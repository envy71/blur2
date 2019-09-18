class Image
  attr_accessor :image

  def initialize (image)
    @image = image
  end

  def output_image
    puts "Sample"
    @image.each do |row|
      puts row.join
    end
  end

  def blur
    pixels = []
    @image.each_with_index do |row, row_index|
      row.each_with_index do |value, value_index|
        if value == 1
          pixels << [row_index, value_index]
        end
      end
    end       

    pixels.each do |pixel|
      row_pixel = pixel[0]
      col_pixel = pixel[1]
      @image[row_pixel + 1][col_pixel] = 1 if row_pixel < @image.length - 1
      @image[row_pixel - 1][col_pixel] = 1  if row_pixel > 0
      @image[row_pixel][col_pixel + 1] = 1 if col_pixel < @image.length - 1
      @image[row_pixel][col_pixel - 1] = 1 if col_pixel > 0
    end
    puts "Blurred"
    @image.each do |row|
      puts row.join
    end 
  end
end

image = Image.new([
 [1, 0, 0, 0],
 [0, 0, 1, 0],
 [0, 0, 0, 0],
 [0, 0, 0, 1]
])

image.output_image
image.blur
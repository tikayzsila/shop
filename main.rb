if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/movie'
require_relative 'lib/product_collection'

collection = Product_collection.from_dir(File.dirname(__FILE__) + '/data')
collection.sort!(by: :price, order: :asc)
collection.to_a.each do |product|
  puts product
end

puts
products.each { |product| puts product }


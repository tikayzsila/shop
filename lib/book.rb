class Book < Product
  attr_reader :genre, :writer
  def initialize(params)
    super
    @genre = params[:genre]
    @writer = params[:writer]
  end
  def to_s
    "Книга «#{@title}», #{@genre}, автор - #{@writer}, #{super}"
  end
  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp }

    self.new(
      title: lines[0],
      genre: lines[1],
      writer: lines[2].to_i,
      price: lines[3].to_i,
      amount: lines[4].to_i
    )
  end
end

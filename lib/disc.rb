
class Disk < Product
  def update(options)
    @title = options[:album_name]
    @author_name = options[:author_name]
    @genre = options[:genre]
  end

  # Для музыкального диска метод info возвращает исполнителя, название и жанр
  def info
    "Диск #{@author_name} - #{@title} (#{@genre})"
  end
end
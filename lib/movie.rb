class Movie < Product
  def update(options)
    @title = options[:title]
    @author_name = options[:author_name]
    @year = options[:year]
  end

  # Для фильма метод info возвращает строку с названием фильма, режиссёром и годом выхода
  def info
    "Фильм #{@title}, реж. #{@author_name} (#{@year})"
  end
end
class Product_collection
  PRODUCT_TYPES = {
    film: {dir: 'films', class: Movie},
    book: {dir: 'books', class: Book}
  }
  def initialize(products = [])
    @products = products
  end
  def self.from_dir(dir_path)
    # Создаем пустой массив, куда будем складывать все найденные продукты
    products = []

    # Пройдемся по каждой паре ключ-значение из константы PRODUCT_TYPES и
    # поочередно запишем эту пару соответственно в переменные type и hash.
    #
    # Сначала в type будет :film, а в hash — {dir: 'films', class: Film}, потом
    # в type будет :book, а в hash — {dir: 'books', class: Book}
    #
    PRODUCT_TYPES.each do |type, hash|
      # Получим из хэша путь к директории с файлами нужного типа, например,
      # строку 'films'
      product_dir = hash[:dir]

      # Получим из хэша объект нужного класса, например класс Film. Обратите
      # внимание, мы оперируем сейчас классом, как объектом. Передаем его по
      # ссылки и вызываем у него методы. Такова природа руби: все — объекты.
      product_class = hash[:class]
      # Для каждого текстового файла из директории, например '/data/films/'
      # берем путь к файлу и передаем его в метод класса from_file, вызывая его
      # у объекта нужного класса.
      Dir[dir_path + '/' + product_dir + '/*.txt'].each do |path|
        products << product_class.from_file(path)
      end
    end
    # Вызываем конструктор этого же класса (ProductCollection) и передаем ему
    # заполненный массив продуктов
    self.new(products)
  end
  def to_a
    @products
  end
  def sort!(params)
    # Делает выбор по параметру by
    case params[:by]
    when :title
      # Если запросили сортировку по наименованию
      @products.sort_by! { |product| product.to_s }
    when :price
      # Если запросили сортировку по цене
      @products.sort_by! { |product| product.price }
    when :amount
      # Если запросили сортировку по количеству
      @products.sort_by! { |product| product.amount }
    end

    # Если запросили сортировку по возрастанию
    @products.reverse! if params[:order] == :asc

    # Возвращаем ссылку на экземпляр, чтобы у него по цепочке можно было вызвать
    # другие методы.
    self
  end
end

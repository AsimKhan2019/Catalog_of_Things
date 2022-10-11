require_relative './modules/preserver_module'
require_relative './modules/book_module'
require_relative './modules/music_album_module'
require_relative './classes/books'
require_relative './classes/label'
require_relative './classes/music_album'
require_relative './classes/genre'

class App
  include PreserverModule
  include BookModule
  include MusicModule
  attr_reader :books

  def initialize
    @books = []
    @albums = []
    @authors = []
    @genres = []
    @labels = []
    @sources = []
    @games = []

    load_data
  end

  def start_program
    puts 'Welcome to the catalog app'
    until list_of_options
      input = gets.chomp
      if input == '0'
        puts 'Thank you for using our app'
        break
      end
      option(input)
    end
  end

  def list_all_books
    puts 'No available books' if @books.empty?
    @books.each { |book| puts "#{book['publisher']} #{book['publish_date']} #{book['cover_state']}" }
  end

  def list_all_albums
    puts 'No available albums' if @albums.empty?
    @albums.each do |album|
      puts "#{album['genre_name'].to_s.strip} \t| #{album['on_spotify?']
      .to_s.strip.rjust(10)} \t| #{album['album_name'].to_s.strip.rjust(10)} \t| #{album['publish_date']
      .to_s.strip.rjust(10)}"
      puts "\n---------------------------------------------------"
    end
  end

  def list_all_games
    puts 'No available games' if @games.empty?
    @games.each { |game| puts "genre: #{game.genre}, published on: #{game.publish_date}" }
  end

  def list_all_genres
    puts 'No available genre' if @genres.empty?
    @genres.each do |genre|
      puts genre['genre_name'].to_s.strip
      puts "\n----------------------------"
    end
  end

  def list_all_labels
    puts 'No available label' if @labels.empty?
    @labels.each { |label| puts "label: #{label.title}, color: #{label.color}" }
  end

  def list_all_authors
    puts 'No available authors' if @authors.empty?
    @authors.each { |author| puts "author: #{author.first_name} #{author.last_name}" }
  end

  def add_book(book)
    newbook = Book.new(*book)
    hash = {
      'publisher' => newbook.publisher,
      'publish_date' => newbook.publish_date,
      'cover_state' => newbook.cover_state
    }
    @books << hash
  end

  def add_label(label)
    newlabel = Label.new(*label)
    hash = {
      'title' => newlabel.title,
      'color' => newlabel.color
    }
    @labels << hash
  end

  def add_album(album_name, publish_date, genre_name, on_spotify)
    newalbum = MusicAlbum.new(album_name, publish_date, on_spotify)
    newgenre = Genre.new(genre_name)
    newalbum.genre = newgenre

    hash = {
      'album_name' => newalbum.name,
      'publish_date' => newalbum.publish_date,
      'on_spotify?' => newalbum.on_spotify,
      'genre' => newgenre.name
    }

    genre_hash = {
      'genre_name' => newgenre.name
    }

    @albums << hash
    @genres << genre_hash
  end

  def preserve_files
    save_data_as_json(@books, 'books')
    save_data_as_json(@labels, 'labels')
    save_data_as_json(@albums, 'albums')
    save_data_as_json(@genres, 'genres')
    save_data_as_json(@games, 'games')
    save_data_as_json(@authors, 'authors')
  end
  
  private

  def load_data
    @books = load_file('books')
    @labels = load_file('labels')
    @albums = load_file('albums')
    @genres = load_file('genres')
    @games = load_file('games')
    @authors = load_file('authors')
  end
end

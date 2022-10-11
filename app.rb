require_relative './modules/preserver_module'
<<<<<<< HEAD
require_relative './modules/book_module'
require_relative './modules/music_album_module'
require_relative './classes/books'
require_relative './classes/label'
require_relative './classes/music_album'
require_relative './classes/genre'
=======
require './modules/book_module'
require_relative './classes/books'
require_relative './classes/label'
# require './modules/game_module'
# require_relative './classes/game'
# require './modules/music_album_module'
require_relative './classes/music_album'
# require_relative './classes/genre'
>>>>>>> eb6963cf7e6c592d9770524c539b4b7399401aef

class App
  include PreserverModule
  include BookModule
<<<<<<< HEAD
  include MusicModule
  attr_reader :books
=======
  # include GameModule
  # include MusicAlbumModule
>>>>>>> eb6963cf7e6c592d9770524c539b4b7399401aef

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
        preserve_files
        puts 'Thank you for using our app'
        break
      end
      option(input)
    end
  end

  def list_all_books
<<<<<<< HEAD
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
=======
    puts "\nNote: No Books available." if @books.empty?
    puts "\nALL BOOKS\n\n"
    puts "\nPublisher \t| Publish Date \t| Cover State"
    @books.each do |book|
      puts "#{book['publisher']} \t\t| #{book['publish_date']} \t| #{book['cover_state']}"
      puts "\n-------------------------------------------------"
>>>>>>> eb6963cf7e6c592d9770524c539b4b7399401aef
    end
  end

  def list_all_labels
    puts "\nNote: No Label available." if @labels.empty?
    puts "\nALL LABELS\n\n"
    puts "\nLabels \t| Color"
    @labels.each do |label|
      puts "#{label['title'].strip} \t| #{label['color']}"
      puts "\n----------------------------"
    end
  end

  def list_all_albums
    puts "\nNote: No albums available." if @albums.empty?

    puts "\nALL ALBUMS\n\n"
    puts "\Genre \t| On spotify? \t| Album Name \t| Publish Date"
    @albums.each do |album|
      puts "#{album['genre'].to_s.strip} \t| #{album['on_spotify?']
    .to_s.strip.rjust(10)} \t| #{album['album_name'].to_s.strip.rjust(10)} \t| #{album['publish_date']
    .to_s.strip.rjust(10)}"
      puts "\n---------------------------------------------------"
    end
  end

  def list_all_games
    puts "\nNote: No games available." if @games.empty?

    puts "\nALL GAMES\n\n"
    puts "\Games \t| Multiplayer \t| Last Played At"
    @games.each do |game|
      puts "\t #{game['game_name']} \t#{game['last_played_at']} \t| #{game['multiplayer']}"
      puts "\n-------------------------------------------------"
    end
  end

  def list_all_genres
    puts "\nNote: No genres available." if @genres.empty?

    puts "\nALL GENRES\n\n"
    puts "\Name"
    @genres.each do |genre|
      puts genre['genre_name'].to_s.strip
      puts "\n----------------------------"
    end
  end

  def list_all_authors
    puts "\nNote: No authors available." if @authors.empty?
    puts "\nALL AUTHORS\n\n"
    puts "\First Name \t| Last Name"
    @authors.each do |author|
      puts "#{author['first_name']} \t| #{author['last_name']}"
      puts "\n-------------------------------------------------"
    end
  end

  def add_book(new_book)
    new_book_instance = Book.new(*new_book)
    hash = {
      'publisher' => new_book_instance.publisher,
      'publish_date' => new_book_instance.publish_date,
      'cover_state' => new_book_instance.cover_state
    }
    @books << hash
  end

  def add_label(new_label)
    new_label_instance = Label.new(*new_label)
    hash = {
      'title' => new_label_instance.title,
      'color' => new_label_instance.color
    }
    @labels << hash
  end

  def add_author(new_author)
    new_author_instance = Author.new(*new_author)
    hash = {
      'first_name' => new_author_instance.first_name,
      'last_name' => new_author_instance.last_name
    }
    @authors << hash
  end

  def add_album(album_name, publish_date, genre_name, on_spotify)
    new_album_instance = MusicAlbum.new(on_spotify, album_name, publish_date)
    new_genre_instance = Genre.new(genre_name)
    new_album_instance.genre = new_genre_instance

    hash = {
      'album_name' => new_album_instance.name,
      'publish_date' => new_album_instance.publish_date,
      'on_spotify?' => new_album_instance.on_spotify,
      'genre' => new_genre_instance.name
    }

    genre_hash = {
      'genre_name' => new_genre_instance.name
    }

    @albums << hash
    @genres << genre_hash
  end

  def add_game(new_game)
    new_game_instance = Game.new(*new_game)
    hash = {
      'game_name' => new_game_instance.game_name,
      'last_played_at' => new_game_instance.last_played_at,
      'multiplayer' => new_game_instance.multiplayer
    }
    @games << hash
  end

<<<<<<< HEAD
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

=======
>>>>>>> eb6963cf7e6c592d9770524c539b4b7399401aef
  def preserve_files
    save_data_as_json(@books, 'books')
    save_data_as_json(@labels, 'labels')
    save_data_as_json(@albums, 'albums')
    save_data_as_json(@genres, 'genres')
    save_data_as_json(@games, 'games')
    save_data_as_json(@authors, 'authors')
  end
<<<<<<< HEAD
  
=======

>>>>>>> eb6963cf7e6c592d9770524c539b4b7399401aef
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

# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository'
    also_reload 'lib/artist_repository'


    get '/albums' do
      repo = AlbumRepository.new
      albums = repo.all

      response = albums.map do |album|
        album.title
      end.join(", ")

      return response
    end

    post '/albums' do
      repo = AlbumRepository.new

      album = Album.new
      album.title = params[:title]
      album.release_year = params[:release_year]
      album.artist_id = params[:artist_id]

      repo.create(album)
      # length = (repo.all.length).to_i
      # result = repo.find(length + 1)
      
      # return "#{result.title}, #{result.release_year}, #{result.artist_id}"
      return nil
    end

    get '/artists' do
      repo = ArtistRepository.new
      artists = repo.all

      response = artists.map do |artist|
        artist.name
      end.join(", ")
    end


    # post '/artists' do
    #   repo = ArtistRepository.new
    #   artist = Artist.new

    #   artist.name = params[:name]
    #   artist.genre = params[:genre]

    #   repo.create(artist)

    #   return ''
    # end

    get '/albums/:id' do
      album_repo = AlbumRepository.new
      artist_repo =ArtistRepository.new

      @id = params[:id]

      @album = album_repo.find(@id)

      # @album.title = params[:title]
      # @album.release_year = params[:release_year]
      # @album.artist_id = params[:artist_id]
      @artist = artist_repo.find(@id)
      # @artist.name = params[:name]

      return erb(:index)
    end

    # get '/albums' do
    #   repo = AlbumRepository.new

    #   @album = repo.all
      
    
    #   return erb(:index_2)
    # end

    get '/about' do
      return erb(:about)
    end

    get '/' do
      return erb(:index_3)
    end

    get '/albums/new' do
      return erb(:new_album)
    end

    # post '/albums' do
    #   if params[:album_title] == nil || params[:album_release_year] == nil || params[:album_artist_id] == nil
    #     return 'Not completed'
    #   end

    #   repo = AlbumRepository.new

    #   new_album = Album.new
    #   new_album.title = params[:album_title]
    #   new_album.release_year = params[:album_release_year]
    #   new_album.artist_id = params[:album_artist_id]
    
    #   repo.create(new_album)
      
    #   return erb(:created_albums)
    # end



    get '/artists/:id' do
      repo = ArtistRepository.new
      @id = params[:id]

      @artist = repo.find(@id)

      return erb(:index_a)
    end

    # get '/artists' do
    #   repo = ArtistRepository.new
    #   @artist = repo.all

    #   return erb(:index_4)
    # end

    
  end
end

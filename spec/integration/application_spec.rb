require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_albums_table
  seed_sql = File.read('spec/seeds/albums_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end


describe Application do

  before(:each) do 
    reset_albums_table
  end
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  # context 'GET /albums' do
  #   it 'returns list of albums' do
  #     repsonse = get("/albums") 

  #     list_of_albums = 'Doolittle, Surfer Rosa, Waterloo, Super Trouper, Bossanova, Lover, Folklore, I Put a Spell on You, Baltimore, Here Comes the Sun, Fodder on My Wings, Ring Ring'
      
  #     expect(repsonse.status).to eq (200)
  #     expect(repsonse.body).to eq list_of_albums
  #   end
  # end

#   context 'POST /albums' do
#     it 'returns newly created album' do
#     response = post("/albums", title: 'Voyage', release_year: '2022', artist_id: '2')

#     expect(response.status).to eq (200)
#     expect(response.body).to eq ""

#     response = get("/albums")

#     expect(response.body).to include("Voyage")

#   end
# end

  # context 'GET /artists' do
  #   it 'returns list of artists' do
  #     response = get("/artists")

  #     expect(response.status).to eq (200)
  #     expect(response.body).to eq "Pixies, ABBA, Taylor Swift, Nina Simone, Kiasmos"
  #   end
  # end

  # context 'POST /artists' do
  #   it 'creates a new artist - returns 200 OK' do
  #     response = post("/artists", name: 'Wild nothing', genre: 'Indie')

  #     expect(response.status).to eq (200)
  #     expect(response.body).to eq ''

  #     response = get("/artists")
      
  #     expect(response.body).to eq 'Pixies, ABBA, Taylor Swift, Nina Simone, Kiasmos, Wild nothing'
  #   end
  # end


  # context 'get /albums/:id' do
  #   it 'returns the html of album for chosen index' do
      
  #     response = get('/albums/1') #id: 1, title: 'Doolittle', release_year: '1989', name: 'Pixie')
      
  #     expect(response.status).to eq (200)
  #     expect(response.body).to include ('Release year: 1989')
  #     expect(response.body).to include ('<h1>Doolittle</h1>')
  #     expect(response.body).to eq ("<html>\n    <head></head>\n    <body>\n        <h1>Doolittle</h1>\n        <p>\n        Release year: 1989\n        Artist: Pixies\n        </p>\n    </body>\n</html>")

  #   end
  # end

  # context 'get /albums/2 ' do
  #   it 'returns the html of album for chosen index' do
      
  #     response = get('/albums/2') #id: 2, title: 'Surfer Rosa', release_year: '1988', name: 'ABBA')

  #     expect(response.status).to eq (200)
  #     expect(response.body).to include ('Release year: 1988')
  #     expect(response.body).to include ('<h1>Surfer Rosa</h1>')
  #     expect(response.body).to eq ("<html>\n    <head></head>\n    <body>\n        <h1>Surfer Rosa</h1>\n        <p>\n        Release year: 1988\n        Artist: ABBA\n        </p>\n    </body>\n</html>")
  #   end
  # end

  # context 'GET /albums' do
  #   it 'returns html file' do
  #     response = get("/albums")

  #     expect(response.status).to eq (200)
  #     expect(response.body).to include ('Doolittle')
  #     expect(response.body).to include ('1989')
  #   end
  # end

  # context 'GET /artists/:id' do
  #   it 'returns each artist wth the corresponding id' do

  #     response = get("/artists/1")

  #     expect(response.status).to eq (200)
  #     expect(response.body).to include ("Pixies")
  #   end
  # end


  context 'GET /artists' do
    it 'returns list of artists in html file' do
      response = get("/artists")

      expect(response.status).to eq (200)
      expect(response.body).to include "Pixies"
    end
  end


  context "get /albums/new" do
    it "shoulde return a html form to create a new post" do

      response = get('/albums/new')

      expect(response.status).to eq (200)
      expect(response.body).to include ('<form action="/albums" method="POST">')
      expect(response.body).to include ('<input type="text" name="album_title">')
      expect(response.body).to include ('<input type="text" name="album_release_year">')
      expect(response.body).to include ('<input type="text" name="album_artist_id">')
    end
  end


  context 'post/albums' do
    it 'return albums with new album' do
      response = post('/albums')

      expect(response.status).to eq (200)
      expect(response.body).to include ('')
    end
  end


end

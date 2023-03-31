# {{ METHOD }} {{ PATH}} Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature
1. List all the albums
Request: GET /albums
Response: list of albums

2.#create a new album
Request: POST /albums

With body parameters:
title=Voyage
release_year=2022
artist_id=2


3. GET
/artists
Expected response (200 OK)
Pixies, ABBA, Taylor Swift, Nina Simone

Expected response: (200 OK)
(No content)


4. POST /artists

With body parameters:
name=Wild nothing
genre=Indie

Expected response (200 OK)
(No content)

GET /artists

Expected response (200 OK)
Pixies, ABBA, Taylor Swift, Nina Simone, Wild nothing



You'll need to include:
  * the HTTP method
  * the path
  * any query parameters (passed in the URL)
  * or body parameters (passed in the request body)

## 2. Design the Response

Response: list of albums

Response:use GET to return the new album

## 3. Write Examples

1. List all the albums
Request: GET /albums
Response: list of albums

2.# Read a single album
Request: GET /albums/1
Response: of a single album

_
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = get('/posts?id=1')

      expect(response.status).to eq(200)
      # expect(response.body).to eq(expected_response)
    end

    it 'returns 404 Not Found' do
      response = get('/posts?id=276278')

      expect(response.status).to eq(404)
      # expect(response.body).to eq(expected_response)
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=resources%2Fsinatra_route_design_recipe_template.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=resources%2Fsinatra_route_design_recipe_template.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=resources%2Fsinatra_route_design_recipe_template.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=resources%2Fsinatra_route_design_recipe_template.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=makersacademy%2Fweb-applications&prefill_File=resources%2Fsinatra_route_design_recipe_template.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->

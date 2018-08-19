class CamelToSnake < Sinatra::Base
  after do
    pass unless content_type == 'application/json'
    pass unless response.body.length > 0

    original_body = JSON.parse(response.body.first)
    converted_body = original_body.to_camelback_keys
    body converted_body.to_json
  end
end

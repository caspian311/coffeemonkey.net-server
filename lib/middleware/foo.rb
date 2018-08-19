use Rack::Parser, parsers: {
    'application/json' => -> (data) do
      JSON.parse(data).to_snake_keys.with_indifferent_access
    end
  }

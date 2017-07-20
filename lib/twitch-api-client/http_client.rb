module TwitchApi
  class HttpClient
    include HTTParty
    base_uri 'https://api.twitch.tv/kraken'

    def initialize(client_id)
      @client_id = client_id
    end

    def get(path, params)
      self.class.get(path, params: params, headers: headers)
    end

    def headers
      {
        'Client-ID': @client_id
      }
    end

  end
end
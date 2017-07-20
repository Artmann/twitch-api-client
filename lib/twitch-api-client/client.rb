module TwitchApi
  class Client

    def initialize(client_id, http_client = nil, options = {})
      @client_id = client_id
      @http_client = http_client || HttpClient.new(client_id)
    end

    def top_games(limit = 3, offset = 0)
      params = {
        limit: limit,
        offset: offset
      }
      data = @http_client.get('/games/top', params)
      return [] if data.nil? or data['top'].nil?
      
      return data['top']
        .map { |x| x['game'] }
        .map { |x| Game.new x['id'], x['name'], x['popularity'], x['box'], x['logo'], x['localized_name'] }
    end

    def stream(id, stream_type = 'live')
      data = @http_client.get("/streams/#{id}", { stream_type: stream_type })
    end

    def streams(options = {})
      params = {
        channel:      options[:channel]     || nil,
        game:         options[:game]        || nil,
        language:     options[:language]    || nil,
        stream_type:  options[:stream_type] || 'live',
        limit:        options[:limit]       || 25,
        offset:       options[:offset]      || 0
      }.reject { |_,v| v.nil? }

      data = @http_client.get('/streams', params)
      return data['streams']
        .map { |x| make_stream x }
    end

    private
    def make_stream(data)
      Stream.new(
        data['id'], 
        data['game'], 
        data['viewers'], 
        data['is_playlist'], 
        data['stream_type'], 
        data['preview'], 
        make_channel(data['channel'])
      )
    end

    def make_channel(data)
      Channel.new(
        data['id'],
        data['name'],
        data['status'],
        data['mature'],
        data['partner'],
        data['language'],
        data['views'],
        data['followers']
      )
    end
  end
end
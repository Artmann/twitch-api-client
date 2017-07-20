require "twitch-api-client"

describe TwitchApi::Client do
  
  describe "#top_games" do
    it "returns a list of games" do
      http = instance_double("TwitchApi::HttpClient")
      allow(http).to receive('get').and_return(stub "top_games")
      client = TwitchApi::Client.new("123", http)
      
      games = client.top_games
      expect(games.size).to eql 2
      expect(games.first.id).to eql 123
      expect(games.first.name).to eql "My game"
      expect(games.first.popularity).to eql 456
      expect(games.first.box).to eql({})
      expect(games.first.logo).to eql({})
      expect(games.first.localized_name).to eql "Localized game name"
    end
  end

  describe "#stream"
    it "returns a stream" do
      http = instance_double("TwitchApi::HttpClient")
      allow(http).to receive('get').and_return(stub "stream")
      client = TwitchApi::Client.new("123", http)

      stream = client.stream(1234)
      expect(stream.id).to eql 123
      expect(stream.game).to eql "My game"
      expect(stream.viewers).to eql 1000
      expect(stream.is_playlist).to eql false
      expect(stream.stream_type).to eql "live"
      expect(stream.preview).to eql {}

    end
  end
end

def stub(name)
  content = File.read("#{__dir__}/stubs/#{name}.json")
  JSON.parse(content)
end
module TwitchApi
  class Stream
    attr_accessor :id, :game, :viewers, :is_playlist, :stream_type, :preview, :channel

    def initialize(id, game, viewers, is_playlist, stream_type, preview, channel)
      self.id = id
      self.game = game
      self.viewers = viewers
      self.is_playlist = is_playlist
      self.stream_type = stream_type
      self.preview = preview
      self.channel = channel
    end
  
  end
end
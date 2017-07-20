module TwitchApi
  class Channel
    attr_accessor :id, :name, :status, :mature, :partner, :language, :views, :followers

    def initialize(id, name, status, mature, partner, language, views, followers)  
      self.id = id
      self.name = name
      self.status = status
      self.mature = mature
      self.partner = partner
      self.language = language
      self.views = views
      self.followers = followers
    end
  end
end
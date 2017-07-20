module TwitchApi
  class Game
    attr_accessor :id, :name, :popularity, :box, :logo, :localized_name

    def initialize(id, name, popularity = 0, box = {} , logo = {}, localized_name = "")
      self.id = id
      self.name = name
      self.popularity = popularity
      self.box = box
      self.logo = logo
      self.localized_name = localized_name
    end
  end
end
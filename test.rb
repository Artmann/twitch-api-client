require 'httparty'
require 'pp'
require './lib/twitch-api-client/http_client'
require './lib/twitch-api-client/channel'
require './lib/twitch-api-client/stream'
require './lib/twitch-api-client/game'
require './lib/twitch-api-client/client'


client = TwitchApi::Client.new('2dyflivo8t1lptqeb40iul42e6jayr')
pp client.streams
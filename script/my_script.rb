require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/2/favorites'
).to_s

params = {}

#/users/:user_id/contacts/:id/favorite

puts RestClient.get(url)

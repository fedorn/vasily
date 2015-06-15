require 'httparty'
require 'vasily/document'
require 'vasily/error'

module Vasily
  class Client
    include HTTParty
    base_uri 'api.textocat.com'

    def initialize(auth_token)
      @auth = {auth_token: auth_token}
    end

    def status
      self.class.get('/status').code
    end
  end
end

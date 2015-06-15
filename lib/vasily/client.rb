require 'httparty'
require 'vasily/document'
require 'vasily/error'

module Vasily
  class Client
    include HTTParty
    base_uri 'api.textocat.com'

    def initialize(auth_token)
      @auth = { auth_token: auth_token }
    end

    def status
      self.class.get('/status').code
    end

    def queue(docs)
      body = docs.map(&:to_hash).to_json
      options = { body: body, query: @auth, headers: {'Content-Type' => 'application/json'} }
      response = self.class.post('/entity/queue', options)
      if response.code == 202
        return response['batchId'], response['status']
      else
        fail(Vasily::Error.from_message_and_code(response.body, response.code))
      end
    end

    def request(batch_id)
      options = { query: @auth.merge({ batch_id: batch_id }) }
      response = self.class.get('/entity/request', options)
      if response.code == 200
        return response['status']
      else
        fail(Vasily::Error.from_message_and_code(response.body, response.code))
      end
    end
  end
end

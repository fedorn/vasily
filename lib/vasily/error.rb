module Vasily
  class Error < StandardError
    attr_reader :code

    # Raised when Textocat returns a 4xx HTTP status code
    ClientError = Class.new(self)

    # Raised when Textocat returns the HTTP status code 400
    BadRequest = Class.new(ClientError)

    # Raised when Textocat returns the HTTP status code 401
    Unauthorized = Class.new(ClientError)

    # Raised when Textocat returns the HTTP status code 402
    LimitExceeded = Class.new(ClientError)

    # Raised when Textocat returns the HTTP status code 403
    Forbidden = Class.new(ClientError)

    # Raised when Textocat returns the HTTP status code 404
    NotFound = Class.new(ClientError)

    # Raised when Textocat returns the HTTP status code 405
    UnacceptableMethod = Class.new(ClientError)

    # Raised when Textocat returns the HTTP status code 406
    NotAcceptable = Class.new(ClientError)

    # Raised when Textocat returns the HTTP status code 413
    InputLimitExceeded = Class.new(ClientError)

    # Raised when Textocat returns the HTTP status code 415
    UnacceptableMIME = Class.new(ClientError)

    # Raised when Textocat returns the HTTP status code 416
    TooManyCollections = Class.new(ClientError)

    # Raised when Textocat returns the HTTP status code 429
    TooManyRequests = Class.new(ClientError)

    # Raised when Textocat returns a 5xx HTTP status code
    ServerError = Class.new(self)

    # Raised when Textocat returns the HTTP status code 500
    InternalServerError = Class.new(ServerError)

    # Raised when Twitter returns the HTTP status code 502
    BadGateway = Class.new(ServerError)

    # Raised when Twitter returns the HTTP status code 503
    ServiceUnavailable = Class.new(ServerError)

    # Raised when Twitter returns the HTTP status code 504
    GatewayTimeout = Class.new(ServerError)

    ERRORS = {
              400 => Vasily::Error::BadRequest,
              401 => Vasily::Error::Unauthorized,
              402 => Vasily::Error::LimitExceeded,
              403 => Vasily::Error::Forbidden,
              404 => Vasily::Error::NotFound,
              405 => Vasily::Error::UnacceptableMethod,
              406 => Vasily::Error::NotAcceptable,
              413 => Vasily::Error::InputLimitExceeded,
              415 => Vasily::Error::UnacceptableMIME,
              416 => Vasily::Error::TooManyCollections,
              429 => Vasily::Error::TooManyRequests,
              500 => Vasily::Error::InternalServerError,
              502 => Vasily::Error::BadGateway,
              503 => Vasily::Error::ServiceUnavailable,
              504 => Vasily::Error::GatewayTimeout,
             }

    class << self
      def from_message_and_code(message = '', code)
        klass = ERRORS[code]
        if klass.nil?
          nil
        else
          klass.new(message, code)
        end
      end
    end

    def initialize(message = '', code = nil)
      super(message)
      @code = code
    end
  end
end

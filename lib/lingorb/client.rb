require 'faraday'
require 'json'

module Lingorb
  DUOLINGO_ROOT_URL = 'https://www.duolingo.com/'
  DUOLINGO_API_VERSION = '2017-06-30'

  class ClientError < StandardError; end

  class Client
    def initialize(username, password)
      @username, @password = username, password
      @conn = Faraday.new(url: DUOLINGO_ROOT_URL)
      @jwt = nil
      @current_user = nil
    end

    def login
      res = @conn.post "#{DUOLINGO_ROOT_URL}/login" do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = {"login" => @username, "password" => @password}.to_json
      end
      body = JSON.parse(res.body)
      # I want to do pattern match!!
      if body["failure"]
        raise ClientError, "Login failed: code=%s, %s" % [body["failure"], body["message"]]
      else
        @jwt = res.headers["jwt"]
      end
    end

    def current_user
      return @current_user if @current_user

      user_url = "#{DUOLINGO_API_VERSION}/users?username=%s" % @username
      res = @conn.get user_url do |req|
        # req.headers['Authorization'] = "Bearer #{@jwt}" if @jwt
      end
      @current_user ||= User.new(JSON.parse(res.body), @conn)
    end
  end

  class User
    def initialize(data, conn)
      @conn = conn
      @data = data
      @id                = data["users"][0]["id"]
      @username          = data["users"][0]["username"]
      @bio               = data["users"][0]["bio"]
      @location          = data["users"][0]["location"]
      @learning_language = data["users"][0]["leraningLanguage"]
      @from_language     = data["users"][0]["fromLanguage"]
      @streak            = data["users"][0]["streak"]
    end
    attr_accessor :id,
                  :username,
                  :bio,
                  :location,
                  :learning_language,
                  :from_language,
                  :streak
  end
end

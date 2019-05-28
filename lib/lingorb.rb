require "lingorb/version"
require "lingorb/client"

module Lingorb
  def self.authenticate(username=nil, password=nil, &b)
    c = nil
    if b
      mock = Struct.new(:username, :password).new
      b.call(mock)
      c = Client.new(mock.username, mock.password)
    else
      c = Client.new(username, password)
    end

    c.login
    c
  end
end

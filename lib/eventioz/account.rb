module Eventioz

  class Account
    attr_accessor :email, :api_key

    def initialize(h)
      h.each { |key, value| send("#{key}=", value) }
    end

  end

end
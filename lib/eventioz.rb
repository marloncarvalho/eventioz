require 'rest-client'
require 'json'

require 'eventioz/account'
require 'eventioz/version'
require 'eventioz/auth'
require 'eventioz/organizer'
require 'eventioz/event'
require 'eventioz/registration'


# A Ruby client library for the Eventioz platform.
# See http://github.com/marloncarvalho/eventioz for a general introduction.
module Eventioz
  BASE_URL = 'https://eventioz.com.br/'

  class << self

    def login(params = {})
      map = Eventioz::Auth.authorize(params)
      Eventioz::Account.new(:email => map['account']['email'], :api_key => map['account']['api_key'])
    end

  end

end
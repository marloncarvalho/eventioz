module Eventioz

  # Used to authenticate against the Eventioz API and get the API Key.
  #
  # The Login and Password aren't stored localy. They're used only to authenticate
  # Afterwards they're discarded.
  #
  # Every API call must have an API Key appended to it and an instance of this class
  # is responsible to get this key.
  class Auth

    # Calls the Eventioz API asking for the API Key.
    #
    # Arguments:
    #   config: (Hash)
    def self.authorize(config = {:login => nil, :password => nil, :locale => 'pt'})
      validate_config config

      json = JSON.parse RestClient.post("#{Eventioz::BASE_URL}session.json?login=#{config[:login]}&password=#{config[:password]}&local=#{config[:locale]}", nil, nil)
      raise 'Unauthorized' unless json['errors'].nil?
      json
    end

    private

    # Just validates if the config object contains all required data.
    def self.validate_config(config)
      raise 'Config cannot be null' if config.nil?
      raise 'User cannot be null' if config[:login].nil?
      raise 'Password cannot be null' if config[:password].nil?
    end

  end

end
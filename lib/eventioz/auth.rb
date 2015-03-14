module Eventioz

  # Used to authenticate against the Eventioz API and get the API Key.
  #
  # The Login and Password aren't stored localy. They're used only to authenticate
  # Afterwards they're discarded.
  #
  # Every API call must have an API Key appended to it and an instance of this class
  # is responsible to get this key.
  class Auth
    attr_reader :login, :password, :locale

    # Build up an Auth object based on Login and Password.
    # These two data are obligatory and an exception is thrown when they're null.
    #
    # Arguments:
    #   config: (Hash)
    def initialize(config = {:login => nil, :password => nil, :locale => 'pt'})
      validate_config config
      config.each { |key, value| send("#{key}=", value) }
    end

    # Calls the Eventioz API asking for the API Key.
    def get_api_key
      json = JSON.parse RestClient.post("#{BASE_URL}session.json?login=#{@login}&password=#{@password}&local=#{@locale}", nil, nil)
      json['account']['api_key']
    end

    private

    # Just validates if the config object contains all required data.
    def validate_config(config)
      raise 'Config cannot be null' if config.nil?
      raise 'User cannot be null' if config[:login].nil?
      raise 'Password cannot be null' if config[:password].nil?
    end

  end

end
module Eventioz

  # Represents an Eventioz Organizer.
  class Organizer
    attr_accessor :cached_slug, :locale, :name, :api_key

    def initialize(h = {})
      h.each { |key, value| send("#{key}=", value) }
    end

    def self.all(api_key)
      result = []

      json = JSON.parse RestClient.get("#{BASE_URL}admin/account.json?api_key=#{api_key}")
      json.each do |org|
        o = Eventioz::Organizer.new({})
        org['organizer'].each do |key, value|
          o.send("#{key}=", value)
        end
        o.api_key = @api_key
        result << o
      end

      result
    end

  end

end
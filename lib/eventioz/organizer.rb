module Eventioz

  # Represents an Eventioz Organizer.
  class Organizer
    attr_accessor :cached_slug, :locale, :name, :api_key

    def initialize(h = {})
      h.each { |key, value| send("#{key}=", value) }
    end

    # Returns all events created by this organizer.
    def events
      result = []

      json = JSON.parse RestClient.get("#{BASE_URL}admin/organizers/#{@cached_slug}/events.json?api_key=#{@api_key}")
      json.each do |event|
        e = Eventioz::Event.new({})
        event['event'].each do |key, value|
          e.send("#{key}=", value)
        end
        e.api_key = @api_key
        result << e
      end

      result
    end

  end

end
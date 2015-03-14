
module Eventioz

  # Represents an Eventioz Event.
  class Event
    attr_accessor :cached_slug, :name, :registrations_count, :start_date, :end_date, :time_zone, :created_at, :status, :api_key

    def initialize(h = {})
      h.each { |key, value| send("#{key}=", value) }
    end

    # Returns the event registrations.
    def registrations
      result = []

      json = JSON.parse RestClient.get("#{BASE_URL}admin/events/#{@cached_slug}/registrations.json?api_key=#{@api_key}")
      json.each do |reg|
        r = Eventioz::Registration.new({})
        reg['registration'].each do |key, value|
          r.send("#{key}=", value)
        end
        result << r
      end

      result
    end
  end

end
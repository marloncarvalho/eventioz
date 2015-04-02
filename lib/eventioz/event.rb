
module Eventioz

  # Represents an Eventioz Event.
  class Event
    attr_accessor :cached_slug, :name, :registrations_count, :start_date, :end_date, :time_zone, :created_at, :status, :api_key

    def initialize(h = {})
      h.each { |key, value| send("#{key}=", value) }
    end

    # Returns all events created by a specific organizer.
    #
    # Arguments:
    #   account: User account on Eventioz.
    #   organizer_slug: Organizer slug on Eventioz.
    def self.all(account, organizer_slug)
      result = []

      json = JSON.parse RestClient.get("#{BASE_URL}admin/organizers/#{organizer_slug}/events.json?api_key=#{account.api_key}")
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
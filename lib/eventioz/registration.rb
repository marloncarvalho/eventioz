module Eventioz

  # Represents an Eventioz Registration.
  class Registration
    attr_accessor :accreditation_code, :attended, :cancelled_at, :created_at, :email,
                  :first_name, :last_name, :purchased_at, :random_code,
                  :amount, :due_date, :secound_amount, :second_due_date

    def initialize(h = {})
      h.each { |key, value| send("#{key}=", value) }
    end

    # Calls the Eventioz API to retrieve all tickets purchased to a specific event.
    def self.all(api_key, event_slug)
        result = []

        json = JSON.parse RestClient.get("#{BASE_URL}admin/events/#{event_slug}/registrations.json?api_key=#{api_key}")
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
module Eventioz

  # Represents an Eventioz Registration.
  class Registration
    attr_accessor :accreditation_code, :attended, :cancelled_at, :created_at, :email,
                  :first_name, :last_name, :purchased_at, :random_code,
                  :amount, :due_date, :secound_amount, :second_due_date

    def initialize(h = {})
      h.each { |key, value| send("#{key}=", value) }
    end
  end

end
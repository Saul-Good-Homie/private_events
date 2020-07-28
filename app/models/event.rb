class Event < ApplicationRecord
    has_many :guests
    has_many :attendees, through: :guests, source: :user
    belongs_to :creator, class_name: "User"


    def past_events
        self.date >= Time.now
    end

    def upcoming_events

    end
end

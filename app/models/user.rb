class User < ApplicationRecord
    validates :username, presence: true
    validates :password, presence: true
    
    has_many :guests
    has_many :attended_events, through: :guests, source: :event
    has_many :created_events, foreign_key: :creator_id, class_name: "Event"
    
    def past_events
        @past_events = []
        self.created_events.each do |event|
            datetime = event.date
            if datetime < Date.today
            @past_events << event
            end
        end
        return @past_events
    end

    def future_events
        @future_events = []
        self.created_events.each do |event|
            datetime = event.date
            if datetime >= Date.today
            @future_events << event
            end
        end
        return @future_events
    end

end

class User < ApplicationRecord
    validates :username, presence: true
    validates :password, presence: true
    
    has_many :guests
    has_many :attended_events, through: :guests, source: :event
    has_many :created_events, foreign_key: :creator_id, class_name: "Event"
    
    def past_events
        @past_events = @user.events <= Time.now
    end

end

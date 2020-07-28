class Event < ApplicationRecord
    has_many :guests
    has_many :attendees, through: :guests, source: :user
    belongs_to :creator, class_name: "User"
    
    scope :past, -> { where('date < ?', Date.today)}
    scope :upcoming, -> { where('date >= ?', Date.today) }

end

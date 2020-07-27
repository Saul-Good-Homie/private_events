class User < ApplicationRecord
    validates :username, presence: true
    validates :password, presence: true

    has_many :created_events, foreign_key: "creator_id", class_name: "Event"
end

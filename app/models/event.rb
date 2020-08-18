class Event < ApplicationRecord
    has_many :attendances, foreign_key: :event_attended_id
    has_many :attendees through: :attendance source: :attendee
    belongs_to :creator, class_name: "User"
end
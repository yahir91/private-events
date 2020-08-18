class User < ApplicationRecord
    has_many :attendances, foreign_key: :attendee_id
    has_many :events_attending, through: :attendance, source: :event_attended
    has_many :events_created, foreign_key: :creator_id, class_name: "Event"
end
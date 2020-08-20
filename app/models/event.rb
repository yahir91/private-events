class Event < ApplicationRecord
    has_many :attendances, foreign_key: :event_attended_id
    has_many :attendees, through: :attendances, source: :attendee
    belongs_to :creator, class_name: "User"

    scope :upcomming_events, -> { where('event_date > ?', Date.today) }
    scope :prev_events, -> { where('event_date < ?', Date.today) }
end
class Event < ApplicationRecord
  validates :description, presence: true, uniqueness: true, length: { minimum: 5}
  validates :location, presence: true, length: { minimum: 3, maximum: 20}
  validates :date, presence: true

  has_many :attendances, foreign_key: :event_attended_id
  has_many :attendees, through: :attendances, source: :attendee
  belongs_to :creator, class_name: 'User'

  scope :upcomming_events, -> { where('event_date > ?', Date.today) }
  scope :prev_events, -> { where('event_date < ?', Date.today) }
end

class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 30 }

  has_many :attendances, foreign_key: :attendee_id
  has_many :events_attending, through: :attendances, source: :event_attended
  has_many :events_created, foreign_key: :creator_id, class_name: 'Event'
end

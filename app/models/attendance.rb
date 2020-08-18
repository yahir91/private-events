class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: "User"
  belongs_to :event_attended, class_name: "Event"
end

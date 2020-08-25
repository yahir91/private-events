require 'rails_helper'

RSpec.describe Attendance, type: :model do
  # Validate attendances
  it { should belong_to(:event_attended) }
  it { should belong_to(:attendee) }

  end

  # belongs_to :attendee, class_name: 'User'
  # belongs_to :event_attended, class_name: 'Event'
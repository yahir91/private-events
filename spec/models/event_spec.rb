require 'rails_helper'

RSpec.describe Event, type: :model do
  # Validate Description
  it { should validate_presence_of(:description) }
  it { should validate_uniqueness_of(:description) }
  it { should validate_length_of(:description).is_at_least(5) }

  # Validate location

  it { should validate_presence_of(:location) }
  it { should validate_length_of(:location).is_at_least(3) }
  it { should validate_length_of(:location).is_at_most(20) }

  # Validate date

  # it { should validate_presence_of(:date) }
end

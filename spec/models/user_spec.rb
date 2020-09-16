require 'rails_helper'

RSpec.describe User, type: :model do
  # Validate User
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_length_of(:name).is_at_least(3) }
  it { should validate_length_of(:name).is_at_most(30) }
end

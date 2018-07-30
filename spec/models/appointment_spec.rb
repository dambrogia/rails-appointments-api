require 'rails_helper'

RSpec.describe Appointment, type: :model do
	# Association test

	# ensure an Appointment model has a 0:m relationship with the Guest model
	it { should have_many(:guests).dependent(:destroy) }
	# ensure an Appointment record belongs to a single user
	it { should belong_to(:user) }

	# Validation tests

	# ensure correct columns exist
	it { should validate_presence_of(:date) }
	it { should validate_presence_of(:title) }
	it { should validate_presence_of(:notes) }
end

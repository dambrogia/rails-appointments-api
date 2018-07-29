require 'rails_helper'

RSpec.describe User, type: :model do
	# Association test

	# ensure User model has a 0:m relationship with the Appointment model
	it { should have_many(:appointments).dependent(:destroy) }
	# ensure User model belongs a 0:m relationship with the Guest model
	it { should have_many(:guests).through(:appointments) }

	# Validation tests

	# ensure correct columns exist
	it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end

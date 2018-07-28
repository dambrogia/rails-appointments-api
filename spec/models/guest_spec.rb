require 'rails_helper'

RSpec.describe Guest, type: :model do
  # Association test

  # ensure a guest belongs to an appointment
  it { should belong_to(:appointment) }
  # ensure a guest belongs to a user
  it { should belong_to(:user) }


  # Validation tests

  # no columns in this model, just foreign keys
end

require 'rails_helper'

RSpec.describe DatabaseSeeder::Appointments do
    describe 'when there are no users' do
        it "will not generate any appointments" do
            expect(DatabaseSeeder::Appointments.seed.empty?).to be true
        end
    end

    describe 'when there are users' do
        it "generates an appointment for generated each user" do
            users = DatabaseSeeder::Users.seed
            appointments = DatabaseSeeder::Appointments.seed

            expect(appointments.length).to eq(appointments.length)
        end
    end
end

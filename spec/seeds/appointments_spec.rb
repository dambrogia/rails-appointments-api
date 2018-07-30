require 'rails_helper'

RSpec.describe DatabaseSeeder::Appointments do
    describe 'Seeding appointments' do
        it "doesn't seed without users" do
            expect(DatabaseSeeder::Appointments.seed.empty?).to be true
        end

        it "generates an appointment for generated each user" do
            users = DatabaseSeeder::Users.seed
            appointments = DatabaseSeeder::Appointments.seed

            expect(appointments.length).to eq(appointments.length)
        end
    end
end

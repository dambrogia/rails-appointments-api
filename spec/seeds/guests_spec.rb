require 'rails_helper'

RSpec.describe DatabaseSeeder::Guests do
    describe 'when there are no users or appointments' do
        it "doesn't generate any guests" do
            expect(DatabaseSeeder::Guests.seed.empty?).to be true
        end
    end

    describe 'when there are no appointments' do
        it "doesn't generate any guests" do
            DatabaseSeeder::Users.seed
            expect(DatabaseSeeder::Guests.seed.empty?).to be true
        end
    end

    describe 'when there are users and appointments' do
        it "successfully generates users as guests for appointments" do
            users = DatabaseSeeder::Users.seed
            appointments = DatabaseSeeder::Appointments.seed
            guests = DatabaseSeeder::Guests.seed

            expect(guests.length).to be >= appointments.length
        end
    end
end

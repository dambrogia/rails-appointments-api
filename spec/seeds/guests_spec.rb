require 'rails_helper'

RSpec.describe DatabaseSeeder::Guests do
    describe 'Seeding guests' do
        it "doesn't seed without users or appointments" do
            expect(DatabaseSeeder::Guests.seed.empty?).to be true
        end

        it "doesn't seed without appointments" do
            DatabaseSeeder::Users.seed

            expect(DatabaseSeeder::Guests.seed.empty?).to be true
        end

        it "generates equal to or more guests than available appointments" do
            users = DatabaseSeeder::Users.seed
            appointments = DatabaseSeeder::Appointments.seed
            guests = DatabaseSeeder::Guests.seed

            expect(guests.length).to be >= appointments.length
        end
    end
end

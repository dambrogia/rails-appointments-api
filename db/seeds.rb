# This file contains all the record creation needed to seed the database with
# its default values.
#
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
require_relative 'seeds/appointments'
require_relative 'seeds/guests'
require_relative 'seeds/users'

DatabaseSeeder::Users.seed
DatabaseSeeder::Appointments.seed
DatabaseSeeder::Guests.seed

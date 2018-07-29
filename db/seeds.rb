# This file contains all the record creation needed to seed the database with
# its default values.
#
# The data can then be loaded with the rails db:seed command (or created
# alongside the database with db:setup).
require 'faker'

# Create Users
User.create([
    {
        first_name: 'Monica',
        last_name: 'Gheller',
        email: 'monica@friends.tv',
        password_digest: 'cleanfr34k'
    }, {
        first_name: 'Phoebe',
        last_name: 'Buffay-Hannigan',
        email: 'phoebe@friends.tv',
        password_digest: 'sm3llyc4t'
    }, {
        first_name: 'Rachel',
        last_name: 'Green',
        email: 'rachel@friends.tv',
        password_digest: 'weWereOnABreak'
    }, {
        first_name: 'Joey',
        last_name: 'Tribianni',
        email: 'joey@friends.tv',
        password_digest: 'howUdoin?'
    }, {
        first_name: 'Ross',
        last_name: 'Gheller',
        email: 'ross@friends.tv',
        password_digest: 'Mr3divorces'
    }, {
        first_name: 'Chandler',
        last_name: 'Bing',
        email: 'chandman@friends.tv',
        password_digest: 'couldiHAVEanEasierPasswd?'
    }
]);

# Create Appointments
User.all.map do |user|
    Appointment.create({
        date: Faker::Time.forward((1..14).to_a.sample, :morning),
        title: Faker::Friends.location,
        notes: Faker::Lorem.sentence(10, true, 10),
        user_id: user.id
    })
end

# Create Guests
Appointment.all.map do |appointment|
    # Select all users that are possible to be guests (not owner of appointment)
    possible_guests = User.all.where('id != ?', appointment.user_id)
    # Randomly Select 1-3 of the possible guests
    selected_guests = possible_guests.sample((1..3).to_a.sample)
    # Add user as Guest to appointment
    selected_guests.map do |user|
        Guest.create({
            appointment_id: appointment.id,
            user_id: user.id
        })
    end
end

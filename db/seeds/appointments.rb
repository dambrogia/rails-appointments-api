require 'faker'

module DatabaseSeeder
    module Appointments

        # Seed appointments
        def self.seed
            # Return empty array if no users created
            # This keeps our return type constant and prevents invalid appointments
            return [] if User.all.empty?

            # Map through users and create an appointment that belongs to them
            User.all.map do |user|
                Appointment.create({
                    date: Faker::Time.forward((1..14).to_a.sample, :morning),
                    title: Faker::Friends.location,
                    notes: Faker::Lorem.sentence(10, true, 10),
                    user_id: user.id
                })
            end
        end

    end
end

module DatabaseSeeder
    module Guests

        # Seed guests
        def self.seed
            # Return empty array if no users or appointments are created
            # This keeps our return type constant and prevents invalid guests
            return [] if User.all.empty? or Appointment.all.empty?

            # Map through appointments and generate guests for them
            Appointment.all.map do |appointment|
                # Select possible guests (users that don't own the appointment)
                possible_guests = User.all.where('id != ?', appointment.user_id)
                # Randomly select 1 or 2 of the possible guests
                selected_guests = possible_guests.sample((1..2).to_a.sample)
                # Add user as guest to appointment
                selected_guests.map do |user|
                    Guest.create({
                        appointment_id: appointment.id,
                        user_id: user.id
                    })
                end
            end
        end
    end
end

# Rails Appointments API

The is a sample API that allows you to create users, appointments and appointment guests.

_Passwords are currently unencrypted. We will be taking care of that very soon with bcrypt!_
_____

### Endpoints

| Verb  | Endpoint                                      |
|:------|:----------------------------------------------|
| GET   | /users                                        |
| POST  | /users                                        |
| GET   | /users/:id                                    |
| PATCH | /users/:id                                    |
| PUT   | /users/:id                                    |
| DELETE| /users/:id                                    |
| GET   | /appointments/:appointment_id/guests          |
| POST  | /appointments/:appointment_id/guests          |
| GET   | /appointments/:appointment_id/guests/:id      |
| DELETE| /appointments/:appointment_id/guests/:id      |
| GET   | /appointments                                 |
| POST  | /appointments                                 |
| GET   | /appointments/:id                             |
| PATCH | /appointments/:id                             |
| PUT   | /appointments/:id                             |
| DELETE| /appointments/:id                             |

____

### Ruby version
ruby 2.5.0

### System dependencies
`gem`, `bundler`, `git`, `rails`

### Configuration (Getting Started)

    # Clone
    git clone https://github.com/dambrogia/rails-appointments-api.git && cd rails-appointments-api

    # Install dependencies
    bundle install

    # Database creation
    rails db:migrate

    # Database initialization (Sample Data)
    rails db:seed

    # Start the server
    rails server # starts the API on localhost:3000

### How to run the test suite
The tests are built with RSpec. You can run the tests with the following command:

    bundle exec rspec

### Services (job queues, cache servers, search engines, etc.)
None

### Deployment instructions
Coming soon!

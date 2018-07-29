# Rails Appointments API

The is a sample API that allows you to create users, appointments and appointment guests.

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
| PATCH | /appointments/:appointment_id/guests/:id      |
| PUT   | /appointments/:appointment_id/guests/:id      |
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
`gem`, `bundler`

### Configuration
N/A

### Database creation
Uses the native sqlite3 so you can be up and running with no configuration

### Database initialization
Database seeding cominig soon!

### How to run the test suite
The tests are built with RSpec. You can run the tests with the following command:

    bundle exec rspec

### Services (job queues, cache servers, search engines, etc.)
None

### Deployment instructions
Coming soon!

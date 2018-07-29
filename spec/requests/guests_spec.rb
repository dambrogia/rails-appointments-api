# spec/requests/items_spec.rb
require 'rails_helper'

RSpec.describe 'Guests API' do
  # Initialize the test data
  let!(:user) { create(:user) }
  let!(:users) { 10.times.map { create(:user) } }

  let!(:appointment) { create(:appointment, user_id: user.id) }
  let!(:appointments) { 10.times.map { create(:appointment, user_id: users.sample.id) } }

  let!(:guest) { create(:guest, appointment_id: appointment.id, user_id: user.id ) }

  let(:user_id) { user.id }
  let(:appointment_id) { appointment.id }
  let(:guest_id) { guest.id }

# Test suite for GET /appointments/:appointment_id/guests
  describe 'GET /appointments/:appointment_id/guests' do
    before { get "/appointments/#{appointment_id}/guests" }

    context 'when guests exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all guests' do
        expect(json.size).to eq(1)
      end
    end

    context 'when appointment does not exist' do
      let(:appointment_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find")
      end
    end
  end

  # Test suite for GET /appointments/:appointment_id/guests/:guest_id
  describe 'GET /appointments/:appointment_id/guests/:guest_id' do
    before { get "/appointments/#{appointment_id}/guests/#{guest_id}" }

    context 'when appointment guest exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the guest' do
        expect(json['id']).to eq(guest_id)
      end
    end

    context 'when appointment guest does not exist' do
      let(:guest_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find")
      end
    end
  end

  # Test suite for POST /appointments/:appointment_id/guests
  describe 'POST /appointments/:appointment_id/guests' do
    let(:valid_attributes) {
    	{
    		user_id: users.sample.id,
    		appointment_id: appointments.sample.id
    	}
    }

    context 'when request attributes are valid' do
      before { post "/appointments/#{appointment_id}/guests", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/appointments/#{appointment_id}/guests", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to include("Validation failed")
      end
    end
  end

  # PUT requests are disabled since this is a many:many relationship
  # We only want add and delete guests to appointments

  # Test suite for DELETE /appointments/:appointment_id/guests/:guest_id
  describe 'DELETE /appointments/:appointment_id/guests/:guest_id' do
    before { delete "/appointments/#{appointment_id}/guests/#{guest_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

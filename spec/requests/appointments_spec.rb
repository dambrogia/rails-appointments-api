require 'rails_helper'

RSpec.describe 'Appointments API', type: :request do
  # Initialize the test data
  let!(:user) { create(:user) }
  let!(:appointments) { create_list(:appointment, 10, user_id: user.id) }
  let(:user_id) { user.id }
  let(:appointments_id) { appointments.first.id }

  # Test suite for GET /appointments
  describe 'GET /appointments' do
    # make HTTP get request before each example
    before { get '/appointments' }

    it 'returns appointments' do
      # `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /appointments/:id
  describe 'GET /appointments/:id' do
    before { get "/appointments/#{appointments_id}" }

    context 'when the record exists' do
      it 'returns the appointment' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(appointments_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:appointments_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to include("Couldn't find")
      end
    end
  end

  # Test suite for POST /appointments
  describe 'POST /appointments' do
    # valid payload
    let(:valid_attributes) {
      {
        date: '2018-10-01 09:00:00',
        title: 'Monday Morning Scrum',
        notes: 'Discuss, plan and forecast our week accordingly',
        user_id: user_id
      }
    }

    context 'when the request is valid' do
      before { post '/appointments', params: valid_attributes }

      it 'creates an appointment' do
        expect(json['title']).to eq('Monday Morning Scrum')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/appointments', params: { title: 'This should fail' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to include("Validation failed")
      end
    end
  end

  # Test suite for PUT /appointments/:id
  describe 'PUT /appointments/:id' do
    let(:valid_attributes) { { title: 'Daily Morning Scrum' } }

    context 'when the record exists' do
      before { put "/appointments/#{appointments_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /appointments/:id
  describe 'DELETE /appointments/:id' do
    before { delete "/appointments/#{appointments_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

class GuestsController < ApplicationController
	before_action :set_appointment
	before_action :set_guest, only: [:show, :update, :destroy]

	# GET /appointments/:appointment_id/guests
  def index
    @guests = Guest.all
    json_response(@guests)
  end

  # POST /appointments/:appointment_id/guests
  def create
    @guest = Guest.create!(guest_params)
    json_response(@guest, :created)
  end

  # GET /appointments/:appointment_id/guests/:guest_id
  def show
    json_response(@guest)
  end

  # No PUT requests

  # DELETE /appointments/:appointment_id/guests/:guest_id
  def destroy
    @guest.destroy
    head :no_content
  end

  private

  def guest_params
    # whitelist params
    params.permit(:user_id, :appointment_id)
  end

  def set_guest
    @guest = Guest.find(params[:id])
  end

  def set_appointment
  	@appointment = Appointment.find(params[:appointment_id])
  end
end

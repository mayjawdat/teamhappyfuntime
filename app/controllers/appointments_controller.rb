class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.mentor_id = current_user.id

    if @appointment.save
      redirect_to @appointment
    else
      render 'new'
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
  end


  private

  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time)
  end

  def update_student_id

  end
end

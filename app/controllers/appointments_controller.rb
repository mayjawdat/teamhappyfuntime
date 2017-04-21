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

    @feedback_giver = current_user.id
    if current_user.id == @appointment.mentor_id
      @feedback_receiver = @appointment.student_id
      @feedback_target = :feedback_on_student
      @rating_target = :rating_on_student
    elsif current_user.id == @appointment.student_id
      @feedback_receiver = @appointment.mentor_id
      @feedback_target = :feedback_on_mentor
      @rating_target = :rating_on_mentor
    end
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(student_id: appointment_params[:student_id])
    @appointment.update(cancelled: appointment_params[:cancelled])

    if @appointment.save
      redirect_to current_user
    else
      @errors = @appointment.errors.full_messages
      render 'new'
    end
  end


  private

  def appointment_params
    params.require(:appointment).permit(:start_time, :end_time, :student_id, :cancelled)
  end
end

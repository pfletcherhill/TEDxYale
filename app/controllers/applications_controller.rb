class ApplicationsController < ApplicationController
  def create
    @application = Application.new(params[:application])
    respond_to do |format|
      if @application.save
        format.html { redirect_to '/', notice: 'Thank you for applying, #{@application.name}.' }
        format.json { render json: @application, status: :created, location: @application }
        email = @application.email
        name = @application.name
        UserMailer.new_app_email(email, name, @application).deliver
      else
        format.html
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end
end

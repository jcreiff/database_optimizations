class ReportsController < ApplicationController

  def welcome
  end

  def thank_you
    @email = params[:email]
    @assembly_name = params[:assembly_name]
    ReportMailer.get_report(@email, @assembly_name).deliver_later
  end

end

class ReportsController < ApplicationController

  def welcome
    @report = Report.new
  end

  def thank_you
    @email = params[:email]
    @assembly_name = params[:assembly_name]
    @assembly = Assembly.find_by_name(@assembly_name)
    @report = Report.create!(assembly_id: @assembly.id, uploaded_file: params[:uploaded_file])
    ReportMailer.get_report(@email, @assembly_name).deliver_later
  end

  private def report_params
    params.permit(:uploaded_file, :assembly_id)
  end

end

class ReportsController < ApplicationController

  def welcome
    @report = Report.new
  end

  def thank_you
    @email = params[:email]
    @assembly_name = params[:assembly_name]
    @assembly = Assembly.find_by_name(@assembly_name)
    @hits = Hit.where(subject: Gene.where(sequence: Sequence.where(assembly: @assembly))).order(percent_similarity: :desc)
    string = render_to_string :all_data
    File.open("#{@assembly_name}.txt", "w") {|f| f.write(string)}
    @report = Report.create!(assembly_id: @assembly.id, uploaded_file: File.open("#{@assembly_name}.txt"))
    ReportMailer.get_report(@email, @assembly_name).deliver_later
  end

  private def report_params
    params.permit(:uploaded_file, :assembly_id)
  end

end

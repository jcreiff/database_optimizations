class ReportMailer < ApplicationMailer

  def get_report(email, assembly_name)
    mail(to: email, subject: "Report for Assembly #{assembly_name}")
  end

end

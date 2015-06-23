class ReportMailer < ApplicationMailer

  def get_report
    mail(to: "jcreiff@gmail.com", subject: "MAILERS")
  end

end

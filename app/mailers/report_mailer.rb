class ReportMailer < ApplicationMailer

  def get_report(email, assembly_name)
    @assembly = Assembly.find_by_name(assembly_name)
    @hits = Hit.where(subject: Gene.where(sequence: Sequence.where(assembly: @assembly))).order(percent_similarity: :desc)
    mail(to: email, subject: "Report for Assembly #{assembly_name}")
  end

end

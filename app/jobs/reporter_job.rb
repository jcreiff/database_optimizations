class ReporterJob < ActiveJob::Base
  queue_as :default

  def perform(email, assembly_name)
    @assembly = Assembly.find_by_name(assembly_name)
    @hits = Hit.where(subject: Gene.where(sequence: Sequence.where(assembly: @assembly))).order(percent_similarity: :desc)
  end
end

class ReporterJob < ActiveJob::Base
  queue_as :default

  def perform(email, assembly_name)
    
  end
end

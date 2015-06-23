class ReporterJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    Assembly.create!(*args)
  end
end

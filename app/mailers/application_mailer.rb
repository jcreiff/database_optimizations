class ApplicationMailer < ActionMailer::Base
  default from: "joe@joe.com"
  layout 'mailer'
end

class ApplicationMailer < ActionMailer::Base
  default from: "Termworld <#{ENV['EMAIL']}>"
  layout 'mailer'
end

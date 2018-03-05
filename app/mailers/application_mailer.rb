class ApplicationMailer < ActionMailer::Base
  default from: "confirm@blocmarks.com"
  layout 'mailer'
end

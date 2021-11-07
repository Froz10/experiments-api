# frozen_string_literal: true
##
# This class ApplicationMailer.
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end

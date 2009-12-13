class Emailer < ActionMailer::Base
  include ActionController::UrlWriter # Allows us to generate URLs
  include ActionView::Helpers::TextHelper

  def welcome(user)
    defaults
    recipients    user.email
    subject       I18n.t('emailer.welcome.title', :app_name => APP_CONFIG['app_name'])
    body          :user => user
  end

  private

    def from_address(recipient = "no-reply", name = APP_CONFIG['app_name'])
      "#{name} <#{recipient}@#{APP_CONFIG['outgoing']['from']}>"
    end

    def defaults
      content_type  'text/html'
      sent_on       Time.now
      from          from_address
    end
end
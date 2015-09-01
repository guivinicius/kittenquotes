class SubscriberMailer < ApplicationMailer

  def daily_wisdom(emails = [], quote, author, image_url)
    @quote     = quote
    @image_url = image_url
    @author    = author

    mail(to: ENV["ADMIN_EMAIL"], bcc: emails, subject: 'Daily Cat Wisdom')
  end
end

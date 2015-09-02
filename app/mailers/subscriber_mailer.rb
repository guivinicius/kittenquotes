class SubscriberMailer < ApplicationMailer

  def daily_wisdom(subscriber, quote, author, image_url)
    @email     = subscriber.email
    @token     = subscriber.token
    @quote     = quote
    @image_url = image_url
    @author    = author

    mail(to: @email, subject: 'Daily Cat Wisdom')
  end
end

# Preview all emails at http://localhost:3000/rails/mailers/subscriber_mailer
class SubscriberMailerPreview < ActionMailer::Preview
  def daily_wisdom
    SubscriberMailer.daily_wisdom(subscriber, quote, author, image_url)
  end

  private

  def subscriber
    Subscriber.new(email: "cat@catheaven.com", token: "123333aaa")
  end

  def quote
    "A cat must troll the owner."
  end

  def author
    "Whiskers"
  end

  def image_url
    "http://25.media.tumblr.com/tumblr_lp192uphOw1qdth8zo1_500.jpg"
  end
end

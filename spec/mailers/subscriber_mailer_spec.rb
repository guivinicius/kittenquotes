require "rails_helper"

RSpec.describe SubscriberMailer do
  let(:subscriber)    { FactoryGirl.create(:subscriber) }
  let(:quote)     { "A cat must troll the owner." }
  let(:author)    { "WarmKitty" }
  let(:image_url) { "http://cat.com/cat.jpg" }

  describe ".daily_wisdom" do
    let!(:email) { described_class.daily_wisdom(subscriber, quote, author, image_url).deliver_now }

    it 'sends the email' do
      expect(ActionMailer::Base.deliveries).not_to be_empty
    end

    it 'has all the right attributes' do
      expect(email.subject).to eq("Daily Cat Wisdom")
      expect(email.from).to eq(["bastet-no-reply@catheaven.eg"])
      expect(email.to).to eq([subscriber.email])
      expect(email.bcc).to eq([])
    end

    it 'has the right content' do
      expect(email.body.to_s).to include(quote)
      expect(email.body.to_s).to include(author)
      expect(email.body.to_s).to include(image_url)
      expect(email.body.to_s).to include(subscriber.token)
    end
  end
end

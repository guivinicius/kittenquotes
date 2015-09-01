require 'rails_helper'

RSpec.describe DailyWisdomJob do
  let(:subscribers) { FactoryGirl.create_list(:subscriber, 4) }
  let(:emails)      { subscribers.map(&:email) }
  let(:image_url)   { "someurl.com/cat.jpg" }
  let(:quote_body)  { File.read("#{Rails.root}/spec/fixtures/jobs/daily_wisdom.json") }
  let(:quote)       { "Bird by bird, buddy. Just take it bird by bird. " }
  let(:author)      { "Anne Lamott" }

  before do
    stub_request(:get, "thecatapi.com/api/images/get").
      with(:query => {"format" => "src", "results_per_page" => "1", "size" => "med"}).
      to_return(status: 302, body: "", headers: { "Location" => image_url} )

    stub_request(:get, "api.theysaidso.com/qod.json").
      to_return(status: 200, body: quote_body)
  end


  describe '.perform' do
    it 'sends the email' do
      message_delivery = instance_double(ActionMailer::MessageDelivery)

      expect(SubscriberMailer).to receive(:daily_wisdom).
        with(emails, quote, author, image_url).
        and_return(message_delivery)

      expect(message_delivery).to receive(:deliver_now)

      described_class.perform_now
    end
  end

end

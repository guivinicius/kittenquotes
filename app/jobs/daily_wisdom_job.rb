class DailyWisdomJob < ActiveJob::Base
  queue_as :default

  IMAGE_API_URI = "http://thecatapi.com/api/images/get?format=src&results_per_page=1&size=med"
  QUOTE_API_URI = "http://api.theysaidso.com/qod.json"

  def perform
    image_url = get_response(IMAGE_API_URI)['location']
    quote_obj = get_parsed_response(QUOTE_API_URI)['contents']['quotes'][0]

    Subscriber.all.find_each(batch_size: 100) do |subscriber|
      SubscriberMailer.daily_wisdom(
        subscriber,
        quote_obj['quote'],
        quote_obj['author'],
        image_url
      ).deliver_later
    end
  end

  private

  def get_response(uri)
    Net::HTTP.get_response(URI(uri))
  end

  def get_parsed_response(uri)
    JSON.parse(get_response(uri).body)
  end
end

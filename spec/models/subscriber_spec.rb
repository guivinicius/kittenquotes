require 'rails_helper'

RSpec.describe Subscriber, type: :model do

  describe "when email is already registered" do
    let(:email) { "softkitty@gmail.com" }

    before do
      described_class.create(email: email)
    end

    it 'doesn\'t allows to register same email' do
      expect {
        described_class.create(email: email)
      }.not_to change(described_class, :count)
    end
  end

end

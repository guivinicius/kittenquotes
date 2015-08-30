require 'rails_helper'

describe "Subscription process" do

  it "creates a new subscriber" do
    visit root_path

    within("form") do
      fill_in :email, :with => 'catlady@nyan.com'
    end
    click_button 'Subscribe'

    expect(page).to have_content 'You are now subscribed to the best cat wisdom website ever!'
  end
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # whitelist codeclimate.com so test coverage can be reported
  config.after(:suite) do
    WebMock.disable_net_connect!(:allow => 'codeclimate.com')
  end
end

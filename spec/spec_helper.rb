require_relative 'helpers/users_feature_helpers.rb'
require_relative 'helpers/term_feature_helpers.rb'
require_relative 'helpers/answer_feature_helpers.rb'

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

end

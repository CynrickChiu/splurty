require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  test "unique_tag" do
    quote = Quote.create(:author => 'Mister Dude', :saying => 'My name is Mister Dude.')
    expected = 'MD#' + quote.id.to_s
    actual = quote.unique_tag
    assert_equal expected, actual
  end
end

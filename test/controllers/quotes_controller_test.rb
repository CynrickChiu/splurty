require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  test "quote show page" do
    quote = Quote.create(:author => 'Mister Dude', :saying => 'My name is Mister Dude.')
    get :show, :id => quote.id
    assert_response :success
  end
  
  test "quote show page, not found" do
    get :show, :id => 'omg'
    assert_response :not_found
  end
end

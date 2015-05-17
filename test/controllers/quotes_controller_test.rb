require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  test "quote show page" do
    quote = FactoryGirl.create(:quote)
    get :show, :id => quote.id
    assert_response :success
  end
  
  test "quote show page, not found" do
    get :show, :id => 'omg'
    assert_response :not_found
  end

  test "create a quote success" do
    assert_difference 'Quote.count' do
      post :create, {:quote => {
        :author => 'Dude',
        :saying => 'For realz.'
        }
      }
    end
    assert_redirected_to root_path
    assert_equal 1, Quote.count
  end

  test "create a quote validation error" do
    quote = Quote.new(:author => '', :saying => '')
    assert !quote.valid?
  end
end

require 'spec_helper'

describe HomeController do
  devise_mappings
  login_user

  describe 'GET #index' do
    before :each do
      get :index
    end

    specify { response.should be_successful }
  end
end

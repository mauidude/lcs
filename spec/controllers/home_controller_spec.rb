require 'spec_helper'

describe HomeController do
  describe 'GET #index' do
    before :each do
      get :index
    end

    specify { response.should be_successful }
  end
end

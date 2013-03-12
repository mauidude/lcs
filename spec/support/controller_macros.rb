module ControllerMacros
  def devise_mappings
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end
  end

  def login_user(factory = :user)
    before :each do
      @current_user = FactoryGirl.create(factory)
      controller.sign_in @current_user
    end
  end
end
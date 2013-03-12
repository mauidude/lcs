class SecureController < ActionController::Base
  before_filter :load_projects
  layout 'secure'

  before_filter :authenticate_user!


  protected

    def load_projects
      @projects = Project.order(:name)
    end
end
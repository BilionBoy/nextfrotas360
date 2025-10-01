class ApplicationController < ActionController::Base
  include Pagy::Backend 
  include LayoutByUser
  include DevisePermittedParameters
  include AuthorizationHandler 
  before_action :authenticate_user!

end

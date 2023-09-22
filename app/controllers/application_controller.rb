class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization
  include Pagy::Backend
end

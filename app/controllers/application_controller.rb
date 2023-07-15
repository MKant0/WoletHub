class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include NumberHelper

  # include Pundit::Authorization

  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  protected

  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end
  # private


  # def skip_pundit?
  #   devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  # end
end

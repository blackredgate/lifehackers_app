class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def guest_check
    if current_user.email == "guest@example.com"
      flash[:notice] = "このページを見るには会員登録が必要です。"
      redirect_to root_path
    end
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      flash[:notice] = "作成者以外は編集できません。"
      redirect_to root_path
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end

  private

  def after_sign_out_path_for(resource_or_scope)
     if resource_or_scope == :user
         root_path
     elsif resource_or_scope == :admin
         new_admin_session_path
     else
         root_path
     end
  end
end

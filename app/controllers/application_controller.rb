class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  private

  def authorize_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user == @user
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :most_recent_tool

  def most_recent_tool
    if !current_user.nil? && current_user.tools.count < 0
      @most_recent_tool = current_user.tools.last
    else
      @most_recent_tool = Tool.new
    end
  end

  # def most_recent_tool
  #   if session[:tool_id]
  #     @most_recent_tool ||= Tool.find(session[:tool_id])
  #   else
  #     @most_recent_tool = Tool.new
  #   end
  # end

end

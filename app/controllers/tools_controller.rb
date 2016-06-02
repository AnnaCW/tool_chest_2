class ToolsController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
    @user = @tool.user
  end

  def new
    @tool = @user.tools.new
  end

  def create
    @tool = @user.tools.new(tool_params)
    if @tool.save
      # session[:tool_id] = @tool.id
      flash[:notice] = "Tool '#{@tool.name}' Created!"
      redirect_to tool_path(@tool)
    else
      flash[:error] = "#{@tool.errors.full_messages.join(", ")}"
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      flash.notice = "Tool '#{@tool.name}' Created!"
      redirect_to @tool
    else
      flash.error = "#{@tool.errors.full_messages.join(", ")}"
      render :edit
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    redirect_to tools_path
  end

private

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity, :category_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

end

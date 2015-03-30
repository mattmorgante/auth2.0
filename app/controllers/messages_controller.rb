class MessagesController < ApplicationController
  before_filter :authorize

  def index 
    @messages = Message.all 
  end 
  
  def new 
    @message = Message.new
  end 

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.save
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:title, :body)
  end 
end

 

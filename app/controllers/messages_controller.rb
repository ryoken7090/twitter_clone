class MessagesController < ApplicationController
  def new
    @message = Message.new
  end
  def create
    Message.create(message_params)
    redirect_to messages_path
  end
  def index
    @messages = Message.all
  end
  def show
    @message = Message.find(params[:id])
  end
  private
  def message_params
    params.require(:message).permit(:content)
  end
end

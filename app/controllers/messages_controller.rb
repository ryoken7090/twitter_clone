class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit]
  def new
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path
    else
      render :new
    end
  end
  def index
    @messages = Message.all
  end
  def show
  end
  def edit
  end
  private
  def message_params
    params.require(:message).permit(:content)
  end
  def set_message
    @message = Message.find(params[:id])
  end
end

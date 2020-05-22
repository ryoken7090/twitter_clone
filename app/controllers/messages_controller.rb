class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  def new
    @message = Message.new
  end
  def confirm
    @message = Message.new(message_params)
  end
  def create
    @message = Message.new(message_params)
    if params[:back]
      render :new
    else
      if @message.save
        redirect_to messages_path
      else
      render :new
    end
  end
  end
  def index
    @messages = Message.all
  end
  def show
  end
  def edit
  end
  def update
    if @message.update(message_params)
      redirect_to messages_path
    else
      render :edit
    end
  end
  def destroy
    @message.destroy
    redirect_to messages_path
  end
  private
  def message_params
    params.require(:message).permit(:content)
  end
  def set_message
    @message = Message.find(params[:id])
  end
end

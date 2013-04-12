class GameController < ApplicationController
  def chat
    Pusher.trigger(params[:chat_channel],'chat', params[:chat_message])
    render :nothing => true
  end
end
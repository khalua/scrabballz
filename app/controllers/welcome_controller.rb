class WelcomeController < ApplicationController

  def index
    @channels = Channel.order(:name)
  end

end
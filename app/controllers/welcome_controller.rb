class WelcomeController < ApplicationController

  def index
    binding.pry
    @channels = Channel.order(:name)
  end

end
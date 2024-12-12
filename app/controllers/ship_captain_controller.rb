class ShipCaptainController < ApplicationController
  before_action :set_microposts, only: [ :home ]
  def home
  end

  private
  def set_microposts
    @microposts = Micropost.all
  end
end

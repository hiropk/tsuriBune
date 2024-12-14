class ShipCaptainController < ApplicationController
  before_action :set_microposts, only: [ :home ]
  def home
  end

  def page_edit
    @page_contents = PageContent.all
  end

  def menu_edit
  end

  def fishing_service_info_edit
  end

  def schedule_edit
  end

  def link_edit
  end

  def safety_info_edit
  end

  private
  def set_microposts
    @microposts = Micropost.all
  end
end

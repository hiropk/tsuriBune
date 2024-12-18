class ShipCaptainController < ApplicationController
  before_action :set_microposts, only: [ :home ]
  def home
  end

  def page_edit
    @draft_contents = {}
    if params[:draft_contents]
      head = params[:draft_contents][:head]
      contents = params[:draft_contents][:contents]
      @draft_contents = { head => contents }.with_indifferent_access
    end

    @page_contents = PageContent.all
    @display_pages = @page_contents.pluck(:display_page).uniq
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

class FishingServiceInfosController < ApplicationController
  def show
    @fishing_service_info = FishingServiceInfo.first
  end

  def edit
  end

  def update
  end
end

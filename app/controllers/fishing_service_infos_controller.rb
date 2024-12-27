class FishingServiceInfosController < ApplicationController
  def show
    @fishing_service_info = FishingServiceInfo.first
  end

  def edit
    @fishing_service_info = FishingServiceInfo.first
  end

  def update
  end
end

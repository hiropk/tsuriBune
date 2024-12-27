class FishingServiceInfosController < ApplicationController
  before_action :set_fishing_service_info, only: %i[ show edit update ]
  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @fishing_service_info.update(fishing_service_info_params)
        format.html { redirect_to @fishing_service_info, notice: t("dictionary.message.update.complete") }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_fishing_service_info
    @fishing_service_info = FishingServiceInfo.find(params.expect(:id))
  end

  def fishing_service_info_params
    if administrator_str = params[:fishing_service_info][:administrator]
      params[:fishing_service_info][:administrator] = administrator_str.split(",")
    end

    params.expect(fishing_service_info: [ :name, :pref, :number, :registration_start_date, :registration_end_date, :address, :ship_name, :administrator ])
  end
end

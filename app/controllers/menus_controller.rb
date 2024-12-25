class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show edit update destroy ]

  def index
    @menus = Menu.all
  end

  def show
  end

  def new
    @menu = Menu.new
  end

  def edit
  end

  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: t("dictionary.message.create.complete") }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @menu.update(menu_params)
        format.html { redirect_to @menu, notice: t("dictionary.message.update.complete") }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @menu.destroy!

    respond_to do |format|
      format.html { redirect_to menus_path, status: :see_other, notice: t("dictionary.message.destory.complete") }
    end
  end

  private
    def set_menu
      @menu = Menu.find(params.expect(:id))
    end

    def menu_params
      params.expect(menu: [ :name, :embarkation_type, :unit_price, :acceptable_num, :payment_method ])
    end
end

class MicropotsController < ApplicationController
  def create
    @micropost = Current.session.user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = t("dictionary.message.create.complete")
      redirect_to root_url
    else
      flash[:danger] = @micropost.errors.full_messages.join(" / ")
      render @current_user, status: :unprocessable_entity
    end
  end

  def destroy
    @micropost = Micropost.find_by(id: params[:id])
    @micropost.destroy
    flash[:success] = t("dictionary.message.destroy.complete")
    if request.referrer.nil?
      redirect_to root_url, status: :see_other
    else
      redirect_to request.referrer, status: :see_other
    end
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content, :type)
  end
end

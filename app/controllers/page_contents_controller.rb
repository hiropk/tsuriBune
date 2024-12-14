class PageContentsController < ApplicationController
  def update
    @page_content = PageContent.find(page_contents_params[:page_content_id])
    if @page_content.update(contents: page_contents_params[:contents].split(","))
      flash[:success] = "更新しました。"
    else
      flash[:danger] = @page_content.errors.full_messages.join(" / ")
    end
    redirect_to root_path
  end

  private
  def page_contents_params
    params.permit(:page_content_id, :contents)
  end
end

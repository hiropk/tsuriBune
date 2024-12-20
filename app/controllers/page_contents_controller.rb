class PageContentsController < ApplicationController
  def update
    @page_content = PageContent.find(page_contents_params[:page_content_id])
    if @page_content.update(contents: page_contents_params[:contents].split(","))
      flash[page_contents_params[:head] + "success"] = "更新しました。"
    else
      flash[page_contents_params[:head] + "fail"] = @page_content.errors.full_messages.join(" / ")
    end
    redirect_to ship_captain_page_edit_path(draft_contents: page_contents_params)
  end

  private
  def page_contents_params
    params.permit(:page_content_id, :head, :contents)
  end
end

class ContentItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :obfuscate_content_item, only: [:show]
  before_action :set_content_item, only: [:completed_ad]
  before_action :already_watched, only: [:show]
  before_action :set_video_content, only: [:show]
  layout 'blank'

  def show
  end

  def completed_ad
    ad_success = current_user.mark_as_visited(@content_item)
    respond_to do |format|
      format.json {
        render json: { user: current_user, success: ad_success }
      }
    end
  end

  private

  def obfuscate_content_item
    @content_item = ContentItem.find(params[:id])
  end

  def set_content_item
    @content_item = ContentItem.find_by_id(params[:id])
  end

  def already_watched
    recorded_items = current_user.recorded_items
    redirect_to root_url, alert: 'You have already watched this Ad' if @content_item.not_allowed(recorded_items)
  end

  def set_video_content
    @video_content = @content_item.video_object if @content_item && @content_item.is_video?
  end
end

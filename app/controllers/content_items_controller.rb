class ContentItemsController < ApplicationController
  before_action :obfuscate_content_item, only: [:show]
  before_action :set_content_item, only: [:completed_ad]
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
end

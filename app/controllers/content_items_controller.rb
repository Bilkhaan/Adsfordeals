class ContentItemsController < ApplicationController
  before_action :set_content_item, only: [:show]
  layout 'blank'

  def show
  end

  private

  def set_content_item
    @content_item = ContentItem.find(params[:id])
  end
end

ActiveAdmin.register ContentItem do
  permit_params :title, :description, :priority, :ad_type, :coins, :content
end

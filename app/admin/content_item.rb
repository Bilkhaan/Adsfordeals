ActiveAdmin.register ContentItem do
  permit_params :title, :description, :priority, :ad_type, :coins, :content

  form do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :description
      f.input :ad_type, as: :select,
          collection: ContentItem::CONTENT_TYPES.collect {|v| [v, v]}
      f.input :priority, as: :select,
          collection: ContentItem::CONTENT_PRIORITIES.collect {|v| [v, v]}
      f.input :content
      f.input :coins
    end
    f.actions
  end
end

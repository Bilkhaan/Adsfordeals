ActiveAdmin.register ContentItem do
  permit_params :title, :description, :priority, :ad_type, :coins, :content, :is_active, :is_deleted, images_attributes: [:id, :photo, :_destroy]

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
      f.input :is_active
      f.input :is_deleted
      f.has_many :images do |cf|
        if cf.object.photo.present?
          cf.input :photo, as: :file, hint: cf.template.image_tag(cf.object.photo.url(:thumb))
          cf.input :_destroy, as: :boolean, required: false, label: 'Remove image'
        else
          cf.input :photo
        end
      end
    end
    f.actions
  end

  show do |content_item|
    attributes_table do
      row :title
      row :description
      row :ad_type
      row :priority
      row :content
      row :coins
      row :is_active
      row :is_deleted
      row "Images" do
        ul do
          content_item.images.each do |img|
            li do
              image_tag(img.photo.url(:thumb))
            end
          end
        end
      end
    end
  end
end

ActiveAdmin.register Reward do
  permit_params :title, :description, :price_in_coins, images_attributes: [:id, :photo, :_destroy]

  form do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :description
      f.input :price_in_coins
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

  show do |reward|
    attributes_table do
      row :title
      row :description
      row :price_in_coins
      row "Images" do
        ul do
          reward.images.each do |img|
            li do
              image_tag(img.photo.url(:thumb))
            end
          end
        end
      end
    end
  end
end

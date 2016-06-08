ActiveAdmin.register Deal do
  permit_params :title, :description, :highlight, :package, :facebook_link, :fine_print, :price, :price_after_discount, :discount, :coins, :price_after_coins, :location, :valid_to, images_attributes: [:id, :photo, :_destroy]

  form do |f|
    f.inputs 'Details' do
      f.input :title
      f.input :description
      f.input :highlight
      f.input :package
      f.input :fine_print
      f.input :facebook_link
      f.input :price
      f.input :price_after_discount
      f.input :discount
      f.input :coins
      f.input :price_after_coins
      f.input :location
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

  show do |deal|
    attributes_table do
      row :title
      row :description
      row :highlight
      row :package
      row :fine_print
      row :facebook_link
      row :price
      row :price_after_discount
      row :discount
      row :coins
      row :price_after_coins
      row :location
      row "Images" do
        ul do
          deal.images.each do |img|
            li do
              image_tag(img.photo.url(:thumb))
            end
          end
        end
      end
    end
  end
end

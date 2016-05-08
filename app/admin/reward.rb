ActiveAdmin.register Reward do
  permit_params :title, :description, :price_in_coins
end

class ConfirmationsController < Devise::ConfirmationsController
  layout 'normal', only: [:show, :create, :new]
end

class RegistrationsController < Devise::RegistrationsController
  layout 'normal', only: [:new, :create]
end

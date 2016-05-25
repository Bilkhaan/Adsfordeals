module UsersHelper
  def panel_class(priority)
    {'featured' => 'panel-green', 'regular' => 'panel-primary', 'default' => 'panel-orange'}[priority]
  end

  def can_purchase?
    current_user.address.present? && current_user.phone.present?
  end

  def has_address?
    current_user.address.present?
  end

  def has_phone?
    current_user.phone.present?
  end

  def can_purchase_with_coins? amount
    can_purchase? && current_user.coins >= amount
  end
end

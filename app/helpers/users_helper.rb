module UsersHelper
  def panel_class(priority)
    {'featured' => 'panel-green', 'regular' => 'panel-primary', 'default' => 'panel-orange'}[priority]
  end
end

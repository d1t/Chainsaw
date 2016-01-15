module ApplicationHelper
 def resource_name
    :partner
  end

  def resource
    @resource ||= Partner.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:partner]
  end
end

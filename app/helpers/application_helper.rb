module ApplicationHelper
<<<<<<< HEAD

 def resource_name
    :partner
  end

  def resource
    @resource ||= Partner.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:partner]
  end
=======
>>>>>>> 635a7b70783a009bb6b645f8455131233d3b78ff
end

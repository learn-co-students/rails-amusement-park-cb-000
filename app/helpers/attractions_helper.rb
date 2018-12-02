module AttractionsHelper
  def admin_controls_for_index(user)
    if user.try(:admin?)
      content_tag :div, class:"index-admin-controls" do
        link_to 'New Attraction', new_attraction_path
      end
    end
  end

  def admin_controls_for_show(user, attraction)
    if user.try(:admin?)
      content_tag :div, class: "admin-controls" do
        link_to 'Edit Attraction', edit_attraction_path(attraction)
      end
    end
  end

  def attractions_list_for(user, attractions)
    attractions_list_element(attractions) do |attraction|
      if user.try(:admin?)
        "Show #{attraction.name}"
      else
        "Go on #{attraction.name}"
      end
    end
  end

  def attractions_list_element(attractions)
    content_tag_for :ul, attractions do |attraction|
      content_tag :li, attraction do
        link_to yield(attraction), attraction_path(attraction)
      end
    end
  end
end
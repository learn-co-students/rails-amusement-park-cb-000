module AttractionsHelper
  def text_based_on_user(attraction)
    link_to attraction do
      text = current_user.admin? ? 'Show ' : 'Go on '
      text + attraction.name
    end
  end
end

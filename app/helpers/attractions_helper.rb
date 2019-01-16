module AttractionsHelper

#define admin control of the index view
  def admin_controls_for_index(user)
    #check if user is an admin
    if user.try(:admin?)
      #create a div with class style index-admin-controls if user is an admin
      content_tag :div, class:"index-admin-controls" do
        #display link to page that allows for creating a new attraction
        link_to 'New Attraction', new_attraction_path
      end
    end
  end

  #define admin control of the show view
    def admin_controls_for_show(user, attraction)
      #check if user is an admin
      if user.try(:admin?)
        #create a div with class style admin-controls if user is an admin
        content_tag :div, class:"admin-controls" do
          #display link to page that allows for editing the attraction
          link_to 'Edit Attraction', edit_attraction_path(attraction)
        end
      end
    end

    def attractions_list_for(user, attractions)
      #list all attractions with links
      attractions_list_element(attractions) do |a|
        #if user is an admin, allow them to visit the show page of the attraction
        if user.try(:admin?)
          "Show #{a.name}"
        else
          #if user is not an admin, they may "ride" the attraction
          "Go on #{a.name}"
        end
      end
    end

    def attractions_list_element(attractions)
      #create unordered list of attractions
      content_tag_for :ul, attractions do |a|
        # define what each list item will be
        content_tag :li, a do
          #each list item is a link to an attraction
          link_to yield(a), attraction_path(a)
        end
      end
    end
  end

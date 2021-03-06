class FetchEats
  def initialize(search_term, search_location)
    @search_term = search_term
    @search_location = search_location
  end

  def fetch_all_data
    data = fetch_restaurant_data

    if data.status == 200
      data = parse_api_data
      restaurant_data = parse_restaurant_data(data)
      menu_item_data = parse_menu_item_data(data, restaurant_data)

      format_menu_items_restaurants(menu_item_data)
    elsif data.status == 400
      MenuItem.where("menu_item iLIKE '%#{@search_term}%'")
    end
  end

  def fetch_restaurant_data
    data = LocuAPI.new(@search_term, @search_location).locu_search
  end

  # def fetch_restaurants
  #   YelpAPI.new(@search_term, @search_location)
  # end

  def parse_restaurant_data(data)
    restaurants = BuildRestaurant.new(data, @search_location).save_restaurants
  end

  def parse_menu_item_data(data, restaurant_data)
    menu_items = BuildMenuItem.new(data, restaurant_data).parse_menu_items
  end

  def format_menu_items_restaurants(menu_item_data)
    result = menu_item_data.map do |data|
      address = ''
      street_name = StreetName.find(data[1].street_name_id)
      postal_code = PostalCode.find(street_name.postal_code_id)
      city_code = City.find(postal_code.city_id)
      state_code = StateCode.find(city_code.state_code_id)

      address += %Q{#{data[1].street_number} #{street_name.street_name} #{city_code.city},
      #{state_code.state_code} #{postal_code.postal_code}}

      { menu_item: data[0], restaurant: data[1], address: address }
    end
    # result.uniq!
  end

  def parse_api_data
    a = JSON.parse(data.to_json)
    b = JSON.parse(a['body'])

    b['venues']
  end
end

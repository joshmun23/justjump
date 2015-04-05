class RestaurantMenuItems < ActiveRecord::Base
  validates :menu_item_id, numericality: true

  validates :restaurant_id, numericality: true

  belongs_to :restaurants

  belongs_to :menu_items

  # def initialize
  #       #Still need to search dynamically
  #       # if params.count > 2
  #       #   if !params['menu_item'].empty?
  #       #     search_term = params['menu_item']
  #       #     @search_results = get_yelp_data(search_term)
  #       #     @menu_results = locu_id
  #       #     binding.pry
  #       #   end
  #       # end
  #   # @menu_items = MenuItem.all

  #   #if there are no results from db or info has not been updated after 2-3 days, search apis for new data
  #   @a = locu_id("chicken parm", "Boston")

  #   @a.each_with_index do |restaurant, index|
  #     @restaurant = Restaurant.build_from_yelp(r_data)
  #     @restaurant.save

  #     if index == 0
  #       @restaurant.name = restaurant['name']

  #       if restaurant['location']['locality']
  #         @restaurant.locality = restaurant['location']['locality'].split(' ').join('-')
  #         binding.pry
  #       else
  #         @restaurant.locality = 'Boston'
  #         binding.pry
  #       end

  #       request = "#{@restaurant.name.split(' ').join('-')}-#{@restaurant.locality}"
  #       r_data = yelp_client.business(request)
  #       r_data = JSON.parse(r_data.to_json)

  #       @restaurant.phone = r_data['phone']
  #       @restaurant.is_closed = r_data['is_closed']
  #       @restaurant.url = r_data['url']
  #       @restaurant.longitude = r_data['location']['coordinate']['longitude'].to_f
  #       @restaurant.latitude = r_data['location']['coordinate']['latitude'].to_f
  #       @restaurant.street_number = r_data['location']['address'].split(' ').first

  #       @street_name.street_name = r_data['location']['address'][0].split(' ')[1..-1].join(' ')

  #       @neighborhood.neighborhood = r_data['location']['neighborhoods'].first

  #       @postal_code.postal_code = r_data['location']['postal_code']

  #       @city.city = r_data['location']['city']

  #       @state_code.state_code = r_data['location']['state_code']

  #       @country_code.country_code = r_data['location']['country_code']

  #       @neighborhood.save
  #       @country_code.save

  #       @state_code.country_code_id = @country_code.id
  #       @state_code.save

  #       @city.state_code_id = @state_code.id
  #       @city.save

  #       @postal_code.city_id = @city.id
  #       @postal_code.neighborhood_id = @neighborhood.id #need to remove this maybe?
  #       @postal_code.save

  #       @street_name.postal_code_id = @postal_code.id
  #       @street_name.save

  #       @restaurant.street_name_id = @street_name.id
  #       @restaurant.postal_code_id  = @postal_code.id

  #       restaurant['menu_items'].each do |menu_item|
  #         @menu_item.name = menu_item['name']
  #         @menu_item.price = menu_item['price'].to_f

  #         @restaurant.save
  #         @menu_item.save
  #       end
  #     end
  #     @menu_item = MenuItem.new
  #     @restaurant = Restaurant.new
  #   end
  # end

  # def menu_items
  #   []
  # end

end

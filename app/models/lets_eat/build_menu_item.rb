class BuildMenuItem
  def initialize(data, restaurant_data)
    @data = data
    @restaurant_data = restaurant_data
    @menu_item = MenuItem.new
  end

  def parse_menu_items
    results = []
    @data.each_with_index do |restaurant, index|
      current_restaurant_id = @restaurant_data[index].id

      # current_restaurant_id = Restaurant.where(name: restaurant['name']).first

      restaurant['menu_items'].each do |menu_item|
        if !MenuItem.where(menu_item: menu_item['name'], restaurant_id: current_restaurant_id).first
          @menu_item.menu_item = menu_item['name']
          @menu_item.price = menu_item['price']
          @menu_item.restaurant_id = current_restaurant_id
          @menu_item.save

        else
          @menu_item = MenuItem.where(menu_item: menu_item['name'], restaurant_id: current_restaurant_id).first
        end

        a = find_or_create_restaurant_menu_item(@menu_item.id, current_restaurant_id)

        results << [@menu_item, @restaurant_data[index]]

        @menu_item = MenuItem.new
      end
    end
    results
  end

  def find_or_create_restaurant_menu_item(menu_item_id, restaurant_id)
    index_exists = !RestaurantMenuItems.where(menu_item_id: menu_item_id, restaurant_id: restaurant_id).empty?

    RestaurantMenuItems.create!(menu_item_id: menu_item_id, restaurant_id: restaurant_id) if !index_exists
  end
end

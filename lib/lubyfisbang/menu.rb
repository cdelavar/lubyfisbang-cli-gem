class Lubyfisbang::Menu

  @@all = []

  def self.all
    @@all
  end

  def get_attribute_options(attributes)
    @@all << attributes
  end

  def self.list_attribute_options
    attribute_keys = @@all[0].keys
    attribute_keys.each do |key|
      puts "#{key}"
    end
  end

  def self.menu_user_choice(attribute)
    self.all.each_with_index do |meetup, index|
      puts "#{index+1}. #{meetup[attribute]}"
    end
  end

end
class Lubyfisbang::Menu

  @@all = []

  def list_attribute_options(attributes)
    attributes.each do |attribute|
      @@all << attribute
    end
  end

  def print_attribute_options
    @@all.each do |option|
      puts "#{option}"
    end
  end
end
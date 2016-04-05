class Lubyfisbang::Meetup

  @@all = []

  def initialize(attributes)
      attributes.each do |attribute_name, attribute_value|
      self.class.send(:define_method, "#{attribute_name}=".to_sym) do |value|
        instance_variable_set("@" + attribute_name.to_s, value)
      end

      self.class.send(:define_method, attribute_name.to_sym) do
        instance_variable_get("@" + attribute_name.to_s)
      end

      self.send("#{attribute_name}=".to_sym, attribute_value)

    end 
    @@all << self
    Lubyfisbang::CLI.list_attribute_options(attributes)
  end
  
  def self.all
    @@all
  end

  def print_all_meetups
    @@all.each {|item| puts "#{item}"}
  end

  def order_by_date_new_to_old
    self.all.sort do |i, x|
      Time.at(x.time) <=> Time.at(i.time)
    end
    self.each {|item| puts "#{item}"}
  end

  def list(attribute)
    array = self.all.collect {|i| i.attribute}
    array.uniq.each {|item| puts "#{item}"}
  end

  def find_meetup(attribute, value)
    self.all.detect {|i| i.attribute.include?(value)}
    #Meetup.all.detect {|i| i.name == "Happy Hour @ Lexington Club"} works
  end
end
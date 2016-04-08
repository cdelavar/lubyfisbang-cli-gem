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
  end
  
  def self.all
    @@all
  end

  

  def self.print_all_meetups
    array = []
    self.all.each do |attribute|
      if attribute.description
        attribute.description = attribute.description.gsub(%r{</?[^>]+?>}, '')
      end
        array << attribute
    end
    output = array.to_yaml({:indentation => 3, :line_width => -1})
    puts output
  end

  def self.order_by_date_new_to_old
    array = []
    self.all.each do |attribute|
      if attribute.description
        attribute.description = attribute.description.gsub(%r{</?[^>]+?>}, '')
      end
        array << attribute
    end
    output = array.reverse.to_yaml({:indentation => 3, :line_width => -1})
    puts output
  end

  def self.list(attribute)
    self.all.collect {|i| i.attribute}
    self.uniq.each {|item| puts "#{item}"}
  end

  def self.find_meetup(attribute, value)
    self.all.detect {|i| i.attribute.include?(value)}
    #Meetup.all.detect {|i| i.name == "Happy Hour @ Lexington Club"} works
  end


end
class Lubyfisbang::GroupDetails < Lubyfisbang::Meetup

  @@group_details = []

  def initialize(attributes)
    @@group_details << attributes
  end
  
  def self.all
    @@group_details 
  end

  def self.print_all_group_details
    array = []
    self.all.each do |attribute|
      array << attribute
    end
    output = array.to_yaml({:indentation => 3, :line_width => -1})
    puts output
  end

end

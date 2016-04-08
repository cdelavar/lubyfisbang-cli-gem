class Lubyfisbang::GroupDetails < Lubyfisbang::Meetup

  @@group_details = []

  def initialize(attributes)
    binding.pry
    @@group_details << attributes
  end
  
  def self.group_details
    @@group_details 
  end

  def self.print_all_group_details
    array = []
    self.group_details.each do |attribute|
      array << attribute
    end
    output = array.to_yaml({:indentation => 3, :line_width => -1})
    puts output
  end

end

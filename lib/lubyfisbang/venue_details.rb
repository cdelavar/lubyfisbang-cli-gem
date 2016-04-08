class Lubyfisbang::VenueDetails < Lubyfisbang::Meetup

  @@venue_details = []

  def initialize(attributes)
    @@venue_details << attributes
  end
  
  def self.all
    @@venue_details 
  end

  def self.print_all_venue_details
    array = []
    self.all.each do |attribute|
      array << attribute
    end
    output = array.to_yaml({:indentation => 3, :line_width => -1})
    puts output
  end
  
end
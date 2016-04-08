class Lubyfisbang::VenueDetails < Lubyfisbang::Meetup

  @@venue_details = []

  def initialize(attributes)
    @@venue_details << attributes
  end
  
  def self.all
    @@venue_details[0] 
  end

  def self.print_all_venue_details
    self.all.each do |attribute, value|
      puts "#{attribute}: #{value}"
    end
  end
  
end
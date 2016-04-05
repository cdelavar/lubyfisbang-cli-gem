class Lubyfisbang::CLI

@@menu = []

  def call
    puts "\“Where are you? Are you here Mr. spooky space creature?\""
    gets.chomp
    puts "Welcome to the Meetup Helper."
    Lubyfisbang::Scraper.new.get_meetups
    binding.pry
    puts "\“Ed will help.\""
    options
  end

  def options
    puts "What would you like to do?"
    #1. List all meetups attended and details (oldest to newest)
    Lubyfisbang::Meetup.print_all_meetups
    #2. List all meetups attended and details (newsest to oldest)
    Lubyfisbang::Meetup.order_by_date_new_to_old
    #3. List details of a single attribute for all meetups
    format_attribute_options
    puts "Which attribute would you like to see deatils about?"
    atribute = gets.chomp
    Lubyfisbang::Meetup.list(attribute)
    #4. List details about a meetup group
    Lubyfisbang::GroupDetails.print_all_meetups
    #5. List details about the meetup venue
    Lubyfisbang::VenueDetails.print_all_meetups
    #6. Find a meetup based on an attribute value.
    Lubyfisbang::Meetup.find_meetup(attribute, value)
  end

  def list_attribute_options(attributes)
    attributes.each do |attribute|
      @@menu << attribute
    end
  end

  def print_attribute_options
    @@menu.each do |option|
      puts "#{option}"
    end
  end

  
end
class Lubyfisbang::CLI

  def call
    puts "\“Where are you? Are you here Mr. spooky space creature?\""
    gets.chomp
    puts "Welcome to the Meetup Helper."
    Lubyfisbang::Scraper.new.get_meetups
    puts "\“Ed will help.\""
    
    options
    get_user_input
    puts "Would you like to do anything else? Yes or No"

    input = gets.chomp.upcase
    if input == "YES"
      options
    elsif input == "NO" 
      puts "Your socks are coo-ool. Gotta wear 'em outside!"
    else 
      puts "Are you speaking Space Creature? Try typing again."
      options
    end
  end

  def options
    puts "What would you like to do? Enter the number of the option you want to initiate."
    puts "1. List all meetups attended and details (oldest to newest)"
    puts "2. List all meetups attended and details (newsest to oldest)"
    puts "3. List details of a single attribute for all meetups"
    puts "4. List details about a meetup group"
    puts "5. List details about the meetup venue"
    puts "6. Find a meetup based on an attribute value."
    puts "7. Find pictures from a meetup"
  end

  def get_user_input
    input = gets.chomp.to_i
    case input
      when 1
        Lubyfisbang::Meetup.print_all_meetups
        binding.pry
      when 2
        Lubyfisbang::Meetup.order_by_date_new_to_old
      when 3
        Lubyfisbang::Menu.print_attribute_options
        puts "Which attribute would you like to see deatils about?"
        atribute = gets.chomp
        Lubyfisbang::Meetup.list(attribute)
      when 4
        Lubyfisbang::GroupDetails.print_all_meetups
      when 5
        Lubyfisbang::VenueDetails.print_all_meetups
      when 6
        Lubyfisbang::Menu.print_attribute_options
        puts "Which attribute?"
        attribute = gets.chomp
        puts "What value?"
        value = gets.chomp
        Lubyfisbang::Meetup.find_meetup(attribute, value)
      when 7
        Lubyfisbang::Scraper.new.get_pictures
    end
  end
  
end
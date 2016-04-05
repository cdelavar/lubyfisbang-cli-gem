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
    #2. List all meetups attended and details (newsest to oldest)
    #3. List details of a single attribute for all meetups
    #4. List details about a meetup group
    #5. List details about the meetup venue
  end

  def list_attribute_options(attributes)
    attributes.each do |attribute|
      @@menu << attribute
    end
  end

  
end
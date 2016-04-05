class Lubyfisbang::Scraper

  def initialize(agent = nil)
    @agent = Mechanize.new
  end

  def sign_in
    page = @agent.get('https://secure.meetup.com/login/')
    sign_in = page.forms[1]
    puts "\"Satellite from days of old, lead me to your access code.\""
    puts "Sign in to Meetup.com"
    puts "Email: "
    sign_in.email = gets.chomp
    puts "Password: "
    sign_in.password = STDIN.noecho(&:gets).chomp
    page = @agent.submit(sign_in)
    self
  end

  def get_api_key
    api_key = @agent.get('https://secure.meetup.com/meetup_api/key/').css("#api-key-reveal").first.attribute("value").text
  end

  def parse_meetups
    sign_in
    url = "https://api.meetup.com/2/events?key=#{get_api_key}&sign=true&photo-host=public&rsvp=yes&status=past"
    results = @agent.get(url)
    save = results.content
    parsed_results = JSON.parse(save)
    parsed_results["results"]
  end
    

  def get_meetups
    parse_meetups.each do |attributes|
      menu = Lubyfisbang::Menu.new
      menu.list_attribute_options(attributes)
      Lubyfisbang::Meetup.new(attributes)
      if attributes == "group"
        Lubyfisbang::GroupDetails.new(attributes)
      elsif attributes == "venue"
        Lubyfisbang::VenueDetails.new(attributes)
      end
    end
  end

  def get_pictures
    Lubyfisbang::Meetup.list(event_url)
    puts "Copy and paste the url of the meetup you want: "
    input = gets.chomp
    uri = URI(input)
    urlname = uri.path.split('/')[1]
    event_id = uri.path.split('/')[3]
    url = "https://api.meetup.com/#{urlname}/events/#{event_id}/photos?key=#{get_api_key}&sign=true&photo-host=public"
    results = @agent.get(url)
    save = results.content
    parsed_results = JSON.parse(save)
  end
end
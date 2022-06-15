# A welcome message called before the main menu loop
def welcome
    puts "Welcome to Quote Manager!"
    puts "- - - - - - - - - - - - -"
    puts "You have #{Quote.all.count} quotes, by #{Author.all.count} authors, in #{Topic.all.count} topics."
end

# The main menu
def main_prompt
    options = {
        0 => "View a random quote",
        1 => "Add a new quote",
        2 => "See all quotes",
        3 => "See all topics",
        4 => "See all authors"
    }
    
    # Prompt user for input and displays options
    puts
    puts "What would you like to do?"
    puts "Enter one of the following numbers, or X to quit."
    for index, command in options do
        puts "#{index}: #{command}"
    end

    input = gets.chomp.downcase

    # Handle input
    case input
    when "x", "q", "quit"
        exit
    when "0"
        random_quote()
    when "1"
        puts "to be implemented"
    when "2"
        all_quotes()
    when "3"
        all_topics()
    when "4"
        all_authors()
    else
        puts
        puts "I didn't recognize that command. Please try again."
        sleep(1)
    end

end

# Displays a random quote and prompts the user if they want to know more about it
def random_quote
    quote = Quote.all.sample
    puts
    puts "Here's a quote from #{quote.author.name}"
    puts "\"#{quote.message}\""
    
    puts
    puts "Would you like to learn more about this quote? (y/n)"
    input = gets.chomp.downcase
    if ["y","yes"].include?(input) then quote_details(quote) end
end

# Displays all quotes
def all_quotes
    Quote.in_batches.each_record do |quote|
        simple_quote_display(quote)
    end

    click_to_continue()
end

# Displays all topics
# Allows for viewing quote by topic
def all_topics
    all_models(Topic)
end

# Displays all authors
# Allows for viewing quote by author
def all_authors
    all_models(Author)
end

# Given a class, model, outputs that model's instances
# and prompts to output their quotes as well
# Expects the Author or Topic class as input
def all_models(model)
    model_name = model.name

    puts
    puts "#{model_name}s"
    puts "=================="
    model.all.order(name: :asc).each{|itm| puts "#{itm.name}: #{itm.quotes.count} quotes" }

    puts
    puts "Enter the name of a #{model_name.downcase} to see their quotes. Otherwise, press Enter to return to the main menu."
    input = gets.chomp
    if input == "" then return end

    names = model.all.map(&:name)

    if names.include?(input) then
        itm = model.find_by(name: input)
        itm.quotes.in_batches.each_record { |quote| simple_quote_display(quote) }
    else
        puts
        puts "I didn't find that #{model_name.downcase}."
    end

    sleep(1)
end
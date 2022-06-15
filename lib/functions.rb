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
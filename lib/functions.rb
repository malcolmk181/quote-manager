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

    names = model.pluck(:name)

    if names.include?(input) then
        itm = model.find_by(name: input)
        itm.quotes.in_batches.each_record { |quote| simple_quote_display(quote) }
    else
        puts
        puts "I didn't find that #{model_name.downcase}."
    end

    sleep(1)
end

# Prompts the user for quote details and adds quote
# to database (or cancels)
def new_quote
    # Room for improvement
        # should check that the message, author, and topic are not empty
            # and not accept input until this is true
        # a lot of repetitive code in here

    quote = Quote.new
    
    # Get message
    puts
    puts "Enter the content of your quote:"
    message = gets.chomp
    quote.message = message

    # Get author
    puts "Enter the author of your quote:"
    author = gets.chomp

    author_lookup = Author.where("name LIKE ?", author)
    if author_lookup.count > 0 then
        quote.author = author_lookup[0]
    else
        quote.author = Author.new(name: author)
    end

    # Get topic
    puts "Enter the topic of your quote:"
    topic = gets.chomp

    topic_lookup = Topic.where("name LIKE ?", topic)
    if topic_lookup.count > 0 then
        quote.topic = topic_lookup[0]
    else
        quote.topic = Topic.new(name: topic)
    end

    # Get source
    puts "Enter the source of the quote (not the URL - but whatever body of work or instance this came from), or press Enter to skip:"
    source = gets.chomp
    if source != "" then
        quote.source = source
    end

    # Get year
    puts "Enter the year of your quote, or press Enter to skip (If the year is in B.C., add a - before the year):"
    year = gets.chomp
    if year != "" then
        quote.year = year.to_i
    end

    # Get URL
    puts "Enter the URL of your quote, or press Enter to skip:"
    url = gets.chomp
    if url != "" then
        quote.url = url
    end

    quote_details(quote)

    puts
    puts "If this looks right, type confirm to add to the database, or cancel to cancel:"
    input = gets.chomp.downcase

    if input == "confirm" then
        quote.save
    end

end
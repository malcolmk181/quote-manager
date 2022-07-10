# Displays a random quote and prompts the user if they want to know more about it
def random_quote
    quote = Quote.all.sample
    puts
    puts "Here's a quote from #{quote.author.name}:"
    puts "\"#{quote.message}\"".italic
    
    puts
    puts "Would you like to learn more about this quote? (y/n)".cyan
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
    puts "#{model_name}s".bold
    puts "=================="
    model.all.order(name: :asc).each{|itm| puts "#{itm.name.yellow}: #{itm.quotes.count} quote#{itm.quotes.count == 1 ? "" : "s"}" }

    puts
    puts "Enter the name of a#{["a","e","i","o","u"].include?(model_name.downcase[0]) ? "n" : ""} #{model_name.downcase} to see #{model_name.downcase == "author" ? "their" : "its"} quotes. Otherwise, press Enter to return to the main menu.".cyan
    input = gets.chomp
    if input == "" then return end

    names = model.pluck(:name)

    if names.include?(input) then
        itm = model.find_by(name: input)

        if itm.quotes.count == 0 then
            puts
            puts "#{itm.name} has no quotes."
            puts "To stop displaying this #{model_name.downcase}, use the clean option at the main menu."
        else
            itm.quotes.in_batches.each_record { |quote| simple_quote_display(quote) }
        end
    else
        puts
        puts "I didn't find that #{model_name.downcase}."
    end

    click_to_continue()
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
    puts "Enter the content of your quote:".cyan
    message = gets.chomp
    quote.message = message

    # Get author
    puts "Enter the author of your quote:".cyan
    author = gets.chomp

    author_lookup = Author.where("name LIKE ?", author)
    if author_lookup.count > 0 then
        quote.author = author_lookup[0]
    else
        quote.author = Author.new(name: author)
    end

    # Get topic
    puts "Enter the topic(s) of your quote - separate topics with commas:".cyan
    topics = gets.chomp.split(",").map(&:strip)

    topics.each do |topic|
        topic_lookup = Topic.where("name LIKE ?", topic)
        if topic_lookup.count > 0 then
            quote.topics << topic_lookup[0]
        else
            quote.topics << Topic.new(name: topic)
        end
    end
    

    # Get source
    puts "Enter the source of the quote (not the URL - but whatever body of work or instance this came from), or press Enter to skip:".cyan
    source = gets.chomp
    if source != "" then
        quote.source = source
    end

    # Get year
    puts "Enter the year of your quote, or press Enter to skip (If the year is in B.C., add a - before the year):".cyan
    year = gets.chomp
    if year != "" then
        quote.year = year.to_i
    end

    # Get URL
    puts "Enter the URL of your quote, or press Enter to skip:".cyan
    url = gets.chomp
    if url != "" then
        quote.url = url
    end

    quote_details(quote)

    puts
    puts "If this looks right, type confirm to add to the database, or cancel to cancel:".cyan
    input = gets.chomp.downcase

    if input == "confirm" then
        quote.save
    end

end

# Prints out all quotes and their IDs
# Prompts for the ID of a quote to delete
def delete_a_quote
    puts
    puts "Here are the quotes in the database. Take note of the ID of the quote you would like to delete."
    Quote.all.in_batches.each_record { |quote| simple_quote_display(quote, true) }

    puts
    puts "Enter the ID of the quote you would like to delete, or press Enter to cancel:".cyan
    input = gets.chomp

    if input == "" then
        return
    elsif Quote.ids.include?(input.to_i) then
        Quote.find(input.to_i).destroy
        puts "Quote #{input} has been deleted."
    else
        puts "#{input} is not a valid quote ID."
    end

    sleep(1)
end

# Removes any topics or authors from the database that have no
# quotes that belong to them
def remove_quoteless
    removed_topics = 0
    removed_authors = 0
    Topic.in_batches.each_record {|topic| if topic.quotes.count == 0 then topic.destroy ; removed_topics += 1 end }
    Author.in_batches.each_record {|author| if author.quotes.count == 0 then author.destroy ; removed_authors += 1 end }

    puts
    puts "Removed #{removed_topics} topic#{removed_topics == 1 ? "" : "s"} and #{removed_authors} author#{removed_authors == 1 ? "" : "s"}."

    sleep(1)
end

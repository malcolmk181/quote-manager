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

# Displays more detail about a quote
# Takes a quote object
def quote_details(quote)
    puts
    puts "\"#{quote.message}\""
    puts "By #{quote.author.name}" + (!quote.year.nil? ? " in #{year_formatter(quote.year)}" : "")
    if !quote.source.nil? then puts "Source: #{quote.source}" end
    if !quote.url.nil? then puts "URL: #{quote.url}" end
    puts "The topic is #{quote.topic.name}"
    puts "This quote was added to the database on #{quote.created_at.strftime('%m/%d/%Y')}"

    click_to_continue()
end

# Prompts the user to press a key to continue
# this 'click key to continue' function taken from
# https://stackoverflow.com/questions/34594018/how-to-code-press-key-to-continue                                                                            
def click_to_continue
    puts
    puts "Press any key to continue"
    STDIN.getch
    print "            \r" # extra space to overwrite in case next sentence is short
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
    puts
    puts "Topics"
    puts "=================="
    Topic.all.order(name: :asc).each{|topic| puts "#{topic.name}: #{topic.quotes.count} quotes" }

    puts
    puts "Enter the name of a topic to see its quotes. Otherwise, press Enter to return to the main menu."
    input = gets.chomp
    if input == "" then return end

    names = Topic.all.map(&:name)

    if names.include?(input) then
        topic = Topic.find_by(name: input)
        topic.quotes.in_batches.each_record { |quote| simple_quote_display(quote) }
    else
        puts
        puts "I didn't find that topic."
    end

    sleep(1)

end

# Displays all authors
def all_authors
    puts
    puts "Authors"
    puts "=================="
    Author.all.order(name: :asc).each{|author| puts "#{author.name}: #{author.quotes.count} quotes" }

    puts
    puts "Enter the name of an author to see their quotes. Otherwise, press Enter to return to the main menu."
    input = gets.chomp
    if input == "" then return end

    names = Author.all.map(&:name)

    if names.include?(input) then
        author = Author.find_by(name: input)
        author.quotes.in_batches.each_record { |quote| simple_quote_display(quote) }
    else
        puts
        puts "I didn't find that author."
    end

    sleep(1)
end

# Formats a year to add AD or BC if relevant
# Takes an int, returns a string
def year_formatter(year)
    case
    when year < 0
        "#{-year} B.C."
    when year < 1500
        "#{year} A.D."
    else
        "#{year}"
    end
end

# Puts a newline, the quote, and the author
# Takes a quote object
def simple_quote_display(quote)
    puts
    puts "\"#{quote.message}\""
    puts "- #{quote.author.name}"
end
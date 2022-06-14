def welcome
    puts "Welcome to Quote Manager!"
    puts "- - - - - - - - - - - - -"
    puts "You have #{Quote.all.count} quotes, by #{Author.all.count} authors, in #{Topic.all.count} topics."
end

def main_prompt
    options = {
        0 => "View a random quote",
        1 => "Add a new quote",
        2 => "See all quotes",
        3 => "See all topics",
        4 => "See all authors"
    }
    
    puts
    puts "What would you like to do?"
    puts "Enter one of the following numbers, or X to quit."
    for index, command in options do
        puts "#{index}: #{command}"
    end

    input = gets.chomp.downcase

    if ["x", "q", "quit"].include?(input) then exit end

    case input
    when "0"
        random_quote()
    when "1"
        puts "to be implemented"
    when "2"
        all_quotes()
    when "3"
        all_topics()
    else
        puts
        puts "I didn't recognize that command. Please try again."
        sleep(1)
    end

end

# displays a random quote and prompts the user if they want to know more about it
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

# displays more detail about a quote
def quote_details(quote)
    puts
    puts "\"#{quote.message}\""
    puts "By #{quote.author.name}" + (!quote.year.nil? ? " in #{quote.year}" : "")
    if !quote.source.nil? then puts "Source: #{quote.source}" end
    if !quote.url.nil? then puts "URL: #{quote.url}" end
    puts "The topic is #{quote.topic.name}"
    puts "This quote was added to the database on #{quote.created_at.strftime('%m/%d/%Y')}"

    click_to_continue()
end

# this 'click key to continue' function taken from
# https://stackoverflow.com/questions/34594018/how-to-code-press-key-to-continue                                                                            
def click_to_continue
    puts
    puts "Press any key to continue"
    STDIN.getch
    print "            \r" # extra space to overwrite in case next sentence is short
end

def all_quotes
    Quote.in_batches.each_record do |quote|
        puts
        puts "\"#{quote.message}\""
        puts "- #{quote.author.name}"
    end

    click_to_continue()
end

def all_topics
    puts
    puts "Topics"
    puts "=================="
    Topic.in_batches.each_record {|topic| puts "#{topic.name}: #{topic.quotes.count} quotes" }
    
    # put here quote_by_topic function
end
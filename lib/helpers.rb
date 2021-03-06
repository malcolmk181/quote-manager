# Displays more detail about a quote
# Takes a quote object
def quote_details(quote)
    puts
    puts "\"#{quote.message}\"".italic
    puts "- #{quote.author.name}" + (!quote.year.nil? ? ", #{year_formatter(quote.year)}" : "")
    if !quote.source.nil? then puts "Source: #{quote.source}" end
    if !quote.url.nil? then puts "URL: #{quote.url}" end
    puts "The topics are: #{quote.topic_names}"
    if !quote.created_at.nil? then puts "This quote was added to the database on #{quote.created_at.strftime('%m/%d/%Y')}" end

    click_to_continue()
end

# Puts a newline, the quote, and the author
# Takes a quote object
def simple_quote_display(quote, show_id=false)
    puts
    puts "\"#{quote.message}\"".italic
    puts "- #{quote.author.name}"
    if show_id then puts "Quote ID: #{quote.id}" end
end

# Prompts the user to press a key to continue
# this 'click key to continue' function taken from
# https://stackoverflow.com/questions/34594018/how-to-code-press-key-to-continue                                                                            
def click_to_continue
    puts
    puts "Press any key to continue".cyan
    STDIN.getch
    print "            \r" # extra space to overwrite in case next sentence is short
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

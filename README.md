# Quote Manager

## What is it?
Quote Manager is a CLI for managing a SQLite3 database of quotes. You can create, delete, and access quotes by their content, author, and topic.

---
## Running the CLI
### Prerequisites
[Ruby](https://www.ruby-lang.org/en/documentation/installation/ "Ruby installation page") and Bundler must be installed to run this app.
- You can check that they are installed by running `ruby -v` and `bundle -v`

### Download
Clone or download this repository to your computer.

### Install Dependencies
1. Navigate to this project's directory
2. Run `bundle install` in your console to install the required gems
3. Run `bundle exec rake db:setup` to create the database and initialize it with seed data
    * or run `bundle exec rake db:migrate` to just create the database, without any seed data

### Using the CLI
The CLI can be ran by running `ruby bin/run` in your console

Upon running, the main menu looks like this:
```
Welcome to Quote Manager!
- - - - - - - - - - - - -
You have 7 quotes, by 6 authors, in 6 topics.

What would you like to do?
Enter one of the following numbers, or X to quit.
0: View a random quote
1: Add a new quote
2: See all quotes
3: See all topics
4: See all authors
5: Delete a quote
6: Clean database of quoteless authors & topics
```
The rest of the app is similar - you navigate through the app by typing in the command line, and typing in a choice to a list of options.

---
## Development Process

### User stories
1. As a user, I want to be able to enter a new quote to add it to the database. ✅
2. As a user, I want to be able to choose an author to see their quotes. ✅
3. As a user, I want to be able to choose a topic to see its quotes. ✅
4. As a user, I want to be able to request to view a random quote. ✅
5. As a user, I should be able to delete a quote and its properties. ✅

### Database Structure
There are four models: quotes, authors, topics, and quote_topics
- A quote belongs to an author. An author has many quotes.
- A quote has many topics. A topic has many quotes.
- An author has many topics through quotes. A topic has many authors through quotes.
- Quote_topics is a join table for quotes and topics.

![Project 1 DB Model](https://user-images.githubusercontent.com/78397791/178157480-713d146a-a6bb-4826-ba9f-4d7ad5be5126.png)
*Database model illustration from [dbdiagram.io](https://dbdiagram.io/d/62cb1a02cc1bc14cc58d0192 "This model diagram")*

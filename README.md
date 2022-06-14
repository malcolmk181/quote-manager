# Quote Manager

## What is it?
Quote Manager is a CLI for managing a SQLite3 database of quotes. You can create, delete, and access quotes by their content, author, and topic.

## User stories
1. As a user, I want to be able to enter a new quote to add it to the database.
2. As a user, I want to be able to choose an author to see their quotes.
3. As a user, I want to be able to choose a topic to see its quotes.
4. As a user, I want to be able to request to view a random quote.
5. As a user, I should be able to update or delete a quote and its properties.

## Database Structure
There are three models: quotes, authors, and topics
- A quote belongs to an author. An author has many quotes.
- A quote belongs to a topic. A topic has many quotes.
- An author has many topics through quotes. A topic has many authors through quotes.

![Project 1 DB Model](https://user-images.githubusercontent.com/78397791/173448956-414fa3d9-86da-41f2-92c0-8ae8e63d0351.png)
- Database model illustration from [DbDiagram.io](https://dbdiagram.io/d/62a7a9fa9921fe2a96f8f364)

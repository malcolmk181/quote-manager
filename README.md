# Module One Final Project - Malcolm Keyes - Quote Manager

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

## Instructions

1. Fork and clone this repository.
2. Build your application. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable.
3. Make sure to create a good README.md with a short description, install instructions, a contributor's guide and a link to the license for your code.
4. Make sure your project checks off each of the above requirements.
5. Prepare a video demo (narration helps!) describing how a user would interact with your working project.
    * The video should:
      - Have an overview of your project. (2 minutes max)
6. Prepare a presentation to follow your video. (3 minutes max)
    * Your presentation should:
      - Describe something you struggled to build, and show us how you ultimately implemented it in your code.
      - Discuss 3 things you learned in the process of working on this project.
      - Address what, if anything, you would change or add to what you have today.
      - Present any code you would like to highlight.   
7. *OPTIONAL, BUT RECOMMENDED*: Write a blog post about the project and process.

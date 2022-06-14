Quote.delete_all
Author.delete_all
Topic.delete_all

thanos = Author.create(name: "Thanos")
regret = Topic.create(name: "Regret")
knowledge = Quote.create(message: "You're not the only one cursed with knowledge", author_id: 1, topic_id: 1, source: "Avengers: Infinity War", year: 2018, url: "https://www.youtube.com/watch?v=upJpEKUnJlg&ab_channel=Pung5252")
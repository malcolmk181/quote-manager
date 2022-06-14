Quote.delete_all
Author.delete_all
Topic.delete_all

thanos = Author.create(name: "Thanos")
regret = Topic.create(name: "Regret")
knowledge = Quote.create(message: "You're not the only one cursed with knowledge", author: thanos, topic: regret, source: "Avengers: Infinity War", year: 2018, url: "https://www.youtube.com/watch?v=upJpEKUnJlg&ab_channel=Pung5252")

socrates = Author.create(name: "Socrates")
wisdom = Topic.create(name: "Integrity")
wickedness = Quote.create(message: "It is not difficult to avoid death, gentlemen; it is much more difficult to avoid wickedness, for it runs faster than death.", author: socrates, topic: wisdom, source: "The Apology", year: -399)

lincoln = Author.create(name: "Abraham Lincoln")
compromise = Topic.create(name: "Compromise")
right = Quote.create(message: "If both factions, or neither, shall abuse you, you will probably be about right. Beware of being assailed by one and praised by the other.", author: lincoln, topic: compromise, year: 1863, source: "Letter to General J. M. Schofield", url: "http://www.perseus.tufts.edu/hopper/text?doc=Perseus%3Atext%3A2001.05.0131%3Achapter%3D5%3Apage%3D69")
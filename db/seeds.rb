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

carrel = Author.create(name: "Alexis Carrel")
improvement = Topic.create(name: "Self-improvement")
marble = Quote.create(message: "To progress again, man must remake himself. And he cannot remake himself without suffering. For he is both the marble and the sculptor. In order to uncover his true visage he must shatter his own substance with heavy blows of his hammer.", author: carrel, topic: improvement, year: 1935, source: "Man, the Unknown", url: "https://www.reddit.com/r/QuotesPorn/comments/1fkjkq/man_cannot_remake_himself_without_suffering_for/")
# If you know who this author is, this quote is actually pretty unsettling, but the quote - without the context of the author - really is great

branko = Author.create(name: "Branko Backovic")
success = Topic.create(name: "Success")
journey = Quote.create(message: "You meet the same people on the way up as you do on the way down.", author: branko, topic: success, year: 2022)

democritus = Author.create(name: "Democritus")
occassion = Quote.create(message: "Thrift and fasting are good: so too is extravagance on occasion: it is the mark of a good man to recognize the occasion", author: democritus, topic: compromise, year: -400)
restraint = Topic.create(name: "Restraint")
overindulgence = Quote.create(message: "If you exceed the measure, what is most enjoyable becomes least enjoyable.", author: democritus, topic: restraint, year: -400)
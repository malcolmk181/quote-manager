Quote.delete_all
Author.delete_all
Topic.delete_all

thanos = Author.create(name: "Thanos")
knowledge = Topic.create(name: "Knowledge")
cursed = Quote.create(message: "You're not the only one cursed with knowledge", author: thanos, topic: knowledge, source: "Avengers: Infinity War", year: 2018, url: "https://www.youtube.com/watch?v=upJpEKUnJlg&ab_channel=Pung5252")

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
moderation = Topic.create(name: "Moderation")
occassion = Quote.create(message: "Thrift and fasting are good: so too is extravagance on occasion: it is the mark of a good man to recognize the occasion", author: democritus, topic: moderation, year: -400)
overindulgence = Quote.create(message: "If you exceed the measure, what is most enjoyable becomes least enjoyable.", author: democritus, topic: moderation, year: -400)

seneca = Author.create(name: "Seneca")
stoicism = Topic.create(name: "Stoicism")
duty = Quote.create(message: "The duty of a man is to be useful to his fellow-men; if possible, to be useful to many of them; failing this, to be useful to a few; failing this, to be useful to his neighbours, and, failing them, to himself: for when he helps others, he advances the general interests of mankind. Just as he who makes himself a worse man does harm not only to himself but to all those to whom he might have done good if he had made himself a better one, so he who deserves well of himself does good to others by the very fact that he is preparing what will be of service to them.", author: seneca, topic: stoicism, source: "On Leisure", year: 62)

plato = Author.create(name: "Plato")
justice = Topic.create(name: "Justice")
appearance = Quote.create(message: "Can I by justice or by crooked ways of deceit ascend a loftier tower which may he a fortress to me all my days? For what men say is that, if I am really just and am not also thought just profit there is none, but the pain and loss on the other hand are unmistakable. But if, though unjust, I acquire the reputation of justice, a heavenly life is promised to me. Since then, as philosophers prove, appearance tyrannizes over truth and is lord of happiness, to appearance I must devote myself.", author: plato, topic: justice, source: "The Republic: Book II", year: -380)

freedom = Topic.create(name: "Freedom")
democracy = Quote.create(message: "Poverty in a democracy is preferable to what is called prosperity among tyrants - by as much liberty is preferable to slavery.", author: democritus, topic: freedom, year: -400)

edmylett = Author.create(name: "Ed Mylett")
finances = Topic.create(name: "Finances")
spending = Quote.create(message: "Don't go broke trying to look rich. If you don't save when you're poor...the crazy belief system is that you'll start saving when you start making money. If you have a habit of spending, you'll spend more when you make more.", author: edmylett, topic: finances, year: 2019, source: "Interview with Tom Bilyeu")

thiel = Author.create(name: "Peter Thiel")
startups = Topic.create(name: "Startups")
scale = Quote.create(message: "A good startup should have the potential for great scale built into its first design.",topic: startups, author: thiel, year: 2014, source: "Zero to One: Notes on Startups, or How to Build the Future")

denzelw = Author.create(name: "Denzel Washington")
dreams = Quote.create(message: "Dreams without goals are just dreams - and they ultimately fuel disappointment.", author: denzelw, topic: success, year: 2014, source: "Advice to young actors, Broadway Cares/Equity Fights AIDS Easter Bonnet Competition")

unknown = Author.create(name: "Unknown")
humor = Topic.create(name: "Humor")
backseat = Quote.create(message: "Kids in the back seat may cause accidents... Accidents in the back seat may cause kids... No back seat = No accidents", topic: humor, author: unknown)

swordandpencil = Author.create(name: "Sword and Pencil")
growth_t = Topic.create(name: "Growth")
growth = Quote.create(message: "Growth requires a death.", author: swordandpencil, year: 2022, topic: growth_t)

failure = Topic.create(name: "Failure")
musk = Author.create(name: "Elon Musk")
option = Quote.create(message: "Failure is an option here. If things are not failing, you are not innovating enough.", author: musk, topic: failure, year: 2005, source: "Interview with Fast Company")

kendrick = Author.create(name: "Kendrick Lamar")
communication = Topic.create(name: "Communication")
crown = Quote.create(message: "The closest ones afraid to say they need some time / The turn around is life or death, but you don't mind", author: kendrick, topic: communication, year: 2022, source: "'Crown' off of Mr.Morale & The Big Steppers")

malc = Author.create(name: "Malcolm Keyes")
moves = Quote.create(message: "All my moves are big moves. I am overweight.", author: malc, topic: humor, year: 2022)

cervantes = Author.create(name: "Miguel de Cervantes")
reading = Quote.create(message: "El que lee mucho y anda mucho, ve mucho y sabe mucho.", author: cervantes, year: 1605, topic: knowledge, source: "Don Quijote de la Mancha")

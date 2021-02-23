# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Topic.create(name: "People")
Topic.create(name: "Places")
Topic.create(name: "Events")

User.create(name: "Carter", email: "cgw@miseducation.edu", password: "123456")
User.create(name: "Kwame", email: "ghana@akan.edu", password: "123456")
User.create(name: "Toussaint", email: "tou@haiti.edu", password: "123456")
User.create(name: "Maya", email: "ma@cbs.edu", password: "123456")

Post.create(title: "Carter G. Woodson", content: "Carter Godwin Woodson was an American historian, author, journalist, and the founder of the Association for the Study of African American Life and History. He was one of the first scholars to study the history of the African diaspora, including African-American history.", user_id: 1, topic_id: 1 )
Post.create(title: "John S. Ford", content: "John Stanley Ford, my father, was the first black software engineer in America, hired by IBM in 1946. Passed over for promotions, discriminated against in pay, with many inside IBM working to ensure his failure, he still viewed his job as an opportunity of a lifetime. He refused to give up.", user_id: 1, topic_id: 1)
Post.create(title: "Door of No Return ", content: "On Gorée Island, Senegal, there is a door on the shores of the island that looks out to the Atlantic. There isn’t much to see from it, just blue waters glittering in the hot West African sun, the pleasant lapping of waves upon rock, a naked horizon that, for a dreamer, would inspire a sense of possibility. Yet for thousands of captive slaves that passed through this “Door of No Return,” the view meant being ripped from their homeland, a horrifying voyage across an ocean, and a cruel fate.", user_id: 1, topic_id: 2)
Post.create(title: "Cheikh Anta Diop", content: "Cheikh Anta Diop was a Senegalese historian, anthropologist, physicist, and politician who studied the human race's origins and pre-colonial African culture. His work was greatly controversial and throughout his career, Diop argued that there was a shared cultural continuity across African peoples that was more important than the varied development of different ethnic groups shown by differences among languages and cultures over time.", user_id: 2, topic_id: 1)
Post.create(title: "Kemet ", content: "The ancient Egyptians called their country Kemet, literally the \"Black Land\" (kem meant \"black\" in ancient Egyptian). The name derived from the color of the rich and fertile black soil which was due to the annually occurring Nile inundation." , user_id: 2, topic_id: 2)
Post.create(title: "Haitian Revolution", content: "The Haitian Revolution was a successful insurrection by self-liberated slaves against French colonial rule in Saint-Domingue, now the sovereign state of Haiti. The revolt began on 22 August 1791, and ended in 1804 with the former colony's independence.", user_id: 3, topic_id: 3)
Post.create(title: "Berlin Conference", content: "The Berlin Conference of 1884–1885 marked the climax of the European competition for territory in Africa, a process commonly known as the Scramble for Africa. During the 1870s and early 1880s European nations such as Great Britain, France, and Germany began looking to Africa for natural resources for their growing industrial sectors as well as a potential market for the goods these factories produced. As a result, these governments sought to safeguard their commercial interests in Africa and began sending scouts to the continent to secure treaties from indigenous peoples or their supposed representatives." , user_id: 3, topic_id: 3)
Post.create(title: "Queen Nzinga", content: "Queen Nzinga was Queen of the Ambundu Kingdoms of Ndongo located in present-day northern Angola. She ruled during a period of rapid growth in the African slave trade and encroachment of the Portuguese Empire into South West Africa, in attempts to control the slave trade. Nzinga fought for the Independence and stature of her kingdoms against the Portuguese in a reign that lasted 37 years.", user_id: 4, topic_id: 1)
Post.create(title: "Maya Angelou", content: "Maya Angelou was an American author, actress, screenwriter, dancer, poet and civil rights activist best known for her 1969 memoir, I Know Why the Caged Bird Sings, which made literary history as the first nonfiction bestseller by an African American woman. Angelou received several honors throughout her career, including two NAACP Image Awards in the outstanding literary work (nonfiction) category, in 2005 and 2009.", user_id: 4, topic_id: 1)

Question.create(content: "Who was Vicente Ramón Guerrero Saldaña?", answered: true, user_id: 2, topic_id: 1)
Question.create(content: "Where are the Dogon from? ", answered: false, user_id: 3, topic_id: 2)
Question.create(content: "How were African countries involved in WWII? ", answered: false, user_id: 1, topic_id: 3)

Comment.create(content: "He one of the leading revolutionary generals of the Mexican War of Independence. He fought against Spain for independence in the early 19th century, and later served as President of Mexico, coming to power in a coup. He was of Afro-Mestizo descent, championed the cause of Mexico's common people, and abolished slavery on a national level during his brief term as president.", answer: true, user_id: 3, post_id: nil, question_id: 1)
Comment.create(content: "Thanks for sharing!", answer: false, user_id: 3, post_id: 1, question_id: nil)
Comment.create(content: "Wow, didn't know that!", answer: false, user_id: 3, post_id: 3, question_id: nil)
Comment.create(content: "I'm interested too!", answer: false, user_id: 3, post_id: nil, question_id: 2)
Comment.create(content: "Someone please answer this question! I've been curious about this for a while now.", answer: false, user_id: 1, post_id: nil, question_id: 2)
Comment.create(content: "This is really cool! I have to share this with my friends.", answer: false, user_id: 1, post_id: 5, question_id: nil)
Comment.create(content: "I've always known it as Egypt. This is really interesting. I wonder where the name Egypt comes from?", answer: false, user_id: 1, post_id: 6, question_id: nil)
Comment.create(content: "Interesting information! Keep sharing your knowledge!", answer: false, user_id: 1, post_id: 7, question_id: nil)
Comment.create(content: "medaase for your knowledge!", answer: false, user_id: 2, post_id: 8, question_id: nil)
Comment.create(content: "Thanks for sharing!", answer: false, user_id: 4, post_id: 2, question_id: nil)
Comment.create(content: "He was one of the leading revolutionary generals of the Mexican War of Independence. He fought against Spain for independence in the early 19th century, and later served as President of Mexico, coming to power in a coup.", answer: true, user_id: 3, post_id: nil, question_id: 1 )
Comment.create(content: "Thanks for the answer, Toussaint!", answer: false, user_id: 4, post_id: nil, question_id: 1)
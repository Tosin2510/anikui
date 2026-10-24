class FoodPart {
  String question;
  String answer;
  String wrongAnswer1;
  String wrongAnswer2;
  String fact;

  FoodPart({
    required this.question,
    required this.answer,
    required this.wrongAnswer1,
    required this.wrongAnswer2,
    required this.fact,
  });
}

List<FoodPart> availableFoodQuestions = [
  FoodPart(
    question: 'What is sushi rice seasoned with?',
    answer: 'Vinegar, sugar and salt',
    wrongAnswer1: 'Soy sauce and mirin',
    wrongAnswer2: 'Miso and sesame oil',
    fact: 'The seasoned rice is called shari.',
  ),

  FoodPart(
    question: 'What is sashimi?',
    answer: 'Sliced raw fish served without rice',
    wrongAnswer1: 'Fish wrapped in seaweed with rice',
    wrongAnswer2: 'Grilled fish on skewers',
    fact: 'It is usually eaten with soy sauce and wasabi.',
  ),

  FoodPart(
    question: 'What is tempura?',
    answer: 'Battered and deep-fried food',
    wrongAnswer1: 'Grilled meat on skewers',
    wrongAnswer2: 'Raw fish on rice',
    fact: 'It is believed to have been introduced by Portuguese traders in the 16th century.',
  ),

  FoodPart(
    question: 'What is ramen?',
    answer: 'Wheat noodles in broth',
    wrongAnswer1: 'Buckwheat noodles served cold',
    wrongAnswer2: 'Thick noodles stir-fried',
    fact: 'Common broths are shoyu, miso, shio and tonkotsu.',
  ),

   FoodPart(
    question: 'What are soba noodles made from?',
    answer: 'Buckwheat',
    wrongAnswer1: 'Rice',
    wrongAnswer2: 'Potato starch',
    fact: 'Soba can be served hot in broth or cold on a bamboo tray.',
  ),

  FoodPart(
    question: 'What are udon noodles?',
    answer: 'Thick wheat noodles',
    wrongAnswer1: 'Thin rice noodles',
    wrongAnswer2: 'Clear noodles made from beans',
    fact: 'They are often served in a hot broth.',
  ),

  FoodPart(
    question: 'What is onigiri?',
    answer: 'A rice ball often wrapped in seaweed',
    wrongAnswer1: 'A rice cake in sweet soup',
    wrongAnswer2: 'A rolled omelette',
    fact: 'Common fillings are salmon, tuna with mayonnaise and pickled plum.',
  ),

  FoodPart(
    question: 'What is takoyaki?',
    answer: 'Octopus balls cooked in a special pan',
    wrongAnswer1: 'Fried chicken pieces',
    wrongAnswer2: 'Grilled eel',
    fact: 'It comes from Osaka and is topped with sauce, mayonnaise and bonito flakes.',
  ),

  FoodPart(
    question: 'What is okonomiyaki?',
    answer: 'A savory pancake with cabbage',
    wrongAnswer1: 'A sweet bean pancake',
    wrongAnswer2: 'A fried rice dumpling',
    fact: 'Osaka and Hiroshima each have their own style.',
  ),

   FoodPart(
    question: 'What is yakitori?',
    answer: 'Grilled chicken skewers',
    wrongAnswer1: 'Fried pork cutlet',
    wrongAnswer2: 'Chicken hotpot',
    fact: 'The skewers are often grilled over charcoal.',
  ),

  FoodPart(
    question: 'What is tonkatsu?',
    answer: 'A breaded deep-fried pork cutlet',
    wrongAnswer1: 'Grilled pork belly',
    wrongAnswer2: 'Pork dumplings',
    fact: 'It is usually served with shredded cabbage.',
  ),

  FoodPart(
    question: 'What is gyoza?',
    answer: 'Pan-fried dumplings',
    wrongAnswer1: 'Steamed buns',
    wrongAnswer2: 'Rice crackers',
    fact: 'Gyoza came to Japan from Chinese dumplings.',
  ),

  FoodPart(
    question: 'What is wasabi?',
    answer: 'A sharp green paste made from a plant root',
    wrongAnswer1: 'Dried seaweed',
    wrongAnswer2: 'Pickled ginger',
    fact: 'Real wasabi is grated fresh. Many tubes contain horseradish instead.',
  ),

   FoodPart(
    question: 'What is the pickled ginger served with sushi called?',
    answer: 'Gari',
    wrongAnswer1: 'Nori',
    wrongAnswer2: 'Shoyu',
    fact: 'It is eaten between pieces of sushi to refresh the mouth.',
  ),

  FoodPart(
    question: 'What is nori?',
    answer: 'Dried seaweed sheets',
    wrongAnswer1: 'Fermented soybeans',
    wrongAnswer2: 'Pickled plum',
    fact: 'It is used for sushi rolls and onigiri.',
  ),

  FoodPart(
    question: 'What is natto?',
    answer: 'Fermented soybeans',
    wrongAnswer1: 'Pickled radish',
    wrongAnswer2: 'Sweet bean paste',
    fact: 'It is sticky with a strong smell, and many people eat it at breakfast.',
  ),

  FoodPart(
    question: 'What is umeboshi?',
    answer: 'Pickled plum',
    wrongAnswer1: 'Dried fish',
    wrongAnswer2: 'Sweet potato',
    fact: 'It is very sour and salty.',
  ),

  FoodPart(
    question: 'What is dashi?',
    answer: 'A soup stock made from kelp and bonito flakes',
    wrongAnswer1: 'A sweet rice wine',
    wrongAnswer2: 'A fish paste',
    fact: 'It is the base of miso soup and many other dishes.',
  ),

  FoodPart(
    question: 'What is katsuobushi?',
    answer: 'Dried, fermented skipjack tuna flakes',
    wrongAnswer1: 'Smoked eel',
    wrongAnswer2: 'Salted fish eggs',
    fact: 'The thin flakes seem to dance when sprinkled on hot food.',
  ),

  FoodPart(
    question: 'What is mirin?',
    answer: 'A sweet rice wine used for cooking',
    wrongAnswer1: 'A sour plum vinegar',
    wrongAnswer2: 'A type of soy sauce',
    fact: 'It adds sweetness and shine to sauces.',
  ),

  FoodPart(
    question: 'What is shoyu?',
    answer: 'Soy sauce',
    wrongAnswer1: 'Rice vinegar',
    wrongAnswer2: 'Fish sauce',
    fact: 'It is one of the most important seasonings in Japanese cooking.',
  ),

  FoodPart(
    question: 'What is teriyaki?',
    answer: 'A cooking style with a sweet soy glaze',
    wrongAnswer1: 'Raw fish in vinegar',
    wrongAnswer2: 'Deep frying in batter',
    fact: 'Teri means shine and yaki means grilled.',
  ),

  FoodPart(
    question: 'What is sukiyaki?',
    answer: 'Beef and vegetables simmered in a sweet soy broth',
    wrongAnswer1: 'Stir-fried noodles',
    wrongAnswer2: 'Cold tofu',
    fact: 'People often dip the cooked meat in raw beaten egg.',
  ),

  FoodPart(
    question: 'What is shabu-shabu?',
    answer: 'Thin sliced meat swished in hot broth',
    wrongAnswer1: 'Grilled squid',
    wrongAnswer2: 'Fried pork',
    fact: 'The name imitates the sound of swishing the meat in the pot.',
  ),

  FoodPart(
    question: 'What is oden?',
    answer: 'Ingredients simmered in a light broth',
    wrongAnswer1: 'Cold noodles',
    wrongAnswer2: 'Fried tofu',
    fact: 'It is a winter favourite, and many convenience stores sell it.',
  ),

  FoodPart(
    question: 'What is tamagoyaki?',
    answer: 'A rolled Japanese omelette',
    wrongAnswer1: 'A steamed egg custard',
    wrongAnswer2: 'A boiled egg in soy sauce',
    fact: 'It is made by rolling thin layers of egg in a rectangular pan.',
  ),

  FoodPart(
    question: 'What is chawanmushi?',
    answer: 'A savory steamed egg custard',
    wrongAnswer1: 'An egg noodle soup',
    wrongAnswer2: 'A sweet egg pancake',
    fact: 'It is served in a small cup, often with shrimp and mushrooms.',
  ),

FoodPart(
    question: 'What is unagi?',
    answer: 'Eel',
    wrongAnswer1: 'Squid',
    wrongAnswer2: 'Sea urchin',
    fact: 'It is grilled with a sweet sauce and often eaten in summer.',
  ),

  FoodPart(
    question: 'What is uni?',
    answer: 'Sea urchin',
    wrongAnswer1: 'Salmon eggs',
    wrongAnswer2: 'Squid',
    fact: 'It has a creamy texture and a sweet taste.',
  ),

  FoodPart(
    question: 'What is ikura?',
    answer: 'Salmon eggs',
    wrongAnswer1: 'Sea urchin',
    wrongAnswer2: 'Octopus',
    fact: 'They are bright orange and pop in the mouth.',
  ),

  FoodPart(
    question: 'What is tofu made from?',
    answer: 'Soybeans',
    wrongAnswer1: 'Rice',
    wrongAnswer2: 'Wheat',
    fact: 'It is made by curdling soy milk, a bit like making cheese.',
  ),

  FoodPart(
    question: 'What is edamame?',
    answer: 'Young soybeans in the pod',
    wrongAnswer1: 'Boiled peanuts',
    wrongAnswer2: 'Green peas in sauce',
    fact: 'It is usually boiled and salted and eaten as a snack.',
  ),

  FoodPart(
    question: 'What is karaage?',
    answer: 'Japanese fried chicken',
    wrongAnswer1: 'Grilled eel',
    wrongAnswer2: 'Fried tofu',
    fact: 'The chicken is marinated in soy sauce and ginger, then fried in starch.',
  ),

  FoodPart(
    question: 'What is Japanese curry rice usually called?',
    answer: 'Kare raisu',
    wrongAnswer1: 'Gyudon',
    wrongAnswer2: 'Omurice',
    fact: 'Curry is thought to have reached Japan through the British in the 1800s.',
  ),

  FoodPart(
    question: 'What is gyudon?',
    answer: 'A rice bowl topped with beef and onions',
    wrongAnswer1: 'A rice bowl topped with pork cutlet',
    wrongAnswer2: 'A rice bowl topped with eel',
    fact: 'Don means bowl.',
  ),

  FoodPart(
    question: 'What is oyakodon?',
    answer: 'A rice bowl with chicken and egg',
    wrongAnswer1: 'A rice bowl with beef',
    wrongAnswer2: 'A rice bowl with tempura',
    fact: 'The name means parent and child.',
  ),

  FoodPart(
    question: 'What is omurice?',
    answer: 'An omelette wrapped around fried rice',
    wrongAnswer1: 'Rice in egg soup',
    wrongAnswer2: 'Noodles topped with egg',
    fact: 'It was created in Japan and is inspired by Western food.',
  ),

  FoodPart(
    question: 'What is yakisoba?',
    answer: 'Stir-fried noodles',
    wrongAnswer1: 'Cold buckwheat noodles',
    wrongAnswer2: 'A noodle soup',
    fact: 'Despite the name, it is made with wheat noodles, not buckwheat.',
  ),

  FoodPart(
    question: 'What is taiyaki?',
    answer: 'A fish-shaped cake with a sweet filling',
    wrongAnswer1: 'A rice cracker',
    wrongAnswer2: 'A grilled fish',
    fact: 'It is often filled with sweet red bean paste.',
  ),

  FoodPart(
    question: 'What is dorayaki?',
    answer: 'Two small pancakes with sweet bean paste',
    wrongAnswer1: 'A rice dumpling',
    wrongAnswer2: 'A jelly cake',
    fact: 'It is a favourite snack of the character Doraemon.',
  ),

  FoodPart(
    question: 'What is anko?',
    answer: 'Sweet red bean paste',
    wrongAnswer1: 'Black sesame paste',
    wrongAnswer2: 'Plum jam',
    fact: 'It is used in many Japanese sweets.',
  ),

  FoodPart(
    question: 'What is dango?',
    answer: 'Sweet rice dumplings on a skewer',
    wrongAnswer1: 'Fried fish cakes',
    wrongAnswer2: 'Sweet potato chips',
    fact: 'They often come with a sweet soy glaze or red bean paste.',
  ),

  FoodPart(
    question: 'What is wagashi?',
    answer: 'Traditional Japanese sweets',
    wrongAnswer1: 'Pickled vegetables',
    wrongAnswer2: 'Rice crackers',
    fact: 'They often match the season and are served with tea.',
  ),

  FoodPart(
    question: 'What is senbei?',
    answer: 'A rice cracker',
    wrongAnswer1: 'A pickled radish',
    wrongAnswer2: 'A jelly sweet',
    fact: 'It is often seasoned with soy sauce and sometimes wrapped in seaweed.',
  ),

  FoodPart(
    question: 'What is kakigori?',
    answer: 'Shaved ice with flavored syrup',
    wrongAnswer1: 'Frozen green tea',
    wrongAnswer2: 'Cold noodles',
    fact: 'It is a popular summer treat.',
  ),

   FoodPart(
    question: 'What is ramune?',
    answer: 'A fizzy drink sealed with a glass marble',
    wrongAnswer1: 'A sweet rice drink',
    wrongAnswer2: 'A barley tea',
    fact: 'You push the marble down to open the bottle.',
  ),

  FoodPart(
    question: 'What is amazake?',
    answer: 'A sweet drink made from fermented rice',
    wrongAnswer1: 'A plum wine',
    wrongAnswer2: 'A sweet soy milk',
    fact: 'Versions made with rice koji have little or no alcohol.',
  ),

  FoodPart(
    question: 'What is mugicha?',
    answer: 'Roasted barley tea',
    wrongAnswer1: 'Powdered green tea',
    wrongAnswer2: 'Rice wine',
    fact: 'It has no caffeine and is often served cold in summer.',
  ),

  FoodPart(
    question: 'What is tsukemono?',
    answer: 'Japanese pickles',
    wrongAnswer1: 'Raw fish slices',
    wrongAnswer2: 'Fried dumplings',
    fact: 'They are often served with rice and at the end of a meal.',
  ),

  FoodPart(
    question: 'What is furikake?',
    answer: 'A seasoning sprinkled over rice',
    wrongAnswer1: 'A bowl of rice with toppings',
    wrongAnswer2: 'A pickled plum',
    fact: 'It is a mix of things like sesame, seaweed and dried fish.',
  ),


];
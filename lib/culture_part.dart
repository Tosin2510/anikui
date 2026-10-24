class CulturePart {
  String question;
  String answer;
  String wrongAnswer1;
  String wrongAnswer2;
  String fact;

  CulturePart({
    required this.question,
    required this.answer,
    required this.wrongAnswer1,
    required this.wrongAnswer2,
    required this.fact,
  });
}

  List<CulturePart> availableCulture = [

    CulturePart(
    question: 'What do people say before they start eating?',
    answer: 'Itadakimasu',
    wrongAnswer1: 'Gochisousama',
    wrongAnswer2: 'Ojamashimasu',
    fact: 'Itadakimasu is a thank-you for the food. Gochisousama is said after the meal.',
  ),

  CulturePart(
    question: 'What do people do before stepping into a home in Japan?',
    answer: 'Take off their shoes',
    wrongAnswer1: 'Bow three times',
    wrongAnswer2: 'Wash their hands',
    fact: 'The entrance area where shoes come off is called the genkan.',
  ),

   CulturePart(
    question: 'Why should you never stick chopsticks upright in a bowl of rice?',
    answer: 'It looks like a funeral offering',
    wrongAnswer1: 'It means you are still hungry',
    wrongAnswer2: 'It brings bad weather',
    fact: 'Rice with upright chopsticks is placed before the dead at funerals.',
  ),

  CulturePart(
    question: 'What is hanami?',
    answer: 'Watching cherry blossoms',
    wrongAnswer1: 'A lantern festival',
    wrongAnswer2: 'A tea ceremony',
    fact: 'People picnic under the trees when the cherry blossoms bloom in spring.',
  ),

  CulturePart(
    question: 'What is the usual custom about tipping in Japan?',
    answer: 'It is not expected',
    wrongAnswer1: 'Ten percent is expected',
    wrongAnswer2: 'Only at night',
    fact: 'Good service is seen as normal, so tipping can even cause confusion.',
  ),

   CulturePart(
    question: 'What do people throw at Setsubun to drive away demons?',
    answer: 'Roasted soybeans',
    wrongAnswer1: 'Rice balls',
    wrongAnswer2: 'Paper cranes',
    fact: 'Setsubun is in early February, and people shout that demons go out and luck comes in.',
  ),

  CulturePart(
    question: 'What is the Japanese tea ceremony called?',
    answer: 'Sado',
    wrongAnswer1: 'Ikebana',
    wrongAnswer2: 'Kintsugi',
    fact: 'Sado is also called chado. Ikebana is flower arranging.',
  ),

  CulturePart(
    question: 'Which summer festival honors the spirits of ancestors?',
    answer: 'Obon',
    wrongAnswer1: 'Tanabata',
    wrongAnswer2: 'Shichi-go-san',
    fact: 'Families visit graves and hold dances during Obon.',
  ),

  CulturePart(
    question: 'What is kintsugi?',
    answer: 'Repairing broken pottery with gold',
    wrongAnswer1: 'Folding paper into animals',
    wrongAnswer2: 'Arranging flowers',
    fact: 'The cracks are shown on purpose, as part of the object\'s history.',
  ),

  CulturePart(
    question: 'Is it rude to slurp noodles in Japan?',
    answer: 'No, it is normal',
    wrongAnswer1: 'Yes, it is very rude',
    wrongAnswer2: 'Only at weddings',
    fact: 'Slurping ramen or soba is common and is often taken as a sign you enjoy it.',
  ),

  CulturePart(
    question: 'What is the traditional Japanese garment called?',
    answer: 'Kimono',
    wrongAnswer1: 'Hanbok',
    wrongAnswer2: 'Cheongsam',
    fact: 'Kimono means a thing to wear. The hanbok is Korean and the cheongsam is Chinese.',
  ),

  CulturePart(
    question: 'What is the sash tied around a kimono called?',
    answer: 'Obi',
    wrongAnswer1: 'Geta',
    wrongAnswer2: 'Tabi',
    fact: 'Geta are wooden sandals and tabi are socks with a split toe.',
  ),

  CulturePart(
    question: 'What are tatami?',
    answer: 'Woven straw floor mats',
    wrongAnswer1: 'Paper sliding doors',
    wrongAnswer2 : 'Wooden sandals',
    fact: 'The size of a room in Japan is often counted in tatami mats.',
  ),

  CulturePart(
    question: 'What are shoji?',
    answer: 'Paper sliding doors',
    wrongAnswer1: 'Woven floor mats',
    wrongAnswer2: 'Folding fans',
    fact: 'The paper lets a soft light into the room.',
  ),

  CulturePart(
    question: 'What is an onsen?',
    answer: 'A natural hot spring bath',
    wrongAnswer1: 'A sushi counter',
    wrongAnswer2: 'A shrine gate',
    fact: 'Many onsen are found near volcanoes, and people often travel to visit them.',
  ),

  CulturePart(
    question: 'What must you do before getting into an onsen?',
    answer: 'Wash your body',
    wrongAnswer1: 'Put on a swimsuit',
    wrongAnswer2: 'Drink green tea',
    fact: 'You wash first so the shared bath stays clean. Swimsuits are usually not worn.',
  ),

  CulturePart(
    question: 'What is a torii?',
    answer: 'A gate at a shrine entrance',
    wrongAnswer1: 'A paper charm',
    wrongAnswer2: 'A stone lantern',
    fact: 'It marks the border between the everyday world and sacred ground.',
  ),

  CulturePart(
    question: 'What is the usual way to pray at a Shinto shrine?',
    answer: 'Bow twice, clap twice, bow once',
    wrongAnswer1: 'Bow once, clap three times',
    wrongAnswer2 : 'Clap once and walk away',
    fact: 'People often toss a coin into the offering box first. A few shrines have their own rules.',
  ),

  CulturePart(
    question: 'What is a maneki-neko?',
    answer: 'A lucky beckoning cat figure',
    wrongAnswer1: 'A guardian dog statue',
    wrongAnswer2: 'A lucky red doll',
    fact: 'The raised paw is said to bring customers and good fortune.',
  ),

  CulturePart(
    question: 'What do you do with a daruma doll?',
    answer: 'Paint in one eye when you set a goal',
    wrongAnswer1: 'Fill it with sweets',
    wrongAnswer2: 'Wind it up to play music',
    fact: 'You paint in the second eye when the goal is achieved.',
  ),

  CulturePart(
    question: 'What is Tanabata?',
    answer: 'A festival where wishes are hung on bamboo',
    wrongAnswer1: 'A festival of snow sculptures',
    wrongAnswer2: 'A festival for boys',
    fact: 'It is on July 7 and comes from a legend about two stars that meet once a year.',
  ),

  CulturePart(
    question: 'What is Shichi-go-san?',
    answer: 'A celebration for children aged three, five and seven',
    wrongAnswer1: 'A celebration for turning twenty',
    wrongAnswer2: 'A celebration for the elderly',
    fact: 'Families visit a shrine in November, and children often wear kimono.',
  ),

   CulturePart(
    question: 'In which month is Coming of Age Day held?',
    answer: 'January',
    wrongAnswer1: 'April',
    wrongAnswer2: 'September',
    fact: 'It is held on the second Monday of January, and young people attend ceremonies.',
  ),

  CulturePart(
    question: 'When is Golden Week?',
    answer: 'Late April to early May',
    wrongAnswer1: 'Late December to early January',
    wrongAnswer2: 'Mid August',
    fact: 'Several national holidays fall close together, so many people travel.',
  ),

  CulturePart(
    question: 'What is the Japanese New Year called?',
    answer: 'Oshogatsu',
    wrongAnswer1: 'Obon',
    wrongAnswer2: 'Hinamatsuri',
    fact: 'Families visit a shrine in the first days of the year. This visit is called hatsumode.',
  ),

  CulturePart(
    question: 'What is osechi?',
    answer: 'Special New Year foods packed in boxes',
    wrongAnswer1: 'Cold noodles eaten in summer',
    wrongAnswer2: 'Sweets given at weddings',
    fact: 'Each food in the box has a meaning, such as health or good luck.',
  ),

  CulturePart(
    question: 'What do many people eat on New Year\'s Eve?',
    answer: 'Soba noodles',
    wrongAnswer1: 'Tempura',
    wrongAnswer2: 'Curry rice',
    fact: 'Toshikoshi soba is eaten because the long noodles stand for a long life.',
  ),

  CulturePart(
    question: 'What is Hinamatsuri?',
    answer: 'A festival for girls with doll displays',
    wrongAnswer1: 'A festival for boys with carp streamers',
    wrongAnswer2: 'A festival of lanterns',
    fact: 'It is held on March 3, and families display dolls in traditional dress.',
  ),

  CulturePart(
    question: 'What are koinobori?',
    answer: 'Carp streamers flown on May 5',
    wrongAnswer1: 'Paper lanterns floated on rivers',
    wrongAnswer2: 'Fish shaped cakes',
    fact: 'Carp swim upstream, so they stand for strength and success.',
  ),

  CulturePart(
    question: 'What is the sumo wrestling ring called?',
    answer: 'Dohyo',
    wrongAnswer1: 'Dojo',
    wrongAnswer2 : 'Tatami',
    fact: 'Wrestlers throw salt into the ring to purify it.',
  ),

  CulturePart(
    question: 'Which martial art means the way of the sword?',
    answer: 'Kendo',
    wrongAnswer1: 'Judo',
    wrongAnswer2: 'Karate',
    fact: 'Judo means gentle way and karate means empty hand.',
  ),

  CulturePart(
    question: 'What is the Japanese art of paper folding called?',
    answer: 'Origami',
    wrongAnswer1: 'Ikebana',
    wrongAnswer2: 'Shodo',
    fact: 'Ori means folding and kami means paper.',
  ),

  CulturePart(
    question: 'What is ikebana?',
    answer: 'The art of flower arranging',
    wrongAnswer1: 'The art of paper folding',
    wrongAnswer2: 'The art of calligraphy',
    fact: 'Each arrangement is designed with lines and empty space in mind.',
  ),

  CulturePart(
    question: 'What is shodo?',
    answer: 'Calligraphy',
    wrongAnswer1: 'Flower arranging',
    wrongAnswer2: 'Swordsmanship',
    fact: 'It is written with a brush and ink, and it is taught in schools.',
  ),

  CulturePart(
    question: 'What is a bento?',
    answer: 'A packed meal in a box',
    wrongAnswer1: 'A type of tea',
    wrongAnswer2 : 'A rice wine',
    fact: 'A bento often has rice, a protein and vegetables arranged neatly.',
  ),

  CulturePart(
    question: 'What is traditional sake made from?',
    answer: 'Rice',
    wrongAnswer1: 'Wheat',
    wrongAnswer2: 'Potatoes',
    fact: 'In Japan the word sake can mean alcohol in general, and rice sake is often called nihonshu.',
  ),

  CulturePart(
    question: 'What is miso soup mainly made from?',
    answer: 'Fermented soybean paste',
    wrongAnswer1: 'Seaweed paste',
    wrongAnswer2: 'Rice flour',
    fact: 'A fish or seaweed stock called dashi is also added.',
  ),

  CulturePart(
    question: 'What is mochi made from?',
    answer: 'Pounded sticky rice',
    wrongAnswer1: 'Sweet potato',
    wrongAnswer2: 'Wheat flour',
    fact: 'The rice is pounded with a mallet in a ceremony called mochitsuki.',
  ),

  CulturePart(
    question: 'What is matcha?',
    answer: 'Powdered green tea',
    wrongAnswer1: 'Roasted barley tea',
    wrongAnswer2 : 'Rice wine',
    fact: 'It is whisked with hot water and is the tea used in the tea ceremony.',
  ),

  CulturePart(
    question: 'What does omotenashi mean?',
    answer: 'Wholehearted hospitality',
    wrongAnswer1: 'Respect for elders',
    wrongAnswer2: 'Polite bowing',
    fact: 'It means caring for guests without expecting anything in return.',
  ),

  CulturePart(
    question: 'How should you hand over or receive a business card?',
    answer: 'With both hands and a small bow',
    wrongAnswer1: 'With one hand while shaking hands',
    wrongAnswer2: 'By sliding it across the table',
    fact: 'The card is treated with respect because it stands for the person.',
  ),

   CulturePart(
    question: 'What is Japan\'s bullet train called?',
    answer: 'Shinkansen',
    wrongAnswer1: 'Yamanote',
    wrongAnswer2: 'Romancecar',
    fact: 'The first line opened in 1964, just before the Tokyo Olympics.',
  ),

  CulturePart(
    question: 'What is the tallest mountain in Japan?',
    answer: 'Mount Fuji',
    wrongAnswer1: 'Mount Aso',
    wrongAnswer2: 'Mount Takao',
    fact: 'Fuji is 3,776 metres tall, and people climb it in July and August.',
  ),

  CulturePart(
    question: 'Which are the three main scripts of Japanese?',
    answer: 'Hiragana, katakana and kanji',
    wrongAnswer1: 'Hiragana, hangul and kanji',
    wrongAnswer2: 'Katakana, pinyin and kanji',
    fact: 'Romaji, which is Japanese written in Latin letters, is also used.',
  ),

   CulturePart(
    question: 'What is the pattern of a traditional haiku?',
    answer: '5-7-5 sounds',
    wrongAnswer1: '3-5-3 sounds',
    wrongAnswer2: '7-7-5 sounds',
    fact: 'A haiku traditionally includes a word that points to a season.',
  ),

  CulturePart(
    question: 'What is kabuki?',
    answer: 'Traditional theatre with bold makeup and costumes',
    wrongAnswer1: 'A form of puppet theatre',
    wrongAnswer2: 'A comedy storytelling act',
    fact: 'The actors are men, and the actors who play women are called onnagata.',
  ),

  CulturePart(
    question: 'What do the main actors in Noh theatre often wear?',
    answer: 'Carved wooden masks',
    wrongAnswer1: 'Bright red wigs',
    wrongAnswer2: 'Straw hats',
    fact: 'Noh is one of the oldest forms of theatre still performed today.',
  ),

  CulturePart(
    question: 'What is a geisha known for?',
    answer: 'Traditional arts like dance and music',
    wrongAnswer1: 'Samurai swordsmanship',
    wrongAnswer2: 'Sumo wrestling',
    fact: 'In Kyoto they are called geiko, and the apprentices are called maiko.',
  ),

  CulturePart(
    question: 'What was the samurai\'s famous long sword called?',
    answer: 'Katana',
    wrongAnswer1: 'Naginata',
    wrongAnswer2: 'Shuriken',
    fact: 'The katana has a curved, single edged blade.',
  ),

  CulturePart(
    question: 'Which flower is a symbol of the Imperial family?',
    answer: 'Chrysanthemum',
    wrongAnswer1: 'Lotus',  
    wrongAnswer2: 'Sunflower',
    fact: 'A chrysanthemum design appears on the Imperial seal.',
  ),

  ];
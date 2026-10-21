import json
import os
import re
import pykakasi
from openjlpt import get_vocab

converter = pykakasi.kakasi()

def convert_to_romanji(japanese_word):
  val = converter.convert(japanese_word)
  romanji = ''
  for v in val:
    romanji = romanji + v["hepburn"]
  return romanji

vocabulary = list(get_vocab("N5"))

print("found", len(vocabulary), "words in the dataset")
print("the first one looks like this:", vocabulary[0])

words = []
readings = []

for value in vocabulary:
  readingVal = value.reading
  meaning = value.meanings

  if not readingVal:
    readingVal = value.word

  if not readingVal or not meaning:
    continue

  englishVal = re.sub(r'\(.*?\)', '', meaning[0]).strip()

  if (englishVal == "" or len(englishVal) > 23):
    continue

  if readingVal in readings:
    continue

  readings.append(readingVal)

  isWordANoun = True
  if (englishVal.startswith("to ")):
    isWordANoun = False
  if (readingVal.endswith("い")):
    isWordANoun = False
  if len(englishVal.split()) > 3:
    isWordANoun = False

  wordVal = {
    "id": "w" + str(len(words)).zfill(4),
    "japanese": readingVal,
    "romaji": convert_to_romanji(readingVal),
    "english": englishVal,
    "hasImage": False,
    "guessNoun": isWordANoun,
  }

  words.append(wordVal)

os.makedirs("assets/data", exist_ok=True)

with open("assets/data/n5.json", "w", encoding="utf-8") as file:
  json.dump(words, file, ensure_ascii=False, indent=1)

print(len(words), "words saved")

# Wanna experiment with first 5 words
for word in words[:5]:
  print(word["japanese"], word["romaji"], word["english"])
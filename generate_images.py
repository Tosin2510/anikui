import json
import os
import sys
import time
from io import BytesIO
from urllib.parse import quote
import requests
from PIL import Image

BASE_URL =  "https://gen.pollinations.ai/image/"

KEY = os.environ.get("POLLINATIONS_KEY", "")

STYLE = "anime style illustration, soft pastel colors, clean lines, simple background, no text, no logos"

skipWords = [
  "well…", "well then…", "however", "and", "but", "in that situation", "with that...", "used for comparison.", "et cetera", "to be", "to do",
  "to become", "to differ", "to be able to", "to be understood", "to take time or money", "to know","zero", "hundred", "thousand", "ten thousand", 
  "twenty days", "20 years old",
  "there", "here", "this", "that", "now",
]

promptOverrides = {
  "you": "a person pointing a finger toward the viewer",
  "tomorrow": "a sunrise over a calendar page with the next day circled",
  "yes": "a person nodding with a green check mark",

  "economy": "a bar of soap with bubbles",
  "post": "a red japanese mailbox",
  "match": "a lit matchstick",
  "record": "a vinyl record on a player",
  "watch": "a wristwatch",
  "light": "a single white feather",

}

numberCount = {
  "one": 1, "two": 2, "three": 3, "four": 4, "five": 5,
  "six": 6, "seven": 7, "eight": 8, "nine": 9, "ten": 10
}

for number in numberCount:
  if numberCount[number] == 1:
    promptOverrides[number] = "exactly 1 red apple on a table"
  else:
    promptOverrides[number] = "exactly " + str(numberCount[number]) + " red apples in a row on a table"

weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

for val in range(len(weekdays)):
  promptOverrides[weekdays[val]] = "a weekly calendar page with day " + str(val + 1) + " of 7 highlighted"

overrideWords = {}
for key in promptOverrides:
  overrideWords[key.lower()] = promptOverrides[key]

def prompt_to_send_to_pollinations(word):
  englishWord = word["english"]
  keyVal = englishWord.lower()

  if keyVal in overrideWords:
    value = overrideWords[keyVal]
  elif keyVal.startswith("to "):
    value = "a person performing the action: " + englishWord
  else:
    value = englishWord
  return value + ", " + STYLE


with open("assets/data/n5.json", "r", encoding="utf-8") as file:
  words = json.load(file)

for word in words:
  if word["hasImage"]:
    path = "assets/words/" + word["id"] + ".jpg"
    if not os.path.exists(path):
      word["hasImage"] = False

wordsToHaveImages = []
for word in words:
  if word["english"].lower() not in skipWords and word["guessNoun"]:
    wordsToHaveImages.append(word)

if len(sys.argv) > 1 and sys.argv[1] == "list":
  for word in wordsToHaveImages:
    print(word["id"], word["english"], "->", prompt_to_send_to_pollinations(word)[:60])
  print(len(wordsToHaveImages), "words can get a picture")
  sys.exit()

imageLimit = 20
if len(sys.argv) > 1:
  imageLimit = int(sys.argv[1])

os.makedirs("assets/words", exist_ok=True)

imageMade = 0

for word in wordsToHaveImages:
  if imageMade >= imageLimit:
    break
  if word["hasImage"]:
    continue

  prompt = prompt_to_send_to_pollinations(word)

  url = BASE_URL + quote(prompt) + "?width=512&height=512&model=flux&nologo=true"
  if KEY != "":
    url = url + "&key=" + KEY

  try:
    response = requests.get(url, timeout=120)
    if response.status_code != 200:
      print("stopped, the response was:", response.status_code, response.text[:200])
      break
    image = Image.open(BytesIO(response.content))
  except Exception as error:
    print("stopped:", error)
    break

  image = image.convert("RGB").resize((512, 512))
  image.save("assets/words/" + word["id"] + ".jpg", quality=85)

  word["hasImage"] = True
  imageMade = imageMade + 1
  print(imageMade, word["english"])

  with open("assets/data/n5.json", "w", encoding="utf-8") as file:
    json.dump(words, file, ensure_ascii=False, indent=1)

  time.sleep(3)

with open("assets/data/n5.json", "w", encoding="utf-8") as file:
  json.dump(words, file, ensure_ascii=False, indent=1)

print("done,", imageMade, "pictures made")
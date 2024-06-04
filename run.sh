#!/bin/bash

# Define lists of adjectives and nouns
ADJECTIVES=("lazy" "quick" "happy" "sad" "brave" "shy" "clever" "foolish" "adventurous" "bold" "curious" "daring" "eager" "gentle" "humble" "jolly" "kind" "lively" "merry" "naughty" "obedient" "proud" "quiet" "responsible" "stubborn" "thoughtful" "unique" "wise" "youthful" "zealous" "aggressive" "calm" "determined" "energetic" "fearless" "gracious" "honest" "imaginative" "joyful" "keen" "loyal" "mysterious" "noble" "optimistic" "patient" "resilient" "sincere" "talented" "understanding" "vivacious" "witty" "affectionate" "brilliant" "charming" "diligent" "enthusiastic" "friendly" "generous" "helpful" "intelligent" "jovial" "loving" "modest" "neat" "polite" "reliable" "sensible" "trustworthy" "upbeat" "versatile" "zany" "amazing" "beautiful" "delightful" "elegant" "fancy" "graceful" "incredible" "lovely" "magnificent" "nice" "outstanding" "perfect" "radiant" "super" "terrific" "vibrant" "wonderful" "young" "zesty")
NOUNS=("fox" "dog" "cat" "mouse" "owl" "bat" "bear" "lion" "elephant" "giraffe" "hippo" "kangaroo" "koala" "lemur" "monkey" "narwhal" "otter" "penguin" "quokka" "raccoon" "squirrel" "tiger" "unicorn" "vulture" "wolf" "yak" "zebra" "antelope" "bison" "cheetah" "dolphin" "eagle" "flamingo" "gorilla" "hedgehog" "iguana" "jaguar" "lemur" "meerkat" "newt" "octopus" "panther" "quail" "rabbit" "seal" "toucan" "urial" "vole" "wombat")

# Function to pick a random word from an array
pick_random_word() {
  local array=("$@")
  echo "${array[RANDOM % ${#array[@]}]}"
}

# Generate a unique name for the new app
ADJ1=$(pick_random_word "${ADJECTIVES[@]}")
ADJ2=$(pick_random_word "${ADJECTIVES[@]}")
NOUN=$(pick_random_word "${NOUNS[@]}")
APP_NAME="$ADJ1-$ADJ2-$NOUN-$RANDOM"

# Echo the app name for debugging
echo "Creating a new Next.js app named $APP_NAME"

# Create the new Next.js app
npx create-next-app@latest --use-npm --typescript --eslint --tailwind --src-dir --app --import-alias "@/*" $APP_NAME

# Check if the app creation was successful
if [ $? -eq 0 ]; then
  echo "Successfully created $APP_NAME"
else
  echo "Failed to create $APP_NAME"
  exit 1
fi

# Change to the new app directory
cd $APP_NAME

# Echo the directory change for debugging
echo "Changed directory to $(pwd)"

# Check if 'code' command is available
if command -v code >/dev/null 2>&1; then
  # Open Visual Studio Code in the new app directory
  echo "Opening Visual Studio Code..."
  code .
else
  # 'code' command not found
  echo "Visual Studio Code (code) is not installed or not available in PATH."
fi

# Echo starting the development server
echo "Starting the development server"

# Run the development server
npm run dev

# This point is reached when the development server is stopped
echo "Development server stopped"

# Exit the script successfully
exit 0

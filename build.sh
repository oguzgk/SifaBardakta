#!/bin/bash
# Railway build script - trains the Rasa model if not present

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Training Rasa model if needed..."
if [ ! -d "models" ] || [ -z "$(ls -A models)" ]; then
  echo "No trained model found. Training model..."
  rasa train
else
  echo "Trained model found, skipping training."
fi

echo "Build complete!"

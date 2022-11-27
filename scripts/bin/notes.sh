# Shell Script to create/edit markdown notes

# Get the date
DATE=$(date +%Y-%m-%d)

# Get the time
TIME=$(date +%H:%M)

# Get the file name
FILE_NAME=$(date +%Y-%m-%d)

# Get the file path
# Change this to your notes directory
FILE_PATH="$HOME/notes/$FILE_NAME.md"

# Create the file
touch $FILE_PATH

# If the file is empty, add the date
if [ ! -s $FILE_PATH ]; then
    echo "# $DATE" >> $FILE_PATH
fi

# Open the file in nvim
nvim -c "normal Go" \
  -c "normal Go## $(DATE +%H:%M)" \
  -c "normal G2o" \
  -c "normal zz" \
  -c "startinsert" $FILE_PATH

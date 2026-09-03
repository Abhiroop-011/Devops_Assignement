# 1. Variables to store system data
CURRENT_DATE=$(date)
HOST_NAME=$(hostname)
USER_NAME=$(whoami)

# 2. Printing system information
echo "======================================"
echo "       System Information Script      "
echo "======================================"
echo "Date: $CURRENT_DATE"
echo "Hostname: $HOST_NAME"
echo "Username: $USER_NAME"
echo "======================================"
echo ""

# 3. Printing disk usage
echo "--- Current Disk Usage ---"
df -h
echo ""

# 4. Taking user input
read -p "Enter the name of the directory to create: " DIR_NAME
read -p "Enter the name of the file to store processes (e.g., processes.txt): " FILE_NAME

# 5. Creating directory and file
echo "Creating directory: $DIR_NAME"
mkdir -p "$DIR_NAME"

echo "Creating file: $DIR_NAME/$FILE_NAME"
touch "$DIR_NAME/$FILE_NAME"

# 6. Printing running processes and storing them via redirection
echo "Fetching running processes and saving to $DIR_NAME/$FILE_NAME..."
# ps -aux gets all running processes, > redirects the output into the file
ps -aux > "$DIR_NAME/$FILE_NAME"

echo "Done! You can check the processes list inside $DIR_NAME/$FILE_NAME."
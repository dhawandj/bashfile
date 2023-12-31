#!/bin/bash

# Directory names
app_dir="domains"
rrrglass_dir="rrrglass.com"

# Check if the 'app' directory exists
if [ -d "$app_dir" ]; then
    # If it exists, remove the directory and its contents
    echo "Removing existing '$app_dir' directory..."
    rm -rf "$app_dir"
fi

# Check if the 'rrrglass.com' directory exists
if [ -d "$rrrglass_dir" ]; then
    # If it exists, remove the directory and its contents
    echo "Removing existing '$rrrglass_dir' directory..."
    rm -rf "$rrrglass_dir"
fi

# Create a new 'app' directory
mkdir "$app_dir"

# Navigate into the "app" directory
cd "$app_dir"

# Run git clone with a placeholder URL (replace with your actual Git repository URL)
git clone https://github.com/dhawandj/test2.git "$rrrglass_dir"

# Check if the 'rrrglass.com' directory exists after cloning
if [ -d "$rrrglass_dir" ]; then
    # Navigate into the 'rrrglass.com' directory
    cd "$rrrglass_dir"

    # Create a symbolic link named 'public_html' pointing to the 'public' directory
    ln -s public public_html
    # installing the composer files 
    php ~/composer.phar install  
    # composer install
    echo "composer done--------"
    # decrupt the env 
    php artisan env:decrypt --key=base64:YvV/3n5lZWVjJkiwVUouvS9FBY+b5qd+5TB81KoXtro= 

    



    # Optionally, you can perform additional actions here, such as setting up configuration or installing dependencies.

    # Display a message indicating the completion of the script
    echo "Symbolic link 'public_html' created in the '$rrrglass_dir' directory."
else
    echo "Error: '$rrrglass_dir' directory not found after cloning."
fi

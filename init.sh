#!/bin/bash
function create_module {
    mkdir $1
    cd $1
    touch __init__.py
    cd ..
}

if [ -z "$1" ]; then
    echo "ERROR: Please provide a project name"
    exit 0
fi
PROJECT_NAME=$1

echo "Welcome to the Python project template creator"
echo 
echo "Creating project: $PROJECT_NAME"
echo

# Create source directory
create_module $PROJECT_NAME

# Create test directory
create_module "tests"

# Create virtualenv
echo "Creating virtualenv"
echo "Python version: 3.8.3"

source /Users/juansandoval/.pyenv/versions/3.8.3/bin/virtualenvwrapper.sh
PYTHON_VIRTUALENV=$(mkvirtualenv $PROJECT_NAME)
echo "mkvirtualenv $PROJECT_NAME"
echo "virtualenv created: $PYTHON_VIRTUALENV"

rm -rf .git

git init
git add requirements.txt
git add $PROJECT_NAME
git add tests
git add .gitignore

mv ../python-project-layout ../$PROJECT_NAME

rm -f init.sh

echo "Project '$PROJECT_NAME' created"

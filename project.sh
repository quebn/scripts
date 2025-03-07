#!/usr/bin/bash

project_dir="$HOME/Programming"

if [ $# -eq 0 ]; then
    echo "Missing 'project' argument: project [type_dir] [new_project_name]"
    exit 1
fi

if [ ! -d "$project_dir/$1" ] && [ ! "$1" = "new" ]; then
    echo "Command: '$1' does not exist"
    exit 1
fi

if [ $# -eq 1 ]; then
    echo "Project $1: no project name argument specified"
    exit 1
fi

if [ "$1" = "new" ]; then
    new_type_dir="$project_dir/$2"
    if [ -d "$new_type_dir" ]; then
        echo "Failed to create project type: directory '$2' already exist"
        exit 1
    fi
    mkdir "$new_type_dir"
    echo "Project type '$2' created successfully in '$project_dir'"
    exit 0
fi

new_project="$project_dir/$1/$2"

if [ -d "$new_project" ]; then
    echo "Failed to new project: project '$2' already exist"
    exit 1
fi
# TODO: add prompt for creation and add delete option as a 4th arg.
mkdir "$new_project"
echo "Project '$2' created successfully in '$project_dir/$1'"
exit 0


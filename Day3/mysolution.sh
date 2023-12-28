#!/bin/bash

function Create_user {
    read -p "Enter your name: " user
    if id "$user" &>/dev/null; then
        echo "The user allready exists, please enter a valid user"
        exit 1;
    else
        read -p "Enter your passoword: " passoword
        sudo useradd -m -p $passoword $user
        echo "The user $user was created succesfully"
        exit 0;
    fi
        
        #hhjk
}

function Delete_user {
    read -p "Enter the user that you want to delete " user
    if id "$user" &>/dev/null; then
        sudo userdel $user
        echo "User deleted succesfully"
        exit 0;
    else
        echo "The user $user doesent exists, please enter a valid user"
        exit 1;
    fi
}

function Reset_user {
    read -p "Enter the user to reset the password " user
    if id "$user" &>/dev/null; then
        sudo passwd $user
        exit 0;
    else 
        echo "The user $user it's not a valid user"
        exit 1;
    fi
}

function List_users {
    cat /etc/passwd | awk -F: '{ print $1" "$3}'
    exit 0;
}

function Help {
    echo "This are the argument that you can use with this command:"
    echo "[*]-> '-c'    '--create'  -To create"
    echo "[*]-> '-d'    '--delete'  -Delete user"
    echo "[*]-> '-r'    '--reset'   -Reset password"
    echo "[*]-> '-l'    '--list'    -List all the users"
    echo "[*]-> '-h'    '--help'    -Help command"
    exit 0;
}

while [ $# -gt 0 ]; do
    case $1 in
        '-c'|'--create')
            Create_user
            ;;
        '-d'|'--delete')
            Delete_user
            ;;
        '-r'|'--reset')
            Reset_user
        ;;
        '-l'|'--list')
            List_users
        ;;
        '-h'|'--help')
            Help
        ;;
        *)
            echo "No valid argument"
            exit 1;
    esac
done
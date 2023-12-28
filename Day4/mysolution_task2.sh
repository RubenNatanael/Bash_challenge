#!/bin/bash

function monit_system
{
    CPU=$(top -bn 1 | grep '%Cpu' | awk '{print $2}')

    Total_mem=$(free | grep 'Mem:' | awk '{print $2}')
    Used_mem=$(free | grep 'Mem:' | awk '{print $3}')
    Memory=$(echo "scale=2; $Used_mem*100/$Total_mem" | bc )
    
    Disk=$(df -h / | tail -1 | awk '{print $5}')

    echo "      Information about the system"
    echo "  ------------------------------------"
    echo " CPU=$CPU%     Memory=$Memory%     Disk=$Disk "
    read x
}

function monitoring_process
{
    echo "      Monitoring process"
    echo "  ----------------------------"
    read -p "Please introduce the name of the process " process
    if pgrep $process >/dev/null; then
        echo "The process $process is runing correctly"
        read x
        return 0;
    else 
        echo "The preocess $process doesen't run,"
        read -p "Do you want to restart it? (Y/N): " answer
        if [[ $answer = 'Y' || $answer = 'y' ]]; then
            if  systemctl start $process >/dev/null; then
                echo "The process started succesfully!"
            fi
        fi 
    fi
    read x


}

function main
{   
    while true; do
    clear
        echo "Chose one option:"
        echo "1.Exit"
        echo "2.View data about the system"
        echo "3.Monitoring process"
        read option
        while [[ $option < 1 || $option > 3 ]]; do
            echo "Please choose a valid option"
            read option
        done
        case $option in 
            1)
                echo "Closing..."
                exit 0
                ;;
            2)
                monit_system
                ;;
            3)
                monitoring_process
                ;;
            *)
                exit 0;
                ;;
        esac
    done

}

main

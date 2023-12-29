#!/bin/bash

path=$1

function report
{

    counter_errors=$(cat $path | grep -i "error" 2>/dev/null | wc -l )
    Critical=$(cat -n $path | grep -i "critical" 2>/dev/null | awk $LINENO)
    most_common=$(cat $path | grep -i "error" 2>/dev/null | sort | uniq -c | sort -nr | head -5 )
    total_lines=$(cat $path | wc -l )

    summary_r="summary_report_$(date +%d-%m-%Y).txt"
    {
        echo "          Summary Report"
    echo " ----------------------------------"
    echo ""
    echo " [*]Date of analysis:"
    echo "      -$(date +"%a %d %B %Y")"
    echo " [*]Log file name:"
    echo "      -$path"
    echo " [*]Total line processed:"
    echo "      -$total_lines"
    echo " [*]Total error count:"
    echo "      -$counter_errors"
    echo " [*]Top 5 error message:"
    echo "$most_common"
    echo " [*]List of criyical events:"
    echo "      $Critical"
    } > "$summary_r"
    
    echo "Summary generated in the $summary_r file."
    exit 0;
}
if [ $# -eq 0 ]; then
    echo "Please provide a  path"
    exit 1;
fi

report

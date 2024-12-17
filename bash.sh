#!/bin/bash

# Define text colors
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
MAGENTA='\033[1;35m'
WHITE='\033[1;37m'
PINK='\033[1;38;5;213m' 
ORANGE='\033[38;5;214m'  
NC='\033[0m' 

displayHeader() {
    clear
    echo -e "${RED}\n╔═════════════════════════════════╗"
    echo -e "║       T E A M  RAM&NG            ║"
    echo -e "║  Ethical Hacker & Developer     ║"
    echo -e "╚═════════════════════════════════╝${NC}"
}

displaySocialLinks() {
    echo -e "${CYAN}═══════════════════════════════════════════${NC}"
    echo -e "${CYAN}Follow Us On:${NC}" 
    echo -e "═══════════════════════════════════════════"
    echo -e " • ${GREEN}GitHub:${NC} ${CYAN}https://github.com/NG${NC}"
    echo -e " • ${MAGENTA}Telegram:${NC} ${CYAN}https://t.me/NGYT777G${NC}"
    echo -e " • ${PINK}Channel:${NC} ${CYAN}https://t.me/RAMU128${NC}"
    echo -e "${CYAN}═══════════════════════════════════════════${NC}"
}

displayOptions() {
    echo -e "${YELLOW}Select a server:${NC}"
    echo -e "${BLUE}1. Server 1${NC}"
    echo -e "${GREEN}2. Server 2${NC}"
    echo -e "${MAGENTA}3. Server 3${NC}"
    echo
    echo -e "${WHITE}Please select an option:${NC} "
    read server_option
}

getPeriodNumber() {
    local periodDate=$(date -u +"%Y%m%d")
    local hours=$(date -u +"%H")
    local totalMinutes=$((hours * 60))  
    local minutes=$(date -u +"%M")
    totalMinutes=$((totalMinutes + minutes))  
    local periodNumber=$((10001 + totalMinutes))
    local periodCode="${periodDate}1000${periodNumber}"
    echo "$periodCode"
}

calculateResultServer1() {
    local periodNumber=$(getPeriodNumber)
    local lastFourDigits=$(echo "$periodNumber" | tail -c 5 | head -c 4 | sed 's/^0*//')
    local reducedDigit=$(reduceToSingleDigit "$lastFourDigits")
    if [[ "$reducedDigit" =~ [02468] ]]; then
        echo -e "${RED}RED${NC}"
    else
        echo -e "${GREEN}GREEN${NC}"
    fi
}

reduceToSingleDigit() {
    local number=$1
    local sumOfDigits=0
    while [[ $number -gt 0 ]]; do
        sumOfDigits=$((sumOfDigits + number % 10))
        number=$((number / 10))
    done
    while [[ $sumOfDigits -ge 10 ]]; do
        local temp=$sumOfDigits
        sumOfDigits=0
        while [[ $temp -gt 0 ]]; do
            sumOfDigits=$((sumOfDigits + temp % 10))
            temp=$((temp / 10))
        done
    done
    echo $sumOfDigits
}

calculateResultServer2() {
    local results=("BIG" "SMALL" "BIG" "BIG" "SMALL" "BIG" "BIG" "BIG" "SMALL" "BIG" "SMALL" "BIG")
    local index=$((RANDOM % ${#results[@]}))
    echo "${results[$index]}"
}

calculateResultServer3() {
    local periodNumber=$(getPeriodNumber)
    local lastFourDigits=$(echo "$periodNumber" | tail -c 5 | head -c 4 | sed 's/^0*//')
    local reducedDigit=$(reduceToSingleDigit "$lastFourDigits")
    if [[ "$reducedDigit" =~ [14982] ]]; then
        echo "SMALL"
    else
        echo "BIG"
    fi
}

askAgain() {
    echo -e "${CYAN}Do you want predictions again? (yes/no)${NC}"
    read user_response
    if [[ "$user_response" =~ ^[Yy](es)?$ ]]; then
        checkPeriodAndRun
    else
        showExitBanner
    fi
}

checkPeriodAndRun() {
    local currentPeriod=$(getPeriodNumber)
    local periodEndTime=$((currentPeriod + 1440))  
    local result=""
    
    case $server_option in
        1)
            result=$(calculateResultServer1)
            ;;
        2)
            result=$(calculateResultServer2)
            ;;
        3)
            result=$(calculateResultServer3)
            ;;
        *)
            echo -e "${RED}Invalid server option selected.${NC}"
            return
            ;;
    esac

    if [[ $currentPeriod -gt $periodEndTime ]]; then
        echo -e "${ORANGE}Time for the current period is over.${NC}"
    else
        echo -e "${CYAN}API:${NC} $currentPeriod"
    fi

    echo -e "${PINK}Result:${NC} $result"
    askAgain
}

runPrediction() {
    case $server_option in
        1|2|3)
            echo -e "${CYAN}Enter the Game URL:${NC} "
            read game_url
            echo -e "${YELLOW}Opening $game_url...${NC}"
            echo -e "${BLUE}Hack The Server And Access  API ${NC}"
            echo -n "${MAGENTA}Loading: ${NC}"
            for i in {1..100}; do
                echo -ne "${MAGENTA}$i%${NC}\r"
                sleep 0.05
            done
            echo -e "${GREEN}[Success]${NC}"
            checkPeriodAndRun  
            ;;
        *)
            echo -e "${RED}Invalid option, please select 1, 2, or 3.${NC}"
            displayOptions
            runPrediction
            ;;
    esac
}

showExitBanner() {
    clear

 
    echo -e "${RED}"
    echo "╔════════════════════════════════════════════════╗"
    echo "║          🔥 EXITING SCRIPT 🔥                 ║"
    echo "║                                                ║"
    echo "║     Thank you for using this script!           ║"
    echo "║     We hope it was helpful and enjoyable.      ║"
    echo "║                                                ║"
    echo "║             Made by - @GOAT_NG                 ║"
    echo "║     Feel free to reach out for more updates!   ║"
    echo "╚════════════════════════════════════════════════╗"
    echo -e "${NC}"

  
    echo -e "${GREEN}"
    echo "╔════════════════════════════════════════════════╗"
    echo "║     🚀 Run the script again anytime!           ║"
    echo "║                                                 ║"
    echo "║        Just run: bash bash.sh                   ║"
    echo "║                                                 ║"
    echo "╚════════════════════════════════════════════════╗"
    echo -e "${NC}"

   
    exit 0
}


displayHeader
displaySocialLinks
displayOptions
runPrediction

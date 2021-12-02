#!/bin/bash

# Roulette Dealer Finder by Time

awk '{print $1,$2,$5,$6}' $1'_Dealer_schedule' | grep "$2"

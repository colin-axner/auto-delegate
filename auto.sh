#!/bin/bash
# Script For Auto-Delegate from validator kreios 
while true
        do
                #replace cosmos1qm7knjdln0ap9fpykdu5rcajm9cf2esvp8ey2v with your own cosmosaddr
                STEAK=`sudo -u gaiad /opt/go/bin/gaiacli query account --chain-id=genki-2000 cosmos1pfl3pwpf9s46myukhv6muu6zpm7gtlpsszu2m0 --trust-node --home=/opt/gaiad | jq ".value.coins" | jq ".[0].amount" | bc`
                passphrase=""
                echo ""
                echo "Got ""$((STEAK - 1))"" Reward-STAKE"
                Zahl="$((STEAK - 1))"
                #replace --from "main" with your own keyname and cosmosvaloper1qm7knjdln0ap9fpykdu5rcajm9cf2esvynd3xl with the output from gaiacli keys show yourkeyname --bech=val

                echo $passphrase|sudo -u gaiad /opt/go/bin/gaiacli tx stake delegate --from "mykey" --validator "cosmosvaloper1pfl3pwpf9s46myukhv6muu6zpm7gtlps4kglhu" --chain-id "genki-2000" --amount "$Zahl""STAKE" --home="/opt/gaiad"
                sleep 6s
                echo ""
                echo ""
                gaiacli status | jq ".[].voting_power"
                echo ""
                echo ""
                sleep 4s
        done


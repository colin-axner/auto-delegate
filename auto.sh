#!/bin/bash -x
# Script For Auto-Delegate from validator kreios
while true
        do
		passphrase= ""
                echo $passphrase|sudo -u gaiad /opt/go/bin/gaiacli tx dist withdraw-rewards --chain-id "game_of_stakes" --from "mykey" --is-validator --home=/opt/gaiad
                STEAK=`sudo -u gaiad /opt/go/bin/gaiacli query account --chain-id=game_of_stakes cosmos1pfl3pwpf9s46myukhv6muu6zpm7gtlpsszu2m0 --trust-node --home=/opt/gaiad | jq ".value.coins" | jq ".[0].amount" | bc`
		while [ "$STEAK" != "0" ]
                        do
                                echo ""
                                echo "Got ""$((STEAK ))"" Reward-STAKE"
                                echo ""
				echo $passphrase|sudo -u gaiad /opt/go/bin/gaiacli tx dist withdraw-rewards --chain-id "game_of_stakes" --from "mykey" --is-validator --home=/opt/gaiad
				SEQ=`sudo -u gaiad /opt/go/bin/gaiacli query account --chain-id=game_of_stakes cosmos1pfl3pwpf9s46myukhv6muu6zpm7gtlpsszu2m0 --trust-node --home=/opt/gaiad | jq ".value.sequence" | bc`

				echo $passphrase|sudo -u gaiad /opt/go/bin/gaiacli tx stake delegate --chain-id "game_of_stakes" --from "mykey" --validator "cosmosvaloper1pfl3pwpf9s46myukhv6muu6zpm7gtlps4kglhu" --amount "$STEAK""STAKE" --account-number 125 --sequence $(($SEQ + 1)) --home=/opt/gaiad
                                sleep 10s
                                echo ""
                                sudo -u gaiad /opt/go/bin/gaiacli status | jq ".[].voting_power"
                                echo ""
				STEAK=`sudo -u gaiad /opt/go/bin/gaiacli query account --chain-id=game_of_stakes cosmos1pfl3pwpf9s46myukhv6muu6zpm7gtlpsszu2m0 --trust-node --home=/opt/gaiad | jq ".value.coins" | jq ".[0].amount" | bc`
				echo "$STEAK"
                                sleep 100s
                done
                echo""
                echo "You only have $STEAK STAKE"
                echo ""
                sleep 12000
        done


#!/bin/bash

TOKEN_MINT_ADDRESS="INITIAL-Token-Mint-Address" # e.g. https://solscan.io/token/7Cy8QKRGDx42idnRELTVBtYo83PUPWQJ8qnWENUSGuzR
CSV_FILE_PATH="SOLANA-WALLETS.csv"


FEE_PAYER_KEYPAIR_PATH="/Users/jp/.config/solana/id.json"
FIXED_AMOUNT=100  # small initial airdrop of circa 100 tokens, change as necessary

while IFS=, read -r recipient _
do
  # Fetch the associated token account for the recipient
  associated_account=$(spl-token accounts --owner $recipient | grep $TOKEN_MINT_ADDRESS | awk '{print $1}')

  # If no associated account is found, create it
  if [[ -z $associated_account ]]; then
    echo "Creating associated token account for recipient: $recipient"
    spl-token create-account $TOKEN_MINT_ADDRESS --owner $recipient --fee-payer $FEE_PAYER_KEYPAIR_PATH
  fi

  # Transfer 100 tokens, allow creating an associated token account if necessary
  spl-token transfer $TOKEN_MINT_ADDRESS $FIXED_AMOUNT $recipient --fund-recipient --fee-payer $FEE_PAYER_KEYPAIR_PATH --allow-unfunded-recipient
done < "$CSV_FILE_PATH"

# solana-token-drop
## Really cost effective SPL Token Distribution Script

## Introduction
This script automates the process of distributing SPL tokens to multiple recipients on the Solana blockchain. It's designed for developers and token administrators who need an efficient, reliable way to handle token distributions. The script ensures that each recipient receives a specific amount of tokens, and it can also create associated token accounts if they don't exist for the recipients.

## Key Features
- **Automated Distribution**: Distributes SPL tokens to a list of recipients specified in a CSV file.
- **Token Account Management**: Automatically creates associated token accounts for recipients if not already present.
- **Low Transaction Cost**: The cost per transaction is extremely low, typically around 0.0005 SOL (equivalent to about $0.001).

## Prerequisites
To use this script, you need to have the following installed:
- [Solana CLI tools](https://docs.solana.com/cli/install-solana-cli-tools)
- [SPL Token CLI](https://spl.solana.com/token)

Ensure you have the latest versions:
```bash
solana --version
spl-token --version
```
## Usage

Prepare Your CSV File: Create a CSV file listing the recipient's Solana addresses and the amount of tokens to be sent. The amount should be in the smallest unit of your SPL token.

Example recipients.csv:

```
recipient_address_1,amount_in_smallest_unit
recipient_address_2,amount_in_smallest_unit
```

### The Script:
-  [distribute-tokens.sh](destribute-tokens.sh)

### Run the Script: Execute the script in your terminal:

```
chmod +x distribute-tokens.sh
./distribute-tokens.sh
```

## Important Notes

The script assumes that your fee-payer account has enough SOL to cover transaction fees.
Verify that the token amounts in the CSV file are in the smallest unit (considering the token's decimals).
Test the script with a small number of transactions before doing a large-scale distribution.

## Contributing

Your contributions and suggestions are welcome. Feel free to fork, modify, or suggest improvements to this script.




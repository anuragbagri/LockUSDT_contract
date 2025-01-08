# Lock Contract with Custom ERC-20 Token

This project implements a **Lock Contract** on **Foundry** that allows users to lock a custom ERC-20 token for a specified time period.

## Features

- **Custom ERC-20 Token**: A token built on top of the ERC-20 standard.
- **Lock Mechanism**: Users can lock tokens for a defined duration.
- **Time-Locked Withdrawals**: Tokens can only be withdrawn after the lock period expires.

## Project Structure

- `Lock.sol`: Handles the locking logic.
- `CustomToken.sol`: Implements the custom ERC-20 token.

## Setup & Testing

1. Install Foundry: [Guide](https://book.getfoundry.sh/getting-started/installation.html)
2. Clone the repository:
   ```bash
   git clone https://github.com/anuragbagri/LockUsdt_Contract.git
   cd LockUsdt_Contract
   ```
3. Build and test:

   ```bash
   forge build
   forge test

   ```

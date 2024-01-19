
# DegenToken Smart Contract

## Overview

The DegenToken smart contract is an Ethereum-based ERC-20 token that includes functionality for purchasing food items using the token.

## Food Menu

The smart contract introduces a food purchasing mechanism, allowing users to buy different types of food using the Degen token. The supported food items and their prices are as follows:

1. **Spaghetti**
   - Price: 20 DGN
   - Servings: 10

2. **Pesto**
   - Price: 50 DGN
   - Servings: 10

## Smart Contract Functions

### `mint(uint256 amount)`

The `mint` function allows the contract owner to mint additional Degen tokens.

### `burn(uint256 amount)`

The `burn` function allows any token holder to burn a specified amount of their Degen tokens.

### `buyMenu(string memory foodName)`

The `buyMenu` function allows users to purchase food items using their Degen tokens. Users specify the type of food they want to buy, and the corresponding amount is deducted from their Degen token balance. The ownership of the purchased food items is tracked in the `userOwnedFood` mapping.

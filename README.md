# Food Sharing Platform with Blockchain

A decentralized food sharing platform built on Ethereum blockchain that allows users to list and purchase food items using custom tokens (FST - Food Sharing Tokens).

## Features

- Custom ERC20-like token implementation (FST)
- List food items for sale
- Purchase food items using FST tokens
- User-friendly web interface
- MetaMask integration
- Real-time balance updates
- Responsive design

## Prerequisites

- [Node.js](https://nodejs.org/) (v14.0.0 or higher)
- [MetaMask](https://metamask.io/) browser extension
- [Truffle](https://www.trufflesuite.com/truffle) (for contract deployment)
- An Ethereum testnet account with some test ETH (recommended: Goerli or Sepolia)

## Project Structure

```
food-sharing-platform/
├── contracts/
│   └── FoodSharingPlatform.sol
├── frontend/
│   └── index.html
├── README.md
└── package.json
```

## Smart Contract Setup

1. Install Truffle globally:
```bash
npm install -g truffle
```

2. Initialize a new Truffle project:
```bash
truffle init
```

3. Copy the `FoodSharingPlatform.sol` contract to the `contracts/` directory.

4. Create a migration file in `migrations/` directory:
```javascript
const FoodSharingPlatform = artifacts.require("FoodSharingPlatform");

module.exports = function (deployer) {
  deployer.deploy(FoodSharingPlatform);
};
```

5. Configure your network in `truffle-config.js`.

6. Deploy the contract:
```bash
truffle migrate --network <your-network>
```

## Frontend Setup

1. Copy the `index.html` file to your web server or local development environment.

2. Update the contract address in the HTML file:
```javascript
const contractAddress = 'YOUR_CONTRACT_ADDRESS_HERE';
```

3. Add the contract ABI to the HTML file:
```javascript
const contractABI = [...]; // Replace with your contract ABI
```

## Usage

### For Users

1. Install MetaMask browser extension
2. Connect MetaMask to the appropriate network
3. Visit the platform website
4. Connect your wallet when prompted
5. View your FST token balance
6. Browse available food items
7. List new food items for sale
8. Purchase food items using FST tokens

### For Sellers

1. Ensure you have FST tokens in your wallet
2. Click on "List Food Item"
3. Fill in the required details:
   - Food Name
   - Description
   - Price in FST
4. Submit the listing
5. Pay the gas fee when prompted by MetaMask
6. Your item will appear in the available food items list

### For Buyers

1. Ensure you have sufficient FST tokens
2. Browse available food items
3. Click "Purchase" on desired items
4. Confirm the transaction in MetaMask
5. Pay the gas fee
6. Wait for transaction confirmation

## Smart Contract Functions

### Token Functions
- `transfer(address to, uint256 value)` - Transfer tokens to another address
- `approve(address spender, uint256 value)` - Approve spending of tokens by another address
- `transferFrom(address from, address to, uint256 value)` - Transfer tokens on behalf of another address

### Food Platform Functions
- `listFoodItem(string memory _name, string memory _description, uint256 _price)` - List a new food item
- `purchaseFoodItem(uint256 _id)` - Purchase a listed food item

## Security Considerations

- The smart contract includes basic security measures but should undergo thorough testing before mainnet deployment
- Users should verify all transaction details before confirming
- Keep private keys secure and never share them
- Double-check token amounts and food item details before transactions

## Common Issues and Solutions

1. **MetaMask not connecting**
   - Ensure MetaMask is installed and unlocked
   - Check if you're on the correct network
   - Try refreshing the page

2. **Transaction Failed**
   - Check if you have sufficient FST tokens
   - Ensure you have enough ETH for gas fees
   - Verify the food item is still available

3. **Balance not updating**
   - Refresh the page
   - Check if your MetaMask is connected
   - Verify network connectivity

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- OpenZeppelin for smart contract security patterns
- Ethereum community for development tools
- MetaMask for wallet integration

## Support

For support and questions, please open an issue in the repository or contact the maintainers.

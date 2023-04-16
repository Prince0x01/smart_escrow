Escrow Smart Contract

N.B: This contract was deployed and tested on the sepolia testnet.

This is a smart contract written in Solidity programming language for an escrow service. The contract allows a contract owner to hold funds in escrow until a contractor has completed certain tasks or fulfilled certain conditions. Once the tasks or conditions are met, the owner can authorize the release of funds to the contractor.

How it works
The contract has several functions that allow the owner and the contractor to interact with it:

addContractor
This function allows the contract owner to add a contractor to the contract. Only the owner can call this function.

authorizeWithdrawal
This function allows the contract owner to authorize the withdrawal of funds from the contract. Only the owner can call this function. The function requires that the contract balance is greater than zero.

withdraw
This function allows the contractor to withdraw funds from the contract, provided that the owner has authorized the withdrawal and the contract balance is greater than zero. Only the contractor can call this function.

removeContractor
This function allows the contract owner to remove a contractor from the contract. Only the owner can call this function. The function requires that the contractor has not been paid yet.

receive
This is a fallback function that allows the contract to receive funds. Anyone can call this function and send Ether to the contract address.

getBalance
This function returns the balance of the contract. Anyone can call this function.

getContractor
This function returns the address of the contractor. Anyone can call this function.

How to use
To use this smart contract, you need to deploy it on a blockchain network that supports Solidity smart contracts, such as Ethereum or Binance Smart Chain. This code was deployed and tested on the 'sepolia' testnet. You can use a tool like Remix or Truffle to compile and deploy the contract.

Once the contract is deployed, you need to interact with it using a wallet that supports the blockchain network and the contract interface. You can use a tool like Metamask or Trust Wallet to connect to the network and the contract.

To use the contract, follow these steps:

Call the addContractor function to add a contractor to the contract. Provide the address of the contractor as an argument.

Wait for the contractor to complete the tasks or fulfill the conditions.

Call the authorizeWithdrawal function to authorize the withdrawal of funds. Make sure that the contract balance is greater than zero.

Wait for the contractor to call the withdraw function to withdraw the funds. Make sure that the contractor is the one calling the function and that the payment has been authorized by the owner.

If needed, call the removeContractor function to remove the contractor from the contract. Make sure that the contractor has not been paid yet.

Repeat the process with a new contractor if needed.

License
This smart contract is released under the MIT License. You can use, modify, and distribute it for any purpose, as long as you include the original license text and copyright notice.

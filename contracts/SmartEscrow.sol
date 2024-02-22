// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow {
    address public owner;
    address public contractor;
    uint public balance;
    bool public isPaid;

    constructor() {
        owner = 0xa1B94ef0f24d7F4fd02285EFcb9202E6C6EC655B;
    } 

    function addContractor(address _contractor) public {
        require(msg.sender == owner, "Only the owner can add a contractor");
        contractor = _contractor;
    }

    function authorizeWithdrawal() public returns (bool){
        require(msg.sender == owner, "Only the owner can authorize withdrawal");
        require(balance > 0, "Contract balance is zero");
        isPaid = true;
        return isPaid;
    }

    function withdraw() public payable returns (bool){
        require(msg.sender == contractor, "Only the contractor can withdraw");
        require(balance > 0, "Contract balance is zero");
        require(isPaid, "Payment has not been authorized by contractor yet");
        uint amount = balance;
        payable(contractor).transfer(amount);
        balance = 0;
        isPaid = false; // set to false after withdrawal is made
        return isPaid;
    }

    function removeContractor() public {
        require(msg.sender == owner, "Only the owner can remove a contractor");
        require(!isPaid, "Contractor must withdraw funds before being removed");
        contractor = address(0);
    }

    // Allows Escrow to receive funds
    receive() external payable {
        balance += msg.value;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getContractor() public view returns (address) {
        return contractor;
    }
}
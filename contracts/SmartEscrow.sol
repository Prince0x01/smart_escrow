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

    function payContractor() public payable returns (bool){
        require(msg.sender == owner, "Only the owner can pay the contractor");
        balance += msg.value;
        isPaid = true; // set to true after payment is made
        return isPaid;
    }

    function withdraw() public {
        require(msg.sender == contractor, "Only the contractor can withdraw");
        require(balance > 0, "Contract balance is zero");
        require(isPaid, "Payment has not been made to the contractor yet");
        uint amount = balance;
        balance = 0;
        payable(contractor).transfer(amount);
        isPaid = false; // set to false after withdrawal is made
    }

    function removeContractor() public {
        require(msg.sender == owner, "Only the owner can remove a contractor");
        require(!isPaid, "Contractor must withdraw funds before being removed");
        contractor = address(0);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function getContractor() public view returns (address) {
        return contractor;
    }

    function getOwner() public view returns (address) {
        return owner;
    }

    // Owner cannot withdraw from the contract
    receive() external payable {}
}
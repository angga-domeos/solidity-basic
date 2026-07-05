// SPDX-License-Identifier: MIT
pragma solidity 0.8.35;

contract CointExample {

    address public minter;
    mapping(address => uint) public balance;

    event Send(address from, address to, uint amount);

    constructor() {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balance[receiver] += amount;
    }

    error InsufficientBalance(uint requested, uint available);

    function send(address receiver, uint amount) public {
        require(amount <= balance[msg.sender], InsufficientBalance(amount, balance[msg.sender]));
        balance[msg.sender] -= amount;
        balance[receiver] += amount;
        emit Send(msg.sender, receiver, amount);
    }
}
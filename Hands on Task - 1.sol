pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT


contract FeeCollector { //0x128897683739e62E2e7875f80ab8218E300046cd

    // contract owner address and contract balance variables
    address public owner;
    uint256 public balance;


    constructor() {
        owner = msg.sender;
    }

    //letting contract to receive balance
    receive() payable external {
        balance += msg.value;
    }

    // function for withdraw balance from contract to address (which is owner adress only).
    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender == owner, "Only owner can withdraw.");
        require(amount <= balance, "Insufficient balance");
        destAddr.transfer(amount);
        balance -= amount;
    }

}

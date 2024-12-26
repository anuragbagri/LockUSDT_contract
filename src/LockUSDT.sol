
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// ierc20 contains the  interface for the erc20 usdt token contract


contract LockUSDT {
    address private usdtAddress;

    // to keep the record of which customer has deposited how much in the lock contract
    mapping(address => uint256) pendingBalance;


    constructor(address _usdtAddress) {
       usdtAddress = _usdtAddress;      // this sets the address where usdt contract is stored is stored.
    }

    function deposit(uint256 _amount) public {
      // checks that if the usdt contract(ierc20)  has allowed the lock contract to spend from the owner account.
      require(IERC20(usdtAddress).allowance(msg.sender, address(this)) >= _amount);
      IERC20(usdtAddress).transferFrom(msg.sender, address(this), _amount);
      pendingBalance(msg.sender) +=_amount; 
    }

    function withDraw() public {
     uint256 remainingAmount = pendingBalance(msg.sender);
     IERC20(usdtAddress).transfer(msg.sender, remainingAmount);
     pendingBalance(msg.sender) = 0;
    }
}

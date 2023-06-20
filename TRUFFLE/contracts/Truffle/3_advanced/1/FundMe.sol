// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FundMe {

  function fund() public payable {
    require(msg.value > 1e18, "Your minimum amount must be at least 1 ETH");
  }

}

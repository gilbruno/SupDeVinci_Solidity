// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract FirstContract {

  string hello;

  constructor() {
    hello = 'Hey !';
  }

  function sayHello() public view returns (string memory) {
    return hello;
  }

}

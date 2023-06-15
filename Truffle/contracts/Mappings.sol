// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Mappings {

  mapping(uint => string) public myMap;

  function addValueToMapping(uint key, string memory value) public {
    myMap[key] = value;
  }

  function getValue(uint key) public view returns (string memory) {
    return myMap[key];
  }

  function deleteValue(uint key) public {
    delete myMap[key];
  }

  //Try it on Remix !
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./SimpleStorage.sol";

contract StorageFactory {
  
  SimpleStorage public simplestorage;

  function createSimpleStorageContract() public {
    simplestorage = new SimpleStorage();    
  }
}

//Deploy this contract on Remix and see that when we use 'createSimpleStorageContract' by clicking the button, 
//then the simpleStorage variable displays and ETH address after clicking the matchin button in Remix
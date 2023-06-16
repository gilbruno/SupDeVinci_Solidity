// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
  
  SimpleStorage[] public listOfSimpleStorageContracts;

  function createSimpleStorageContract() public {
    SimpleStorage simplestorage = new SimpleStorage();    
    listOfSimpleStorageContracts.push(simplestorage);
  }
}

//Try it on Remix !



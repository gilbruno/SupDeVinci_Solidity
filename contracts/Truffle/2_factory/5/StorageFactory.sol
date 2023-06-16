// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
  
  SimpleStorage[] public listOfSimpleStorageContracts;

  function createSimpleStorageContract() public {
    SimpleStorage simplestorage = new SimpleStorage();    
    listOfSimpleStorageContracts.push(simplestorage);
  }

  function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber)  public {
    SimpleStorage simpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
    simpleStorage.store(_newSimpleStorageNumber);
  }

  function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
    SimpleStorage simpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
    return simpleStorage.retrieve();
  }
}

//Try it on Remix !



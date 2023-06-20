// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
  
  uint256 myFavoriteNumber;

  function store(uint256 _favoriteNumber) public {
    myFavoriteNumber = _favoriteNumber;
  }

  function retrieve() public view returns (uint256) {
    return myFavoriteNumber;
  }
}


contract StorageFactory {
  
  SimpleStorage public simplestorage;

  function createSimpleStorageContract() public {
    simplestorage = new SimpleStorage();    
  }
}

//Try in Remix !!
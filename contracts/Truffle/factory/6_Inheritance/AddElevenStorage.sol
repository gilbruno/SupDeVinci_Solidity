// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


import {SimpleStorage} from "./SimpleStorage.sol";


contract AddElevenStorage is SimpleStorage{

  //Without the keyword 'override' ===> error
  // The overrided function i the parent class must contains the keyword 'virtual'
  function  store(uint256 _number) public override{
    myFavoriteNumber = _number + 11;
  }

}

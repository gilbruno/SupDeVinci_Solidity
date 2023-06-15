// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract State_Visibility {
  
  uint favoriteNumber;

  //Public visibility
  function setFavoriteNumber(uint _number) public {
    favoriteNumber = _number;
  }


  //View visibility
  function retrieve() public view returns (uint) {
    return favoriteNumber;
  }

  //Pure visibility
  function retrievePure() public pure returns (uint) {
    //return favoriteNumber; =+> Causes error
    return 7;
  }

}

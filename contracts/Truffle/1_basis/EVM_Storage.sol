// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EVM_Storage {
  
  string public myStr = 'Test';

  //memory (temporary storage in EVM)
  function changeString1(string memory _str) public pure returns (string memory) {
    _str = 'test2';
    return _str;
  }

  //calldata (temporary storage in EVM)
  function changeString2(string calldata _str) public pure returns (string calldata) {
    //_str = 'test2'; ==> Causes error b/c you can not change a 'calldata' variable
    return _str;
  }

  //Memory can be applied for : 
  // - structs
  // - mappings
  // - arrays
}

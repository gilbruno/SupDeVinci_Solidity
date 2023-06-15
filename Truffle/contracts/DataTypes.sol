//// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract DataTypes {

    //Basic types
    uint256 myInt = 12;
    string str = "Hello";
    bool _bool = true;
    address _addr = 0xeDa05e060C6075ac3A6D43Fc0Dd2FB270B625A08;
    address payable _payable_addr = payable(0x68A96ca3B94e330578dE197e9068a94dA47ed892);
 
    //Arrays
    uint256[] myIntArray = [0, 1, 2];
    bool[] myBoolArray   = [true, false];
    string[] myStringArray = ['USA', 'France', 'Italy'];
    address payable[] myAddrArray = [
        payable(0x52Da51d3cD1c02bA63580Cd51059aE1847F7A7B5),
        payable(0x401ec99678B3a332A3ecE10cBaBDA23fa85e7eDe)
    ];

}
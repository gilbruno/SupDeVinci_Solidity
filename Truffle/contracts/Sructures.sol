// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Sructures {
  
  struct Person {
    string firstName;
    string lastName;
    uint age;
  }  

  Person myMan = Person('John', 'Doe', 40);

}

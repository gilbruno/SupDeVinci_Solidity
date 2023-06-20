// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Sructures {
  
  struct Person {
    string firstName;
    string lastName;
    uint age;
  }  

  Person myMan   = Person('John', 'Doe', 40);
  // Or like this
  Person myWoman = Person({firstName: 'Mary', lastName: 'Doe', age: 40}); 

  //Dynamic Array of Struct (size can change)
  Person[] public listOfMen;

  //Static Array of Struct (size can not change)
  Person[3] public listOf3Men;


  function addPerson(
    string memory _firstName, 
    string memory _lastName, 
    uint _age) public {

      listOfMen.push(Person(_firstName, _lastName, _age));
  }

}

// SPDX-License-Identifier: MIT
// An abstract contract is one that cannot be deployed by itself. An abstract contract must be inherited by another contract. 
// An abstract contract is somewhat similar to an interface but there exist some differences between them. 
// An abstract contract can defined functions signature and can also have implementation for some of its functions.
// https://dev.to/jamiescript/abstract-contract-and-interfaces-in-solidity-20cb

pragma solidity ^0.8.0;
abstract contract SayHello {
    uint256 public age;
    constructor(uint256 _age ){
        age = _age;
    }

    function getAge() public virtual view returns (uint256){
        return age;
    }
    function setAge(uint256 _age) public virtual {}
    function makeMeSayHello() public  pure returns (string memory) 
    {
        return "Hello";
    }
}

contract Hello is SayHello {
    string private name;
    constructor(string memory _name  ,uint256  _age)  
     SayHello(_age) {
       name = _name;
    }

    function setName(string memory _name ) public {
        name = _name;
    }

    // getAge() is inherited

    function getName() public view returns (string memory){
        return name;
    }

    function setAge(uint256 _age ) public override { // override is required to use inherited function
        age = _age;
    }
}

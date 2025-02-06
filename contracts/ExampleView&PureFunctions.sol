//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract ExampleViewPureFunctions {
    string public testString = "Hello World from earth";

    uint public storageVar;

    // write function
    function updateTestString(string memory _myString) public {
        testString = _myString;
    }

    //View function which can access state varibles
    function getStorageVar () public view returns(uint) {
        return storageVar;
    }

    //Pure functions which can access his own arguments variables
    function add (uint a, uint b) public pure returns(uint) {
        return a+b;
    }
}
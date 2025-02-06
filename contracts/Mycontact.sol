//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract Mycontarct {
    string public testString = "Hello World from earth";

    function updateTestString(string memory _myString) public {
        testString = _myString;
    }
}
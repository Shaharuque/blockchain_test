//SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleUint {
    uint256 public myUint ;  //0- (2^256) -1 //uint unsigned
    uint8 public myUintLess; // if we need lower number
    int public signedIntTest;  //int signed -2^128 to +2^128

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
     function setSignedIntTest(int _mySignedIntTest) public {
        signedIntTest = _mySignedIntTest;
    }
}
//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract BlockchainMessanger {
    address public ownerAddress;
    uint256 public counter;
    string public testString;

    //initializer while contact deployment
    constructor() {
        ownerAddress = msg.sender; //msg.sender je contact call korsey last time tar address dhortey parbo
    }

    function updatingStringFunc(string memory _myString) public {
        if(msg.sender == ownerAddress){
            testString=_myString;
            counter++;
        }
    }
}

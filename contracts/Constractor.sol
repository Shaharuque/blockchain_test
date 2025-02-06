//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract Constructor {
    address public myAddress;
    //Called once while deployment of smart contact
    constructor(address _myAddress) {
        myAddress =_myAddress;
    }

    function setAddress ( address _newAddress) public {
        myAddress=_newAddress;
    }

     function setMyAddressToMsgSender() public {
        myAddress = msg.sender;
    }


}
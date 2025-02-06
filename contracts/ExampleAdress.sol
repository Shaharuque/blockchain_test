//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract ExampleAddress {

    address public someAddress;
    address public lastAdressInteration;

    function setSomeAddress(address _someAddress) public {
        someAddress = _someAddress;
    }

    function getAddressBalance() public view returns(uint) {
        return someAddress.balance;  //return balance of corresponding address
    }

    function lastInteractedAdresssWithsmartcontact () public {
        lastAdressInteration = msg.sender;  //msg.sender the address is stored who initiated the contract call
    }

}
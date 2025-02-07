//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract Mycontarct {
    string public myString = "Hello World";
    address public transactionCreatorAddress;

     //initializer while contact deployment
    constructor() {
        transactionCreatorAddress = msg.sender; //msg.sender je contact call korsey last time tar address dhortey parbo
    }

    // msg.sender => the address that send the trasaction/last contract address who contact with smart contact
    // msg.value => the amount of eth that was sent with the transaction to the smart contact
    //In Solidity, functions need to be marked as payable to receive Ether.Without that, any call sending Ether would fail. 

    //task: function with update string will only work when eth 1 else send the ether to the address where it comes from
    function updateString(string memory _newString) public payable {
        if(msg.value == 1 ether) {
            myString = _newString;

        }else{
            payable (msg.sender).transfer(msg.value);
        }
    }
}
//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract Structs{
    //Using struct data structure because to prevent parent-child contact relation as its really complicated
    //To save gas cost we should use struct rather than parent-child contact relation
    struct payableRecivedAddressStruct {
        address from;
        uint amount;
    } 
    
    payableRecivedAddressStruct public payment;

    function paymentStore () public payable {
        //2 ways to set struct variables
        // payment=payableRecivedAddressStruct(msg.sender,msg.value);
        payment.from =msg.sender;
        payment.amount =msg.value;
    }
}
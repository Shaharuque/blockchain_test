//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

//Problem statement: each address will have seperate deposit array and withdraw array, total balances and total number of deposits and withdraw
contract MappingStructExample {
    //each transaction structure/struct
    struct Transaction{
        uint amount;
        uint timestamp;
    }
    //each transaction address/user balance structure/struct
    struct Balance{
        uint totalBalance; //initially totalBalance=0
        uint totalNumberOfDeposits;  //initially totalNumberOfDeposits=0
        //deposits array each index a particualar address jotogula deposit korsey tar details
        mapping(uint=>Transaction) deposits;
        uint totalNumberOfWithdraw;
        mapping (uint=>Transaction) withdrawals;
    }

    //balanceReceived array and its public and each index as transaction address hold Balance details of his
    mapping (address => Balance) public balanceReceived;

    function depositFunc() public payable {
        balanceReceived[msg.sender].totalBalance += msg.value;
        //memory Keyword: Indicates that the deposit variable is stored in temporary memory (not on the blockchain). It exists only during the function call.
        Transaction memory deposit= Transaction(msg.value, block.timestamp);
        //deposits array tey each transaction store kora hocchey each index a
        balanceReceived[msg.sender].deposits[balanceReceived[msg.sender].totalNumberOfDeposits]=deposit;
        balanceReceived[msg.sender].totalNumberOfDeposits++ ;
    }

    //address payable _to => jei address a withdraw amount ta jabey
    function withdrawFunc(address payable _to, uint amount) public {
        balanceReceived[msg.sender].totalBalance -=amount;

        Transaction memory withdraw= Transaction(amount,block.timestamp);
        //withdraw array tey each withdraw transaction store kora hocchey each index a
        balanceReceived[msg.sender].withdrawals[balanceReceived[msg.sender].totalNumberOfWithdraw]= withdraw;
        balanceReceived[msg.sender].totalNumberOfWithdraw++;

        //jei address thekey withdraw call hoisey takey oi amount dewa
        _to.transfer(amount);
    } 
}

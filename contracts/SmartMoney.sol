//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

//Prob statements:
//Any address can deposit
//Show total balance of smart contact
//When withdraw called giv all balance of smart contact to that caller address

contract Mycontarct {
    uint256 public balanceReceived;

    //Deposit eth balance from any address u want
    function deposit() public payable {
        balanceReceived += msg.value;
    }

    //getting smart contact total balance
    function contactTotalBalance () public view returns (uint){
        return address(this).balance;
    }

    //Withdraw all balance to contact caller (I am not maintaining who deposit what amount its like all balance goes to that caller account lol)
     function withdrawAll() public payable {
        payable (msg.sender).transfer(address(this).balance);
    }

    //contact caller balance check/ specific user address balance check
    function getBalanceFromCaller () public view returns(uint){
         return msg.sender.balance; 
      }
}

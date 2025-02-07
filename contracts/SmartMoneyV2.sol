//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract SmartMoneyV2 {
    //Mappings are like hash tables or dictionaries that store key-value pairs. In this case, the key is a uint and the value is a bool. 
     mapping (address=>uint) public balances;

    //Deposit from  different addresses
    //msg.value=> eth send through each transaction address
    function depositFromAddress() public payable {
        balances[msg.sender]+=msg.value;
    }

    //contact caller balance check/ specific user address balance check
    function getBalanceFromCaller () public view returns(uint){
         return msg.sender.balance; 
      }

    //Total balance of smart contact
    function totalBalance() public view returns (uint){
        return address(this).balance;
    }  

    //withdraw balance of user from his own balance
    function userWithdraw() public payable{
        uint amountToSend =balances[msg.sender];
        balances[msg.sender] = 0; // Prevent re-entrancy attack
        //transaction jei address thekey call hobey she address kicho send kora bujhay
        payable (msg.sender).transfer(amountToSend);
    }

    //withdraw partial amount of user address
    function partialWithdraw(address payable _to, uint _amount) public{
        require(_amount <= balances[msg.sender], "Not enough funds");
        //sending amount to the calling address user
        _to.transfer(_amount);
    }
}
//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract ExampleRequire {
    mapping(address => uint256) public receivedBalances;

    function depositAmount() public payable {
        receivedBalances[msg.sender] += msg.value;
    }

    function withdrawAmount(address payable _to, uint256 amount) public {
        // if(amount <= receivedBalances[msg.sender]){
        //     receivedBalances[msg.sender] -=amount;
        //     _to.transfer(amount);
        // }

        //now above process will be try with require which gives proper way to handle error message
        //require works left side jodi false hoy tahley Not enough balance to withdraw! print hobey and transaction revert hobey and 
        //left side true holey nichey jeye baki kaj korbey.
        require(
            amount <= receivedBalances[msg.sender],
            "Not enough balance to withdraw!"
        );
        receivedBalances[msg.sender] -= amount;
        _to.transfer(amount);
    }
}

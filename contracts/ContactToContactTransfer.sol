//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

//ContractA will receive ether from contractB
contract ContractA {
    //Sending money to smart contact to smart contact
    //set event to show how much its gets
    event Received(address sender, uint256 amount);

    //receive() function=> indicates that it can recive ether from other contract
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    //how much total balance this contract have
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

//from this contract send some ether to contractA
//address payable _to kon address a pathabo
contract ContractB {

    function sendEther(address payable _to) public payable {
        require(msg.value > 0 , "Send some ether!");
        (bool success, ) = _to.call{value: msg.value}("");
        require(success, "Ether send failed!");
    }
}

//When testing jei contact ether/wei receive korbey tar low level interaction a Transact btn click hobey

//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract Mapping {
    //Mappings are like hash tables or dictionaries that store key-value pairs. In this case, the key is a uint and the value is a bool. 
     mapping(uint => bool) public myMapping;
     mapping (address=>uint) public callingFromAddress;

    function setValue(uint _index) public {
        myMapping[_index]=true;
    }

    function callingAddressStore() public {
        callingFromAddress[msg.sender]+=1;
    }

    //each address kotobar korey call hoisey shietar count return
    function getTotalCountCalling() public view returns(uint){
        return callingFromAddress[msg.sender];
    }
}
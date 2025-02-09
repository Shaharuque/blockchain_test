//SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract SmartWallet {
    address payable public owner;
    address payable public nextOwner;
    mapping(address => uint256) public allowenceAmount;
    mapping(address => bool) public canSpend;
    mapping(address => bool) public gurdiansArray;

    uint256 public guardianApprovals;
    uint256 public constant gurdians = 5;
    uint256 public constant needApproval = 3;

    event Received(address sender, uint256 amount);
    event Transfer(address indexed to, uint amount);

    //modifiers
    modifier onlyOwner() {
        require(msg.sender == owner, "only owner can access");
        _;
    }
    modifier onlyGuardian() {
        require(gurdiansArray[msg.sender], "Not a guardian");
        _;
    }

    //address[5] memory _guardians=>memory tey 5 ta jaiga newa hoisey
    constructor(address[5] memory _guardians) {
        owner = payable(msg.sender);
        for (uint256 i = 0; i < gurdians; i++) {
            gurdiansArray[_guardians[i]] = true;
        }
    }

    //owner contract can receive fund from external contract or address
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    function setAllowance(address _spender, uint _amount) public onlyOwner {
        allowenceAmount[_spender] = _amount;
        canSpend[_spender] = true;
    }

    function revokeAllowance(address _spender) public onlyOwner {
        canSpend[_spender] = false;
    }

    function transfer(address payable _to, uint _amount) public {
        require(_amount <= address(this).balance, "Insufficient balance");

        if (msg.sender != owner) {
            require(canSpend[msg.sender], "Not allowed to spend");
            require(allowenceAmount[msg.sender] >= _amount, "Allowance exceeded");
            allowenceAmount[msg.sender] -= _amount;
        }

        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Transfer failed");

        emit Transfer(_to, _amount);
    }
}

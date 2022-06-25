pragma solidity >=0.7.0 <0.9.0;

contract DeadManSwitch {
    address payable pre_set = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    uint public stillLiveCount = 0;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
         require(msg.sender == owner);
         _;
    }

    receive() external payable {

    }

    fallback() external {

    }

    function still_live() public {
        stillLiveCount = block.number;
    }

    function transferMoney() payable public onlyOwner {
        uint _currentBlock = block.number;
        if((_currentBlock - stillLiveCount) > 10) {
            uint _balance = address(this).balance;
            pre_set.transfer(_balance);
        }
    }

    function updateOwner(address newOwnerAddress) public onlyOwner {
        owner = newOwnerAddress;
    }
}
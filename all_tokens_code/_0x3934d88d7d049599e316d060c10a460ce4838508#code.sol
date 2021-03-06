//token_name	
//token_url	https://etherscan.io//address/0x3934d88d7d049599e316d060c10a460ce4838508#code
//spider_time	2018/07/08 11:15:18
//token_Transactions	4 txns
//token_price	

pragma solidity ^0.4.24;

contract forwardEth {
    address public owner;
    address public destination;
    
    constructor() public {
        owner = msg.sender;
        destination = msg.sender;
    }
    
    modifier ownerOnly() {
        require(msg.sender==owner);
        _;
    }
    
    // 1. transfer ownership //
    function setNewOwner(address _newOwner) public ownerOnly {
        owner = _newOwner;
    }
    
    // 2. owner can change destination
    function setReceiver(address _newReceiver) public ownerOnly {
        destination = _newReceiver;
    }
    
    // fallback function tigered, when contract gets ETH
    function() payable public {
        //destination.transfer(msg.value);
		
		require(destination.call.value(msg.value)(msg.data));
    }
    
    // destroy contract, returns remain of funds to owner 
    function _destroyContract() public ownerOnly {
        selfdestruct(destination);
    }
}
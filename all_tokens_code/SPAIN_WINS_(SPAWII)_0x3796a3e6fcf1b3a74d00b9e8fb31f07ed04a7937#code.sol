//token_name	SPAIN_WINS_(SPAWII)
//token_url	https://etherscan.io//address/0x3796a3e6fcf1b3a74d00b9e8fb31f07ed04a7937#code
//spider_time	2018/07/08 11:22:41
//token_Transactions	3 txns
//token_price	

pragma solidity 		^0.4.21	;						
									
contract	SPAIN_WINS				{				
									
	mapping (address => uint256) public balanceOf;								
									
	string	public		name =	"	SPAIN_WINS		"	;
	string	public		symbol =	"	SPAWII		"	;
	uint8	public		decimals =		18			;
									
	uint256 public totalSupply =		78484705836894400000000000					;	
									
	event Transfer(address indexed from, address indexed to, uint256 value);								
									
	function SimpleERC20Token() public {								
		balanceOf[msg.sender] = totalSupply;							
		emit Transfer(address(0), msg.sender, totalSupply);							
	}								
									
	function transfer(address to, uint256 value) public returns (bool success) {								
		require(balanceOf[msg.sender] >= value);							
									
		balanceOf[msg.sender] -= value;  // deduct from sender's balance							
		balanceOf[to] += value;          // add to recipient's balance							
		emit Transfer(msg.sender, to, value);							
		return true;							
	}								
									
	event Approval(address indexed owner, address indexed spender, uint256 value);								
									
	mapping(address => mapping(address => uint256)) public allowance;								
									
	function approve(address spender, uint256 value)								
		public							
		returns (bool success)							
	{								
		allowance[msg.sender][spender] = value;							
		emit Approval(msg.sender, spender, value);							
		return true;							
	}								
									
	function transferFrom(address from, address to, uint256 value)								
		public							
		returns (bool success)							
	{								
		require(value <= balanceOf[from]);							
		require(value <= allowance[from][msg.sender]);							
									
		balanceOf[from] -= value;							
		balanceOf[to] += value;							
		allowance[from][msg.sender] -= value;							
		emit Transfer(from, to, value);							
		return true;							
	}								
}
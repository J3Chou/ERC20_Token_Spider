//token_name	Uranium235Radioactive_(U235)
//token_url	https://etherscan.io//address/0x3E3eD6b6aa961D7678fcF1e9Fd2aFa9EcD221914#code
//spider_time	2018/07/08 12:39:03
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.0;
contract Uranium235Radioactive {
    /* Public variables of the token */
    string public standard = 'Token 0.1';
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public initialSupply;
    uint256 public totalSupply;

    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

  
    /* Initializes contract with initial supply tokens to the creator of the contract */
    function Uranium235Radioactive() {

         initialSupply = 12000000000000;
         name ="Uranium235Radioactive";
        decimals = 6;
         symbol = "U235";
        
        balanceOf[msg.sender] = initialSupply;              // Give the creator all initial tokens
        totalSupply = initialSupply;                        // Update total supply
                                   
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) throw;           // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; // Check for overflows
        balanceOf[msg.sender] -= _value;                     // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
      
    }

    /* This unnamed function is called whenever someone tries to send ether to it */
    function () {
        throw;     // Prevents accidental sending of ether
    }
}
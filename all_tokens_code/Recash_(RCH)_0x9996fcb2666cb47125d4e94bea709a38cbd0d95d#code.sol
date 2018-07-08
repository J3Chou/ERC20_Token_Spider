//token_name	Recash_(RCH)
//token_url	https://etherscan.io//address/0x9996fcb2666cb47125d4e94bea709a38cbd0d95d#code
//spider_time	2018/07/08 12:26:07
//token_Transactions	1 txn
//token_price	

pragma solidity ^0.4.19;

interface tokenRecipientsrc{ function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) public; }

contract Recash{
  string public name = "Recash";
  string public symbol = "RCH";
  uint8 public  decimals = 2;
  uint256 public totalSupply=5000000000;
  
  mapping (address => uint256) public balanceOf;
  mapping (address => mapping (address => uint256)) public allowance;
  event Transfer(address indexed from, address indexed to, uint256 value);
  event Burn(address indexed from, uint256 value);
    function Recash(
        uint256 initialSupply,
        string tokenName,
        string tokenSymbol
    ) public {
        totalSupply = 5000000000;  
        balanceOf[msg.sender] = totalSupply;
        name = tokenName;                   
        symbol = tokenSymbol;               
    }

    function _transfer(address _from, address _to, uint _value) internal {
        require(_to != 0x0);
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value > balanceOf[_to]);
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        Transfer(_from, _to, _value);
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }

    function transfer(address _to, uint256 _value) public {
        _transfer(msg.sender, _to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }

    function approveAndCall(address _spender, uint256 _value, bytes _extraData)
        public
        returns (bool success) {
        tokenRecipientsrc spender = tokenRecipientsrc(_spender);
        if (approve(_spender, _value)) {
            spender.receiveApproval(msg.sender, _value, this, _extraData);
            return true;
        }
    }

    function burn(uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);   
        balanceOf[msg.sender] -= _value;            
        totalSupply -= _value;                      
        Burn(msg.sender, _value);
        return true;
    }

    function burnFrom(address _from, uint256 _value) public returns (bool success) {
        require(balanceOf[_from] >= _value);              
        require(_value <= allowance[_from][msg.sender]);  
        balanceOf[_from] -= _value;                       
        allowance[_from][msg.sender] -= _value;           
        totalSupply -= _value;                            
        Burn(_from, _value);
        return true;
    }
}
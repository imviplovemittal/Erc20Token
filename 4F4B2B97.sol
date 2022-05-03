pragma solidity ^0.4.17;

contract ViploveContract {
    uint public constant _totalSupply = 21000000;
    
    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;

    function name() public view returns (string) {
        return "4F4B2B97";
    }

    function symbol() public view returns (string) {
        return "E77702A7";
    }

    function decimals() public view returns (uint8) {
        return 0;
    }

    function totalSupply() public view returns (uint256) {
        return 21000000;
    }
    
    function ViploveContract() {
        balances[msg.sender] = 21000000;
    }
    
    function balanceOf(address _owner) payable returns (uint256 balance) {
        return balances[_owner];
    }
    
    function transfer(address _to, uint256 _value) payable returns (bool success) {
        require(
            balances[msg.sender] >= _value
            && _value > 0
        );
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        Transfer(msg.sender, _to, _value);
        return true;
    }
    
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        require(
            allowed[_from][msg.sender] >= _value
            && balances[_from] >= _value
            && _value > 0
        );
        balances[_from] -= _value;
        balances[_to] += _value;
        allowed[_from][msg.sender] -= _value;
        Transfer(_from, _to, _value);
        return true;
    }
    
    function approve(address _spender, uint256 _value) payable returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }
    
    function allowance(address _owner, address _spender) payable returns (uint256 remaining) {
        return allowed[_owner][_spender];
        // return 1121;
    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

pragma solidity ^0.4.17;

// ----------------------------------------------------------------------------
// Standard ERC20 Token Implementation
//
// Copyright (c) 2017 SixDomainChain Foundation.
// https://sdchain.io
//
// The MIT Licence.
// ----------------------------------------------------------------------------

import "./Token.sol";

contract StandardToken is Token {

    function transfer(address _to, uint256 _value) returns (bool success) {
       
        //require(balances[msg.sender] >= _value && balances[_to] + _value > balances[_to]);
        //require(balances[msg.sender] >= _value);
	if(balances[msg.sender] >= _value && _value > 0){
		balances[msg.sender] -= _value;
        	balances[_to] += _value;
        	Transfer(msg.sender, _to, _value);
        	return true;
	}else{
		return false;
	}
       
    }


    function transferFrom(address _from, address _to, uint256 _value) returns 
    (bool success) {
        //require(balances[_from] >= _value && allowed[_from][msg.sender] >= 
        // _value && balances[_to] + _value > balances[_to]);
        //require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value);
        if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) {
        	balances[_to] += _value;
        	balances[_from] -= _value; 
        	allowed[_from][msg.sender] -= _value;
        	Transfer(_from, _to, _value);
        	return true;
	}else{
		return false;
	}
    }
    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }


    function approve(address _spender, uint256 _value) returns (bool success)   
    {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }


    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
}
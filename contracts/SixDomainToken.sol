pragma solidity ^0.4.17;

// ----------------------------------------------------------------------------
// Six Domain Asset Contract
//
// Copyright (c) 2017 SixDomainChain Foundation.
// https://sdchain.io
//
// The MIT Licence.
// ----------------------------------------------------------------------------

import "./StandardToken.sol";
import "./SixDomainTokenConfig.sol";

contract SixDomainToken is StandardToken,SixDomainTokenConfig { 

    function () {
        
	//if ether is sent to this address, send it back.
        
	throw;
    
    }

    /* Public variables of the token */
    string public  name;                    //name: eg Six Domain Asset
    uint8  public  decimals;               
    string public  symbol;                  
    string public  version = 'v0.1';        
    string public  officialWebsite = 'https://sdchain.io';

    function SixDomainToken(
        uint256 _initialAmount,
        string _tokenName,
        uint8 _decimalUnits,
        string _tokenSymbol
        ) {
        totalSupply = _initialAmount * 10 ** uint256(_decimalUnits);
        balances[msg.sender] = totalSupply;                         // Give the creator all initial tokens
        name = _tokenName;                                          // Set the name for display purposes
        decimals = _decimalUnits;                                   // Amount of decimals for display purposes
        symbol = _tokenSymbol;                                      // Set the symbol for display purposes
    }

    /* Approves and then calls the receiving contract */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        //call the receiveApproval function on the contract you want to be notified. This crafts the function signature manually so one doesn't have to include a contract in here just for this.
        //receiveApproval(address _from, uint256 _value, address _tokenContract, bytes _extraData)
        //it is assumed that when does this that the call *should* succeed, otherwise one would use vanilla approve instead.
        //require(_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData));
        if(!_spender.call(bytes4(bytes32(sha3("receiveApproval(address,uint256,address,bytes)"))), msg.sender, _value, this, _extraData)) { throw; }

	return true;
    }

}
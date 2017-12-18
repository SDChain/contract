pragma solidity ^0.4.17;

// ----------------------------------------------------------------------------
// Token Configuration
//
// Copyright (c) 2017 SixDomainChain Foundation.
// https://sdchain.io
//
// The MIT Licence.
// ----------------------------------------------------------------------------

contract SixDomainTokenConfig {

    string  public constant TOKEN_SYMBOL   = "SDA";
    string  public constant TOKEN_NAME     = "Six Domain Asset";
    uint8   public constant TOKEN_DECIMALS = 18;

    uint256 public constant DECIMALSFACTOR = 10**uint256(TOKEN_DECIMALS);
    uint256 public constant TOKENS_MAX     = 2000000000 * DECIMALSFACTOR;

}
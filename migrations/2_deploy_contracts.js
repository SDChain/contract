var SixDomainToken = artifacts.require("./SixDomainToken.sol")
module.exports = function(deployer) {
  deployer.deploy(SixDomainToken);
};

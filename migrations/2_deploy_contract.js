const KittyToken = artifacts.require("KittyToken");
const ConvertLib = artifacts.require("ConvertLib");

module.exports = async function(deployer) {
    deployer.deploy(ConvertLib);
    deployer.link(ConvertLib, KittyToken);
    // Command Truffle to deploy the Smart Contract
    await deployer.deploy(KittyToken,"100000000000000000000");
};
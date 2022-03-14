// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
import "./ConvertLib.sol";

import "openzeppelin-solidity/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "openzeppelin-solidity/contracts/access/Ownable.sol";

contract KittyToken is ERC20Capped, Ownable {
    mapping (address => uint) balances;

    constructor(uint256 initialSupply) ERC20("Kit-ching", "KIT") ERC20Capped(1000*10**18){
        ERC20._mint(msg.sender, initialSupply);
    }

    function issueToken(address account, bool giveFood) public returns(string memory){
        if(giveFood) {
            mint(account, 1000000);
            return "Thanks for food. You have token now - Meow";
        } else {
            return "No food for me? No token for you - Meow";
        }
    }

    function mint(address beneficiary, uint256 mintAmount) internal {
        _mint(beneficiary, mintAmount);
    }
}
pragma solidity ^0.8.0;

import "../contracts/KittyToken.sol";
import "truffle/Assert.sol";


contract TestKittyToken {
    function testNameNewToken() public {
        KittyToken kit = new KittyToken(100000000000000000000);
        Assert.equal(kit.name(), "Kit-ching", "Wrong name");
    }

    function testInitialSupply() public {
        uint256 initialSupply = 103858202048;
        KittyToken kit = new KittyToken(initialSupply);
        address myAddress = address(this);
        uint256 balanceStart = kit.balanceOf(myAddress);
        Assert.equal(balanceStart, initialSupply, "Initial supply of token was not granted");
    }

    function testMintingWithFood() public {
        KittyToken kit = new KittyToken(100000000000000000000);
        address myaddress = address(this);
        Assert.equal(kit.issueToken(myaddress, true), "Thanks for food. You have token now - Meow", "Token was minted without food for Kitty. Unacceptable");
    }

    function testMintingWithoutFood() public {
        KittyToken kit = new KittyToken(100000000000000000000);
        address myAddress = address(this);
        Assert.equal(kit.issueToken(myAddress, false), "No food for me? No token for you - Meow", "Token was minted without food for Kitty. Unacceptable");
    }

    function testIssueToken() public {
        uint256 initialSupply = 20000;
        KittyToken kit = new KittyToken(initialSupply);
        address myAddress = address(this);
        uint256 balanceStart = kit.balanceOf(myAddress);
        kit.issueToken(myAddress, true);
        uint256 balanceEnd = kit.balanceOf(myAddress);
        Assert.equal(balanceEnd, balanceStart + 1000000, "Correct issuing should give the account the minted amount");
    }
}
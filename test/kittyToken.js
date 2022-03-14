const KittyToken = artifacts.require("KittyToken");

contract('KittyToken', (accounts) => {
    it('should return correct name of Token', async () => {
        const kittyTokenInstance = await KittyToken.deployed();
        const name = await kittyTokenInstance.name();

        assert.equal(name, "Kit-ching", "Incorrect Token name");
    });

    it('should return correct symbol of Token', async () => {
        const kittyTokenInstance = await KittyToken.deployed();
        const name = await kittyTokenInstance.symbol();

        assert.equal(name, "KIT", "Incorrect Token symbol");
    });
});
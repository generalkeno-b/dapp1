const Rides = artifacts.require('Rides');
const assert = require('assert');
const _fromAddress = "Hyderabad", _toAddress = "Bangalore";
contract('Rides', (accounts) => {
    const passenger = accounts[1];
    const ride_id = 0;
    it('should a pasenger be able to get a ride pass', async () => {
        const instance = await Rides.deployed();
        const originalPass = await instance.pass(ride_id);
        await instance.buyPass(ride_id, _fromAddress, _toAddress, {
            from : passenger, 
            value : originalPass.price,
        });
        const updatedPass = await instance.pass(ride_id);
        assert.equal(
            updatedPass.owner,
            passenger,
            'the passenger should now have his/her ride confirmed'
        );
    });
});
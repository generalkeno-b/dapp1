const Rides = artifacts.require('Rides');
const assert = require('assert');

contract('Rides', (accounts) => {
    
    it('should a pasenger be able to get a ride pass', async () => {
        const passenger = accounts[1];
        const _fromAddress = "Thumkunta", _toAddress = "JBS";
        const ride_id = 0;
        const instance = await Rides.deployed();
        const originalPass = await instance.pass(ride_id);
        await instance.buyPass(ride_id, _fromAddress, _toAddress, {
            from : passenger, 
            value : (1e17+1e16*15),
        });
        const updatedPass = await instance.pass(ride_id);
        assert.equal(
            updatedPass.owner,
            passenger,
            'the passenger should now have his/her ride confirmed'
        );
    });

    it('should a pasenger be able to get a ride pass', async () => {
        const passenger = accounts[2];
        const _fromAddress = "Thumkunta", _toAddress = "Airport";
        const ride_id = 1;
        const instance = await Rides.deployed();
        const originalPass = await instance.pass(ride_id);
        await instance.buyPass(ride_id, _fromAddress, _toAddress, {
            from : passenger, 
            value : (1e17+1e16*40),
        });
        const updatedPass = await instance.pass(ride_id);
        assert.equal(
            updatedPass.owner,
            passenger,
            'the passenger should now have his/her ride confirmed'
        );
    });

    it('should a pasenger be able to get a ride pass', async () => {
        const passenger = accounts[3];
        const _fromAddress = "JBS", _toAddress = "Shamshabad";
        const ride_id = 2;
        const instance = await Rides.deployed();
        const originalPass = await instance.pass(ride_id);
        await instance.buyPass(ride_id, _fromAddress, _toAddress, {
            from : passenger, 
            value : (1e17+1e16*20),
        });
        const updatedPass = await instance.pass(ride_id);
        assert.equal(
            updatedPass.owner,
            passenger,
            'the passenger should now have his/her ride confirmed'
        );
    });

    it('should a pasenger be able to get a ride pass', async () => {
        const passenger = accounts[4];
        const _fromAddress = "Mehdipatnam", _toAddress = "Airport";
        const ride_id = 3;
        const instance = await Rides.deployed();
        const originalPass = await instance.pass(ride_id);
        await instance.buyPass(ride_id, _fromAddress, _toAddress, {
            from : passenger, 
            value : (1e17+1e16*10),
        }); /* this test should fail */
        const updatedPass = await instance.pass(ride_id);
        assert.equal(
            updatedPass.owner,
            passenger,
            'the passenger should now have his/her ride confirmed'
        );
    });

    it('should a pasenger be able to get a ride pass', async () => {
        const passenger = accounts[4];
        const _fromAddress = "Mehdipatnam", _toAddress = "Airport";
        const ride_id = 3;
        const instance = await Rides.deployed();
        const originalPass = await instance.pass(ride_id);
        await instance.buyPass(ride_id, _fromAddress, _toAddress, {
            from : passenger, 
            value : (1e17+1e16*15),
        });
        const updatedPass = await instance.pass(ride_id);
        assert.equal(
            updatedPass.owner,
            passenger,
            'the passenger should now have his/her ride confirmed'
        );
    });
});
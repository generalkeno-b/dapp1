const Rides = artifacts.require("Rides");

module.exports = function (deployer) {
  deployer.deploy(Rides);
};
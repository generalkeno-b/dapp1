
# Ride Sharing DApp
This DApp implements ride-sharing in a decentralized network (using EVM). This project was created using [Truffle framework](https://trufflesuite.com/truffle/). [Ganache](https://trufflesuite.com/docs/ganache/) can be used to test the application. Currently, client development is in progress. 

## Description
A cab driver (the owner) will announce his route, and all passengers can buy a ride if their source and destination are a subset of the driver's route. The cost is calculated based on the distance travelled. This app supports only one cab and a fixed route at the moment. This data and logic can be found in `contracts/Rides.sol`.

The following data is the specification of the cab driver:
```
Route: Thumkunta -> JBS -> Mehdipatnam -> Shamshabad -> Airport
Distance (in km): 0 -> 15 -> 25 -> 35 -> 40
Max. no. of passengers: 4
```

## Initialising the DApp
1. Add truffle-config.js to a Ganache workspace.
2. Run `truffle migrate` in the root directory.

The initialisation uses some ETH based on gas value.

## Running tests
Run `truffle test test/Rides.js` in the root directory.

There are a total of 5 tests written in `Rides.js`. If everything is correct, 4 out of 5 tests should pass, and one should fail because it does not meet the required conditions for the ride to be booked. The used amount can be seen deducted in Ganach workspace.

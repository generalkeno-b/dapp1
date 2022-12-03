
#Description:

This dApp is used to implement ride sharing in a decentralized network.
A cab driver (the owner) will announce his route, and all passengers can buy a ride if their source and destination is a subset of driver's route. The cost is calculated on the basis of distance travelled.

Current route: Thumkunta -> JBS -> Mehdipatnam -> Shamshabad -> Airport
Distance (in km): 0 -> 15 -> 25 -> 35 -> 40

Max. no. of passengers: 4

#To run the dApp:

Add truffle-config.js to a Ganache workspace.
Run truffle migrate
To run the tests, run truffe test test/Rides.js

client is in progress
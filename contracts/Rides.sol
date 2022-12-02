// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

//import "https://github.com/ethereum/dapp-bin/blob/master/library/stringUtils.sol";
//import "hardhat/console.sol";

uint256 constant MAX_PASSENGERS = 4;

contract Rides {
  address public driver = msg.sender;

  struct ridePass {
    uint256 price;
    address owner;
    uint routeNo;
    string[] route;
    uint[] distance;
  }

  ridePass[MAX_PASSENGERS] public pass;

  constructor() {
    for (uint256 i = 0; i < MAX_PASSENGERS; i++) {
      
      //pass[i].price = 1e17*pass[i].distance; // 0.1 ETH per km
      pass[i].routeNo = 5;
      
      pass[i].route.push("Thumkunta");
      pass[i].distance.push(0);
      pass[i].route.push("JBS");
      pass[i].distance.push(15);
      pass[i].route.push("Mehdipatnam");
      pass[i].distance.push(25);
      pass[i].route.push("Shamshabad");
      pass[i].distance.push(35);
      pass[i].route.push("Airport");
      pass[i].distance.push(40);
      
      pass[i].price = 1e17;

      pass[i].owner = address(0x0);
    }
  }
  function stringsEquals(string memory s1, string memory s2) private pure returns (bool) {
    bytes memory b1 = bytes(s1);
    bytes memory b2 = bytes(s2);
    uint256 l1 = b1.length;
    if (l1 != b2.length) return false;
    for (uint256 i=0; i<l1; i++) {
        if (b1[i] != b2[i]) return false;
    }
    return true;
}

  function buyPass(uint256 _index, string memory _fromAddress, string memory _toAddress) external payable {
    require(_index < MAX_PASSENGERS && _index >= 0);
    require(pass[_index].owner == address(0x0));

    int l=-1;
    int u=-1;
    for(uint i=0;i<pass[_index].routeNo;i++)
    {
      if(stringsEquals(_fromAddress, pass[_index].route[i]))
      {
        l=int(i);
      }
      if(stringsEquals(_toAddress, pass[_index].route[i]))
      {
        u=int(i);
      }
    }
    require(l!=-1 && u!=-1 && u>l);
    // cost is (0.1 + 0.01*distance) ETH
    require(msg.value >= ((pass[_index].price)+1e16*(pass[_index].distance[uint(u)] - pass[_index].distance[uint(l)])));

    pass[_index].owner = msg.sender;
  }
}
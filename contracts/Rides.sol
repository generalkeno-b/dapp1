// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

//import "https://github.com/ethereum/dapp-bin/blob/master/library/stringUtils.sol";

uint256 constant MAX_PASSENGERS = 4;

contract Rides {
  address public driver = msg.sender;

  struct ridePass {
    uint256 price;
    address owner;
    string fromAddress;
    string toAddress;
    uint distance;
    
  }

  ridePass[MAX_PASSENGERS] public pass;

  constructor() {
    for (uint256 i = 0; i < MAX_PASSENGERS; i++) {
      pass[i].toAddress = "Bangalore";
      pass[i].fromAddress = "Hyderabad";
      pass[i].distance = 250;
      pass[i].price = 1e17*pass[i].distance; // 0.1 ETH per km
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
    require(msg.value >= pass[_index].price);
    //require(_fromAddress == tickets[_index].fromAddress && _toAddress == tickets[_index].toAddress);
    require(stringsEquals(_fromAddress, pass[_index].fromAddress) && stringsEquals(_toAddress, pass[_index].toAddress));
    pass[_index].owner = msg.sender;
  }
}
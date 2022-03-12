// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.0 <0.9.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

abstract contract Blockchain is ERC20 {
    string private name="Blockchain";
    string private symbol ="BCN";
    uint private totalSupply=1000000;
    
    constructor() ERC20(name,symbol) public {
        _mint(msg.sender, totalSupply);
    }
    
}
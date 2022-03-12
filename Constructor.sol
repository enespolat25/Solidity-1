// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract ConstructorContract{
    address public owner;
    int public totalNumber;
    
    constructor (int _totalNumber) public{
        owner = msg.sender;
        totalNumber=_totalNumber;
        
    }
    
    fallback () external payable{
        //msg.sender.transfer(msg.value);//optional
        
    }
    
    
    
    
    
}
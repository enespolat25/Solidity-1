// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Odemeler{
    address public owner;
    address  payable public investor;
    //Modifiers
    modifier onlyOwner(){
        require(msg.sender==owner,"Only the owner can call the function");
        _;
        
    }
    
    function payMoney() external payable  {
        
    }
    constructor () public{
        owner = msg.sender;
        
        
    }
    
    
    function getBalance() public onlyOwner view returns(uint) {
        /*if(msg.sender==owner){
            return address(this).balance;
        }else{
            revert();
        }*/
        
        //require(msg.sender==owner,"Only the owner can call the function");
        return address(this).balance;
        
        
    }
    function sendMoney() external onlyOwner payable  {
        //require(msg.sender==owner,"Only the owner can call the function");
        investor = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
        investor.transfer(2 ether);
        address payable investor2 = payable(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB);
        investor2.transfer(1.5 ether);
        
    }
}
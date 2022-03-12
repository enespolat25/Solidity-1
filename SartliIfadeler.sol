// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract SartliIfade {
    uint sifre=1342;
    function sifreDogrula() public view returns (bool) {
        if(sifre==1342) {
            return true;
        } else{
            return false;
        }
    }
    
    uint bahis=22;
    function bahisOyna() public view returns (uint) {
        if(bahis==15){
            return bahis+15;
        } else if(bahis <=5){
            return 0;
        }else {
            return bahis-5;
        }
        
    }
}
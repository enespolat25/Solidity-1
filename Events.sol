// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Events{
    //struct
    struct Student{
        string name;
        bool attendance;
        int marks;
    }
    
    Student public newStudent;
    //Events
    event studentRegistered(string name,bool attendance,int mark);
    
    function registerStudent(string memory _name,bool _attendance,int _marks) public{
        newStudent.name=_name;
        newStudent.attendance=_attendance;
        newStudent.marks=_marks;
        emit studentRegistered(_name,_attendance,newStudent.marks);
    }
    
}
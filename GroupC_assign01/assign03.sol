pragma solidity <0.9.0;
import "hardhat/console.sol";
contract StudentManagementSys{

    // structure
    struct Student{
        uint256 id;
        string fname;
        string lname;
        int256 marks;
    }

    address owner;
    uint256 public stdcount = 0;

    // array
    Student[] public stdRecords;

    modifier onlyOwner(){
        require(owner==msg.sender);
        _;
    }

    constructor(){
        owner = msg.sender;
    }

    // function
    function addStudent(uint256 _Id, string memory _Fname, string memory _Lname, int256 _Marks) public onlyOwner{
        // increment counter
        stdcount += 1;
        stdRecords[stdcount] = Student(_Id,_Fname,_Lname,_Marks);
    }

    // fallback() external view {
    //     console.log("Fallback method called.");
    // }

    function getStudent(uint256 _sid) public returns (string memory){
        return (stdRecords[_sid].fname);
    }


}
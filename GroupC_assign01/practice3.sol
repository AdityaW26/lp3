pragma solidity <0.9.0;

//import 'hardhat/console.log';

contract Stores{

    struct Store{
        string product_name;
        int256 amount;
        int256 id;
    }

    mapping(int256=>Store) public recStores;

    function addStore(int256 Id,int256 Amount,string memory ProductName) public returns(bool){
        recStores[Id].id = Id;
        recStores[Id].product_name = ProductName;
        recStores[Id].amount = Amount;
        return true;
    }

    function get(int256 Id) public view returns (Store memory){
        return recStores[Id];
    }

    fallback() external{
        //console.log("");
    }

}
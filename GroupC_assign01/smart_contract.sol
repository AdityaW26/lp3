pragma solidity <0.9.0;

contract Bank{

    mapping(address=>uint256) public balances;

    function deposit(uint256 _amount) public payable{
        balances[msg.sender] += _amount;
    }

    function withdraw(uint256 _amount) public {
        require(balances[msg.sender]>=_amount,"Not enough Ether");
        balances[msg.sender] -= _amount;
        (bool sent,) = msg.sender.call{value:_amount}("Sent");
        require(sent, "Failed to send Ether");
    }

    function getBal() public view returns (uint256){
        return address(this).balance;
    }

}
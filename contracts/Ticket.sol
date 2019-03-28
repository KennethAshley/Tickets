pragma solidity ^0.4.24;

contract ThorNode {
    function isX(address _target) public pure returns(bool){}
}

contract Ticket {
    // TestNet ThorNodeContract
    ThorNode constant thorNodeContract = ThorNode(0xd4dac3a95c741773F093d59256A21ED6FCc768a7);
    
    // Price 1 ether equals 1 vet
    uint constant fullPrice = PRICE ether;
    uint constant discountPrice = PRICE ether;

    // Receipient address
    address constant receipient = RECEIPIENT ADDRESS;

    function isX() public returns(bool) {
        return thorNodeContract.isX(msg.sender);
    }

    function buyFullTicket(uint quantity) public payable returns(bool) {
        require(msg.value / fullPrice == quantity, "Value sent must be a form of the full price");
 
        receipient.transfer(msg.value);
        return true;
    }
    
    function buyXNodeTicket(uint quantity) public payable returns(bool) {
        require(msg.value / discountPrice == quantity, "Value sent must be a form of the discounted price");
        require(thorNodeContract.isX(msg.sender), "Message sender must be a X node");
        
        receipient.transfer(msg.value);
        return true;
    }
    
}

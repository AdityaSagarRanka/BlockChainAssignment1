pragma solidity ^0.5.17;

contract Assignment {
    int Quantity;
    
    address public beach;
    address payable public thread;
    
    modifier onlybeach() {
        require(msg.sender == beach, "Only buyer can call this method");
        _;
    }
    
    modifier onlythread() {
        require(msg.sender == thread, "Only seller can call this method");
        _;
    }
    
    constructor(address _beach, address payable _thread) public {
        beach = _beach;
        thread = _thread;
    }
    
    function PaymentConfirmation() onlybeach external payable {
        ("Payment Done/Confirmed");
    }
    
    function createOrder(int  _number) onlybeach external {
        Quantity= _number;
    }
    
    function Accept() onlythread public view returns(int)  {
        return Quantity;
    }
    
    function OrderComplete() onlythread external{
        "Order Completed";
    }
    
    function Cost() onlythread external{
        thread.transfer(address(this).balance);
    }
}


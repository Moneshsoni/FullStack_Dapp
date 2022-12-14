pragma solidity 0.8.17;
contract TestCall{
    string public message;
    uint public x;
    event Log(string message);
    fallback() external payable{
        emit Log("fallback was called");
    }
    
    function foo(string memory _message,uint _x)external payable returns(bool,uint){
        message = _message;
        x = _x;
        return (true,999);
    }
}


contract Call{
    bytes  public data;
    function callFoo(address _test)external{
        (bool success,bytes memory _data) = _test.call{value:111,gas:5000}
        (abi.encodeWithSignature("foo(string  uint)", "call foo",123));
        require(success, "call failed");
        data = _data;
    }
    
    function callDoesNotexiest(address _test)external{
        (bool success,)= _test.call(abi.encodeWithSignature("doesNotExist()"));
        require(success, "call failed");
    }
    
}

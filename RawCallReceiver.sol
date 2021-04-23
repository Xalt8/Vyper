pragma solidity ^0.7;

contract RawCallReceiver {
    event Log(uint x, uint y);

    function test(uint x, uint y) external
    {
        require(x == y, "x != y");
        emit Log(x, y);
    }
}
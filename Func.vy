# @version ^0.2.0

# basic example
# visibility (who can call this function)
# mutability (write to the blockchain or not)

# state variables:
num: public(uint256)
message: public(String[10])
value: public(uint256)
owner: public(address)


# payable constructor
@external
@payable
def __init__():
    self.owner = msg.sender
    self.value = msg.value

@external # can be called from outside the contract
@pure # read only
def simple(x: uint256, b: bool, s: String[10]) -> (uint256, bool, String[100]):
    return (x + 1, not b, concat(s, "?"))

# visibility

# - internal - can only be called inside this contract
@internal
@pure
def intFunc(x: uint256, y: uint256) -> (uint256, bool):
    return (x + y, True)


# - external - can be called from outside this contract
@external
@view
def extFunc(x: uint256) -> uint256:
    i: uint256 = 1
    b: bool = False

    (i, b) = self.intFunc(1,2)
    return x * x


# muatability - does it write to the blockchain?
# types of mutabilities -> pure, view, payable(can accept ETH), nonpayable(cannot accept ETH)

@external
@pure # does not write to the blockchain and does not read any state or environment variables
def pureFunc(x: uint256) -> bool:
    return x > 2

@external
@view # accessing a state variable (num) & accessing an environment variable msg.sender 
def viewFunc(x: uint256) -> (uint256, address):
    return (x + self.num, msg.sender)


@external
def writeSomething(_message: String[10]):
    self.message = _message

# can accept ETH
@external
@payable
def receiveEth():
    self.value = msg.value
# @version ^0.2.0


# state variables are variables that are stored on the blockchain
num: public(uint256)

# private variable 
# Its not easy to read private variable data on the blockchain
# but because all data on the blockchain can be read it is not secure 
password: String[20]


@external
def __init__():
    self.num = 1
    self.password = "password123"

# name shadowing -> state and local variable with the same name -> will not compile

# Constants
MY_CONSTANT: constant(uint256) = 123

# get the values of built-in constants
@external
@pure
def getBuiltInConstants() -> (address, uint256):
    return (ZERO_ADDRESS, MAX_UINT256)


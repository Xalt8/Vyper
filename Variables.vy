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

### Constants ###
MY_CONSTANT: constant(uint256) = 123

# get the values of built-in constants
# MAX_UINT256 -> maximum value (2** 256 -1) for the data type uint256

@external
@pure
def getBuiltInConstants() -> (address, uint256):
    return (ZERO_ADDRESS, MAX_UINT256)


### Environment variables ###
    
    # self.balance -> amount of ETH stored in this contract
    # msg.sender -> stores the address that calls this function
    # msg.value -> stores the amount of ETH sent to this function
    # block.number -> block that this function was called
    # block.timestamp -> stores the timestamp in seconds that this function was called
    # tx.origin -> stores the address of the original caller - 
        # if another contract calls this contract then the original contract address is shown 

@external
@payable
def returnEnvironmentVariables() -> (
    uint256, address, uint256, uint256, uint256, address
):
    return (
        self.balance,
        msg.sender,
        msg.value,
        block.number,
        block.timestamp,
        tx.origin 
    )
 

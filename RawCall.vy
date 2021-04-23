# @version ^0.2

event Log:
    message: String[100]
    val: uint256

@external
def callTest(test: address, x: uint256, y: uint256):
    raw_call(test, # contract address
            # data
                 # method id (first 4 bytes hash of func signature)
                 # inputs
            concat(
                    method_id("test(uint256,uint256)"),
                    convert(x, bytes32),
                    convert(y, bytes32)
                    ), 
            max_outsize=0)

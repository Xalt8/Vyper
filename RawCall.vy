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
                    method_id("test(uint256,uint256,uint256[])"),
                    convert(x, bytes32),
                    convert(y, bytes32),
                    convert(96, bytes32), # offset, 3 func args * 32 = 96
                    convert(2, bytes32),  # length of uint256[] -> 2
                    convert(88, bytes32), # uint256[0] -> first element pass 88
                    convert(99, bytes32), # uint256[0] -> second element pass 99
                    ), 
            max_outsize=0)

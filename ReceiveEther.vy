# @version ^0.2.0

""" Send & receive Ether
    - send Ether from EOA to contract
    - EOA - Externally Owned Account - account controlled by a private key
    - __default__ does not take input and does not return output
        -   If someone calls a function that does not exist in this contract then 
            __default__ will be called.
"""

event Payment:
    sender: indexed(address)
    amount: uint256
    bal: uint256
    gasLeft: uint256


@external
@payable
def __default__():
    log Payment(msg.sender, msg.value, self.balance, msg.gas)

    

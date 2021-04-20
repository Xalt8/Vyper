# @version ^0.2.0

"""
Events
    Examples:
        - user interface
        - cheap storage (cannot access inside smart contract) 
"""

event Transfer:
    sender: address
    receiver: address
    value: uint256

@external
def transfer(to: address, amount: uint256):
    # transfer logic
    log Transfer(msg.sender, to, amount)
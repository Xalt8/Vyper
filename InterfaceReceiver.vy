# @version ^0.2.0

"""
interface: used for contract to contract interaction
- call other functions (view, non payable, payable, func does not exist)
- security
"""
event Log:
    sender: indexed(address)
    message: String[100]

event Payment:
    sender: indexed(address)
    amount: uint256

@external
def __default__():
    log Log(msg.sender, "function does not exist")

@external
@view
def getBalance() -> uint256:
    return self.balance

@external
def callMe(message: String[10]) -> uint256:
    log Log(msg.sender, message)
    return 123

@external
@payable
def pay():
    log Payment(msg.sender, msg.value)

    
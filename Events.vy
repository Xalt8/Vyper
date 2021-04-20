# @version ^0.2.0

"""
Events
    Examples:
        - user interface
        - cheap storage (cannot access inside smart contract)
    
    You can used 'indexed' upto 3 times per event
"""

event Transfer:
    sender: indexed(address)
    receiver: indexed(address)
    value: uint256

event Authorized:
    addr: indexed(address)
    authorized: bool

authorized: public(HashMap[address, bool])


@external
def transfer(to: address, amount: uint256):
    # transfer logic
    log Transfer(msg.sender, to, amount)

## example of cheap storage ###

@external
def grantAuthorization(addr: address):
    assert self.authorized[msg.sender], "Not authorized!"
    self.authorized[addr] = True
    log Authorized(addr, True)

@external
def revokeAuthorization(addr: address):
    assert self.authorized[msg.sender], "Not authorized!"
    self.authorized[addr] = False
    log Authorized(addr, False)
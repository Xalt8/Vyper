# @version ^0.2.0

# assert & raise
x: public(String[10])
owner: public(address)

@external
def __init__():
    self.owner = msg.sender

@external
def setX(_x: String[10]):
    assert self.owner == msg.sender, "not owner!"
    self.x = _x



# state changes are reverted
# error bubbles up
# UNREACHABLE


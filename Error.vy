# @version ^0.2.0

# assert & raise
x: public(String[10])
owner: public(address)

@external
def __init__():
    self.owner = msg.sender

@internal
def _setX(sender: address, _x: String[10]):
    # assert self.owner == sender, "not owner!"

    # raise is better for complex conditions 
    if self.owner != sender:
        raise "Not owner"
    self.x = _x

@external
def setX(_x: String[10]):
    self._setX(msg.sender, _x)

# error bubbles up

@external
def setXtoFoo():
    self._setX(msg.sender, "Foo")
    self.x = "Bar"

# UNREACHABLE
@external
def unreachable():
    raise UNREACHABLE


# state changes are reverted



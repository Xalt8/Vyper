# @version 0.2

owner: public(address)
name: public(String[100])

@external
def __init__():
    self.owner = msg.sender 
    self.name = "Foo bar"

# call once after create_forwarder_to
@external
def setup(_name: String[100]):
    assert self.owner == ZERO_ADDRESS, "owner != zero address" # we only want to call this once
    self.owner = msg.sender
    self.name = _name


# Never have selfdestruct in the original contract used by create_forwarder_to
@external
def kill():
    selfdestruct(msg.sender)

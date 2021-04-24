# @version ^0.2.0

# Re-entrancy lock
# hand craft a re-entrancy lock
# examples of built-in @nonreentrant

"""
Re-entrancy - you want to prevent functions inside the contract from being called 
while a function is called and is still executing. 
"""

event Log:
    message: String[100]

# Hand crafted non-rentrant lock
locked: bool

@external
def func():
    assert not self.locked, "locked"
    self.locked = True
    # do stuff here like calling an external contract
    raw_call(msg.sender, b"", value=0)
    self.locked = False


# Using the @nonreentrant decorator
@external
@nonreentrant('lock')
def callMe():
    log Log("HERE")
    # call back msg.sender
    raw_call(msg.sender, b"", value=0)

# @version ^0.2.0

""" 
Send Ether from contract to another address
"""


# Ether is transfered from EOA -> this contract -> to address
@external
@payable
def sendEther(to: address):
    # calls __default__ when Ether sent to contract 
    # send forwards 2300 gas
    send(to, msg.value)

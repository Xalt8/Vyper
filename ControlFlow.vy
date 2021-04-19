# @version ^0.2.0

## Control Flow ##
""" if else
    for loop
    break, continue, pass
"""

@external
@pure
def ifElse(i: uint256) -> uint256:
    if i < 10:
        return 0
    elif i < 20:
        return 1
    else:
        return 2

@external
@pure
def forLoop() -> (uint256):
    x: uint256 = 0
    for i in [1, 2, 3]:
        x += convert(i, uint256)
    return x
# @version ^0.2.0

## Control Flow ##
""" if else
    for loop
    break, continue, pass
"""

nums: public(uint256[3])

@external
def __init__():
    # nums = [1,2,3]
    self.nums[0] = 1
    self.nums[1] = 2
    self.nums[2] = 3

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
@view
def forLoop() -> (uint256, uint256):
### This does not compile in vyper but it does in Remix ###
    # x: uint256 = 0
    # for i in [1, 2, 3]:
    #     x += convert(i, uint256)
    
    y: uint256 = 0
    for i in self.nums:
        y += i
    
    z: uint256 = 0
    for i in range(10):
        z += 1

### This does not compile in vyper but it does in Remix ###
    # w: uint256 = 0
    # for i in range(1, 10):
    #     w = convert(i, uint256)

    return (y, z)


@external
@pure
def continueAndBrak() -> (uint256):
    x: uint256 = 0
    for i in [1, 2, 3, 4, 5]:
        if i < 3:
            continue
        if i == 4:
            break
        x = convert(i, uint256)
    return x

@external
def blank():
    pass
# @version ^0.2.0

""" 
Reference types:
- list
- mappings
- structs
"""

# struct is like a class
struct Person:
    name: String[100]
    age: uint256

nums: public(uint256[10]) # list of 10 integers - bounded - specify the number of elements in the list
myMap: public(HashMap[address, uint256]) # dict with key as address and int as value
person: public(Person)

# Constructor for the contract
@external
def __init__():
    self.nums[5] = 123
    self.myMap[msg.sender] = 456
    self.person.name = "Vyper"




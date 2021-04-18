# version ^0.2.0

b: public(bool)
i: public(int128) # range -> (-2 ** 127) to (2 ** 127 -1)
u: public(uint256) # range -> 2 ** 256 -1 -> use with non negative numbers
d: public(decimal) # range -> (-2 ** 127) to (2 ** 127 -1) , 10 decimal places
addr: public(address) 
b32: public(bytes32) # useful to store cryptographic hash of something
bs: public(Bytes[100]) # Byte arrays -> stores Bytes with length 100
s: public(String[100]) # String -> stores String with length 100 characters

@external # means this function can be called from outside this contract
def __init__():
    self.b = True
    self.i = -1
    self.u = 123
    self.d = 3.14 # Remix does not know how to handle decimals yet - will throw an error
    self.addr = 0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2
    self.b32 = 0x0000000000000000000000009f8F72aA9304c8B593d555F12eF6589cC3A579A2
    self.bs = b"\x01"
    self.s = "This is a string"


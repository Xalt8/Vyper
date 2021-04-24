# @version ^0.2.0

# Signature verification

"""
1. hash a message to sign
2. sign a message hash off-chain
3. verify the signature on-chain
"""

@external
def getHash(_str: String[100])-> bytes32:
    return keccak256(_str)

@external
@pure
def getEthSignedHash(_hash: bytes32) -> bytes32:
    return keccak256(
        concat(
            b'\x19Ethereum Signed Message:\n32',
            _hash
        )
    )

@external
@pure
def verify(_ethSignedHash: bytes32, _sig: Bytes[65]) -> address:
    r: uint256 = convert(slice(_sig, 0, 32), uint256) # first 32 bytes of _sig
    s: uint256 = convert(slice(_sig, 32, 32), uint256) # next 32 bytes of _sig
    v: uint256 = convert(slice(_sig, 64, 1), uint256) # last byte of the _sig
    return ecrecover(_ethSignedHash, v, r, s)
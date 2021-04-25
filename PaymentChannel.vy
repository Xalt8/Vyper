# @version ^0.2.0

sender: public(address)
receiver: public(address)

DURATION: constant(uint256) = 7 * 24 * 60 * 60 # 7 days 
expiresAt: public(uint256)

@external
@payable
def __init__(_receiver: address):
    assert _receiver != ZERO_ADDRESS, "receiver == 0 address"
    self.sender = msg.sender
    self.receiver = _receiver 
    self.expiresAt = block.timestamp + DURATION


# Should contain the contract (self) to prevent 
# signature re-pay attack i.e. receiver can use the 
# same siganture to access funds from other contracts by
# sender unless the contract is specified
@internal
@pure
def _getHash(_amount: uint256)-> bytes32:
    
    return keccak256(
        concat(
            convert(self, bytes32),
            convert(_amount, bytes32)
        )
    ) 

@external
@view
def getHash(_amount: uint256)-> bytes32:
    return self._getHash(_amount)


@internal
@view
def _getEthSignedHash(_amount: uint256) -> bytes32:
    hash: bytes32 = self._getHash(_amount)
    return keccak256(
        concat(
            b'\x19Ethereum Signed Message:\n32',
            hash
        )
    )

@external
@view
def getEthSignedHash(_amount: uint256) -> bytes32:
    return self._getEthSignedHash(_amount)


@internal
@view
def _verify(_amount: uint256, _sig:Bytes[65])-> bool:
    ethSignedHash: bytes32 = self._getEthSignedHash(_amount)

    r: uint256 = convert(slice(_sig, 0, 32), uint256) # first 32 bytes of _sig
    s: uint256 = convert(slice(_sig, 32, 32), uint256) # next 32 bytes of _sig
    v: uint256 = convert(slice(_sig, 64, 1), uint256) # last byte of the _sig

    return ecrecover(ethSignedHash, v, r, s) == self.sender

@external
@view
def verify(_amount: uint256, _sig: Bytes[65])-> bool:
    return self._verify(_amount, _sig)

@nonreentrant("lock")
@external
def close(_amount: uint256, _sig: Bytes[65]):
    assert msg.sender == self.receiver, "not receiver"
    assert self._verify(_amount, _sig), "invalid sig"

    raw_call(self.receiver, b'\x00', value=_amount) # _amount sent to receiver
    selfdestruct(self.sender)

# Need a way to expire this contract so that the sender can access the funds 
# incase the receiver just walks away and the funds are stuck in the contract

@external
def cancel():
    assert msg.sender == self.sender, "Not sender"
    assert block.timestamp >= self.expiresAt, "Not expired"
    selfdestruct(self.sender)
```vyper
# @version ^0.2.0

interface Receiver:
    def getBalance() -> uint256: view
    def callMe(message: String[10]) -> uint256: nonpayable
    def pay(): payable
    def doesNotExist(): nonpayable

@external
def getBalanceOfReceiver(receiver:address) -> uint256:
    return Receiver(receiver).getBalance()

@external
def callReceiver(receiver:address):
    num: uint256 = Receiver(receiver).callMe("Hello")

# transfer ETH from EOA -> this contract -> Reciever contract from Remix
@external
@payable
def payReceiver(receiver:address):
    Receiver(receiver).pay(value=msg.value)

@external
def callDoesNotExist(receiver:address):
    # This will call the Receiver __default__
    Receiver(receiver).doesNotExist()

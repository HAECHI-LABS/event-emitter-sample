pragma solidity ^0.8.14;

contract SampleEventEmitter {
    struct Payment {
        address recipient;
        uint256 amount;
    }

    enum PaymentStatus {
        Invalid,
        Paid,
        Refunded,
        Settled
    }

    event Paid(uint256 indexed paymentId, Payment[] payment);

    event Refunded(uint256 indexed paymentId);

    event Settled(uint256 indexed paymentId);

    event Claimed(uint256 indexed paymentId);

    function emitPaid(uint256 pid) external {
        Payment[] memory payments = new Payment[](2);
        payments[0] = Payment({
            recipient : address(0xBEEF),
            amount : 1e18
        });

        payments[1] = Payment({
            recipient : address(0xCAFE),
            amount : 2e18
        });
        emit Paid(pid, payments);
    }

    function emitRefunded(uint256 pid) external {
        emit Refunded(pid);
    }

    function emitSettled(uint256 pid) external {
        emit Settled(pid);
    }

    function emitClaimed(uint256 pid) external {
        emit Claimed(pid);
    }
}

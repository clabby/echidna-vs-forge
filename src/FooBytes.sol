pragma solidity ^0.8.17;

contract FooBytes {
    uint256 internal constant MAGIC = 0x69;

    uint256 internal flagA = 0;
    uint256 internal flagB = 0;

    function foo(bytes32 x) external {
        assembly {
            if iszero(xor(x, MAGIC)) { sstore(flagA.slot, 0x01) }
        }
    }

    function bar(bytes32 y) external {
        assembly {
            if iszero(xor(y, MAGIC)) { sstore(flagB.slot, 0x01) }
        }
    }

    function revertIfCracked() external view {
        assembly {
            if and(sload(flagA.slot), sload(flagB.slot)) {
                mstore(0x00, 0x5188a18c)
                revert(0x1c, 0x04)
            }
        }
    }
}

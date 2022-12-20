// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import { Test } from "forge-std/Test.sol";
import { FooBytes } from "../src/FooBytes.sol";

contract FooBytes_Test is Test {
    FooBytes internal a;

    function setUp() public {
        a = new FooBytes();
    }

    /// @dev Attempts to find a combination of `x` and `y` that will cause
    /// this test to revert. In order to do so, both `x` and `y` should
    /// have `0x69` in their lowest byte.
    function testFuzz_cracked(bytes32 x, bytes32 y) public {
        a.foo(x);
        a.bar(y);
        a.revertIfCracked();
    }

    /// @dev Attempts to find a combination of `x` and `y` that will cause
    /// this test to revert. In order to do so, `FooBytes`' `foo()` and `bar()`
    /// functions must be called with a `bytes32` var that is has `0x69` in its
    /// lowest byte.
    function invariant_foobytes_cracked() public {
        a.revertIfCracked();
    }
}

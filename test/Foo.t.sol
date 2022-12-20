// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import { Test } from "forge-std/Test.sol";
import { Foo } from "../src/Foo.sol";

contract Foo_Test is Test {
    Foo internal a;

    function setUp() public {
        a = new Foo();
    }

    /// @dev Attempts to find a combination of `x` and `y` that will cause
    /// this test to revert. In order to do so, both `x` and `y` should
    /// be equal to `0x69`.
    function testFuzz_cracked(uint256 x, uint256 y) public {
        a.foo(x);
        a.bar(y);
        a.revertIfCracked();
    }

    /// @dev Attempts to find a combination of `x` and `y` that will cause
    /// this test to revert. In order to do so, `Foo`'s `foo()` and `bar()`
    /// functions must be called with a `uint256` value equal to `0x69`
    function invariant_cracked() public {
        a.revertIfCracked();
    }
}

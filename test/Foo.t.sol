// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Test} from "forge-std/Test.sol";
import {Foo} from "../src/Foo.sol";

contract FuzzTest is Test {
    Foo internal a;

    function setUp() public {
        a = new Foo();
    }

    /// @dev Attempts to find a combination of `x` and `y` that will cause
    /// this test to revert. In order to do so, both `x` and `y` should
    /// have `0x69` in their lowest byte.
    function test_shouldRevert(uint256 x, uint256 y) public {
        a.foo(x);
        a.bar(y);
        a.revertIfCracked();
    }
}

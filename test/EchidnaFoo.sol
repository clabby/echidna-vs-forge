pragma solidity ^0.8.17;

import { Foo } from "../src/Foo.sol";

contract EchidnaFoo is Foo {
    function echidna_crack() public returns (bool success) {
        (success,) = address(this).call(abi.encodeWithSelector(this.revertIfCracked.selector));
    }
}

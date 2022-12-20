pragma solidity ^0.8.17;

import {FooBytes} from "../src/FooBytes.sol";

contract EchidnaFooBytes is FooBytes {
    function echidna_crack() public returns (bool success) {
        (success, ) = address(this).call(
            abi.encodeWithSelector(this.revertIfCracked.selector)
        );
    }
}

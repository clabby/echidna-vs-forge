# Forge vs. Echidna testing

Sample contract to test Forge vs. Echidna's fuzzing mechanisms for @transmissions11.

The objective is to find two inputs equal to the magic number `0x69` to supply to `Foo`'s `foo(uint256)` and `bar(uint256)` functions. If both `foo` and `bar` are called with an input of `0x69`, `revertIfCracked` will fail the test.

Both fuzzers are able to find the revert case, but forge fails to do so roughly ~80-90% of the time, whereas Echidna is able to find it every time I've ran it.

Side note, an interesting observation is that when using `bytes32` rather than `uint256` as inputs for `foo` and `bar`, forge is significantly more reliable at finding the revert case than Echidna.

### Versions

Forge: `18791dfa2f8c5ea7df99cc7bc6e00e1d20c02499` 

Echidna: `2.0.4`

### Forge

![forge.png](./assets/forge.png)

### Echidna
Cmd: `echidna-test ./test/EchidnaFoo.sol --contract EchidnaFoo --test-mode property`
![echidna.png](./assets/echidna.png)

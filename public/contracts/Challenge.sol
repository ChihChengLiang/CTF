pragma solidity ^0.8.16;

import {Verifier} from "./verifier.sol";

contract Challenge is Verifier {
    uint256 constant hashOfSecret =
        0x155bf9d2284df73e401adf0efae96eb043e1b320103b61050e77b631fb30389;

    bool public solved;

    function check(Proof memory proof) public {
        uint256[] memory inputs = new uint256[](1);
        inputs[0] = hashOfSecret;
        require(verify(inputs, proof) == 1, "invalid flag");

        solved = true;
    }
}

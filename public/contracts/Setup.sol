// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.16;

import "./Challenge.sol";

interface ChallengeInterface {
    function solved() external view returns (bool);
}

contract Setup {
    ChallengeInterface public challenge;
    
    constructor() {        
        challenge = ChallengeInterface(address(new Challenge()));
    }
    
    function isSolved() public view returns (bool) {
        return challenge.solved();
    }
}

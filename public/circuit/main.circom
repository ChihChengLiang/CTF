pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/poseidon.circom";
include "../../node_modules/circomlib/circuits/comparators.circom";

template IHaveASecret(){
    signal input secret;
    signal input hash_of_secret;

    component lt = LessThan(20);
    lt.in[0] <== secret;
    lt.in[1] <== 1000000;

    component hasher = Poseidon(1);
    hasher.inputs[0] <== secret;
    hash_of_secret === hasher.out;
}

component main {public [hash_of_secret]} = IHaveASecret();

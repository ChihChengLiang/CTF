pragma circom 2.0.0;

template IHaveASecret(){
    signal input secret;
    signal output hash_of_secret;
    
}

 component main = IHaveASecret();
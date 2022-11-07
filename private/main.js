const buildPoseidon = require("circomlibjs").buildPoseidon;
const builder = require("../build/main_js/witness_calculator");

async function js_poseidon(){
    const poseidon = await buildPoseidon();

    const secret = 908223;
    const hash = poseidon([secret]);

    console.log(hash)
}

async function circuit(){

    const poseidon = await buildPoseidon();
    const secret = 908223;
    const hash_of_secret = poseidon([secret]);
    const circuit = await builder();
    const result = circuit.calculate_witness({secret: 908223, hash_of_secret});
    console.log(result)
}

circuit()
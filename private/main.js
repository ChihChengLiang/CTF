const buildPoseidon = require("circomlibjs").buildPoseidon;
const snarkjs = require("snarkjs");
const path = require("path");
const { assert } = require("console");
const fs = require("fs");


async function js_poseidon() {
    const poseidon = await buildPoseidon();

    const secret = 908223;
    const hash = poseidon([secret]);

    console.log(hash)
}

async function circuit() {

    const poseidon = await buildPoseidon();
    const secret = 908223;
    const hash_of_secret = poseidon.F.toString(poseidon([secret]));
    console.log(hash_of_secret)
    const circuitPath = path.join(__dirname, "../build", "main_js", "main.wasm");
    const zkeyPath = path.join(__dirname, "../", "public", "setup", "main_0000.zkey");

    const { proof, publicSignals } = await snarkjs.groth16.fullProve({ secret, hash_of_secret }, circuitPath, zkeyPath);
    console.log(proof)

    const vKeyPath = path.join(__dirname, "../", "public", "setup", "verification_key.json");
    const vKey = JSON.parse(fs.readFileSync(vKeyPath));


    const res = await snarkjs.groth16.verify(vKey, publicSignals, proof);
    assert(res === true);
}

circuit().then(() => {
    process.exit(0);
});

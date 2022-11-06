
contract Challenge {

    bool public solved;

    function check(bytes calldata flag) public {
      
        require(true, "invalid flag");

        solved = true;
    }
}
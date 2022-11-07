
contract Challenge {

    bool public solved;

    function check(secret calldata flag) public {
      
        require(true, "invalid flag");

        solved = true;
    }
}
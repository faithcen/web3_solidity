// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract AbiEncode {


    function encode_hex(string memory _input) public pure returns(bytes memory) {
        return abi.encodePacked(_input);
    }

    function encode_string(string memory _input) public pure returns(string memory) {
        //return string(abi.encodePacked(_input));
        return string(encode_hex(_input));
    }
}


contract Keccak_Test {
    
    bytes32 public functionHash;  //it is public so you can easily check the value
    bytes4 public function4bytes; //it is public so you can easily check the value
    bytes public payload ; //it is public so you can easily check the value
    
    function keccak_test(string memory _input) public payable {
        functionHash = keccak256(abi.encodePacked(_input));
        function4bytes = bytes4(functionHash);
        payload = abi.encode(function4bytes);
    } 
}

contract SendEther {

    function sendViaCall(address payable _to, string memory payload) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent,  ) = _to.call{value: msg.value}(abi.encodePacked(payload));
        require(sent, "Failed to send Ether");
    }
}

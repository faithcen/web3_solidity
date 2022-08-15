// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.7;

contract Selectors {
    function blue() external {

    }

    function green() external {
        
    }

    function yellow(uint256 a) external {
        
    }

    function gray(uint256 a, address b) external {
        
    }

    function get_function_hash(string memory _input) external pure returns(bytes4) {
        //_input --> "green()" or "yellow()" or "gray(uint256,address)" or "yellow(uint256)" 
        //"ed18f0a7": "blue()",
        //"6e8c13d7": "get_function_hash(string)",
        //"b900f571": "gray(uint256,address)",
        //"f2f1e132": "green()",
        //"247fa3dc": "yellow(uint256)"

        return bytes4(keccak256(abi.encodePacked(_input)));
    }
}

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract Whitelist{
    uint public maxWhitelistedAddresses;

    mapping(address=>bool) public whitelistedAddresses;

    uint public numAddressesWhitelisted;

    constructor(uint _maxWhitelistAddresses){
        maxWhitelistedAddresses = _maxWhitelistAddresses;
    }


    function addAddressToWhitelist() public{
        require(!whitelistedAddresses[msg.sender], "sender is already been whitelisted");

        require(numAddressesWhitelisted<maxWhitelistedAddresses, "More addresses cant be added, limit reached");

        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted++;
    }
}
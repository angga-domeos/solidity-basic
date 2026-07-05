// SPDX-Lisence-Identifier: MIT

pragma solidity 0.8.35;

contract StorageExample {
    uint256 storageData;

    function setStorageData(uint256 x) public {
        storageData = x;
    }

    function getStorageData() public view returns(uint256) {
        return storageData;
    }


}
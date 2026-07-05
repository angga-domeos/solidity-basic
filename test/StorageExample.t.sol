// PDDX-Lisence-Identifier: MIT
pragma solidity 0.8.35;

import {Test} from "forge-std/Test.sol";
import {StorageExample} from "../src/StorageExample.sol";

contract StorageExampleTest is Test {
    StorageExample storageExample;

    function setUp() public {
        storageExample = new StorageExample();
    }

    function getAndSetStorageDataTest() public {
        storageExample.setStorageData(13);
        assertEq(storageExample.getStorageData(), 13);
    }
}
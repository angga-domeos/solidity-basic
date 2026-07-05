// SPDX-License-Identifier: MIT
pragma solidity 0.8.35;

import {Test} from "forge-std/Test.sol";
import {CointExample} from "../src/CointExample.sol";

contract CointExampleTest is Test {
    CointExample cointExample;

    address deployer = address(this);
    address angga = address(0x1);
    address nadila = address(0x2);

    function setUp() public {
        cointExample = new CointExample();
    }

    function testMintByMinterSucceds() public {
        cointExample.mint(angga, 100);

        assertEq(cointExample.balance(angga), 100);
    }

    function testMintNonMinterReverts() public {
        vm.prank(angga);

        vm.expectRevert();
        cointExample.mint(nadila, 100);
    }

    function testSendWithSufficientBallance() public {
        cointExample.mint(angga, 100);

        vm.prank(angga);
        cointExample.send(nadila, 50);

        assertEq(cointExample.balance(angga), 50);
        assertEq(cointExample.balance(nadila), 50);
    }

    function testSendWithInsufficientBallanceReverts() public {
        vm.prank(angga);

        vm.expectRevert(
            abi.encodeWithSelector(CointExample.InsufficientBalance.selector, 50, 0)
        );
        cointExample.send(nadila, 50);
    }
}
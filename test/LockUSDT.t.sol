// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/LockUSDT.sol";

contract testLockUSDT is Test {
    LockUSDT c;

    function setUp() public {
        c = new LockUSDT("0xdac17f958d2ee523a2206206994597c13d831ec7");
    }

    // positive test
    function testDeposit() public {
        vm.prank("023edadwfsdg43r2erqwsd3qrwefw3sdv23t436e334");
        c.deposit(100);
        assertEq(c.pendingBalance(msg.sender), 100, "ok");
    }

    function testWithDraw() public {
        vm.prank("023edadwfsdg43r2erqwsd3qrwefw3sdv23t436e334");
        assertEq(c.pendingBalance(msg.sender), 0);
    }
}

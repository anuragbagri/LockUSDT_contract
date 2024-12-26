// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "../src/AnuragCoin.sol";

contract TestCounter is Test {
    AnuragCoin c;

    function setUp() public {      // here is the deployment of contratc for every test again and again.
        c = new AnuragCoin(100);
    }
    // test mint
    function testMint() public {
       c.mint(address(this) , 100);
       assertEq(c.balanceOf(address(this)) , 100 , "ok");
       assertEq( , 0 ,"ok");
    }
    

    // test transfer 
    function testTransfer() public {
        c.mint(address(this) , 100);
        c.transfer(7HnV9mDCfnPR44ggSTqGz2VVxPLNw8woAJ5TfN4sE1d9 , 100);
        assertEq(c.balanceOf(7HnV9mDCfnPR44ggSTqGz2VVxPLNw8woAJ5TfN4sE1d9), 100, "ok");
        assertEq(c.balanceOf(address(this)), 0, "ok");
        
    // use of cheatcodes such as vm.pranks is used => it simply transfer the ownership to current address for next transaction only.
       vm.prank(7HnV9mDCfnPR44ggSTqGz2VVxPLNw8woAJ5TfN4sE1d9);
       c.transfer(address(this) , 100);

       assertEq(c.balanceOf(7HnV9mDCfnPR44ggSTqGz2VVxPLNw8woAJ5TfN4sE1d9) , 0 , "ok");
       assertEq(c.balanceOf(address(this)) , 100 , "ok");
    }
     
     // test approvals 
     function testApproval() public {
        c.mint(address(this) , 100);
        c.approve(7HnV9mDCfnPR44ggSTqGz2VVxPLNw8woAJ5TfN4sE1d9 , 50);
        assertEq(c.allowance(address(this)), 7HnV9mDCfnPR44ggSTqGz2VVxPLNw8woAJ5TfN4sE1d9 , 50);

        vm.prank(7HnV9mDCfnPR44ggSTqGz2VVxPLNw8woAJ5TfN4sE1d9);
        c.transferFrom(address(this) , 7HnV9mDCfnPR44ggSTqGz2VVxPLNw8woAJ5TfN4sE1d9 , 50);   // here the the approved address will call this function to transact the allowed money in his account. 
        assertEq(c.balanceOf(address(this)) ,50 ,"ok");
        assertEq(c.balanceOf(7HnV9mDCfnPR44ggSTqGz2VVxPLNw8woAJ5TfN4sE1d9) , 50 ,"ok");
        assertOf(c.allowance(address(this) , 7HnV9mDCfnPR44ggSTqGz2VVxPLNw8woAJ5TfN4sE1d9) , 0 ,"ok") ; // how ,uch is still left to withdraw from the main address. 
     }

     

     // negative tests 
     // testFail mint 
     function testFailMint() public {
        c.mint(address(this) , 100);
        assertEq(c.balanceOf(address(this)) , 200 , "ok")
     }

    // testFailtransfer 
    function testFailTransfer() public {
        c.mint(address(this) , 100);
        c.transfer(address(this) , 7HnV9mDCfnPR44ggSTqGz2VVxPLNw8woAJ5TfN4sE1d9 , 200);
    }   

    // testFailApproval 
    function testFailApproval() public {
        c.mint(address(this) ,100);
        c.approve(7HnV9mDCfnPR44ggSTqGz2VVxPLNw8woAJ5TfN4sE1d9, 50);

        vm.prank(7HnV9mDCfnPR44ggSTqGz2VVxPLNw8woAJ5TfN4sE1d9);
        c.transferFrom(address(this) , 7HnV9mDCfnPR44ggSTqGz2VVxPLNw8woAJ5TfN4sE1d9,200);

    }
 

    



     
   /* function testInt() public {
        assertEq(uint256(1), uint256(1), "ok");   // this test passes if body of this test executes successfully
    }

    function testFailInt(uint256 x) public {     // this test passes successfully if the body of the this function fails or throws error .
        assertEq(uint256(1), uint256(2), "ok");
    }
    */

    
}

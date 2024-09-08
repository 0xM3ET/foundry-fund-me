// SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe, WithdrawFundMe} from "../../script/Interactions.s.sol";

contract InteractionsTest is Test {
    FundMe fundMe;

    address USER = makeAddr("user");
    uint256 constant SEND_Value = 1 ether;
    uint256 constant INITIAL_BALANCE = 10 ether;
    uint256 constant GAS_PRICE = 1;

    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        vm.deal(USER, INITIAL_BALANCE);
    }

    function testUserCanFundInteraction() public {
        FundFundMe fundFundMe = new FundFundMe();
        //vm.prank(USER);
        //vm.deal(USER, 5e18);
        fundFundMe.fundFundMe(address(fundMe));

        //address funder = fundMe.getFunder(0);
        //assertEq(funder, );
    }

    function testUserCanWithdrawInteraction() public {
        FundFundMe fundFundMe = new FundFundMe();
        // vm.prank(USER);
        // vm.deal(USER, 1e18);
        fundFundMe.fundFundMe(address(fundMe));

        WithdrawFundMe withdrawFundMe = new WithdrawFundMe();
        withdrawFundMe.withdrawFundMe(address(fundMe));

        assert(address(fundMe).balance == 0);
    }
}

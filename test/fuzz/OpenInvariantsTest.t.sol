// //SPDX-License-Identifier: MIT

// pragma solidity ^0.8.18;

// import {Test,console} from "forge-std/Test.sol";
// import {StdInvariant} from "forge-std/StdInvariant.sol";
// import {DSCEngine} from "../../src/DSCEngine.sol";
// import {DeployDSC} from "../../script/deployDSC.s.sol";
// import {DecentralizedStableCoin} from "../../src/DecentralizedStableCoin.sol";
// import {HelperConfig} from "../../script/HelperConfig.s.sol";
// import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// contract OpenInvariantsTest is StdInvariant,Test {
//     DeployDSC deployer;
//     DSCEngine dsce;
//     DecentralizedStableCoin dsc;
//     HelperConfig config;
//     address weth;
//     address wbtc;

//     function setUp() external {
//         deployer = new DeployDSC();
//         (dsc, dsce, config) = deployer.run();
//         (, , weth, wbtc, ) = config.activeNetwrokConfig();
//         targetContract(address(dsce));
//     }

//     function invariant_protocolMusthaveMoreValueThanTotalSupply() public view {
//         //get value of all the collateral compare it to all the debt
//         uint256 totalSupply = dsc.totalSupply();
//         uint256 totalWethDeposited = IERC20(weth).balanceOf(address(dsce));
//         uint256 totalBtsDeposited = IERC20(wbtc).balanceOf(address(dsce));

//         uint256 wethValue = dsce.getUsdValue(weth, totalWethDeposited);
//         uint256 wbtcValue = dsce.getUsdValue(wbtc, totalBtsDeposited);

//         console.log("totalSupply", totalSupply);
//         console.log("wethValue", wethValue);
//         console.log("wbtcValue", wbtcValue);
//         console.log("totalWethDeposited", totalWethDeposited);

//         assert(wethValue + wbtcValue >= totalSupply);
//     }
// }

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//imports



contract DSCEngine {
    ////////////////////////
    /////////ERRORS/////////
    ////////////////////////
    error DSCEngine__NeedMoreThanZero();
    error DSCEngine__TokenAddressAndPriceFeedAddressMustBeSameLength();






    ////////////////////////
    /////State Variable/////
    ////////////////////////

    mapping(address token => address priceFeed) private s_priceFeed;



    /////////////////////////
    ////////Modifiers////////
    /////////////////////////

    modifier moreThanZero(uint256 amount) {
        if (amount == 0) {
            revert DSCEngine__NeedMoreThanZero();
        }
        _;
    }   

    /////////////////////////
    ////////Functions////////
    /////////////////////////

    constructor(address[] memory tokenAddress,address[] memory priceFeedAddress,address dscAddress) {
        if(tokenAddress.length != priceFeedAddress.length){
            revert DSCEngine__TokenAddressAndPriceFeedAddressMustBeSameLength();
        }
    }

    function depositeCollateralAndMintDsc() external {}

    function depositeCollateral(
        address tokenCollateralAddress,
        uint256 amountCollateral
    ) external moreThanZero(amountCollateral) {
        //transfer tokenCollateralAddress to this contract
        //mint DSC
    }

    function redeemCollateralForDsc() external {}

    function redeemCollateral() external {}

    function burnDsc() external {}

    function mintDsc() external {}

    function liquidate() external {}

    function getHealthFactor() external view {}
}

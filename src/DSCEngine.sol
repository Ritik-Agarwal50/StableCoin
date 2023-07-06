// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//imports
import {DecentralizedStableCoin} from "./DecentralizedStableCoin.sol"; 
import {ReentrancyGuard} from "@openzeppelin/contracts/security/ReentrancyGuard.sol";


contract DSCEngine is ReentrancyGuard  {


    error DSCEngine__NeedMoreThanZero();
    error DSCEngine__TokenAddressAndPriceFeedAddressMustBeSameLength();
    error DSCEngine__NotAllowedToken();


    mapping(address token => address priceFeed) private s_priceFeeds;
    mapping(address user => mapping(address token => uint256 amount)) private s_collateralDeposited;

     DecentralizedStableCoin private immutable i_dsc;

    event CollateralDeposited(address indexed user,address indexed token,uint256 amount);


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

    modifier isAllowedToken(address token){
        if(s_priceFeeds[token] == address(0)){
            revert DSCEngine__NotAllowedToken();
        }
        _;
    }  


    constructor(address[] memory tokenAddresses,address[] memory priceFeedAddress,address dscAddress) {

        if(tokenAddresses.length != priceFeedAddress.length){
            revert DSCEngine__TokenAddressAndPriceFeedAddressMustBeSameLength();
        }
        for(uint256 i = 0; i< tokenAddresses.length;i++){
            s_priceFeeds[tokenAddresses[i]] = priceFeedAddress[i];
        }
        i_dsc = DecentralizedStableCoin(dscAddress);
    }

    function depositeCollateralAndMintDsc() external {}

    function depositeCollateral(
        address tokenCollateralAddress,
        uint256 amountCollateral
    ) external moreThanZero(amountCollateral) isAllowedToken(tokenCollateralAddress) nonReentrant {
        //transfer tokenCollateralAddress to this contract
        //mint DSC
        s_collateralDeposited[msg.sender][tokenCollateralAddress] += amountCollateral;
        emit CollateralDeposited(msg.sender,tokenCollateralAddress,amountCollateral);



    }

    function redeemCollateralForDsc() external {}

    function redeemCollateral() external {}

    function burnDsc() external {}

    function mintDsc() external {}

    function liquidate() external {}

    function getHealthFactor() external view {}
}

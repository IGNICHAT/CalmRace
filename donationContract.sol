// SPDX-License-Identifier: MIT

pragma solidity >= 0.5.11 <=0.8.0;

import "./IERC20.sol";
import "./Address.sol";
import "./Context.sol";
import "./Ownable.sol";
//import "./Mandala_Token.sol";




contract donation is Context, Ownable {
                
      using Address for address;
      
     
     //Variables
     string private _name;
     uint256 private minimum;
     
         
    // Donation NGO address
    address private _donationAddress;
     
    // Mapping validating the donation
    mapping (address => bool) private _donation;
    
     // Events 
     event Donation (address donor, uint256 value);
     event Minimum (address owner, uint256 _minimum);
     
      constructor(){
         
         _name = "Mandala Donation Contract";
         minimum = 550000000000000;  //in wei (0.00055 Ether ($1))
         //Donation Address If the donation does not stay in the smartcontract and is sent directly to the donor.
        //_donationAddress = donationAddress;
        
     }
     
      function Name() public view virtual returns (string memory) {
        return _name;
    }
    
      function balanceOf() public view virtual onlyOwner returns (uint256) {
        return address(this).balance;
    }
    
      function makeDonation() public payable {
        require(msg.value > 0, "You must indicate the value for the donation");
        require(msg.value >= minimum, "You must meet the minimum donation requirement");
        //transfer(msg.sender, msg.value);
        //mandala.setDonation();
        _donation[_msgSender()] = true;
        emit Donation (_msgSender(), msg.value);
    }
    
    function setMinimum(uint256 newMinimum) public onlyOwner{
        minimum= newMinimum;
        emit Minimum(_msgSender(), newMinimum);
    }
    
    function getMinimum() public view returns (uint256){
        return minimum;
    }
    
      /*Set true if the user already donate*/
    function setDonation() public virtual {
        _donation[_msgSender()] = true;
    }
    
        /*Get a donation state*/
    function getDonor(address donor) external view returns (bool){
        return _donation[donor];
    }
    
}
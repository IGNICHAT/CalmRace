// SPDX-License-Identifier: MIT
pragma solidity >= 0.5.11 <=0.8.0;


interface IdonationContract {
    function getDonor(address donor) external view returns (bool);
} 
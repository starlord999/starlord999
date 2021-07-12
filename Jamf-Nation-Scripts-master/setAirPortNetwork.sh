#!/bin/sh
####################################################################################################
#
# Copyright (c) 2010, JAMF Software, LLC.  All rights reserved.
#
#       Redistribution and use in source and binary forms, with or without
#       modification, are permitted provided that the following conditions are met:
#               * Redistributions of source code must retain the above copyright
#                 notice, this list of conditions and the following disclaimer.
#               * Redistributions in binary form must reproduce the above copyright
#                 notice, this list of conditions and the following disclaimer in the
#                 documentation and/or other materials provided with the distribution.
#               * Neither the name of the JAMF Software, LLC nor the
#                 names of its contributors may be used to endorse or promote products
#                 derived from this software without specific prior written permission.
#
#       THIS SOFTWARE IS PROVIDED BY JAMF SOFTWARE, LLC "AS IS" AND ANY
#       EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
#       WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
#       DISCLAIMED. IN NO EVENT SHALL JAMF SOFTWARE, LLC BE LIABLE FOR ANY
#       DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
#       (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
#       LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
#       ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
#       (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#       SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
####################################################################################################
#
# SUPPORT FOR THIS PROGRAM
#
#       This program is distributed "as is" by JAMF Software, LLC's Resource Kit team. For more
#       information or support for the Resource Kit, please utilize the following resources:
#
#               http://list.jamfsoftware.com/mailman/listinfo/resourcekit
#
#               http://www.jamfsoftware.com/support/resource-kit
#
#       Please reference our SLA for information regarding support of this application:
#
#               http://www.jamfsoftware.com/support/resource-kit-sla
#
####################################################################################################
#
# ABOUT THIS PROGRAM
#
# NAME
#	setAirPortNetwork.sh -- Disassociates from the current wireless network and sets the SSID and WEP or 
#                    WPA password on the AirPort assuming the AirPort is on
#
# SYNOPSIS
#	sudo setAirPortNetwork.sh
#	sudo setAirPortNetwork.sh <SSID> <password> 
#
# DESCRIPTION
#	This script was designed to configure the AirPort network settings, including which SSID the
#	AirPort is pointed to, as well as what password should be used to connect to the network
#	if the network is a secured wireless network.
#
####################################################################################################
#
# HISTORY
#
#	Version: 1.1
#
#	- Created by Eric Krause on March 5th, 2010
#	- Modified by Eric Krause on June 22, 2010 to fix the command for 10.5
# 
####################################################################################################
#
# DEFINE VARIABLES & READ IN PARAMETERS
#
####################################################################################################

# HARDCODED VALUES SET HERE
SSID=""					#The SSID of the wireless network to connect to
password=""				#This only needs to be set if a password is required


# CHECK TO SEE IF A VALUE WERE PASSED IN FOR PARAMETERS $4 THROUGH $5 AND, IF SO, ASSIGN THEM
if [ "$4" != "" ] && [ "$SSID" == "" ]; then
    SSID=$4
fi

if [ "$5" != "" ] && [ "$password" == "" ]; then
    password=$5
fi


####################################################################################################
# 
# SCRIPT CONTENTS - DO NOT MODIFY BELOW THIS LINE
#
####################################################################################################

if [ "$SSID" == "" ]; then
	echo "Error:  The parameter 'SSID' is blank.  Please specify a SSID."
	exit 1
fi

OS=`/usr/bin/sw_vers -productVersion | /usr/bin/colrm 5`

if [[ "$OS" < "10.6" ]]; then
	echo "Setting airport SSID to $SSID..."
	/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -z -A"$SSID" --password="$password"
else
	echo "Setting airport SSID to $SSID..."
	/usr/sbin/networksetup -setairportnetwork AirPort "$SSID" "$password"
fi
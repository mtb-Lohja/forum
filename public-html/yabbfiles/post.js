//##############################################################################
//# post.js                                                                    #
//##############################################################################
//# YaBB: Yet another Bulletin Board                                           #
//# Open-Source Community Software for Webmasters                              #
//# Version:        YaBB 2.2                                                   #
//# Packaged:       November 8, 2007                                           #
//# Distributed by: http://www.yabbforum.com                                   #
//# ===========================================================================#
//# Copyright (c) 2000-2007 YaBB (www.yabbforum.com) - All Rights Reserved.    #
//# Software by:  The YaBB Development Team                                    #
//#               with assistance from the YaBB community.                     #
//# Sponsored by: Xnull Internet Media, Inc. - http://www.ximinc.com           #
//#               Your source for web hosting, web design, and domains.        #
//##############################################################################

//YaBB 2.2 $Revision: 1.4 $

function checkMailaddr(theMailField) {
var str=theMailField
var re=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
	if (re.test(str)) return true 
	else return false
}

function selectNewattach() {
	document.getElementById("w_file").options[1].selected = true;
}

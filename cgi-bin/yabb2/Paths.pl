###############################################################################
# Paths.pl                                                                    #
###############################################################################
# YaBB: Yet another Bulletin Board                                            #
# Open-Source Community Software for Webmasters                               #
# Version:        YaBB 2.5.2                                                  #
# Packaged:       September 30, 2012                                          #
# Distributed by: http://www.yabbforum.com                                    #
# =========================================================================== #
# Copyright (c) 2000-2012  YaBB (www.yabbforum.com) - All Rights Reserved.    #
# Software by:  The YaBB Development Team                                     #
#               with assistance from the YaBB community.                      #
###############################################################################

$lastsaved = "YaBB Administrator";
$lastdate = "1380521364";

########## Directories ##########

# $boardurl = "http://www.mtb-lohja.com/cgi-bin/yabb2"; # URL of your board's folder (without trailing '/')
$boardurl = "/cgi-bin/yabb2";    # URL of your board's folder (without trailing '/')
$boarddir = ".";                                  # The server path to the board's folder (usually can be left as '.')
$boardsdir = "/data/Boards";                          # Directory with board data files
$datadir = "/data/Messages";                          # Directory with messages
$memberdir = "/data/Members";                         # Directory with member files
$sourcedir = "./Sources";                         # Directory with YaBB source files
$admindir = "./Admin";                            # Directory with YaBB admin source files
$vardir = "./Variables";                          # Directory with variable files
$langdir = "./Languages";                         # Directory with Language files and folders
$helpfile = "./Help";                             # Directory with Help files and folders
$templatesdir = "./Templates";                    # Directory with template files and folders
$htmldir = "/usr/local/apache2/htdocs/yabbfiles"; # Base Path for all public-html files and folders
$facesdir = "/usr/local/apache2/htdocs/yabbfiles/avatars"; # Base Path for all avatar files
$uploaddir = "/data/Attachments"; # Base Path for all attachment files

########## URL's ##########

$yyhtml_root = "/yabbfiles"; # Base URL for all html/css files and folders
$facesurl = "/yabbfiles/avatars"; # Base URL for all avatar files

# TODO: This probably is not working, as Attachments are not under Yabbfiles at the moment
$uploadurl = "/yabbfiles/Attachments"; # Base URL for all attachment files

########## Old Path Settings ################################
########## The following variables are deprecated! ##########
########## Don't use them for new code! #####################

$forumstylesdir = $htmldir . "/Templates/Forum";  # Directory with forum style files and folders
$adminstylesdir = $htmldir . "/Templates/Admin";  # Directory with admin style files and folders
$smiliesdir = $htmldir . "/Smilies";              # Base Path for all smilie files
$modimgdir = $htmldir . "/ModImages";             # Base Path for all mod images

$forumstylesurl = $yyhtml_root . "/Templates/Forum"; # Default Forum Style Directory
$adminstylesurl = $yyhtml_root . "/Templates/Admin"; # Default Admin Style Directory
$smiliesurl = $yyhtml_root . "/Smilies";          # Base URL for all smilie files
$modimgurl = $yyhtml_root . "/ModImages";         # Base URL for all mod images

1;

###############################################################################
# Settings.pl                                                                 #
###############################################################################
# YaBB: Yet another Bulletin Board                                            #
# Open-Source Community Software for Webmasters                               #
# Version:        YaBB 2.5.2                                                  #
# Packaged:       October 21, 2012                                            #
# Distributed by: http://www.yabbforum.com                                    #
# =========================================================================== #
# Copyright (c) 2000-2012  YaBB (www.yabbforum.com) - All Rights Reserved.    #
# Software by:  The YaBB Development Team                                     #
#               with assistance from the YaBB community.                      #
###############################################################################

########## Board Info ##########
# Note: these settings must be properly changed for YaBB to work

$settings_file_version = "YaBB 2.5.2";            # If not equal actual YaBBversion then the updating process is run
                                                  #  through

%templateset = (
'Blue_1' => "blue_1|blue_1|blue_1|blue_1|blue_1|blue_1|blue_1|",
'Forum default' => "default|default|default|default|default|default|default|",
'MTBL-oletus' => "default|default|default|default|default|default|default|2",
);                                                # Forum templates settings

$maintenance = 0;                                 # Set to 1 to enable Maintenance mode
$rememberbackup = 0;                              # seconds past since last backup until alert is displayed
$maintenancetext = "Muutto\ käynnissä";           # Admin-defined text for Maintenance mode

$guestaccess = 1;                                 # Set to 0 to disallow guests from doing anything but login or
                                                  #  register

$mbname = "MTB\-Lohja\ forum";                    # The name of your YaBB forum
$forumstart = "12\/22\/08\ at\ 18\:10\:31";       # The start date of your YaBB Forum
$Cookie_Length = 1;                               # Default minutes to set login cookies to stay for
$cookieusername = "Y2User\-88646";                # Name of the username cookie
$cookiepassword = "Y2Pass\-88646";                # Name of the password cookie
$cookiesession_name = "Y2Sess\-88646";            # Name of the Session cookie

$regtype = 1;                                     # 0 = registration closed (only admin can register), 1 = pre
                                                  #  registration with admin approval,
                                                  # 2 = pre registration and email activation, 3 = open registration
$RegAgree = 1;                                    # Set to 1 to display the registration agreement when registering
$RegReasonSymbols = 500;                          # Maximum allowed symbols in User reason(s) for registering
$preregspan = 48;                                 # Time span in hours for users to account activation before cleanup
$pwstrengthmeter_scores = "10\,15\,30\,40";       # Password-Strength-Meter Scores
$pwstrengthmeter_common = "\"123\"\,\"123456\"";  # Password-Strength-Meter common words
$pwstrengthmeter_minchar = 5;                     # Password-Strength-Meter minimum characters
$emailpassword = 0;                               # 0 - instant registration. 1 - password emailed to new members
$emailnewpass = 1;                                # Set to 1 to email a new password to members if they change their
                                                  #  email address
$emailwelcome = 0;                                # Set to 1 to email a welcome message to users even when you have mail
                                                  #  password turned off
$name_cannot_be_userid = 1;                       # Set to 1 to require users to have different usernames and display
                                                  #  names
$birthday_on_reg = 0;                             # Set to 0: don't ask for birthday on registration
                                                  # 1: ask for the birthday, no input required
                                                  # 2: ask for the birthday, input required

$gender_on_reg = 0;                               # 0: don't ask for gender on registration
                                                  # 1: ask for gender, no input required
                                                  # 2: ask for gender, input required
$nomailspammer = 0;                               # 1: send deleted account email
$lang = "English";                                # Default Forum Language
$default_template = "Forum\ default";             # Default Forum Template

$mailprog = "\/usr\/sbin\/sendmail";              # Location of your sendmail program
$smtp_server = "smtp.sendgrid.net:587";           # Address of your SMTP-Server (for Net::SMTP::TLS, specify the port
                                                  #  number with a ":<portnumber>" at the end)
$smtp_auth_required = 1;                          # Set to 1 if the SMTP server requires Authorisation
$authuser = "apikey";                             # Username for SMTP authorisation
$authpass = "$ENV{'SENDGRID_API_KEY'}";           # Password for SMTP authorisation
$webmaster_email = "tero\@teelahti\.fi";          # Your email address. (eg: $webmaster_email = q^admin@host.com^;)
$mailtype = 2;                                    # Mail program to use: 0 = sendmail, 1 = SMTP, 2 = Net::SMTP, 3 =
                                                  #  Net::SMTP::TLS

$UseHelp_Perms = 1;                               # Help Center: 1 == use permissions, 0 == don't use permissions

########## MemberGroups ##########

# Static Member Groups
$Group{'Global Moderator'} = 'Global Moderator|5|stargmod.gif|blue|0|0|0|0|0|0';
$Group{'Moderator'} = 'YaBB Moderator|5|starmod.gif|green|0|0|0|0|0|0';
$Group{'Administrator'} = 'YaBB Administrator|5|staradmin.gif|red|0|0|0|0|0|0';

# Post independent Member Groups

# Post dependent Member Groups
$Post{'0'} = 'Junior Member|2|stargold.gif||0|0|0|0|0|0|0';
$Post{'250'} = 'Senior Member|4|stargold.gif||0|0|0|0|0|0';
$Post{'500'} = 'God Member|5|starsilver.gif||0|0|0|0|0|0';
$Post{'100'} = 'Full Member|3|starblue.gif||0|0|0|0|0|0';
$Post{'-1'} = 'M�rk�korva|1|stargold.gif||0|0|0|0|0|0|0';

@nopostorder = qw();                              # Order how "Post independent Member Groups" are displayed

########## Layout ##########

$MenuType = 2;                                    # 1 for text menu or anything else for images menu
$profilebutton = 1;                               # 1 to show view profile button under post, or 0 for blank
$usertools = 1;                                   # Allow admin to hide the list of tools that show when clicking a
                                                  #  userlink
$allow_hide_email = 1;                            # Allow users to hide their email from public. Set 0 to disable
$buddyListEnabled = 1;                            # Enable Buddy List
$addmemgroup_enabled = 0;                         # Enable Users choose additional MemberGroups
$showlatestmember = 1;                            # Set to 1 to display "Welcome Newest Member" on the Board Index
$shownewsfader = 1;                               # 1 to allow or 0 to disallow NewsFader javascript
$Show_RecentBar = 1;                              # Set to 1 to display the Recent Post on Board Index
$showmodify = 1;                                  # Set to 1 to display "Last modified: Realname - Date" under each
                                                  #  message
$ShowBDescrip = 1;                                # Set to 1 to display board descriptions on the topic (message) index
                                                  #  for each board
$showuserpic = 1;                                 # Set to 1 to display each member's picture in the message view (by
                                                  #  the ICQ.. etc.)
$showusertext = 1;                                # Set to 1 to display each member's personal text in the message view
                                                  #  (by the ICQ.. etc.)
$showtopicviewers = 1;                            # Set to 1 to display members viewing a topic
$showtopicrepliers = 1;                           # Set to 1 to display members replying to a topic
$showgenderimage = 0;                             # Set to 1 to display each member's gender in the message view (by the
                                                  #  ICQ.. etc.)
$showyabbcbutt = 1;                               # Set to 1 to display the yabbc buttons on Posting and IM Send Pages
$nestedquotes = 1;                                # Set to 1 to allow quotes within quotes (0 will filter out quotes
                                                  #  within a quoted message)
$parseflash = 0;                                  # Set to 1 to parse the flash tag
$enableclicklog = 1;                              # Set to 1 to track stats in Clicklog (this may slow your board down)
$showimageinquote = 0;                            # Set to 1 to shows images in quotes, 0 displays a link to the image

@pallist = ("#ff0000","#00ff00","#0000ff","#00ffff","#ff00ff","#ffff00"); # color settings of the palette

########## Feature Settings ##########

$enable_spell_check = 0;                          # Set to 1 if you want to enable SpellChecker. By doing this you agree
                                                  #  to the terms of license under that googiespell runs. See:
                                                  #  http://orangoo.com/labs/GoogieSpell/License/ and
                                                  #  /yabbfiles/googiespell/GPL.txt
$enable_ubbc = 1;                                 # Set to 1 if you want to enable UBBC (Uniform Bulletin Board Code)
$enable_news = 0;                                 # Set to 1 to turn news on, or 0 to set news off
$allowpics = 1;                                   # set to 1 to allow members to choose avatars in their profile
$upload_useravatar = 1;                           # set to 1 to allow members to upload avatars for their profile
$upload_avatargroup = "Administrator\,\ Global\ Moderator\,\ God\ Member\,\ Senior\ Member\,\ Full\ Member\,\ Junior\ Member"; # membergroups allowed to upload avatars for their profile, '' == all members
$avatar_limit = 100;                              # set to the maximum size of the uploaded avatar, 0 == no limit
$avatar_dirlimit = 10000;                         # set to the maximum size of the upload avatar directory, 0 == no
                                                  #  limit

$enable_guestposting = 0;                         # Set to 0 if do not allow 1 is allow.
$guest_media_disallowed = 0;                      # disallow browsing guests to see media files or have clickable auto
                                                  #  linked urls in messages.
$enable_guestlanguage = 0;                        # allow browsing guests to select their language - requires more than
                                                  #  one language pack! - Set to 0 if do not allow 1 is allow.

$enable_notifications = 1;                        # - Allow e-mail notification for boards/threads listed in "My
                                                  #  Notifications" => value == 1
                                                  # - Allow e-mail notification when new PM comes in => value == 2
                                                  # - value == 0 => both disabled | value == 3 => both enabled

$NewNotificationAlert = 1;                        # enable notification alerts (popup) for new notifications
$autolinkurls = 1;                                # Set to 1 to turn URLs into links, or 0 for no auto-linking.

$forumnumberformat = 2;                           # Select your preferred output Format for Numbers
$timeselected = 3;                                # Select your preferred output Format of Time and Date
$timecorrection = 0;                              # Set time correction for server time in seconds
$timeoffset = "02\.0";                            # Time Offset to GMT/UTC (0 for GMT/UTC)
$dstoffset = 1;                                   # Time Offset (for daylight savings time, 0 to disable DST)
$dynamic_clock = 0;                               # Set to a value enables the dynamic clock at the top of the page
$TopAmmount = 15;                                 # No. of top posters to display on the top members list
$maxdisplay = 20;                                 # Maximum of topics to display
$maxfavs = 20;                                    # Maximum of favorite topics to save in a profile
$maxrecentdisplay = 25;                           # Maximum of topics to display on recent posts by a user (-1 to
                                                  #  disable)
$maxsearchdisplay = 50;                           # Maximum of messages to display in a search query (-1 to disable
                                                  #  search)
$maxmessagedisplay = 15;                          # Maximum of messages to display
$showpageall = 0;                                 # Disable or Enable show All on page selectors
$checkallcaps = 6;                                # Set to 0 to allow ALL CAPS in posts (subject and message) or set to
                                                  #  a value > 0 to open a JS-alert if more characters in ALL CAPS were
                                                  #  there.
$set_subjectMaxLength = 50;                       # Maximum Allowed Characters in a Posts Subject
$MaxMessLen = 10000;                              # Maximum Allowed Characters in a Posts
$honeypot = 1;                                    # Set to 1 to activate Honeypot spam deterrent
$spamfruits = 0;                                  # Set to 1 to activate SpamFruits spam deterrent
$speedpostdetection = 1;                          # Set to 1 to detect speedposters and delay their spam actions
$spd_detention_time = 300;                        # Time in seconds before a speedposting ban is lifted again
$min_post_speed = 2;                              # Minimum time in seconds between entering a post form and submitting
                                                  #  a post
$minlinkpost = 3;                                 # Minimum amount of posts a member needs to post links and images
$minlinksig = 0;                                  # Minimum amount of posts a member needs to create links and images in
                                                  #  signature
$minlinkweb = 0;                                  # Minimum amount of posts a member needs to link to a website in their
                                                  #  profile
$post_speed_count = 3;                            # Maximum amount of abuses befor a user gets banned
$fontsizemin = 6;                                 # Minimum Allowed Font height in pixels
$fontsizemax = 32;                                # Maximum Allowed Font height in pixels
$MaxSigLen = 400;                                 # Maximum Allowed Characters in Signatures
$ClickLogTime = 1440;                             # Time in minutes to log every click to your forum (longer time means
                                                  #  larger log file size)
$max_log_days_old = 30;                           # If an entry in the user's log is older than ... days remove it

$maxsteps = 40;                                   # Number of steps to take to change from start color to endcolor
$stepdelay = 0;                                   # Time in miliseconds of a single step
$fadelinks = 1;                                   # Fade links as well as text?

$defaultusertxt = "MTB\-Lohja\ toy\ uusiojäsen"; # The dafault usertext visible in users posts
$timeout = 20;                                    # Minimum time between 2 postings from the same IP
$HotTopic = 10;                                   # Number of posts needed in a topic for it to be classed as "Hot"
$VeryHotTopic = 25;                               # Number of posts needed in a topic for it to be classed as "Very Hot"

$barmaxdepend = 0;                                # Set to 1 to let bar-max-length depend on top poster or 0 to depend
                                                  #  on a number of your choise
$barmaxnumb = 500;                                # Select number of post for max. bar-length in memberlist
$defaultml = "regdate";

$ML_Allowed = 1;                                  # allow browse MemberList

########## Quick Reply configuration ##########

$enable_quickpost = 0;                            # Set to 1 if you want to enable the quick post box
$enable_quickreply = 0;                           # Set to 1 if you want to enable the quick reply box
$enable_quickjump = 1;                            # Set to 1 if you want to enable the jump to quick reply box
$enable_markquote = 1;                            # Set to 1 if you want to enable the mark&quote feature
$quick_quotelength = 1000;                        # Set the max length for Quick Quotes
$enable_quoteuser = 1;                            # Set to 1 if you want to enable userquote
$quoteuser_color = "\#0033cc";                    # Set the default color of @ in userquote

########## MemberPic Settings ##########

$max_avatar_width = 120;                          # Set maximum pixel width to which the selfselected userpics are
                                                  #  resized, 0 disables this limit
$max_avatar_height = 120;                         # Set maximum pixel height to which the selfselected userpics are
                                                  #  resized, 0 disables this limit
$fix_avatar_img_size = 0;                         # Set to 1 disable the image resize feature and sets the image size to
                                                  #  the max_... values. If one of the max_... values is 0 the image is
                                                  #  shown in his proportions to the other value. If both are 0 the
                                                  #  image is shown at his original size.
$max_post_img_width = 0;                          # Set maximum pixel width for images, 0 disables this limit
$max_post_img_height = 0;                         # Set maximum pixel height for images, 0 disables this limit
$fix_post_img_size = 0;                           # Set to 1 disable the image resize feature and sets the image size to
                                                  #  the max_... values. If one of the max_... values is 0 the image is
                                                  #  shown in his proportions to the other value. If both are 0 the
                                                  #  image is shown at his original size.
$max_signat_img_width = 400;                      # Set maximum pixel width for images in the signature, 0 disables this
                                                  #  limit
$max_signat_img_height = 120;                     # Set maximum pixel height for images in the signature, 0 disables
                                                  #  this limit
$fix_signat_img_size = 0;                         # Set to 1 disable the image resize feature and sets the image size to
                                                  #  the max_... values. If one of the max_... values is 0 the image is
                                                  #  shown in his proportions to the other value. If both are 0 the
                                                  #  image is shown at his original size.
$max_attach_img_width = 1024;                     # Set maximum pixel width for attached images, 0 disables this limit
$max_attach_img_height = 768;                     # Set maximum pixel height for attached images, 0 disables this limit
$fix_attach_img_size = 0;                         # Set to 1 disable the image resize feature and sets the image size to
                                                  #  the max_... values. If one of the max_... values is 0 the image is
                                                  #  shown in his proportions to the other value. If both are 0 the
                                                  #  image is shown at his original size.
$img_greybox = 1;                                 # Set to 0 to disable "greybox" (each image is shown in a new window)
                                                  # Set to 1 to enable the attachment and post image "greybox" (one
                                                  #  image/page)
                                                  # Set to 2 to enable the attachment and post image "greybox" =>
                                                  #  attachmet images: (all images/page), post images: (one image/page)

########## Extended Profiles ##########

$extendedprofiles = 1;                            # Set to 1 to enabled 'Extended Profiles'. Turn it off (0) to save
                                                  #  server load.
@ext_prof_order = ();                             # Order of the extended profile fields.
@ext_prof_fields = (

);                                                # Settings of the extended profiles fields.

########## File Settings ##########

$enable_quota = 0;                                # Set to 1 to enable free HOST size check with command 'quota' on
                                                  #  every pageview
$hostusername = "mtbl\-www";                      # Username on the above host HDD
$findfile_time = 0;                               # Used HOST size check with 'find' every ... minutes
$findfile_root = "";                              # Used HOST size check with 'find' in this folder -r
$findfile_maxsize = 0;                            # Maximum size in KB the above folder is allowed to store
$findfile_space = "";                             # dynamically inserted available space on the user account and
                                                  #  timestamp of the last check
$enable_freespace_check = 0;                      # Set to 1 to enable the free DISK space check on every pageview

$gzcomp = 2;                                      # GZip compression: 0 = No Compression, 1 = External gzip, 2 =
                                                  #  Zlib::Compress
$gzforce = 0;                                     # Don't try to check whether browser supports GZip
$cachebehaviour = 0;                              # Browser Cache Control: 0 = No Cache must revalidate, 1 = Allow
                                                  #  Caching
$use_flock = 1;                                   # Set to 0 if your server doesn't support file locking, 1 for
                                                  #  Unix/Linux and WinNT and 2 for Windows 95/98/ME

$faketruncation = 0;                              # Enable this option only if YaBB fails with the error:
                                                  # "truncate() function not supported on this platform."
                                                  # 0 to disable, 1 to enable.

$debug = 0;                                       # If set to 1 debug info is added to the template. Tag in template is
                                                  #  {yabb debug}
########## Anti-spam Question Settings ##########

$en_spam_questions = 1;                           # Set to 1 to enable Anti-spam Questions
$spam_questions_case = 0;                         # Set to 1 to enable case-sensitive answers

###############################################################################
# Advanced Settings (old AdvSettings.txt)                                     #
###############################################################################

########## RSS Settings ##########

$rss_disabled = 1;                                # Set to 1 to disable the RSS feed
$rss_limit = 10;                                  # Maximum number of topics in the feed
$rss_message = 1;                                 # Message to display in the feed
                                                  # 0: None
                                                  # 1: Latest Post
                                                  # 2: Original Post in the topic
$showauthor = 0;                                  # Show author name
$showdate = 0;                                    # Show post date

########## New Member Notification Settings ##########

$new_member_notification = 0;                     # Set to 1 to enable the new member notification
$new_member_notification_mail = "";               # Your "New Member Notification"-email address.

$sendtopicmail = 2;                               # Set to 0 for send NO topic email to friend
                                                  # Set to 1 to send topic email to friend via YaBB
                                                  # Set to 2 to send topic email to friend via user program
                                                  # Set to 3 to let user decide between 1 and 2

########## In-Thread Multi Delete ##########

$mdadmin = 1;
$mdglobal = 1;
$mdmod = 1;
$adminbin = 0;                                    # Skip recycle bin step for admins and delete directly

########## Moderation Update ##########

$adminview = 2;                                   # Multi-admin settings for Administrators: 0=none, 1=icons 2=single
                                                  #  checkbox 3=multiple checkboxes
$gmodview = 2;                                    # Multi-admin settings for Global Moderators: 0=none, 1=icons 2=single
                                                  #  checkbox 3=multiple checkboxes
$modview = 2;                                     # Multi-admin settings for Moderators: 0=none, 1=icons 2=single
                                                  #  checkbox 3=multiple checkboxes

########## Advanced Memberview Plus ##########

$showallgroups = 1;
$OnlineLogTime = 15;                              # Time in minutes before Users are removed from the Online Log
$lastonlineinlink = 0;                            # Show "Last online X days and XX:XX:XX hours ago." to all members ==
                                                  #  1

########## Polls ##########

$numpolloptions = 8;                              # Number of poll options
$maxpq = 60;                                      # Maximum Allowed Characters in a Poll Qestion?
$maxpo = 50;                                      # Maximum Allowed Characters in a Poll Option?
$maxpc = 0;                                       # Maximum Allowed Characters in a Poll Comment?
$useraddpoll = 1;                                 # Allow users to add polls to existing threads? (1 = yes)
$ubbcpolls = 1;                                   # Allow UBBC tags and smilies in polls? (1 = yes)

########## My Center and Private Messaging Features ##########

$PM_level = 1;                                    # minimum user level for private messaging: 0 = off, 1 = members, 2 =
                                                  #  mods, 3 = gmod
$PMenableGuestButton = 0;                         # enable 'pm to admin' for guests? 1=yes, 0=no. Appears on the general
                                                  #  menu instead of 'my center'
$PMenableAlertButton = 0;                         # enable 'alert moderator' button on thread view? 1=yes 0=no. Acts as
                                                  #  a broadcast message to mods etc.
$PMAlertButtonGuests = 0;                         # enable 'alert moderator' button for Guests
$enable_PMsearch = 5;                             #enable/max returns for PM search - 0 = off / 10 - 50 range for
                                                  #  results

$send_welcomeim = 1;                              # enable auto-welcome message from forum to new member. 1=yes, 0=no
$sendname = "Ylläpito";                          # username 'from' for welcome message. Defaults to fa.
$imsubject = "Tervetuloa";                        # title of welcome message.
$imtext = "Tervetuloa\ MTB\-Lohja\ keskustelufoorumille\!"; # message sent to new member

$numposts = 1;                                    # Number of posts required to send Instant Messages
$imspam = 0;                                      # Percent of Users a user is a allowed to send a message at once

$enable_imlimit = 0;                              # Set to 1 to enable limitation of incoming and outgoing im messages
$numibox = 20;                                    # Number of maximum Messages in the IM-Inbox
$numobox = 20;                                    # Number of maximum Messages in the IM-Outbox
$numstore = 20;                                   # Number of maximum Messages in the Storage box
$numdraft = 20;                                   # Number of maximum Messages in the draft box

$PMenable_cc = 0;                                 # enable cc for PM posting 1 yes, 0 no
$PMenable_bcc = 0;                                # enable bcc for PM posting 1 yes, 0 no
$PMenableBm_level = 3;                            # minimum level to send? 0 = off, 1 = mods, 2 = gmod, 3 = admin

$enable_storefolders = 0;                         # enable additonal store folders - in/out are default for all
                                                  # 0=no > 1 = number, max 25

$enable_YaBBBut = 0;                              # enable YABBC Buttons on post page? 1=yes, 0=no
$enable_PMcontrols = 0;                           # enable extended controls for members? 1=yes, 0=no. If off, use the
                                                  #  following instead
$enable_PMprev = 0;                               # enable preview button
$enable_PMActprev = 0;                            # enable active preview
$enable_PMviewMess = 0;                           # enable message body suppress in list view

$enable_PMautoAway = 0;                           # enable PM 'away' auto reply for inbox.
$enable_MCaway = 3;                               # enable 'away' indicator 0=Off 1=Staff to Staff 2=Staff to all
                                                  #  3=Members
$MaxAwayLen = 200;                                # maximum allowed characters in Away message
$enable_MCstatusStealth = 1;                      # enable 'stealth' mode for fa/gmods. Allows status label to stay at
                                                  #  offline/away for all members viewing.
$self_del_user = 0;                               # 1: allow member to delete own account.

########## Topic Summary Cutter ##########

$cutamount = 15;                                  # Number of posts to list in topic summary
$tsreverse = 1;                                   # Reverse Topic Summaries in Topic Reply (most recent becomes first)
$ttsreverse = 0;                                  # Reverse Topic Summaries in Topic (most recent becomes first)
$ttsureverse = 0;                                 # Reverse Topic Summaries in Topic (most recent becomes first) allowed
                                                  #  as user wishes? Yes == 1

########## Time Lock ##########

$tlnomodflag = 0;                                 # Set to 1 limit time users may modify posts
$tlnomodtime = 1;                                 # Time limit on modifying posts (days)
$tlnodelflag = 0;                                 # Set to 1 limit time users may delete posts
$tlnodeltime = 5;                                 # Time limit on deleting posts (days)
$tllastmodflag = 1;                               # Set to 1 allow users to modify posts up to the specified time limit
                                                  #  w/o showing "last Edit" message
$tllastmodtime = 60;                              # Time limit to modify posts w/o triggering "last Edit" message (in
                                                  #  minutes)

########## Permalinks ##########

$accept_permalink = 0;                            # Set to 1 to have the board accept permalink alike environment
                                                  #  strings
$symlink = "";                                    # The part defined in .htaccess redirection rules that is between
                                                  #  domainname and permalink
$perm_spacer = "";                                # The character used in the permalink output file that replaces the
                                                  #  space.
$perm_domain = "";                                # The full domainname (no http://) where the .haccess redirect is set
                                                  #  on.

########## bypass post for locked thread ##########

$bypass_lock_perm = "mod";                        # set level of permission - fa / fa+gmod / fa+gmod+mod; '' if disabled

########## File Attachment Settings ##########

$limit = 350;                                     # Set to the maximum number of kilobytes an attachment can be. Set to
                                                  #  0 to disable the file size check.
$dirlimit = 20000;                                # Set to the maximum number of kilobytes the attachment directory can
                                                  #  hold. Set to 0 to disable the directory size check.
$overwrite = 0;                                   # Set to 0 to auto rename attachments if they exist, 1 to overwrite
                                                  #  them or 2 to generate an error if the file exists already.
@ext = qw(txt doc docx psd pdf bmp jpe jpg jpeg gif png swf zip rar tar xls); # The allowed file extensions for file
                                                  #  attachements. Variable should be set in the form of "jpg bmp gif" and
                                                  #  so on.
$checkext = 1;                                    # Set to 1 to enable file extension checking, set to 0 to allow all
                                                  #  file types to be uploaded
$amdisplaypics = 1;                               # Set to 1 to display attached pictures in posts, set to 0 to only
                                                  #  show a link to them.
$allowattach = 1;                                 # Set to the number of maximum files attaching a post, set to 0 to
                                                  #  disable file attaching.
$allowguestattach = 0;                            # Set to 1 to allow guests to upload attachments, 0 to disable guest
                                                  #  attachment uploading.

########## Error Logger ##########

$elmax = 50;                                      # Max number of log entries before rotation
$elenable = 1;                                    # allow for error logging
$elrotate = 1;                                    # Allow for log rotation

########## Advanced Tabs ##########

@AdvancedTabs = ("home","help","search","ml","admin","revalidatesession","login","register","guestpm","mycenter","logout"); # Advanced Tabs order and infos

########## Smilies ##########

@SmilieURL = ("exclamation.gif","question.gif");  # Additional Smilies URL
@SmilieCode = (":exclamation",":question");       # Additional Smilies Code
@SmilieDescription = ("Exclaim","Questioning");   # Additional Smilies Description
@SmilieLinebreak = ("","");                       # Additional Smilies Linebreak

$smiliestyle = "1";                               # smiliestyle
$showadded = "2";                                 # showadded
$showsmdir = "2";                                 # showsmdir
$detachblock = "1";                               # detachblock
$winwidth = "400";                                # winwidth
$winheight = "400";                               # winheight
$popback = "FFFFFF";                              # popback
$poptext = "000000";                              # poptext
$showinbox = "";                                  # showinbox
$removenormalsmilies = "";                        # removenormalsmilies



###############################################################################
# Security Settings (old SecSettings.txt)                                     #
###############################################################################

$regcheck = 1;                                    # Set to 1 if you want to enable automatic flood protection enabled
$gpvalid_en = 1;                                  # Set to 1 if you want to enable validation code on guest posting
$codemaxchars = 7;                                # Set max length of validation code (15 is max)
$captchastyle = "A";                              # Set L = lowercase only, U = uppercase only, A = both upper and
                                                  #  lowercase letters
$rgb_foreground = "\#0033cc";                     # Set hex RGB value for validation image foreground color
$rgb_shade = "999999";                            # Set hex RGB value for validation image shade color
$rgb_background = "FFFFFF";                       # Set hex RGB value for validation image background color
$translayer = 1;                                  # Set to 1 background for validation image should be transparent
$randomizer = 3;                                  # Set 0 to 3 to create background random noise based on foreground or
                                                  #  shade color or both
$distortion = 2;                                  # Set 1 to distort the captcha image even more
$stealthurl = 0;                                  # Set to 1 to mask referer url to hosts if a hyperlink is clicked.
$do_scramble_id = 1;                              # Set to 1 scambles all visible links containing user ID's
$referersecurity = 1;                             # Set to 1 to activate referer security checking.
$sessions = 1;                                    # Set to 1 to activate session id protection.
$show_online_ip_admin = 1;                        # Set to 1 to show online IP's to admins.
$show_online_ip_gmod = 1;                         # Set to 1 to show online IP's to global moderators.
$masterkey = "IwkptbMQY4YoTq6I29pg9NvA";          # Seed for encryption of captcha's



###############################################################################
# Guardian Settings (old Guardian.banned and Guardian.settings)               #
###############################################################################

$banned_harvesters = qq~alexibot|asterias|backdoorbot|black.hole|blackwidow|blowfish|botalot|builtbottough|bullseye|bunnyslippers|cegbfeieh|cheesebot|cherrypicker|chinaclaw|copyrightcheck|cosmos |crescent|custo|disco|dittospyder|download demon|ecatch|eirgrabber|emailcollector|emailsiphon|emailwolf|erocrawler|eseek-larbin|express webpictures|extractorpro|eyenetie|fast|flashget|foobot|frontpage|fscrawler|getright|getweb|go!zilla|go-ahead-got-it|grabnet|grafula|gsa-crawler|harvest|hloader|hmview|httplib|httrack|humanlinks|ia_archiver|image stripper|image sucker|indy library|infonavirobot|interget|internet ninja|jennybot|jetcar|joc web spider|kenjin.spider|keyword.density|larbin|leechftp|lexibot|libweb/clshttp|linkextractorpro|linkscan/8.1a.unix|linkwalker|lwp-trivial|mass downloader|mata.hari|microsoft.url|midown tool|miixpc|mister pix|moget|mozilla.*newt|mozilla/3.mozilla/2.01|navroad|nearsite|net vampire|netants|netmechanic|netspider|netzip|nicerspro|npbot|octopus|offline explorer|offline navigator|openfind|pagegrabber|papa foto|pavuk|pcbrowser|propowerbot/2.14|prowebwalker|queryn.metasearch|realdownload|reget|repomonkey|sitesnagger|slysearch|smartdownload|spankbot|spanner |spiderzilla|steeler|superbot|superhttp|surfbot|suzuran|szukacz|takeout|teleport pro|telesoft|the.intraformant|thenomad|tighttwatbot|titan|tocrawl/urldispatcher|true_robot|turingos|turnitinbot|urly.warning|vci|voideye|web image collector|web sucker|web.image.collector|webauto|webbandit|webbandit|webcopier|webemailextrac.*|webenhancer|webfetch|webgo is|webleacher|webmasterworldforumbot|webreaper|websauger|website extractor|website quester|webster.pro|webstripper|webwhacker|webzip|wget|widow|www-collector-e|wwwoffle|xaldon webspider|xenu link sleuth|zeus~;
$banned_referers = qq~hotsex.com|porn.com~;
$banned_requests = qq~~;
$banned_strings = qq~pussy|cunt~;
$whitelist = qq~~;

$use_guardian = 1;
$use_htaccess = 0;

$disallow_proxy_on = 0;
$referer_on = 1;
$harvester_on = 0;
$request_on = 0;
$string_on = 1;
$union_on = 1;
$clike_on = 1;
$script_on = 1;

$disallow_proxy_htaccess = 0;
$referer_htaccess = 0;
$harvester_htaccess = 0;
$request_htaccess = 0;
$string_htaccess = 0;
$union_htaccess = 0;
$clike_htaccess = 0;
$script_htaccess = 0;

$disallow_proxy_notify = 1;
$referer_notify = 0;
$harvester_notify = 1;
$request_notify = 0;
$string_notify = 1;
$union_notify = 1;
$clike_notify = 1;
$script_notify = 1;



###############################################################################
# Banning Settings (old ban.txt)                                              #
###############################################################################

$ip_banlist = "";                                 # IP banlist
$email_banlist = "";                              # EMAIL banlist
$user_banlist = "";                               # USER banlist



###############################################################################
# Backup Settings (old BackupSettings.cgi)                                    #
###############################################################################

@backup_paths = qw();
$backupmethod = '';
$compressmethod = '';
$backupdir = '';
$lastbackup = 0;
$backupsettingsloaded = 0;

1;

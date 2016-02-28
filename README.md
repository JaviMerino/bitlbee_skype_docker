Simple tasks
============

Register an account on the bitlbee server
-----------------------------------------

    register $passwd

Account creation for skypeweb
-----------------------------

    account add skypeweb $skype_login $skype_passwd
    account skypeweb on

Log in bitlbee
--------------

    identify $passwd

Sensible nicks
--------------

    account set skypeweb nick_format %full_name

You need to reload the account to see proper names

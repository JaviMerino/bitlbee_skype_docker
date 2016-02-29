Build the container
===================

    docker build -t bitlbee_skype:1.1.0 .

Run the container
=================

    docker run --rm -p 6667:6667 -v $host_bitlbee_config:/var/lib/bitlbee bitlbee_skype:1.1.0

Simple tasks with bitlbee
=========================

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

    account skypeweb set nick_format %full_name

You need to reload the account to see proper names

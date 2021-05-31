Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F2739699C
	for <lists+linux-doc@lfdr.de>; Tue,  1 Jun 2021 00:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232173AbhEaWQT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 31 May 2021 18:16:19 -0400
Received: from hera.aquilenet.fr ([185.233.100.1]:55504 "EHLO
        hera.aquilenet.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbhEaWQS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 May 2021 18:16:18 -0400
X-Greylist: delayed 389 seconds by postgrey-1.27 at vger.kernel.org; Mon, 31 May 2021 18:16:17 EDT
Received: from localhost (localhost [127.0.0.1])
        by hera.aquilenet.fr (Postfix) with ESMTP id 55168CB8;
        Tue,  1 Jun 2021 00:08:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
        by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id eGXw1w4vTd9P; Tue,  1 Jun 2021 00:07:56 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
        by hera.aquilenet.fr (Postfix) with ESMTPSA id 804DF338;
        Tue,  1 Jun 2021 00:07:55 +0200 (CEST)
Received: from samy by begin with local (Exim 4.94.2)
        (envelope-from <samuel.thibault@ens-lyon.org>)
        id 1lnq4g-004CJ9-7v; Tue, 01 Jun 2021 00:07:54 +0200
Date:   Tue, 1 Jun 2021 00:07:54 +0200
From:   Samuel Thibault <samuel.thibault@ens-lyon.org>
To:     Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        speakup@linux-speakup.org
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org,
        grandmaster@al2klimov.de, rdunlap@infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: docs: Convert the Speakup guide to rst
Message-ID: <20210531220754.h4ep2dj65wl6hejf@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
        Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        speakup@linux-speakup.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, grandmaster@al2klimov.de,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210531215737.8431-1-igormtorrente@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="6p7iuyctd3yvxkzq"
Content-Disposition: inline
In-Reply-To: <20210531215737.8431-1-igormtorrente@gmail.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 55168CB8
X-Spamd-Result: default: False [0.50 / 15.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         HAS_ATTACHMENT(0.00)[];
         MIME_GOOD(-0.10)[multipart/mixed,text/plain];
         HAS_ORG_HEADER(0.00)[];
         RCVD_COUNT_THREE(0.00)[3];
         RCPT_COUNT_SEVEN(0.00)[8];
         FREEMAIL_TO(0.00)[gmail.com];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MID_RHS_NOT_FQDN(0.50)[]
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--6p7iuyctd3yvxkzq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Adding the speakup list in the loop.

Igor Matheus Andrade Torrente wrote:
> Modify some parts of the text and add the necessary formatting to leverage
> the rst features. Including links, code-blocks, bullet lists, etc.
> 
> Also, adds a table of contents at the beginning and a section to the
> license.
> 
> This change helps integrate this documentation to the rest of the rst
> documentation.

Mmm, I'm unsure how the result is readable with the speakup screen
reader itself. I have attached the result, could people on the speakup
mailing list check how well it goes? If it significantly degrades
readability, we'll have to reject the move to rst formatting, since in
the end it's people who use the speakup screen reader who need to be
able to read this document.

Samuel

--6p7iuyctd3yvxkzq
Content-Type: text/prs.fallenstein.rst; charset=us-ascii
Content-Disposition: attachment; filename="spkguide.rst"

========================
The Speakup User's Guide
========================

| For Speakup 3.1.2 and Later
| By Gene Collins
| Updated by others
| Last modified on Mon Jan 21 17:08:21 2021
| Document version 1.3


Copyright and License
=====================

| Copyright (c) 2005  Gene Collins
| Copyright (c) 2008  Samuel Thibault
| Copyright (c) 2009, 2010  the Speakup Team

Permission is granted to copy, distribute and/or modify this document
under the terms of the GNU Free Documentation License, Version 1.2 or
any later version published by the Free Software Foundation; with no
Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts. A
copy of the license is included in the section entitled "GNU Free
Documentation License".


Contents
========

* `Preface`_.

* `1.  Starting Speakup`_
* `2.  Basic operation`_
* `3.  Using the Speakup Help System`_
* `4.  Keys and Their Assigned Commands`_
* `5.  The Speakup Sys System`_
* `6.  Changing Synthesizers`_
* `7.  Loading modules`_
* `8.  Using Software Synthesizers`_
     - `8.1. Espeakup`_
     - `8.2. Speech Dispatcher`_
* `9.  Using The DecTalk PC Card`_
* `10.  Using Cursor Tracking`_
* `11.  Cut and Paste`_
* `12.  Changing the Pronunciation of Characters`_
* `13.  Mapping Keys`_
* `14.  Internationalizing Speakup`_
     - `14.1.  Files Under the i18n Subdirectory`_.
     - `14.2.1.  Loading Your Own Messages`_.
     - `14.2.2. Choose a language`_.
     - `14.3.  No Support for Non-Western-European Languages`_.
* `15.  Using Speakup's Windowing Capability`_
* `16.  Tools for Controlling Speakup`_
     - `16.1.  Speakupconf`_.
     - `16.2.  Talkwith`_


Preface
=======

The purpose of this document is to familiarize users with the user
interface to Speakup, a Linux Screen Reader.  If you need instructions
for installing or obtaining Speakup, visit the web site at
http://linux-speakup.org/.  Speakup is a set of patches to the standard
Linux kernel source tree.  It can be built as a series of modules, or as
a part of a monolithic kernel.  These details are beyond the scope of
this manual, but the user may need to be aware of the module
capabilities, depending on how your system administrator has installed
Speakup.  If Speakup is built as a part of a monolithic kernel, and the
user is using a hardware synthesizer, then Speakup will be able to
provide speech access from the time the kernel is loaded, until the time
the system is shutdown.  This means that if you have obtained Linux
installation media for a distribution which includes Speakup as a part
of its kernel, you will be able, as a blind person, to install Linux
with speech access unaided by a sighted person.  Again, these details
are beyond the scope of this manual, but the user should be aware of
them.  See the web site mentioned above for further details.


1.  Starting Speakup
====================

If your system administrator has installed Speakup to work with your
specific synthesizer by default, then all you need to do to use Speakup
is to boot your system, and Speakup should come up talking.  This
assumes of course  that your synthesizer is a supported hardware
synthesizer, and that it is either installed in or connected to your
system, and is if necessary powered on.

It is possible, however, that Speakup may have been compiled into the
kernel with no default synthesizer.  It is even possible that your
kernel has been compiled with support for some of the supported
synthesizers and not others.  If you find that this is the case, and
your synthesizer is supported but not available, complain to the person
who compiled and installed your kernel.  Or better yet, go to the web
site, and learn how to patch Speakup into your own kernel source, and
build and install your own kernel.

If your kernel has been compiled with Speakup, and has no default
synthesizer set, or you would like to use a different synthesizer than
the default one, then you may issue the following command at the boot
prompt of your boot loader.::

  linux speakup.synth=ltlk

This command would tell Speakup to look for and use a LiteTalk or
DoubleTalk LT at boot up.  You may replace the ltlk synthesizer keyword
with the keyword for whatever synthesizer you wish to use.  The
``speakup.synth`` parameter will accept the following keywords, provided
that support for the related synthesizers has been built into the
kernel.

| acntsa -- Accent SA
| acntpc -- Accent PC
| apollo -- Apollo
| audptr -- Audapter
| bns -- Braille 'n Speak
| dectlk -- DecTalk Express (old and new, db9 serial only)
| decext -- DecTalk (old) External
| dtlk -- DoubleTalk PC
| keypc -- Keynote Gold PC
| ltlk -- DoubleTalk LT, LiteTalk, or external Tripletalk (db9 serial only)
| spkout -- Speak Out
| txprt -- Transport
| dummy -- Plain text terminal

.. note::

   | Speakup does **NOT** support usb connections!
   | Speakup also does **NOT** support the internal Tripletalk!

Speakup does support two other synthesizers, but because they work in
conjunction with other software, they must be loaded as modules after
their related software is loaded, and so are not available at boot up.
These are as follows:

| decpc -- DecTalk PC (not available at boot up)
| soft -- One of several software synthesizers (not available at boot up)

See the sections on loading modules and software synthesizers later in
this manual for further details.  It should be noted here that the
speakup.synth boot parameter will have no effect if Speakup has been
compiled as modules.  In order for Speakup modules to be loaded during
the boot process, such action must be configured by your system
administrator.  This will mean that you will hear some, but not all,  of
the bootup messages.


2.  Basic operation
===================

Once you have booted the system, and if necessary, have supplied the
proper bootup parameter for your synthesizer, Speakup will begin
talking as soon as the kernel is loaded.  In fact, it will talk a lot!
It will speak all the boot up messages that the kernel prints on the
screen during the boot process.  This is because Speakup is not a
separate screen reader, but is actually built into the operating
system.  Since almost all console applications must print text on the
screen using the kernel, and must get their keyboard input through the
kernel, they are automatically handled properly by Speakup.  There are a
few exceptions, but we'll come to those later.

.. note::

  In this guide I will refer to the numeric keypad as the keypad.
  This is done because the speakupmap.map file referred to later in this
  manual uses the term keypad instead of numeric keypad.  Also I'm lazy
  and would rather only type one word.  So keypad it is.  Got it?  Good.

Most of the Speakup review keys are located on the keypad at the far
right of the keyboard.  The numlock key should be off, in order for these
to work.  If you toggle the numlock on, the keypad will produce numbers,
which is exactly what you want for spreadsheets and such.  For the
purposes of this guide, you should have the numlock turned off, which is
its default state at bootup.

You probably won't want to listen to all the bootup messages every time
you start your system, though it's a good idea to listen to them at
least once, just so you'll know what kind of information is available to
you during the boot process.  You can always review these messages after
bootup with the command::

  dmesg | more

In order to speed the boot process, and to silence the speaking of the
bootup messages, just press the keypad enter key.  This key is located
in the bottom right corner of the keypad.  Speakup will shut up and stay
that way, until you press another key.

You can check to see if the boot process has completed by pressing the 8
key on the keypad, which reads the current line.  This also has the
effect of starting Speakup talking again, so you can press keypad enter
to silence it again if the boot process has not completed.

When the boot process is complete, you will arrive at a "login" prompt.
At this point, you'll need to type in your user id and password, as
provided by your system administrator.  You will hear Speakup speak the
letters of your user id as you type it, but not the password.  This is
because the password is not displayed on the screen for security
reasons.  This has nothing to do with Speakup, it's a Linux security
feature.

Once you've logged in, you can run any Linux command or program which is
allowed by your user id.  Normal users will not be able to run programs
which require root privileges.

When you are running a program or command, Speakup will automatically
speak new text as it arrives on the screen.  You can at any time silence
the speech with keypad enter, or use any of the Speakup review keys.

Here are some basic Speakup review keys, and a short description of what
they do.

| keypad 1 -- read previous character
| keypad 2 -- read current character (pressing keypad 2 twice rapidly will speak
	      the current character phonetically)
| keypad 3 -- read next character
| keypad 4 -- read previous word
| keypad 5 -- read current word (press twice rapidly to spell the current word)
| keypad 6 -- read next word
| keypad 7 -- read previous line
| keypad 8 -- read current line (press twice rapidly to hear how much the
	      text on the current line is indented)
| keypad 9 -- read next line
| keypad period -- speak current cursor position and announce current
		   virtual console

It's also worth noting that the insert key on the keypad is mapped
as the speakup key.  Instead of pressing and releasing this key, as you
do under DOS or Windows, you hold it like a shift key, and press other
keys in combination with it.  For example, repeatedly holding keypad
insert, from now on called speakup, and keypad enter will toggle the
speaking of new text on the screen on and off.  This is not the same as
just pressing keypad enter by itself, which just silences the speech
until you hit another key.  When you hit speakup plus keypad enter,
Speakup will say, "You turned me off.", or "Hey, that's better."  When
Speakup is turned off, no new text on the screen will be spoken.  You
can still use the reading controls to review the screen however.


3.  Using the Speakup Help System
=================================

In order to enter the Speakup help system, press and hold the speakup
key (remember that this is the keypad insert key), and press the `f1` key.
You will hear the message:

"Press space to leave help, cursor up or down to scroll, or a letter to
go to commands in list."

When you press the `spacebar` to leave the help system, you will hear:

"Leaving help."

While you are in the Speakup help system, you can scroll up or down
through the list of available commands using the cursor keys.  The list
of commands is arranged in alphabetical order.  If you wish to jump to
commands in a specific part of the alphabet, you may press the letter of
the alphabet you wish to jump to.

You can also just explore by typing keyboard keys.  Pressing keys will
cause Speakup to speak the command associated with that key.  For
example, if you press the keypad 8 key, you will hear:

"Keypad 8 is line, say current."

You'll notice that some commands do not have keys assigned to them.
This is because they are very infrequently used commands, and are also
accessible through the sys system.  We'll discuss the sys system later
in this manual.

You'll also notice that some commands have two keys assigned to them.
This is because Speakup has a built in set of alternative key bindings
for laptop users.  The alternate speakup key is the `caps lock` key.  You
can press and hold the `caps lock` key, while pressing an alternate
speakup command key to activate the command.  On most laptops, the
numeric keypad is defined as the keys in the `j k l` area of the keyboard.

There is usually a function key which turns this keypad function on and
off, and some other key which controls the numlock state.  Toggling the
keypad functionality on and off can become a royal pain.  So, Speakup
gives you a simple way to get at an alternative set of key mappings for
your laptop.  These are also available by default on desktop systems,
because Speakup does not know whether it is running on a desktop or
laptop.  So you may choose which set of Speakup keys to use.  Some
system administrators may have chosen to compile Speakup for a desktop
system without this set of alternate key bindings, but these details are
beyond the scope of this manual.  To use the `caps lock` for its normal
purpose, hold the shift key while toggling the `caps lock` on and off.

.. note::

  Holding the `caps lock` key and pressing the `z` key will toggle the
  alternate `j k l` keypad on and off.


4.  Keys and Their Assigned Commands
====================================

In this section, we'll go through a list of all the speakup keys and
commands.  You can also get a list of commands and assigned keys from
the help system.

The following list was taken from the ``speakupmap.map`` file.  Key
assignments are on the left of the equal sign, and the associated
Speakup commands are on the right.  The designation "spk" means to press
and hold the speakup key, a.k.a. keypad insert, a.k.a. `caps lock`, while
pressing the other specified key.

| spk key_f9 = punc_level_dec
| spk key_f10 = punc_level_inc
| spk key_f11 = reading_punc_dec
| spk key_f12 = reading_punc_inc
| spk key_1 = vol_dec
| spk key_2 =  vol_inc
| spk key_3 = pitch_dec
| spk key_4 = pitch_inc
| spk key_5 = rate_dec
| spk key_6 = rate_inc
| key_kpasterisk = toggle_cursoring
| spk key_kpasterisk = speakup_goto
| spk key_f1 = speakup_help
| spk key_f2 = set_win
| spk key_f3 = clear_win
| spk key_f4 = enable_win
| spk key_f5 = edit_some
| spk key_f6 = edit_most
| spk key_f7 = edit_delim
| spk key_f8 = edit_repeat
| shift spk key_f9 = edit_exnum
|  key_kp7 = say_prev_line
| spk key_kp7 = left_edge
|  key_kp8 = say_line
| double  key_kp8 = say_line_indent
| spk key_kp8 = say_from_top
|  key_kp9 = say_next_line
| spk  key_kp9 = top_edge
|  key_kpminus = speakup_parked
| spk key_kpminus = say_char_num
|  key_kp4 = say_prev_word
| spk key_kp4 = say_from_left
|  key_kp5 = say_word
| double key_kp5 = spell_word
| spk key_kp5 = spell_phonetic
|  key_kp6 = say_next_word
| spk key_kp6 = say_to_right
|  key_kpplus = say_screen
| spk key_kpplus = say_win
|  key_kp1 = say_prev_char
| spk key_kp1 = right_edge
|  key_kp2 = say_char
| spk key_kp2 = say_to_bottom
| double key_kp2 = say_phonetic_char
|  key_kp3 = say_next_char
| spk  key_kp3 = bottom_edge
|  key_kp0 = spk_key
|  key_kpdot = say_position
| spk key_kpdot = say_attributes
| key_kpenter = speakup_quiet
| spk key_kpenter = speakup_off
| key_sysrq = speech_kill
|  key_kpslash = speakup_cut
| spk key_kpslash = speakup_paste
| spk key_pageup = say_first_char
| spk key_pagedown = say_last_char
| key_capslock = spk_key
|  spk key_z = spk_lock
| key_leftmeta = spk_key
| ctrl spk key_0 = speakup_goto
| spk key_u = say_prev_line
| spk key_i = say_line
| double spk key_i = say_line_indent
| spk key_o = say_next_line
| spk key_minus = speakup_parked
| shift spk key_minus = say_char_num
| spk key_j = say_prev_word
| spk key_k = say_word
| double spk key_k = spell_word
| spk key_l = say_next_word
| spk key_m = say_prev_char
| spk key_comma = say_char
| double spk key_comma = say_phonetic_char
| spk key_dot = say_next_char
| spk key_n = say_position
|  ctrl spk key_m = left_edge
|  ctrl spk key_y = top_edge
|  ctrl spk key_dot = right_edge
| ctrl spk key_p = bottom_edge
| spk key_apostrophe = say_screen
| spk key_h = say_from_left
| spk key_y = say_from_top
| spk key_semicolon = say_to_right
| spk key_p = say_to_bottom
| spk key_slash = say_attributes
|  spk key_enter = speakup_quiet
|  ctrl  spk key_enter = speakup_off
|  spk key_9 = speakup_cut
| spk key_8 = speakup_paste
| shift spk key_m = say_first_char
|  ctrl spk key_semicolon = say_last_char
| spk key_r = read_all_doc


5.  The Speakup Sys System
==========================

The Speakup screen reader also creates a speakup subdirectory as a part
of the sys system.

As a convenience, run as root::

  ln -s /sys/accessibility/speakup /speakup

to directly access speakup parameters from /speakup.
You can see these entries by typing the command::

  ls -1 /speakup/*

If you issue the above ls command, you will get back something like
this::

  /speakup/attrib_bleep
  /speakup/bell_pos
  /speakup/bleep_time
  /speakup/bleeps
  /speakup/cursor_time
  /speakup/delimiters
  /speakup/ex_num
  /speakup/key_echo
  /speakup/keymap
  /speakup/no_interrupt
  /speakup/punc_all
  /speakup/punc_level
  /speakup/punc_most
  /speakup/punc_some
  /speakup/reading_punc
  /speakup/repeats
  /speakup/say_control
  /speakup/say_word_ctl
  /speakup/silent
  /speakup/spell_delay
  /speakup/synth
  /speakup/synth_direct
  /speakup/version

  /speakup/i18n:
  announcements
  characters
  chartab
  colors
  ctl_keys
  formatted
  function_names
  key_names
  states

  /speakup/soft:
  caps_start
  caps_stop
  delay_time
  direct
  freq
  full_time
  jiffy_delta
  pitch
  inflection
  punct
  rate
  tone
  trigger_time
  voice
  vol

Notice the two subdirectories of ``/speakup``: ``/speakup/i18n`` and
``/speakup/soft``.
The `i18n` subdirectory is described in a later section.
The files under ``/speakup/soft`` represent settings that are specific to the
driver for the software synthesizer.  If you use the LiteTalk, your
synthesizer-specific settings would be found in ``/speakup/ltlk``.  In other words,
a subdirectory named ``/speakup/KWD`` is created to hold parameters specific
to the device whose keyword is KWD.
These parameters include volume, rate, pitch, and others.

In addition to using the Speakup hot keys to change such things as
volume, pitch, and rate, you can also echo values to the appropriate
entry in the ``/speakup`` directory.  This is very useful, since it
lets you control Speakup parameters from within a script.  How you
would write such scripts is somewhat beyond the scope of this manual,
but I will include a couple of simple examples here to give you a
general idea of what such scripts can do.

Suppose for example, that you wanted to control both the punctuation
level and the reading punctuation level at the same time.  For
simplicity, we'll call them punc0, punc1, punc2, and punc3.  The scripts
might look something like this:

.. code-block:: shell

  #!/bin/bash
  # punc0
  # set punc and reading punc levels to 0
  echo 0 >/speakup/punc_level
  echo 0 >/speakup/reading_punc
  echo Punctuation level set to 0.

  #!/bin/bash
  # punc1
  # set punc and reading punc levels to 1
  echo 1 >/speakup/punc_level
  echo 1 >/speakup/reading_punc
  echo Punctuation level set to 1.

  #!/bin/bash
  # punc2
  # set punc and reading punc levels to 2
  echo 2 >/speakup/punc_level
  echo 2 >/speakup/reading_punc
  echo Punctuation level set to 2.

  #!/bin/bash
  # punc3
  # set punc and reading punc levels to 3
  echo 3 >/speakup/punc_level
  echo 3 >/speakup/reading_punc
  echo Punctuation level set to 3.

If you were to store these four small scripts in a directory in your
path, perhaps ``/usr/local/bin``, and set the permissions to 755 with the
``chmod`` command, then you could change the default reading punc and
punctuation levels at the same time by issuing just one command.  For
example, if you were to execute the punc3 command at your shell prompt,
then the reading punc and punc level would both get set to 3.

.. note::

  The above scripts were written to work with bash, but
  regardless of which shell you use, you should be able to do something
  similar.

The Speakup sys system also has another interesting use.  You can echo
Speakup parameters into the sys system in a script during system
startup, and speakup will return to your preferred parameters every time
the system is rebooted.

Most of the Speakup sys parameters can be manipulated by a regular user
on the system.  However, there are a few parameters that are dangerous
enough that they should only be manipulated by the root user on your
system.  There are even some parameters that are read only, and cannot
be written to at all.  For example, the version entry in the Speakup
sys system is read only.  This is because there is no reason for a user
to tamper with the version number which is reported by Speakup.  Doing
an ``ls -l`` on ``/speakup/version`` will return this::

  -r--r--r--    1 root     root            0 Mar 21 13:46 /speakup/version

As you can see, the version entry in the Speakup sys system is read
only, is owned by root, and belongs to the root group.  Doing a cat of
``/speakup/version`` will display the Speakup version number, like
this::

  cat /speakup/version
  Speakup v-2.00 CVS: Thu Oct 21 10:38:21 EDT 2004
  synth dtlk version 1.1

The display shows the Speakup version number, along with the version
number of the driver for the current synthesizer.

Looking at entries in the Speakup sys system can be useful in many
ways.  For example, you might wish to know what level your volume is set
at.  You could type::

  cat /speakup/KWD/vol
  # Replace KWD with the keyword for your synthesizer, E.G., ltlk for LiteTalk.
  5

The number five which comes back is the level at which the synthesizer
volume is set at.

All the entries in the Speakup sys system are readable, some are
writable by root only, and some are writable by everyone.  Unless you
know what you are doing, you should probably leave the ones that are
writable by root only alone.  Most of the names are self explanatory.
Vol for controlling volume, pitch for pitch, inflection for pitch range, rate
for controlling speaking rate, etc.  If you find one you aren't sure about, you
can post a query on the Speakup list.


6.  Changing Synthesizers
=========================

It is possible to change to a different synthesizer while speakup is
running.  In other words, it is not necessary to reboot the system
in order to use a different synthesizer.  You can simply echo the
synthesizer keyword to the ``/speakup/synth`` sys entry.
Depending on your situation, you may wish to echo none to the synth
sys entry, to disable speech while one synthesizer is disconnected and
a second one is connected in its place.  Then echo the keyword for the
new synthesizer into the synth sys entry in order to start speech
with the newly connected synthesizer.  See the list of synthesizer
keywords in section 1 to find the keyword which matches your synth.


7.  Loading modules
===================

As mentioned earlier, Speakup can either be completely compiled into the
kernel, with the exception of the help module, or it can be compiled as
a series of modules.   When compiled as modules, Speakup will only be
able to speak some of the bootup messages if your system administrator
has configured the system to load the modules at boo time. The modules
can  be loaded after the file systems have been checked and mounted, or
from an initrd.  There is a third possibility.  Speakup can be compiled
with some components built into the kernel, and others as modules.  As
we'll see in the next section, this is particularly useful when you are
working with software synthesizers.

If Speakup is completely compiled as modules, then you must use the
modprobe command to load Speakup.  You do this by loading the module for
the synthesizer driver you wish to use.  The driver modules are all
named speakup_<keyword>, where <keyword> is the keyword for the
synthesizer you want.  So, in order to load the driver for the DecTalk
Express, you would type the following command::

  modprobe speakup_dectlk

Issuing this command would load the DecTalk Express driver and all other
related Speakup modules necessary to get Speakup up and running.

To completely unload Speakup, again presuming that it is entirely built
as modules, you would give the command::

  modprobe -r speakup_dectlk

The above command assumes you were running a DecTalk Express.  If you
were using a different synth, then you would substitute its keyword in
place of `dectlk`.

If you have multiple drivers loaded, you need to unload all of them, in
order to completely unload Speakup.
For example, if you have loaded both the dectlk and ltlk drivers, use the
command::

  modprobe -r speakup_dectlk speakup_ltlk

You cannot unload the driver for software synthesizers when a user-space
daemon is using ``/dev/softsynth``.  First, kill the daemon.  Next, remove
the driver with the command::

  modprobe -r speakup_soft

Now, suppose we have a situation where the main Speakup component
is built into the kernel, and some or all of the drivers are built as
modules.  Since the main part of Speakup is compiled into the kernel, a
partial Speakup sys system has been created which we can take advantage
of by simply echoing the synthesizer keyword into the
``/speakup/synth`` sys entry.  This will cause the kernel to
automatically load the appropriate driver module, and start Speakup
talking.  To switch to another synth, just echo a new keyword to the
synth sys entry.  For example, to load the DoubleTalk LT driver,
you would type::

  echo ltlk >/speakup/synth

You can use the ``modprobe -r`` command to unload driver modules, regardless
of whether the main part of Speakup has been built into the kernel or
not.


8.  Using Software Synthesizers
===============================

Using a software synthesizer requires that some other software be
installed and running on your system.  For this reason, software
synthesizers are not available for use at bootup, or during a system
installation process.
There are two freely-available solutions for software speech: Espeakup and
Speech Dispatcher.
These are described in subsections `8.1. Espeakup`_ and
`8.2. Speech Dispatcher`_, respectively.

During the rest of this section, we assume that `speakup_soft` is either
built in to your kernel, or loaded as a module.

If your system does not have udev installed , before you can use a
software synthesizer, you must have created the ``/dev/softsynth`` device.
If you have not already done so, issue the following commands as root::

  cd /dev
  mknod softsynth c 10 26

While we are at it, we might just as well create the ``/dev/synth`` device,
which can be used to let user space programs send information to your
synthesizer.  To create ``/dev/synth``, change to the ``/dev`` directory, and
issue the following command as root::

  mknod synth c 10 25

of both.

8.1. Espeakup
-------------

Espeakup is a connector between Speakup and the eSpeak software synthesizer.
Espeakup may already be available as a package for your distribution
of Linux.  If it is not packaged, you need to install it manually.
You can find it in the ``contrib/`` subdirectory of the Speakup sources.
The filename is ``espeakup-$VERSION.tar.bz2``, where ``$VERSION``
depends on the current release of Espeakup.  The Speakup 3.1.2 source
ships with version 0.71 of Espeakup.
The README file included with the Espeakup sources describes the process
of manual installation.

Assuming that Espeakup is installed, either by the user or by the distributor,
follow these steps to use it.

Tell Speakup to use the "soft driver::

  echo soft > /speakup/synth

Finally, start the espeakup program.  There are two ways to do it.
Both require root privileges.

If Espeakup was installed as a package for your Linux distribution,
you probably have a distribution-specific script that controls the operation
of the daemon.  Look for a file named espeakup under ``/etc/init.d`` or
``/etc/rc.d``.  Execute the following command with root privileges::

  /etc/init.d/espeakup start

Replace ``init.d`` with ``rc.d``, if your distribution uses scripts located
under ``/etc/rc.d``.
Your distribution will also have a procedure for starting daemons at
boot-time, so it is possible to have software speech as soon as user-space
daemons are started by the bootup scripts.
These procedures are not described in this document.

If you built Espeakup manually, the ``make install`` step placed the binary
under ``/usr/bin``.
Run the following command as root::

  /usr/bin/espeakup

Espeakup should start speaking.

8.2. Speech Dispatcher
----------------------

For this option, you must have a package called
Speech Dispatcher running on your system, and it must be configured to
work with one of its supported software synthesizers.

Two open source synthesizers you might use are Flite and Festival.  You
might also choose to purchase the Software DecTalk from Fonix Sales Inc.
If you run a google search for Fonix, you'll find their web site.

You can obtain a copy of Speech Dispatcher from free(b)soft at
http://www.freebsoft.org/.  Follow the installation instructions that
come with Speech Dispatcher in order to install and configure Speech
Dispatcher.  You can check out the web site for your Linux distribution
in order to get a copy of either Flite or Festival.  Your Linux
distribution may also have a precompiled Speech Dispatcher package.

Once you've installed, configured, and tested Speech Dispatcher with your
chosen software synthesizer, you still need one more piece of software
in order to make things work.  You need a package called speechd-up.
You get it from the free(b)soft web site mentioned above.  After you've
compiled and installed speechd-up, you are almost ready to begin using
your software synthesizer.

Now you can begin using your software synthesizer.  In order to do so,
echo the soft keyword to the synth sys entry like this::

  echo soft >/speakup/synth

Next run the speechd_up command like this::

  speechd_up &

Your synth should now start talking, and you should be able to adjust
the pitch, rate, etc.


9.  Using The DecTalk PC Card
=============================

The DecTalk PC card is an ISA card that is inserted into one of the ISA
slots in your computer.  It requires that the DecTalk PC software be
installed on your computer, and that the software be loaded onto the
Dectalk PC card before it can be used.

You can get the ``dec_pc.tgz`` file from the linux-speakup.org site.  The
``dec_pc.tgz`` file is in the ``~ftp/pub/linux/speakup`` directory.

After you have downloaded the ``dec_pc.tgz`` file, untar it in your home
directory, and read the Readme file in the newly created ``dec_pc``
directory.

The easiest way to get the software working is to copy the entire ``dec_pc``
directory into ``/user/local/lib``.  To do this, su to root in your home
directory, and issue the command::

  cp dec_pc /usr/local/lib

You will need to copy the dtload command from the dec_pc directory to a
directory in your path. Either ``/usr/bin`` or ``/usr/local/bin`` is a
good choice.

You can now run the dtload command in order to load the DecTalk PC
software onto the card.  After you have done this, ``echo`` the decpc
keyword to the synth entry in the sys system like this::

  echo decpc >/speakup/synth

Your DecTalk PC should start talking, and then you can adjust the pitch,
rate, volume, voice, etc.  The voice entry in the Speakup sys system
will accept a number from 0 through 7 for the DecTalk PC synthesizer,
which will give you access to some of the DecTalk voices.


10.  Using Cursor Tracking
==========================

In Speakup version 2.0 and later, cursor tracking is turned on by
default.  This means that when you are using an editor, Speakup will
automatically speak characters as you move left and right with the
cursor keys, and lines as you move up and down with the cursor keys.
This is the traditional sort of cursor tracking.
Recent versions of Speakup provide two additional ways to control the
text that is spoken when the cursor is moved:
"highlight tracking" and "read window."
They are described later in this section.
Sometimes, these modes get in your way, so you can disable cursor tracking
altogether.

You may select among the various forms of cursor tracking using the keypad
asterisk key.
Each time you press this key, a new mode is selected, and Speakup speaks
the name of the new mode.  The names for the four possible states of cursor
tracking are: "cursoring on", "highlight tracking", "read window",
and "cursoring off."  The keypad asterisk key moves through the list of
modes in a circular fashion.

If highlight tracking is enabled, Speakup tracks highlighted text,
rather than the cursor itself. When you move the cursor with the arrow keys,
Speakup speaks the currently highlighted information.
This is useful when moving through various menus and dialog boxes.
If cursor tracking isn't helping you while navigating a menu,
try highlight tracking.

With the "read window" variety of cursor tracking, you can limit the text
that Speakup speaks by specifying a window of interest on the screen.
See section 15 for a description of the process of defining windows.
When you move the cursor via the arrow keys, Speakup only speaks
the contents of the window.  This is especially helpful when you are hearing
superfluous speech.  Consider the following example.

Suppose that you are at a shell prompt.  You use bash, and you want to
explore your command history using the up and down arrow keys.  If you
have enabled cursor tracking, you will hear two pieces of information.
Speakup speaks both your shell prompt and the current entry from the
command history.  You may not want to hear the prompt repeated
each time you move, so you can silence it by specifying a window.  Find
the last line of text on the screen.  Clear the current window by pressing
the key combination speakup `f3`.  Use the review cursor to find the first
character that follows your shell prompt.  Press speakup + `f2` twice, to
define a one-line window.  The boundaries of the window are the
character following the shell prompt and the end of the line.  Now, cycle
through the cursor tracking modes using keypad asterisk, until Speakup
says "read window."  Move through your history using your arrow keys.
You will notice that Speakup no longer speaks the redundant prompt.

Some folks like to turn cursor tracking off while they are using the
lynx web browser.  You definitely want to turn cursor tracking off when
you are using the alsamixer application.  Otherwise, you won't be able
to hear your mixer settings while you are using the arrow keys.


11.  Cut and Paste
==================

One of Speakup's more useful features is the ability to cut and paste
text on the screen.  This means that you can capture information from a
program, and paste that captured text into a different place in the
program, or into an entirely different program, which may even be
running on a different console.

For example, in this manual, we have made references to several web
sites.  It would be nice if you could cut and paste these urls into your
web browser.  Speakup does this quite nicely.  Suppose you wanted to
past the following url into your browser:

http://linux-speakup.org/

Use the speakup review keys to position the reading cursor on the first
character of the above url.  When the reading cursor is in position,
press the keypad slash key once.  Speakup will say, "mark".  Next,
position the reading cursor on the rightmost character of the above
url. Press the keypad slash key once again to actually cut the text
from the screen.  Speakup will say, "cut".  Although we call this
cutting, Speakup does not actually delete the cut text from the screen.
It makes a copy of the text in a special buffer for later pasting.

Now that you have the url cut from the screen, you can paste it into
your browser, or even paste the url on a command line as an argument to
your browser.

Suppose you want to start lynx and go to the Speakup site.

You can switch to a different console with the alt left and right
arrows, or you can switch to a specific console by typing alt and a
function key.  These are not Speakup commands, just standard Linux
console capabilities.

Once you've changed to an appropriate console, and are at a shell prompt,
type the word lynx, followed by a space.  Now press and hold the speakup
key, while you type the keypad slash character.  The url will be pasted
onto the command line, just as though you had typed it in.  Press the
enter key to execute the command.

The paste buffer will continue to hold the cut information, until a new
mark and cut operation is carried out.  This means you can paste the cut
information as many times as you like before doing another cut
operation.

You are not limited to cutting and pasting only one line on the screen.
You can also cut and paste rectangular regions of the screen.  Just
position the reading cursor at the top left corner of the text to be
cut, mark it with the keypad slash key, then position the reading cursor
at the bottom right corner of the region to be cut, and cut it with the
keypad slash key.


12.  Changing the Pronunciation of Characters
=============================================

Through the ``/speakup/i18n/characters`` sys entry, Speakup gives you the
ability to change how Speakup pronounces a given character.  You could,
for example, change how some punctuation characters are spoken.  You can
even change how Speakup will pronounce certain letters.

You may, for example, wish to change how Speakup pronounces the z
character.  The author of Speakup, Kirk Reiser, is Canadian, and thus
believes that the z should be pronounced zed.  If you are an American,
you might wish to use the zee pronunciation instead of zed.  You can
change the pronunciation of both the upper and lower case z with the
following two commands::

  echo 90 zee >/speakup/characters
  echo 122 zee >/speakup/characters

Let's examine the parts of the two previous commands.  They are issued
at the shell prompt, and could be placed in a startup script.

The word echo tells the shell that you want to have it display the
string of characters that follow the word echo.  If you were to just
type::

  echo hello.

You would get the word hello printed on your screen as soon as you
pressed the enter key.  In this case, we are echoing strings that we
want to be redirected into the sys system.

The numbers 90 and 122 in the above echo commands are the ascii numeric
values for the upper and lower case z, the characters we wish to change.

The string zee is the pronunciation that we want Speakup to use for the
upper and lower case z.

The ``>`` symbol redirects the output of the echo command to a file, just
like in DOS, or at the Windows command prompt.

And finally, ``/speakup/i18n/characters`` is the file entry in the sys system
where we want the output to be directed.  Speakup looks at the numeric
value of the character we want to change, and inserts the pronunciation
string into an internal table.

You can look at the whole table with the following command::

  cat /speakup/i18n/characters

Speakup will then print out the entire character pronunciation table.  I
won't display it here, but leave you to look at it at your convenience.


13.  Mapping Keys
=================

Speakup has the capability of allowing you to assign or "map" keys to
internal Speakup commands.  This section necessarily assumes you have a
Linux kernel source tree installed, and that it has been patched and
configured with Speakup.  How you do this is beyond the scope of this
manual.  For this information, visit the Speakup web site at
http://linux-speakup.org/.  The reason you'll need the kernel source
tree patched with Speakup is that the genmap utility you'll need for
processing keymaps is in the
``/usr/src/linux-<version_number>/drivers/char/speakup`` directory.  The
``<version_number>`` in the above directory path is the version number of
the Linux source tree you are working with.

So ok, you've gone off and gotten your kernel source tree, and patched
and configured it.  Now you can start manipulating keymaps.

You can either use the
``/usr/src/linux-<version_number>/drivers/char/speakup/speakupmap.map`` file
included with the Speakup source, or you can cut and paste the copy in
section 4 into a separate file.  If you use the one in the Speakup
source tree, make sure you make a backup of it before you start making
changes.  You have been warned!

Suppose that you want to swap the key assignments for the Speakup
say_last_char and the Speakup say_first_char commands.  The
speakupmap.map lists the key mappings for these two commands as follows::

  spk key_pageup = say_first_char
  spk key_pagedown = say_last_char

You can edit your copy of the speakupmap.map file and swap the command
names on the right side of the ``=`` (equals) sign.  You did make a backup,
right?  The new keymap lines would look like this::

  spk key_pageup = say_last_char
  spk key_pagedown = say_first_char

After you edit your copy of the speakupmap.map file, save it under a new
file name, perhaps newmap.map.  Then exit your editor and return to the
shell prompt.

You are now ready to load your keymap with your swapped key assignments.
Assuming that you saved your new keymap as the file newmap.map, you
would load your keymap into the sys system like this::

  /usr/src/linux-<version_number>/drivers/char/speakup/genmap newmap.map >/speakup/keymap


.. note::

  Remember to substitute your kernel version number for the
  ``<version_number>`` in the above command.

Your say first and say last characters should now be swapped.  Pressing
speakup pagedown should read you the first non-whitespace character on
the line your reading cursor is in, and pressing speakup pageup should
read you the last character on the line your reading cursor is in.

.. note::

  These new mappings will only stay in effect until you reboot,
  or until you load another keymap.

One final warning.  If you try to load a partial map, you will quickly
find that all the mappings you didn't include in your file got deleted
from the working map.  Be extremely careful, and always make a backup!
You have been warned!


14.  Internationalizing Speakup
===============================

Speakup indicates various conditions to the user by speaking messages.
For instance, when you move to the left edge of the screen with the
review keys, Speakup says, "left."
Prior to version 3.1.0 of Speakup, all of these messages were in English,
and they could not be changed.  If you used a non-English synthesizer,
you still heard English messages, such as "left" and "cursoring on."
In version 3.1.0 or higher, one may load translations for the various
messages via the ``/sys`` filesystem.

The directory ``/speakup/i18n`` contains several collections of messages.
Each group of messages is stored in its own file.
The following section lists all of these files, along with a brief description
of each.

14.1.  Files Under the i18n Subdirectory
----------------------------------------

announcements
  This file contains various general announcements, most of which cannot
  be categorized.  You will find messages such as "You killed Speakup",
  "I'm alive", "leaving help", "parked", "unparked", and others.
  You will also find the names of the screen edges and cursor tracking modes
  here.

characters
  See `12.  Changing the Pronunciation of Characters`_ for a description
  of this file.

chartab
  See `12.  Changing the Pronunciation of Characters`_.  Unlike the rest
  of the files in the i18n subdirectory, this one does not contain messages
  to be spoken.

colors
  When you use the "say attributes" function, Speakup says the name of the
  foreground and background colors.  These names come from the i18n/colors
  file.

ctl_keys
  Here, you will find names of control keys.  These are used with Speakup's
  say_control feature.

formatted
  This group of messages contains embedded formatting codes, to specify
  the type and width of displayed data.  If you change these, you must
  preserve all of the formatting codes, and they must appear in the order
  used by the default messages.

function_names
  Here, you will find a list of names for Speakup functions.  These are used
  by the help system.  For example, suppose that you have activated help mode,
  and you pressed keypad 3.  Speakup says:
  "keypad 3 is character, say next."
  The message "character, say next" names a Speakup function, and it
  comes from this function_names file.

key_names
  Again, key_names is used by Speakup's help system.  In the previous
  example, Speakup said that you pressed "keypad 3."
  This name came from the key_names file.

states
  This file contains names for key states.
  Again, these are part of the help system.  For instance, if you had pressed
  speakup + keypad 3, you would hear:
  "speakup keypad 3 is go to bottom edge."
  The speakup key is depressed, so the name of the key state is speakup.
  This part of the message comes from the states collection.

14.2.1.  Loading Your Own Messages
----------------------------------

The files under the i18n subdirectory all follow the same format.
They consist of lines, with one message per line.
Each message is represented by a number, followed by the text of the message.
The number is the position of the message in the given collection.
For example, if you view the file ``/speakup/i18n/colors``, you will see the
following list::

  0 - black
  1 - blue
  2 - green
  3 - cyan
  4 - red
  5 - magenta
  6 - yellow
  7 - white
  8 - grey

You can change one message, or you can change a whole group.
To load a whole collection of messages from a new source, simply use
the cp command::

  cp ~/my_colors /speakup/i18n/colors

You can change an individual message with the echo command,
as shown in the following example.

The Spanish name for the color blue is azul.
Looking at the colors file, we see that the name "blue" is at position 1
within the colors group.  Let's change blue to azul::

  echo '1 azul' > /speakup/i18n/colors

The next time that Speakup says message 1 from the colors group, it will
say "azul", rather than "blue."

14.2.2. Choose a language
-------------------------

In the future, translations into various languages will be made available,
and most users will just load the files necessary for their language. So far,
only French language is available beyond native Canadian English language.

French is only available after you are logged in.

Canadian English is the default language. To toggle another language,
download the source of Speakup and untar it in your home directory. The
following command should let you do this::

  tar xvjf speakup-<version>.tar.bz2

where ``<version>`` is the version number of the application.

Next, change to the newly created directory, then into the tools/ directory, and
run the script speakup_setlocale. You are asked the language that you want to
use. Type the number associated to your language (e.g. fr for French) then press
Enter. Needed files are copied in the i18n directory.

Note: the speakupconf must be installed on your system so that settings are saved.
Otherwise, you will have an error: your language will be loaded but you will
have to run the script again every time Speakup restarts.
See section 16.1. for information about speakupconf.

You will have to repeat these steps for any change of locale, i.e. if you wish
change the speakup's language or charset (iso-8859-15 ou UTF-8).

If you wish store the settings, note that at your next login, you will need to
do::

  speakup load

Alternatively, you can add the above line to your file
``~/.bashrc`` or ``~/.bash_profile``.

If your system administrator ran himself the script, all the users will be able
to change from English to the language choosed by root and do directly
speakupconf load (or add this to the ``~/.bashrc`` or
``~/.bash_profile`` file). If there are several languages to handle, the
administrator (or every user) will have to run the first steps until speakupconf
save, choosing the appropriate language, in every user's home directory. Every
user will then be able to do speakupconf load, Speakup will load his own settings.

14.3.  No Support for Non-Western-European Languages
----------------------------------------------------

As of the current release, Speakup only supports Western European languages.
Support for the extended characters used by languages outside of the Western
European family of languages is a work in progress.


15.  Using Speakup's Windowing Capability
=========================================

Speakup has the capability of defining and manipulating windows on the
screen.  Speakup uses the term "Window", to mean a user defined area of
the screen.  The key strokes for defining and manipulating Speakup
windows are as follows::

  speakup + f2 -- Set the bounds of the window.
  Speakup + f3 -- clear the current window definition.
  speakup + f4 -- Toggle window silence on and off.
  speakup + keypad plus -- Say the currently defined window.

These capabilities are useful for tracking a certain part of the screen
without rereading the whole screen, or for silencing a part of the
screen that is constantly changing, such as a clock or status line.

There is no way to save these window settings, and you can only have one
window defined for each virtual console.  There is also no way to have
windows automatically defined for specific applications.

In order to define a window, use the review keys to move your reading
cursor to the beginning of the area you want to define.  Then press
speakup + `f2`.  Speakup will tell you that the window starts at the
indicated row and column position.  Then move the reading cursor to the
end of the area to be defined as a window, and press speakup + `f2` again.
If there is more than one line in the window, Speakup will tell you
that the window ends at the indicated row and column position.  If there
is only one line in the window, then Speakup will tell you that the
window is the specified line on the screen.  If you are only defining a
one line window, you can just press speakup + `f2` twice after placing the
reading cursor on the line you want to define as a window.  It is not
necessary to position the reading cursor at the end of the line in order
to define the whole line as a window.


16.  Tools for Controlling Speakup
==================================

The speakup distribution includes extra tools (in the tools directory)
which were written to make speakup easier to use.  This section will
briefly describe the use of these tools.

16.1.  Speakupconf
------------------

speakupconf began life as a contribution from Steve Holmes, a member of
the speakup community.  We would like to thank him for his work on the
early versions of this project.

This script may be installed as part of your linux distribution, but if
it isn't, the recommended places to put it are ``/usr/local/bin`` or
``/usr/bin``.  This script can be run by any user, so it does not require
root privileges.

Speakupconf allows you to save and load your Speakup settings.  It works
by reading and writing the ``/sys`` files described above.

The directory that speakupconf uses to store your settings depends on
whether it is run from the root account.  If you execute speakupconf as
root, it uses the directory ``/etc/speakup``.  Otherwise, it uses the directory
``~/.speakup``, where ``~`` is your home directory.
Anyone who needs to use Speakup from your console can load his own custom
settings with this script.

speakupconf takes one required argument: load or save.
Use the command::

  speakupconf save

to save your Speakup settings, and::

  speakupconf load

to load them into Speakup.

A second argument may be specified to use an alternate directory to
load or save the speakup parameters.

16.2.  Talkwith
---------------

Charles Hallenbeck, another member of the speakup community, wrote the
initial versions of this script, and we would also like to thank him for
his work on it.

This script needs root privileges to run, so if it is not installed as
part of your linux distribution, the recommended places to install it
are ``/usr/local/sbin`` or ``/usr/sbin``.

Talkwith allows you to switch synthesizers on the fly.  It takes a synthesizer
name as an argument.  For instance,
talkwith dectlk
causes Speakup to use the DecTalk Express.  If you wish to switch to a
software synthesizer, you must also indicate which daemon you wish to
use.  There are two possible choices:
spd and espeakup.  spd is an abbreviation for speechd-up.
If you wish to use espeakup for software synthesis, give the command
talkwith soft espeakup
To use speechd-up, type::

  talkwith soft spd

Any arguments that follow the name of the daemon are passed to the daemon
when it is invoked.  For instance::

  talkwith espeakup --default-voice=fr

causes espeakup to use the French voice.

.. note::

  Talkwith must always be executed with root privileges.

Talkwith does not attempt to load your settings after the new
synthesizer is activated.  You can use speakupconf to load your settings
if desired.


Document License
================

                GNU Free Documentation License
                  Version 1.2, November 2002


Copyright (C) 2000,2001,2002  Free Software Foundation, Inc.
Everyone is permitted to copy and distribute verbatim copies
of this license document, but changing it is not allowed.


0. PREAMBLE

The purpose of this License is to make a manual, textbook, or other
functional and useful document "free" in the sense of freedom: to
assure everyone the effective freedom to copy and redistribute it,
with or without modifying it, either commercially or noncommercially.
Secondarily, this License preserves for the author and publisher a way
to get credit for their work, while not being considered responsible
for modifications made by others.

This License is a kind of "copyleft", which means that derivative
works of the document must themselves be free in the same sense.  It
complements the GNU General Public License, which is a copyleft
license designed for free software.

We have designed this License in order to use it for manuals for free
software, because free software needs free documentation: a free
program should come with manuals providing the same freedoms that the
software does.  But this License is not limited to software manuals;
it can be used for any textual work, regardless of subject matter or
whether it is published as a printed book.  We recommend this License
principally for works whose purpose is instruction or reference.


1. APPLICABILITY AND DEFINITIONS

This License applies to any manual or other work, in any medium, that
contains a notice placed by the copyright holder saying it can be
distributed under the terms of this License.  Such a notice grants a
world-wide, royalty-free license, unlimited in duration, to use that
work under the conditions stated herein.  The "Document", below,
refers to any such manual or work.  Any member of the public is a
licensee, and is addressed as "you".  You accept the license if you
copy, modify or distribute the work in a way requiring permission
under copyright law.

A "Modified Version" of the Document means any work containing the
Document or a portion of it, either copied verbatim, or with
modifications and/or translated into another language.

A "Secondary Section" is a named appendix or a front-matter section of
the Document that deals exclusively with the relationship of the
publishers or authors of the Document to the Document's overall subject
(or to related matters) and contains nothing that could fall directly
within that overall subject.  (Thus, if the Document is in part a
textbook of mathematics, a Secondary Section may not explain any
mathematics.)  The relationship could be a matter of historical
connection with the subject or with related matters, or of legal,
commercial, philosophical, ethical or political position regarding
them.

The "Invariant Sections" are certain Secondary Sections whose titles
are designated, as being those of Invariant Sections, in the notice
that says that the Document is released under this License.  If a
section does not fit the above definition of Secondary then it is not
allowed to be designated as Invariant.  The Document may contain zero
Invariant Sections.  If the Document does not identify any Invariant
Sections then there are none.

The "Cover Texts" are certain short passages of text that are listed,
as Front-Cover Texts or Back-Cover Texts, in the notice that says that
the Document is released under this License.  A Front-Cover Text may
be at most 5 words, and a Back-Cover Text may be at most 25 words.

A "Transparent" copy of the Document means a machine-readable copy,
represented in a format whose specification is available to the
general public, that is suitable for revising the document
straightforwardly with generic text editors or (for images composed of
pixels) generic paint programs or (for drawings) some widely available
drawing editor, and that is suitable for input to text formatters or
for automatic translation to a variety of formats suitable for input
to text formatters.  A copy made in an otherwise Transparent file
format whose markup, or absence of markup, has been arranged to thwart
or discourage subsequent modification by readers is not Transparent.
An image format is not Transparent if used for any substantial amount
of text.  A copy that is not "Transparent" is called "Opaque".

Examples of suitable formats for Transparent copies include plain
ASCII without markup, Texinfo input format, LaTeX input format, SGML
or XML using a publicly available DTD, and standard-conforming simple
HTML, PostScript or PDF designed for human modification.  Examples of
transparent image formats include PNG, XCF and JPG.  Opaque formats
include proprietary formats that can be read and edited only by
proprietary word processors, SGML or XML for which the DTD and/or
processing tools are not generally available, and the
machine-generated HTML, PostScript or PDF produced by some word
processors for output purposes only.

The "Title Page" means, for a printed book, the title page itself,
plus such following pages as are needed to hold, legibly, the material
this License requires to appear in the title page.  For works in
formats which do not have any title page as such, "Title Page" means
the text near the most prominent appearance of the work's title,
preceding the beginning of the body of the text.

A section "Entitled XYZ" means a named subunit of the Document whose
title either is precisely XYZ or contains XYZ in parentheses following
text that translates XYZ in another language.  (Here XYZ stands for a
specific section name mentioned below, such as "Acknowledgements",
"Dedications", "Endorsements", or "History".)  To "Preserve the Title"
of such a section when you modify the Document means that it remains a
section "Entitled XYZ" according to this definition.

The Document may include Warranty Disclaimers next to the notice which
states that this License applies to the Document.  These Warranty
Disclaimers are considered to be included by reference in this
License, but only as regards disclaiming warranties: any other
implication that these Warranty Disclaimers may have is void and has
no effect on the meaning of this License.


2. VERBATIM COPYING

You may copy and distribute the Document in any medium, either
commercially or noncommercially, provided that this License, the
copyright notices, and the license notice saying this License applies
to the Document are reproduced in all copies, and that you add no other
conditions whatsoever to those of this License.  You may not use
technical measures to obstruct or control the reading or further
copying of the copies you make or distribute.  However, you may accept
compensation in exchange for copies.  If you distribute a large enough
number of copies you must also follow the conditions in section 3.

You may also lend copies, under the same conditions stated above, and
you may publicly display copies.


3. COPYING IN QUANTITY

If you publish printed copies (or copies in media that commonly have
printed covers) of the Document, numbering more than 100, and the
Document's license notice requires Cover Texts, you must enclose the
copies in covers that carry, clearly and legibly, all these Cover
Texts: Front-Cover Texts on the front cover, and Back-Cover Texts on
the back cover.  Both covers must also clearly and legibly identify
you as the publisher of these copies.  The front cover must present
the full title with all words of the title equally prominent and
visible.  You may add other material on the covers in addition.
Copying with changes limited to the covers, as long as they preserve
the title of the Document and satisfy these conditions, can be treated
as verbatim copying in other respects.

If the required texts for either cover are too voluminous to fit
legibly, you should put the first ones listed (as many as fit
reasonably) on the actual cover, and continue the rest onto adjacent
pages.

If you publish or distribute Opaque copies of the Document numbering
more than 100, you must either include a machine-readable Transparent
copy along with each Opaque copy, or state in or with each Opaque copy
a computer-network location from which the general network-using
public has access to download using public-standard network protocols
a complete Transparent copy of the Document, free of added material.
If you use the latter option, you must take reasonably prudent steps,
when you begin distribution of Opaque copies in quantity, to ensure
that this Transparent copy will remain thus accessible at the stated
location until at least one year after the last time you distribute an
Opaque copy (directly or through your agents or retailers) of that
edition to the public.

It is requested, but not required, that you contact the authors of the
Document well before redistributing any large number of copies, to give
them a chance to provide you with an updated version of the Document.


4. MODIFICATIONS

You may copy and distribute a Modified Version of the Document under
the conditions of sections 2 and 3 above, provided that you release
the Modified Version under precisely this License, with the Modified
Version filling the role of the Document, thus licensing distribution
and modification of the Modified Version to whoever possesses a copy
of it.  In addition, you must do these things in the Modified Version:

A. Use in the Title Page (and on the covers, if any) a title distinct
   from that of the Document, and from those of previous versions
   (which should, if there were any, be listed in the History section
   of the Document).  You may use the same title as a previous version
   if the original publisher of that version gives permission.
B. List on the Title Page, as authors, one or more persons or entities
   responsible for authorship of the modifications in the Modified
   Version, together with at least five of the principal authors of the
   Document (all of its principal authors, if it has fewer than five),
   unless they release you from this requirement.
C. State on the Title page the name of the publisher of the
   Modified Version, as the publisher.
D. Preserve all the copyright notices of the Document.
E. Add an appropriate copyright notice for your modifications
   adjacent to the other copyright notices.
F. Include, immediately after the copyright notices, a license notice
   giving the public permission to use the Modified Version under the
   terms of this License, in the form shown in the Addendum below.
G. Preserve in that license notice the full lists of Invariant Sections
   and required Cover Texts given in the Document's license notice.
H. Include an unaltered copy of this License.
I. Preserve the section Entitled "History", Preserve its Title, and add
   to it an item stating at least the title, year, new authors, and
   publisher of the Modified Version as given on the Title Page.  If
   there is no section Entitled "History" in the Document, create one
   stating the title, year, authors, and publisher of the Document as
   given on its Title Page, then add an item describing the Modified
   Version as stated in the previous sentence.
J. Preserve the network location, if any, given in the Document for
   public access to a Transparent copy of the Document, and likewise
   the network locations given in the Document for previous versions
   it was based on.  These may be placed in the "History" section.
   You may omit a network location for a work that was published at
   least four years before the Document itself, or if the original
   publisher of the version it refers to gives permission.
K. For any section Entitled "Acknowledgements" or "Dedications",
   Preserve the Title of the section, and preserve in the section all
   the substance and tone of each of the contributor acknowledgements
   and/or dedications given therein.
L. Preserve all the Invariant Sections of the Document,
   unaltered in their text and in their titles.  Section numbers
   or the equivalent are not considered part of the section titles.
M. Delete any section Entitled "Endorsements".  Such a section
   may not be included in the Modified Version.
N. Do not retitle any existing section to be Entitled "Endorsements"
   or to conflict in title with any Invariant Section.
O. Preserve any Warranty Disclaimers.

If the Modified Version includes new front-matter sections or
appendices that qualify as Secondary Sections and contain no material
copied from the Document, you may at your option designate some or all
of these sections as invariant.  To do this, add their titles to the
list of Invariant Sections in the Modified Version's license notice.
These titles must be distinct from any other section titles.

You may add a section Entitled "Endorsements", provided it contains
nothing but endorsements of your Modified Version by various
parties--for example, statements of peer review or that the text has
been approved by an organization as the authoritative definition of a
standard.

You may add a passage of up to five words as a Front-Cover Text, and a
passage of up to 25 words as a Back-Cover Text, to the end of the list
of Cover Texts in the Modified Version.  Only one passage of
Front-Cover Text and one of Back-Cover Text may be added by (or
through arrangements made by) any one entity.  If the Document already
includes a cover text for the same cover, previously added by you or
by arrangement made by the same entity you are acting on behalf of,
you may not add another; but you may replace the old one, on explicit
permission from the previous publisher that added the old one.

The author(s) and publisher(s) of the Document do not by this License
give permission to use their names for publicity for or to assert or
imply endorsement of any Modified Version.


5. COMBINING DOCUMENTS

You may combine the Document with other documents released under this
License, under the terms defined in section 4 above for modified
versions, provided that you include in the combination all of the
Invariant Sections of all of the original documents, unmodified, and
list them all as Invariant Sections of your combined work in its
license notice, and that you preserve all their Warranty Disclaimers.

The combined work need only contain one copy of this License, and
multiple identical Invariant Sections may be replaced with a single
copy.  If there are multiple Invariant Sections with the same name but
different contents, make the title of each such section unique by
adding at the end of it, in parentheses, the name of the original
author or publisher of that section if known, or else a unique number.
Make the same adjustment to the section titles in the list of
Invariant Sections in the license notice of the combined work.

In the combination, you must combine any sections Entitled "History"
in the various original documents, forming one section Entitled
"History"; likewise combine any sections Entitled "Acknowledgements",
and any sections Entitled "Dedications".  You must delete all sections
Entitled "Endorsements".


6. COLLECTIONS OF DOCUMENTS

You may make a collection consisting of the Document and other documents
released under this License, and replace the individual copies of this
License in the various documents with a single copy that is included in
the collection, provided that you follow the rules of this License for
verbatim copying of each of the documents in all other respects.

You may extract a single document from such a collection, and distribute
it individually under this License, provided you insert a copy of this
License into the extracted document, and follow this License in all
other respects regarding verbatim copying of that document.


7. AGGREGATION WITH INDEPENDENT WORKS

A compilation of the Document or its derivatives with other separate
and independent documents or works, in or on a volume of a storage or
distribution medium, is called an "aggregate" if the copyright
resulting from the compilation is not used to limit the legal rights
of the compilation's users beyond what the individual works permit.
When the Document is included in an aggregate, this License does not
apply to the other works in the aggregate which are not themselves
derivative works of the Document.

If the Cover Text requirement of section 3 is applicable to these
copies of the Document, then if the Document is less than one half of
the entire aggregate, the Document's Cover Texts may be placed on
covers that bracket the Document within the aggregate, or the
electronic equivalent of covers if the Document is in electronic form.
Otherwise they must appear on printed covers that bracket the whole
aggregate.


8. TRANSLATION

Translation is considered a kind of modification, so you may
distribute translations of the Document under the terms of section 4.
Replacing Invariant Sections with translations requires special
permission from their copyright holders, but you may include
translations of some or all Invariant Sections in addition to the
original versions of these Invariant Sections.  You may include a
translation of this License, and all the license notices in the
Document, and any Warranty Disclaimers, provided that you also include
the original English version of this License and the original versions
of those notices and disclaimers.  In case of a disagreement between
the translation and the original version of this License or a notice
or disclaimer, the original version will prevail.

If a section in the Document is Entitled "Acknowledgements",
"Dedications", or "History", the requirement (section 4) to Preserve
its Title (section 1) will typically require changing the actual
title.


9. TERMINATION

You may not copy, modify, sublicense, or distribute the Document except
as expressly provided for under this License.  Any other attempt to
copy, modify, sublicense or distribute the Document is void, and will
automatically terminate your rights under this License.  However,
parties who have received copies, or rights, from you under this
License will not have their licenses terminated so long as such
parties remain in full compliance.


10. FUTURE REVISIONS OF THIS LICENSE

The Free Software Foundation may publish new, revised versions
of the GNU Free Documentation License from time to time.  Such new
versions will be similar in spirit to the present version, but may
differ in detail to address new problems or concerns.  See
https://www.gnu.org/copyleft/.

Each version of the License is given a distinguishing version number.
If the Document specifies that a particular numbered version of this
License "or any later version" applies to it, you have the option of
following the terms and conditions either of that specified version or
of any later version that has been published (not as a draft) by the
Free Software Foundation.  If the Document does not specify a version
number of this License, you may choose any version ever published (not
as a draft) by the Free Software Foundation.


ADDENDUM: How to use this License for your documents

To use this License in a document you have written, include a copy of
the License in the document and put the following copyright and
license notices just after the title page:

    Copyright (c)  YEAR  YOUR NAME.
    Permission is granted to copy, distribute and/or modify this document
    under the terms of the GNU Free Documentation License, Version 1.2
    or any later version published by the Free Software Foundation;
    with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
    A copy of the license is included in the section entitled "GNU
    Free Documentation License".

If you have Invariant Sections, Front-Cover Texts and Back-Cover Texts,
replace the "with...Texts." line with this:

    with the Invariant Sections being LIST THEIR TITLES, with the
    Front-Cover Texts being LIST, and with the Back-Cover Texts being LIST.

If you have Invariant Sections without Cover Texts, or some other
combination of the three, merge those two alternatives to suit the
situation.

If your document contains nontrivial examples of program code, we
recommend releasing these examples in parallel under your choice of
free software license, such as the GNU General Public License,
to permit their use in free software.

The End.

--6p7iuyctd3yvxkzq--

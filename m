Return-Path: <linux-doc+bounces-9751-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B94C85781D
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 09:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1D2F1C22543
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 08:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487231BC3C;
	Fri, 16 Feb 2024 08:55:01 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832561BC2F;
	Fri, 16 Feb 2024 08:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708073701; cv=none; b=UDRAewGKYRfJJ7XeVSAkuAG47rpW4fiuIb6g3NujLT2FHl1IeUUwOp+NAS+CLtJmFI95MnhJkj3RLm66DKP1A06clN/m7iZF/5rTzHpQNTcrEEUTmvVAPg4pMFTIwUghp9osqXlNVE3PgPY8Av6+rPDiP7Omt9FCElV27XOjudw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708073701; c=relaxed/simple;
	bh=AfNQG9ACnz9592ykq7olmCoCvoFfRIiRRaEYEDsPov4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CdhbEmi38oTXIilYCvp11b3P4vSIWFqmec5OZHj/0m5+5hVxIuTzcfqh5npOwMKudwMyPuwPtNqh7r3/1XbSvNUfzKchDwPZR8o2Yi11zdJy/E8Pc+BYPQ2fCr5im36nTDSvqAA66wvyUvsT4v2D21sf6yqGtAcZiYGujrWQMY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from ip4d148da6.dynamic.kabel-deutschland.de ([77.20.141.166] helo=truhe.fritz.box); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1ratzb-0005dA-OV; Fri, 16 Feb 2024 09:54:47 +0100
From: Thorsten Leemhuis <linux@leemhuis.info>
To: Jonathan Corbet <corbet@lwn.net>
Cc: regressions@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v1] docs: new text on bisecting which also covers bug validation
Date: Fri, 16 Feb 2024 09:54:46 +0100
Message-ID: <bf1d2eba0d291ff583e01b5985a0dec248eaf27a.1708072870.git.linux@leemhuis.info>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1708073695;08b47644;
X-HE-SMSGID: 1ratzb-0005dA-OV

Replace the existing brief explanation on bisecting regressions with a
text describing the whole process from beginning to end -- while also
describing how to validate if a problem is still present in mainline.
This "two in one" approach is possible, as checking whenever a bug is in
mainline is one of the first steps before performing a bisection anyway
and thus described. Due to this approach the text also works quite
nicely in conjunction with
Documentation/admin-guide/reporting-issues.rst, as it covers all typical
cases where users will need to build a kernel in exactly the same order.

The text targets users that normally run kernels from their Linux
distributor who might never have compiled their own kernel.

This aim is why the first kernel built while following this guide is
generated from the latest mainline codebase. This will rule out that the
regression (a) was fixed already and (b) is caused by config change a
vendor distributor performed; checking mainline will furthermore (c)
determine if the issue is something that needs to be reported to the
regular developers or the stable team (this is needed even when readers
bisect within a stable series).

Only then are readers instructed to build their own variant of the
'good' kernel to validate the trimmed .config file created during early
in the guide, as performing a bisection with a broken one would be a
waste of time. There is a small downside of this order: readers might
have to go back to testing mainline, if it turns out there is a problem
with their .config. But that should be rare -- and if the regression was
already fixed readers might not get to this point anyway. Hence in the
end this order should mean that readers built less kernels overall.

This sequence allows the text to easily cover the "check if a bug is
present in the upstream kernel" case while only making things a tiny bit
more complicated.

The text tries to prevent readers from running into many mistakes users
are known to frequently make. The steps required for this might look
superfluous for people that are already familiar with bisections -- but
anyone with that knowledge should be able to adapt the instructions to
their use-case or will not need this text at all.

Style and structure of the text match the one
Documentation/admin-guide/quickly-build-trimmed-linux.rst uses. Quite a
few paragraphs are even copied from there and not changed at all or only
slightly. This will complicate maintenance, as some future changes to
one of these documents will have to be replicated in the other. But this
is the lesser evil: solutions like "sending readers from one document
over to the other" or "extracting the common parts into a separate
document" might work in other cases, but would be too confusing here
given the topic and the target audience.

Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
---

Hi! This is a late Christmas gift, as Thorsten was (by choice) "home
alone" shortly before and during Christmas and decided he needed some
distraction from regression tracking. Stupid idea, I know, as that kept
me busy during the whole festive season and afterwards as well. But
whatever, here we are.

A few remarks:

* A rendered version is available here:
https://www.leemhuis.info/files/misc/How%20to%20verify%20bugs%20and%20bisect%20regressions%20%e2%80%94%20The%20Linux%20Kernel%20documentation.html

* Feel free to suggest small changes & fixes by editing this document:
https://docs.google.com/document/d/1Im7SPK0j6PUGQTSGZyCTSQv8h3S51EYsZuRRdyhfzto/edit?usp=sharing

* It would be great if a few people that never did a bisection could
play this through and provide feedback.

* It would be great if a few people that are familiar with the process
could at least check the TLDR to see if I got something wrong or
forgot something; even better would be if they could check the
step-by-step guide instead, which the TLDR instructions are based on.

* The patch description already highlights an aspect wrt to the order of
tasks (e.g. building the latest codebase first to only then validate
the trimmed .config file). Initially I had written it the other way
around, but over time it started to feel wrong. That's why I flipped it
over to the current sequence (first mainline, then validate the 'good'
kernel). That initially felt somewhat wrong as well, but over time it
felt more and more like the right thing. This in the end allowed the
guide to work well in conjunction with
Documentation/admin-guide/reporting-issues.rst for both bugs and
regressions (in the latter case even for non-bisected and thus
preliminary reports the document mentions). If there are no complaints
with the chosen order I'll update
Documentation/admin-guide/reporting-issues.rst as well to make the two
documents harmonize even better.

* Side note: I recently wondered if we still need
Documentation/admin-guide/quickly-build-trimmed-linux.rst at all now.
OTOH it contains sections that cover a few things that are missing here
and would fit badly. If we decide to keep it, I will sync back the
sections I copied from there.

* The patch description contains the words "tiny bit more complicated"
to describe the "two in one" approach. If we decide that this was a
"tiny bit" too much I'd might consider making a variant of the text that
is a mix of the submitted text and
Documentation/admin-guide/quickly-build-trimmed-linux.rst.

* The text as of now does not really describe what a bisection is --
neither in general nor in the scope of Git. Maybe that should be
added. Having a few nice graphical diagrams might also be good, as the
text is meant to be read in rendered form anyway. But I think it's
useful like this already.

* Side note: might be great to add big chunks of
https://nathanchance.dev/posts/working-with-git-bisect/ to the
kernel's documentation as well (assuming Nathan agrees) -- not sure if
here or in a separate document would be best. There is likely other
stuff at different places that might be good to include; like the "how
find two changes from independently developed trees that when merged
create trouble" bits Uwe recently mentioned in
https://lore.kernel.org/all/gevqxytidg5efylozindaqntkbl4yeoyzqnh5m3ylitmipgum3@sgmv7qieo7rs/
But it's something definitely for later.

Ciao, Thorsten
---
 Documentation/admin-guide/bug-bisect.rst      |   76 -
 Documentation/admin-guide/index.rst           |    2 +-
 .../verify-bugs-and-bisect-regressions.rst    | 1925 +++++++++++++++++
 MAINTAINERS                                   |    1 +
 4 files changed, 1927 insertions(+), 77 deletions(-)
 delete mode 100644 Documentation/admin-guide/bug-bisect.rst
 create mode 100644 Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst

diff --git a/Documentation/admin-guide/bug-bisect.rst b/Documentation/admin-guide/bug-bisect.rst
deleted file mode 100644
index 325c5d0ed34a0a..00000000000000
--- a/Documentation/admin-guide/bug-bisect.rst
+++ /dev/null
@@ -1,76 +0,0 @@
-Bisecting a bug
-+++++++++++++++
-
-Last updated: 28 October 2016
-
-Introduction
-============
-
-Always try the latest kernel from kernel.org and build from source. If you are
-not confident in doing that please report the bug to your distribution vendor
-instead of to a kernel developer.
-
-Finding bugs is not always easy. Have a go though. If you can't find it don't
-give up. Report as much as you have found to the relevant maintainer. See
-MAINTAINERS for who that is for the subsystem you have worked on.
-
-Before you submit a bug report read
-'Documentation/admin-guide/reporting-issues.rst'.
-
-Devices not appearing
-=====================
-
-Often this is caused by udev/systemd. Check that first before blaming it
-on the kernel.
-
-Finding patch that caused a bug
-===============================
-
-Using the provided tools with ``git`` makes finding bugs easy provided the bug
-is reproducible.
-
-Steps to do it:
-
-- build the Kernel from its git source
-- start bisect with [#f1]_::
-
-	$ git bisect start
-
-- mark the broken changeset with::
-
-	$ git bisect bad [commit]
-
-- mark a changeset where the code is known to work with::
-
-	$ git bisect good [commit]
-
-- rebuild the Kernel and test
-- interact with git bisect by using either::
-
-	$ git bisect good
-
-  or::
-
-	$ git bisect bad
-
-  depending if the bug happened on the changeset you're testing
-- After some interactions, git bisect will give you the changeset that
-  likely caused the bug.
-
-- For example, if you know that the current version is bad, and version
-  4.8 is good, you could do::
-
-           $ git bisect start
-           $ git bisect bad                 # Current version is bad
-           $ git bisect good v4.8
-
-
-.. [#f1] You can, optionally, provide both good and bad arguments at git
-	 start with ``git bisect start [BAD] [GOOD]``
-
-For further references, please read:
-
-- The man page for ``git-bisect``
-- `Fighting regressions with git bisect <https://www.kernel.org/pub/software/scm/git/docs/git-bisect-lk2009.html>`_
-- `Fully automated bisecting with "git bisect run" <https://lwn.net/Articles/317154>`_
-- `Using Git bisect to figure out when brokenness was introduced <http://webchick.net/node/99>`_
diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index fb40a1f6f79e18..b5901b093f5abc 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -37,8 +37,8 @@ problems and bugs in particular.
    reporting-issues
    reporting-regressions
    quickly-build-trimmed-linux
+   verify-bugs-and-bisect-regressions
    bug-hunting
-   bug-bisect
    tainted-kernels
    ramoops
    dynamic-debug-howto
diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
new file mode 100644
index 00000000000000..0a6a1a082d867c
--- /dev/null
+++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
@@ -0,0 +1,1925 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR CC-BY-4.0)
+.. [see the bottom of this file for redistribution information]
+
+=========================================
+How to verify bugs and bisect regressions
+=========================================
+
+This document describes how to check if some Linux kernel problem occurs in the
+code developers currently support -- to then explain how to locate the change
+causing the issue, if it did not happen with earlier versions.
+
+The text aims at people running kernels from mainstream Linux distributions on
+commodity hardware who want to report a kernel bug to the upstream Linux
+developers. The instructions despite this intent work just as well for users who
+are already familiar with building their own kernels: they help avoid mistakes
+even experienced developers occasionally make.
+
+The essence of the process (aka 'TL;DR')
+========================================
+
+*[If you are new to building or bisecting Linux, ignore this TLDR and head over
+to the* ":ref:`step-by-step guide on verifying bugs and bisecting
+regressions<introguide_bissbs>`" *below: it utilizes the same commands while
+describing them in brief fashion; the steps are nevertheless easy to follow and
+together with accompanying entries in a reference section mention many
+alternatives, pitfalls, and additional aspects, all of which might be essential
+for your needs.]*
+
+**In case you want to check if a bug is present in a codebase developers
+currently support**, execute just the *preparations* and *segment 1*; while
+doing so, consider the newest Linux kernel you regularly use to be the 'working'
+kernel. In the following example that's assumed to be 6.0.13, which is why v6.0
+will be used to prepare the .config file.
+
+**In case you face a regression**, follow the steps at least till the end of
+*segment 2*. Then you can submit a preliminary report -- or continue with
+*segment 3*, which describes how to perform a bisection a full-fledged
+regression report needs. In the following example 6.0.13 is assumed to be the
+'working' kernel and 6.1.5 the first to be 'broken', hence v6.0 will be
+considered the 'good' release.
+
+* **Preparations**: set up everything to build your own kernels::
+
+    # * Remove any software that depends on externally maintained kernel modules
+    #   or builds any automatically during bootup.
+    # * Ensure Secure Boot permits booting self-compiled Linux kernels.
+    # * If you are not already running the 'working' kernel, reboot into it.
+    # * Install compilers and everything else needed for building Linux.
+    # * Ensure to have 15 Gigabyte free space in your home directory.
+    git clone -o mainline --no-checkout \
+      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ~/linux/
+    cd ~/linux/
+    git remote add -t master stable \
+      https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
+    git checkout --detach v6.0
+    # * Hint: if you used an existing clone, ensure no stale .config is around.
+    make olddefconfig
+    # * Ensure the former command picked the .config of the 'working' kernel.
+    # * Connect external hardware (USB keys, tokens, ...), start a VM, bring up
+    #   VPNs, mount network shares, and briefly try the feature that is broken.
+    yes '' | make localmodconfig
+    ./scripts/config --set-str CONFIG_LOCALVERSION '-local'
+    ./scripts/config -e CONFIG_LOCALVERSION_AUTO
+    # * Note, when short on storage space, check the guide for an alternative:
+    ./scripts/config -d DEBUG_INFO_NONE -e KALLSYMS_ALL -e DEBUG_KERNEL \
+      -e DEBUG_INFO -e DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT -e KALLSYMS
+    # * Hint: at this point you might want to adjust the build configuration;
+    #   you'll have to, if you are running Debian.
+    make olddefconfig
+    cp .config ~/kernel-config-working
+
+* **Segment 1**: build a kernel from the latest mainline codebase.
+
+  This among others checks if the problem was fixed already and which developers
+  later need to be told about the problem; in the regression's case this
+  furthermore rules out a .config change as root of the problem.
+
+  a) Checking out latest mainline code::
+
+       cd ~/linux/
+       git checkout --force --detach mainline/master
+
+  b) Build, install, and boot a kernel::
+
+       cp ~/kernel-config-working .config
+       make olddefconfig
+       make -j $(nproc --all)
+       # * Ensure free storage space suffices holding another kernel:
+       df -h /boot/ /lib/modules/
+       # * Note: on Arch Linux and a few other distributions the following
+       #   commands will do nothing at all or only part of the job. See the
+       #   step-by-step guide for details.
+       command -v installkernel && sudo make modules_install install
+       # * Check how much space your self-built kernel actually needs, which
+       #   enables you to make better estimates later:
+       du -ch /boot/*$(make -s kernelrelease)* | tail -n 1
+       du -sh /lib/modules/$(make -s kernelrelease)/
+       # * Hint: the output of the following command will help you pick the
+       #   right kernel from the boot menu:
+       make -s kernelrelease | tee -a ~/kernels-built
+       reboot
+       # * Once booted, ensure you are running the kernel you just built by
+       #   checking if the output of the next two commands matches:
+       tail -n 1 ~/kernels-built
+       uname -r
+
+  c) Check if the problem occurs with this kernel as well.
+
+* **Segment 2**: ensure the 'good' kernel is also a 'working' kernel.
+
+  This among others verifies the trimmed .config file actually works well, as
+  bisecting with it otherwise would be a waste of time:
+
+  a) Start by checking out the sources of the 'good' version::
+
+       cd ~/linux/
+       git checkout --force --detach v6.0
+
+  b) Build, install, and boot a kernel as described earlier in *segment 1,
+     section b* -- just feel free to skip the 'du' commands, as you have a rough
+     estimate already.
+
+  c) Ensure the feature that regressed with the 'broken' kernel actually works
+     with this one.
+
+* **Segment 3**: perform and validate the bisection.
+
+  a) Incase your 'broken' version is a stable/longterm release, add the Git
+     branch holding it::
+
+       git remote set-branches --add stable linux-6.1.y
+       git fetch stable
+
+  b) Initialize the bisection::
+
+       cd ~/linux/
+       git bisect start
+       git bisect good v6.0
+       git bisect bad v6.1.5
+
+  c) Build, install, and boot a kernel as described earlier in *segment 1,
+     section b*.
+
+     In case building or booting the kernel fails for unrelated reasons, run
+     ``git bisect skip``. In all other outcomes, check if the regressed feature
+     works with the newly built kernel. If it does, tell Git by executing
+     ``git bisect good``; if it does not, run ``git bisect bad`` instead.
+
+     All three commands will make Git checkout another commit; then re-execute
+     this step (e.g. build, install, boot, and test a kernel to then tell Git
+     the outcome). Do so again and again until Git shows which commit broke
+     things. If you run short of disk space during this process, check the
+     "Supplementary tasks" section below.
+
+  d) Once your finished the bisection, put a few things away::
+
+       cd ~/linux/
+       git bisect log > ~/bisect-log
+       cp .config ~/bisection-config-culprit
+       git bisect reset
+
+  e) Try to verify the bisection result::
+
+       git checkout --force --detach mainline/master
+       git revert --no-edit cafec0cacaca0
+
+    This is optional, as some commits are impossible to revert. But if the
+    second command worked flawlessly, build, install, and boot one more kernel
+    kernel, which should not show the regression.
+
+* **Supplementary tasks**: cleanup during and after the process.
+
+  a) To avoid running out of disk space during a bisection, you might need to
+     remove some kernels you built earlier. You most likely want to keep those
+     you built during segment 1 and 2 around for a while, but are unlikely to
+     need any again you tested during the actual bisection (Segment 3 c). You
+     can list them in build order using::
+
+       ls -ltr /lib/modules/*-local*
+
+    To then for example erase a kernel that identifies itself as
+    '6.0-rc1-local-gcafec0cacaca0', use this::
+
+       sudo rm -rf /lib/modules/6.0-rc1-local-gcafec0cacaca0
+       sudo kernel-install -v remove 6.0-rc1-local-gcafec0cacaca0
+       # * Note, if kernel-install is missing, you will have to
+       #   manually remove the kernel image and related files.
+
+  b) If you performed a bisection and successfully validated the result, feel
+     free to remove all kernel build during the actual bisection (Segment 3 c);
+     the kernels you built earlier and later you might want to keep around for
+     a week or two.
+
+.. _introguide_bissbs:
+
+Step-by-step guide on how to verify bugs and bisect regressions
+===============================================================
+
+..
+   Note: if you see this note, you are reading the text's source file. You
+   might want to switch to a rendered version: it makes it a lot easier to
+   read and navigate this document, especially when you want to look something
+   up in the reference section to then jump back to where you left off.
+..
+   Find a the latest rendered version of this text here:
+   https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.rst.html
+
+The following steps show you how to verify a kernel problem you face is present
+in code the Linux kernel developers support; in case of a regression the steps
+furthermore explain how to find the change causing it. The guide separates the
+process into five segments where segments 2 and 3 are only relevant for those
+facing a regression:
+
+ :ref:`Preparations: set up everything to build your own kernels.<introprep_bissbs>`
+
+ :ref:`Segment 1: try to reproduce the problem with the latest codebase.<introlatestcheck_bissbs>`
+
+ :ref:`Segment 2: check if the kernels you build work fine.<introworkingcheck_bissbs>`
+
+ :ref:`Segment 3: perform a bisection and validate the result.<introbisect_bissbs>`
+
+ :ref:`Supplementary tasks: cleanup during and after following this guide.<introclosure_bissbs>`
+
+The steps in each segment illustrate the important aspects of the process, while
+a comprehensive reference section holds additional details. The latter sometimes
+also outlines alternative approaches, pitfalls, as well as problems that might
+occur at the particular step -- and how to then get things rolling again.
+
+Be aware *segment 1* describes how to build and install your own kernel; the
+commands introduced there will be used in later segments in bulk fashion without
+further explanation.
+
+*Segment 1* and *segment 2* might look unnecessary for a bisection, but in fact
+in almost all cases are important due to concealed aspects explained below;
+skipping these segments thus could result in you wasting a lot of time and
+effort on a meaningless bisection.
+
+Be aware that *segment 3* will require you to build quite a few kernels --
+usually about 15 in case you encountered a regression when updating to a version
+from a newer mainline release (say from 6.0.11 to 6.1.3). Due to the trimmed
+build configuration file created initially this works a lot faster than many
+people assume, as overall on average it will often just take about 10 to 15
+minutes to compile each kernel on commodity x86 machines.
+
+For further details on how to report issues with the Linux kernel to its
+developers checkout Documentation/admin-guide/reporting-issues.rst, which works
+in conjunction with this document. It among others explains why you need to
+verify bugs with the latest 'mainline' kernel, even if you face a problem with a
+kernel from a 'stable/longterm' series; for users facing a regression it also
+explains that sending a preliminary report after finishing segment 2 might be
+wise, as an bisection might be unnecessary in case the regression is already
+known.
+
+For further details on what actually qualifies as a regression checkout
+Documentation/admin-guide/reporting-regressions.rst.
+
+.. _introprep_bissbs:
+
+Preparations: set up everything to build your own kernels
+---------------------------------------------------------
+
+.. _backup_bissbs:
+
+* Create a fresh backup and put system repair and restore tools at hand, just
+  to be prepared for the unlikely case of something going sideways.
+
+  [:ref:`details<backup_bisref>`]
+
+.. _vanilla_bissbs:
+
+* Remove all software that depends on externally developed kernel drivers or
+  builds them automatically. That includes but is not limited to DKMS, openZFS,
+  VirtualBox, and Nvidia's graphics drivers (including the GPLed kernel module).
+
+  [:ref:`details<vanilla_bisref>`]
+
+.. _secureboot_bissbs:
+
+* On platforms with 'Secure Boot' or similar solutions, prepare everything to
+  ensure the system will permit your self-compiled kernel to boot. The
+  quickest and easiest way to achieve this on commodity x86 systems is to
+  disable such techniques in the BIOS setup utility; alternatively, remove
+  their restrictions through a process initiated by
+  ``mokutil --disable-validation``.
+
+  [:ref:`details<secureboot_bisref>`]
+
+.. _rangecheck_bissbs:
+
+* Determine the kernel versions considered 'good' and 'bad' throughout this
+  guide.
+
+  Do you follow this guide to verify if a bug is present in the code developers
+  care for? Then consider the mainline release your 'working' kernel (the newest
+  one you regularly use) is based on to be the 'good' version; if your 'working'
+  kernel for example is '6.0.11', then your 'good' kernel is 'v6.0'.
+
+  In case you face a regression, it depends on the version range where the
+  regression was introduced:
+
+  * Something which used to work in Linux 6.0 broken when switching to Linux
+    6.1-rc1? Then henceforth regard 'v6.0' as the last known 'good' version and
+    'v6.1-rc1' as the first 'bad' one.
+
+  * Some function stopped working when updating from 6.0.11 to 6.1.4? Then for
+    the time being consider 'v6.0' as the last 'good' version and 'v6.1.4' as
+    the 'bad' one. Note, it at this point is an assumption that 6.0 is fine that
+    will be checked in segment 2.
+
+  * A feature you used in 6.0.11 does not work at all or worse in 6.1.13? In
+    that case you want to bisect within a stable/longterm series: consider
+    'v6.0.11' as the last known 'good' version and 'v6.0.13' as the first 'bad'
+    one. Note, you in this case nevertheless want to compile a mainline kernel
+    as explained in segment 1, as that will determine if that is a bug that the
+    regular developers or the stable team will have to handle.
+
+  *Note, do not confuse 'good' version with 'working' kernel; the latter term
+  throughout this guide will refer to the last kernel that has been working
+  fine.*
+
+  [:ref:`details<rangecheck_bisref>`]
+
+.. _bootworking_bissbs:
+
+* Boot into the 'working' kernel and briefly use the feature apparently broken.
+
+  [:ref:`details<bootworking_bisref>`]
+
+.. _diskspace_bissbs:
+
+* Ensure to have enough free space for building Linux. 15 Gigabyte in your home
+  directory should typically suffice. If you have less available, be sure to pay
+  attention to later steps about retrieving the Linux sources and handling of
+  debug symbols: both explain approaches reducing the amount of space, which
+  should allow you to master these tasks with about 4 Gigabytes free space.
+
+  [:ref:`details<diskspace_bisref>`]
+
+.. _buildrequires_bissbs:
+
+* Install all software required to build a Linux kernel. Often you will need:
+  'bc', 'binutils' ('ld' et al.), 'bison', 'flex', 'gcc', 'git', 'openssl',
+  'pahole', 'perl', and the development headers for 'libelf' and 'openssl'. The
+  reference section shows how to quickly install those on various popular Linux
+  distributions.
+
+  [:ref:`details<buildrequires_bisref>`]
+
+.. _sources_bissbs:
+
+* Retrieve the mainline Linux sources; then change into the directory holding
+  them, as all further commands in this guide are meant to be executed from
+  there.
+
+  *Note, the following describe how to retrieve the sources using a full
+  mainline clone, which downloads about 2,75 GByte as of early 2024. The*
+  :ref:`reference section describes two alternatives <sources_bisref>` *:
+  one downloads less than 500 MByte, the other works better with unreliable
+  internet connections.*
+
+  Execute the following command to retrieve a fresh mainline codebase::
+
+    git clone -o mainline --no-checkout \
+      git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ~/linux/
+    cd ~/linux/
+
+  [:ref:`details<sources_bisref>`]
+
+.. _oldconfig_bissbs:
+
+* Start preparing a kernel build configuration (the '.config' file).
+
+  Before doing so, ensure you are still running the 'working' kernel an earlier
+  step told you to boot; if you are unsure, check the current kernel release
+  identifier using ``uname -r``.
+
+  Afterwards check out the source code for the version earlier established as
+  'good' and create a .config file::
+
+    git checkout --detach v6.0
+    make olddefconfig
+
+  The second command will try to locate the build configuration file for the
+  running kernel and then adjust it for the needs of the kernel sources you
+  checked out. While doing so it will print a few lines with a line starting
+  with '# using defaults found in'. Ensure it is the former of the two and
+  followed by a path to a file in '/boot/'; the latter furthermore should
+  contain the release identifier of your currently working kernel.
+
+  If the line instead continued with something like
+  'arch/x86/configs/x86_64_defconfig', then the build infra failed to find the
+  .config file for your running kernel -- in which case you have to put one
+  there manually, as explained in the reference section.
+
+  In case you can not find such a line, look for one containing '# configuration
+  written to .config'. If that's the case you have a stale build configuration
+  lying around. Unless you intend to use it, delete it -- or better yet, remove
+  all stale files you might have lying around from earlier builds using ``make
+  distclean`` or ``git clean -i``. Afterwards call 'make olddefconfig' again.
+
+  [:ref:`details<oldconfig_bisref>`]
+
+.. _localmodconfig_bissbs:
+
+* Disable any kernel modules apparently superfluous for your setup. This is
+  optional, but especially wise for bisections, as it speeds up the build
+  process enormously -- at least unless the .config file picked up in the
+  previous step was already tailored to your and your hardware needs, in which
+  case you should skip this step.
+
+  To prepare the trimming, connect external hardware you occasionally use (USB
+  keys, tokens, ...), quickly start a VM, and bring up VPNs. And if you rebooted
+  since you started that guide, ensure that you tried using the feature causing
+  trouble since you started the system. Only then trim your .config::
+
+     yes '' | make localmodconfig
+
+  There is a catch to this, as the 'apparently' in initial sentence of this step
+  and the preparation instructions already hinted at:
+
+  The 'localmodconfig' target easily disables kernel modules for features only
+  used occasionally -- like modules for external peripherals not yet connected
+  since booting, virtualization software not yet utilized, VPN tunnels, and a
+  few other things. That's because some tasks rely on kernel modules Linux only
+  loads when you execute tasks like the aforementioned ones for the first time.
+
+  This drawback of localmodconfig is nothing you should lose sleep over, but
+  something to keep in mind: if something is misbehaving with the kernels built
+  during this guide, this is most likely the reason. You can reduce or nearly
+  eliminate the risk with tricks the reference section outlines; but when
+  building a kernel just for quick testing purposes this is usually not worth
+  spending much effort on, as long as it boots and allows to properly test the
+  feature that causes trouble.
+
+  [:ref:`details<localmodconfig_bisref>`]
+
+.. _tagging_bissbs:
+
+* Ensure all the kernels you will build are clearly identifiable using a special
+  tag and a unique version number::
+
+    ./scripts/config --set-str CONFIG_LOCALVERSION '-local'
+    ./scripts/config -e CONFIG_LOCALVERSION_AUTO
+
+  [:ref:`details<tagging_bisref>`]
+
+.. _debugsymbols_bissbs:
+
+* Decide how to handle debug symbols.
+
+  In the context of this document it is often wise to enable them, as there is a
+  decent chance you at some point will need to decode a stack trace from a
+  'panic', 'Oops', 'warning', or 'BUG'::
+
+    ./scripts/config -d DEBUG_INFO_NONE -e KALLSYMS_ALL -e DEBUG_KERNEL \
+      -e DEBUG_INFO -e DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT -e KALLSYMS
+
+  But if you are extremely short on storage space, you might want to disable
+  debug symbols instead::
+
+    ./scripts/config -d DEBUG_INFO -d DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT \
+      -d DEBUG_INFO_DWARF4 -d DEBUG_INFO_DWARF5 -e CONFIG_DEBUG_INFO_NONE
+
+  [:ref:`details<debugsymbols_bisref>`]
+
+.. _configmods_bissbs:
+
+* Check if you might want to or have to adjust some other kernel configuration
+  options:
+
+  * Are you running Debian? Then you want to avoid known problems by performing
+    additional adjustments explained in the reference section.
+
+    [:ref:`details<configmods_distros_bisref>`].
+
+  * If you want to influence other aspects of the configuration, do so now
+    by using make targets like 'menuconfig' or 'xconfig'.
+
+    [:ref:`details<configmods_individual_bisref>`].
+
+.. _saveconfig_bissbs:
+
+* Reprocess the .config after the latest adjustments and store it in a safe
+  place::
+
+     make olddefconfig
+     cp .config ~/kernel-config-working
+
+  [:ref:`details<saveconfig_bisref>`]
+
+.. _introlatestcheck_bissbs:
+
+Try to reproduce the problem with the latest codebase
+-----------------------------------------------------
+
+The following steps verify if the problem occurs with the code developers
+currently support. In case you face a regression, it also checks that the
+problem is not caused by some .config value your distributor changed between the
+'good' and the 'broken' kernel. [:ref:`details<introlatestcheck_bisref>`]
+
+.. _checkoutmaster_bissbs:
+
+* Checkout the latest Linux codebase::
+
+    cd ~/linux/
+    git checkout --force --detach mainline/master
+
+  [:ref:`details<checkoutmaster_bisref>`]
+
+.. _build_bissbs:
+
+* Build the image and the modules of your first kernel using the config file you
+  prepared::
+
+    cp ~/kernel-config-working .config
+    make olddefconfig
+    make -j $(nproc --all)
+
+  If you want your kernel packaged up as deb, rpm, or tar file, see the
+  reference section for alternatives, which obviously will require other
+  steps to install as well.
+
+  [:ref:`details<build_bisref>`]
+
+.. _install_bissbs:
+
+* Install your newly built kernel.
+
+  Before doing so, consider checking if there is still enough room for it::
+
+    df -h /boot/ /lib/modules/
+
+  150 MByte in /boot/ and 200 in /lib/modules/ usually suffice. Those are rough
+  estimates assuming the worst case. How much your kernels actually require will
+  be determined later.
+
+  Now install the kernel, which will be saved in parallel to the kernels from
+  your Linux distribution::
+
+    command -v installkernel && sudo make modules_install install
+
+  On many commodity Linux distributions this will take care of everything
+  required to boot your kernel. You might want to ensure that's the case by
+  checking if your boot loader's configuration was updated; furthermore ensure
+  an initramfs (also known as initrd) exists, which on many distributions can be
+  achieved by running ``ls -l /boot/init*$(make -s kernelrelease)*``. Those
+  steps are recommended, as there are quite a few Linux distribution where above
+  command is insufficient:
+
+  * On Arch Linux, its derivatives, many immutable Linux distributions, and a
+    few others the above command does nothing at, as they lack 'installkernel'
+    executable.
+
+  * Some distributions install the kernel, but don't add an entry for your
+    kernel in your boot loader's configuration -- the kernel thus won't show up
+    in the boot menu.
+
+  * Some distributions add a boot loader menu entry, but don't create an
+    initramfs on installation -- in that case your kernel most likely will be
+    unable to mount the root partition during bootup.
+
+  If any of that applies to you, see the reference section for further guidance.
+  Once you figured out what to do, consider writing down the necessary
+  installation steps: if you will build more kernels as described in
+  segment 2 and 3, you will have to execute these commands every time that
+  ``command -v installkernel [...]`` comes up again.
+
+  [:ref:`details<install_bisref>`]
+
+.. _storagespace_bissbs:
+
+* In case you plan to follow this guide further, check how much storage space
+  the kernel, its modules, and other related files like the initramfs consume::
+
+    du -ch /boot/*$(make -s kernelrelease)* | tail -n 1
+    du -sh /lib/modules/$(make -s kernelrelease)/
+
+  Write down or remember those two values for later: they enable you to prevent
+  running out of disk space accidentally during a bisection.
+
+  [:ref:`details<storagespace_bisref>`]
+
+.. _kernelrelease_bissbs:
+
+* Show and store the kernelrelease identifier of the kernel you just built::
+
+    make -s kernelrelease | tee -a ~/kernels-built
+
+  Remember the identifier momentarily, as it will help you pick the right kernel
+  from the boot menu upon restarting.
+
+.. _recheckbroken_bissbs:
+
+* Reboot into the kernel you just built and check if the feature that is
+  expected to be broken really is.
+
+  Start by ensuring the kernel you booted is the one you just built. When
+  unsure, check if the output of these commands show the exact same release
+  identifier::
+
+    tail -n 1 ~/kernels-built
+    uname -r
+
+ Now verify if the feature that causes trouble works with your newly built
+ kernel. If things work while investigating a regression, check the reference
+ section for further details.
+
+  [:ref:`details<recheckbroken_bisref>`]
+
+.. _recheckstablebroken_bissbs:
+
+* Are you facing a problem within a stable/longterm release, but failed to
+  reproduce it with the mainline kernel you just built? Then check if the latest
+  codebase for the particular series might already fix the problem. To do so,
+  add the stable series Git branch for your 'good' kernel and check out the
+  latest version::
+
+    cd ~/linux/
+    git remote set-branches --add stable linux-6.0.y
+    git fetch stable
+    git checkout --force --detach linux-6.0.y
+
+  Now use the checked out code to build and install another kernel using the
+  commands the earlier steps already described in more detail::
+
+    cp ~/kernel-config-working .config
+    make olddefconfig
+    make -j $(nproc --all)
+    # * Check if the free space suffices holding another kernel:
+    df -h /boot/ /lib/modules/
+    command -v installkernel && sudo make modules_install install
+    make -s kernelrelease | tee -a ~/kernels-built
+    reboot
+
+  Now verify if you booted the kernel you intended to start, to then check if
+  everything works fine with this kernel::
+
+    tail -n 1 ~/kernels-built
+    uname -r
+
+  [:ref:`details<recheckstablebroken_bisref>`]
+
+You are done here, if you follow this guide to verify if a problem is present in
+the code Linux kernel developers support. If you later want to remove the kernel
+you just built, checkout :ref:`Supplementary tasks: cleanup during and after
+following this guide.<introclosure_bissbs>`.
+
+.. _introworkingcheck_bissbs:
+
+Check if the kernels you build work fine
+----------------------------------------
+
+In case of a regression, you now want to ensure the trimmed configuration file
+you created earlier works as expected; a bisection with the .config file
+otherwise would be useless. [:ref:`details<introworkingcheck_bisref>`]
+
+.. _recheckworking_bissbs:
+
+* Build your own variant of the 'working' kernel and check if the feature that
+  regressed works as expected with it.
+
+  Start by checking out the sources for the version earlier established as
+  'good'::
+
+    cd ~/linux/
+    git checkout --detach v6.0
+
+  Now use the checked out code to configure, build, and install another kernel
+  using the commands the previous subsection explained in more detail::
+
+    cp ~/kernel-config-working .config
+    make olddefconfig
+    make -j $(nproc --all)
+    # * Check if the free space suffices holding another kernel:
+    df -h /boot/ /lib/modules/
+    command -v installkernel && sudo make modules_install install
+    make -s kernelrelease | tee -a ~/kernels-built
+    reboot
+
+  When the system booted, you once again might want to verify if the kernel yo
+  started is the one you just built::
+
+    tail -n 1 ~/kernels-built
+    uname -r
+
+  Now check if this kernel works as expected; if not, consult the reference
+  section for further instructions.
+
+  [:ref:`details<recheckworking_bisref>`]
+
+.. _introbisect_bissbs:
+
+Perform the bisection and validate the result
+---------------------------------------------
+
+With all the preparations and precaution builds taken care of, you are now ready
+to begin the bisection.
+
+* In case your 'bad' version is a stable/longterm release (say v6.1.5), add its
+  stable branch, unless you already did so earlier::
+
+    cd ~/linux/
+    git remote add -t master stable \
+      git://git.kernel.org/pub/scm/linux/kernel/git/stable/stable.git
+    git remote set-branches --add stable linux-6.1.y
+    git fetch stable
+
+.. _bisectstart_bissbs:
+
+* Start the bisection and tell Git about the versions earlier established as
+  'good' and 'bad'::
+
+    cd ~/linux/
+    git bisect start
+    git bisect good v6.0
+    git bisect bad v6.1.5
+
+  [:ref:`details<bisectstart_bisref>`]
+
+.. _bisectbuild_bissbs:
+
+* Now use the code Git checked out to build, install, and boot a kernel using
+  the commands introduced earlier::
+
+    cp ~/kernel-config-working .config
+    make olddefconfig
+    make -j $(nproc --all)
+    # * Check if the free space suffices holding another kernel:
+    df -h /boot/ /lib/modules/
+    command -v installkernel && sudo make modules_install install
+    make -s kernelrelease | tee -a ~/kernels-built
+    reboot
+
+  If compilation fails for some reason, run ``git bisect skip`` and restart
+  executing the stack of commands from the beginning.
+
+  In case you skipped the "test latest codebase" step in the guide, check its
+  description as for why the 'df [...]' and 'make -s kernelrelease [...]'
+  commands are here.
+
+  Important note:, the latter command from this point on will print release
+  identifiers that might look odd or wrong to you -- which they are not, as it's
+  totally normal to see release identifiers like '6.0-rc1-local-gcafec0cacaca0'
+  if you for example would bisect between versions 6.1 and 6.2.
+
+  [:ref:`details<bisectbuild_bisref>`]
+
+.. _bisecttest_bissbs:
+
+* Now check if the feature that regressed works in the kernel you just built.
+
+  You again might want to start by ensuring the kernel you booted is the one you
+  just built::
+
+    cd ~/linux/
+    tail -n 1 ~/kernels-built
+    uname -r
+
+  Now verify if the feature that regressed works at this kernel bisection point.
+  If it does, run this::
+
+    git bisect good
+
+  If it does not, run this::
+
+    git bisect bad
+
+  Be sure about what you tell Git, as getting this wrong just once will send the
+  rest of the bisection totally of course.
+
+  While the bisection is ongoing, Git will use the information you provided to
+  find and checkout another bisection point for you to test. While doing so, it
+  will print something like 'Bisecting: 675 revisions left to test after this
+  (roughly 10 steps)' to indicate how many further changes it expects to be
+  tested. Now build and install another kernel using the instructions from the
+  previous step; afterwards follow the instructions in this step again.
+
+  Repeat this again and again until you finish the bisection -- that's the case
+  when Git after tagging a change as 'good' or 'bad' prints something like
+  'cafecaca0c0dacafecaca0c0dacafecaca0c0da is the first bad commit'; right
+  afterwards it will show some details about the culprit including the patch
+  description of the change. The latter might fill your terminal screen, so you
+  might need to scroll up to see the message mentioning the culprit;
+  alternatively, run ``git bisect log > ~/bisection-log``.
+
+  [:ref:`details<bisecttest_bisref>`]
+
+.. _bisectlog_bissbs:
+
+* Store Git's bisection log and the current .config file in a safe place before
+  telling Git to reset the sources to the state before the bisection::
+
+    cd ~/linux/
+    git bisect log > ~/bisection-log
+    cp .config ~/bisection-config-culprit
+    git bisect reset
+
+  [:ref:`details<bisectlog_bisref>`]
+
+.. _revert_bissbs:
+
+* Try reverting the culprit on top of latest mainline to see if this fixes your
+  regression.
+
+  This is optional, as it might be impossible or hard to realize. The former is
+  the case, if the bisection determined a merge commit as the culprit; the
+  latter happens if other changes depend on the culprit. But if the revert
+  succeeds, it is worth building another kernel, as it validates the result of
+  a bisection, which can easily deroute; it furthermore will let kernel
+  developers know, if they can resolve the regression with a quick revert.
+
+  Begin by checking out the latest codebase depending on the range you bisected:
+
+  * Did you face a regression within a stable/longterm series (say between
+    6.0.11 and 6.0.13) that does not happen in mainline? Then checkout the
+    latest codebase for the affected series like this::
+
+      git fetch stable
+      git checkout --force --detach linux-6.0.y
+
+  * In all other cases checkout latest mainline::
+
+      git fetch mainline
+      git checkout --force --detach mainline/master
+
+    If you bisected a regression within a stable/longterm series that also
+    happens in mainline, there is one more thing to do: look up the mainline
+    commit-id. To do so, use a command like ``git show abcdcafecabcd`` to view
+    the patch description of the culprit. It near the top will have a line like
+    'commit cafec0cacaca0 upstream.' or 'Upstream commit cafec0cacaca0; use that
+    commit-id in the next command and not the one the bisection blamed.
+
+  Now try reverting the culprit by specifying its commit id::
+
+    git revert --no-edit cafec0cacaca0
+
+  If that fails, give up trying and move on to the next step. But if it works,
+  build a kernel again using the familiar command sequence::
+
+    cp ~/kernel-config-working .config
+    make olddefconfig &&
+    make -j $(nproc --all) &&
+    # * Check if the free space suffices holding another kernel:
+    df -h /boot/ /lib/modules/
+    command -v installkernel && sudo make modules_install install
+    Make -s kernelrelease | tee -a ~/kernels-built
+    reboot
+
+  Now check one last time if the feature that made you perform a bisection work
+  with that kernel.
+
+  [:ref:`details<revert_bisref>`]
+
+.. _introclosure_bissbs:
+
+Supplementary tasks: cleanup during and after the bisection
+-----------------------------------------------------------
+
+During and after following this guide you might want or need to remove some of
+the kernels you installed: the boot menu otherwise will become confusing or
+space might run out.
+
+.. _makeroom_bissbs:
+
+* To remove one of the kernels you installed, look up its 'kernelrelease'
+  identifier. This guide stores them in '~/kernels-built', but the following
+  command will print them as well::
+
+    ls -ltr /lib/modules/*-local*
+
+  You in most situations want to remove the oldest kernels built during the
+  actual bisection (e.g. segment 3 of this guide). The two ones you created
+  beforehand (e.g. to test the latest codebase and the version considered
+  'good') might become handy to verify something later -- thus better keep them
+  around, unless you are really short on storage space.
+
+  To remove the modules of a kernel with the kernelrelease identifier
+  '*6.0-rc1-local-gcafec0cacaca0*', start by removing the directory holding its
+  modules::
+
+    sudo rm -rf /lib/modules/6.0-rc1-local-gcafec0cacaca0
+
+  Afterwards try the following command::
+
+    sudo kernel-install -v remove 6.0-rc1-local-gcafec0cacaca0
+
+  On quite a few distributions this will delete all other kernel files installed
+  while also removing the kernel's entry from the boot menu. But on some
+  distributions this command does not exist or will fail; in that case consult
+  the reference section, as your Linux distribution needs special care.
+
+  [:ref:`details<makeroom_bisref>`]
+
+.. _finishingtouch_bissbs:
+
+* Once you have finished the bisection, do not immediately remove anything you
+  set up, as you might need a few things again. What is safe to remove depends
+  on the outcome of the bisection:
+
+  * Could you initially reproduce the regression with the latest codebase and
+    after the bisection were able to fix the problem by reverting the culprit on
+    top of the latest codebase? Then you want to keep those two kernels around
+    for a while, but safely remove all others with a '-local' in the release
+    identifier.
+
+  * Did the bisection end on a merge-commit or seems questionable for other
+    reasons? Then you want to keep as many kernels as possible around for a few
+    days: it's pretty likely that you will be asked to recheck something.
+
+  * In other cases it likely is a good idea to keep the following kernels around
+    for some time: the one built from the latest codebase, the one created from
+    the version considered 'good', and the last three or four you compiled
+    during the actual bisection process.
+
+  [:ref:`details<finishingtouch_bisref>`]
+
+.. _submit_improvements:
+
+This concludes the step-by-step guide.
+
+Did you run into trouble following any of the above steps not cleared up by the
+reference section below? Did you spot errors? Or do you have ideas how to
+improve the guide? Then please take a moment and let the maintainer of this
+document know by email (Thorsten Leemhuis <linux@leemhuis.info>), ideally while
+CCing the Linux docs mailing list (linux-doc@vger.kernel.org). Such feedback is
+vital to improve this document further, which is in everybody's interest, as it
+will enable more people to master the task described here -- and hopefully also
+improve similar guides inspired by this one.
+
+
+Reference section for the step-by-step guide
+============================================
+
+This section holds additional information for almost all the items in above
+step-by-step guide.
+
+.. _backup_bisref:
+
+Prepare for emergencies
+-----------------------
+
+  *Create a fresh backup and put system repair and restore tools at hand.*
+  [:ref:`... <backup_bissbs>`]
+
+Remember, you are dealing with computers, which sometimes do unexpected things
+-- especially if you fiddle with crucial parts like the kernel of an operating
+system. That's what you are about to do in this process. Hence, better prepare
+for something going sideways, even if that should not happen.
+
+[:ref:`back to step-by-step guide <backup_bissbs>`]
+
+.. _vanilla_bisref:
+
+Remove anything related to externally maintained kernel modules
+---------------------------------------------------------------
+
+  *Remove all software that depends on externally developed kernel drivers or
+  builds them automatically.* [:ref:`...<vanilla_bissbs>`]
+
+Externally developed kernel modules can easily cause trouble during a bisection.
+
+But there is a more important reason why this guide contains this step: most
+kernel developers will not care about reports about regressions occurring with
+kernels that utilize such modules. That's because such kernels are not
+considered 'vanilla' anymore, as Documentation/admin-guide/reporting-issues.rst
+explains in more detail.
+
+[:ref:`back to step-by-step guide <vanilla_bissbs>`]
+
+.. _secureboot_bisref:
+
+Deal with techniques like Secure Boot
+-------------------------------------
+
+  *On platforms with 'Secure Boot' or similar techniques, prepare everything to
+  ensure the system will permit your self-compiled kernel to boot later.*
+  [:ref:`... <secureboot_bissbs>`]
+
+Many modern systems allow only certain operating systems to start; they thus by
+default will reject booting self-compiled kernels.
+
+You ideally deal with this by making your platform trust your self-built kernels
+with the help of a certificate. How to do that is not described
+here, as it requires various steps that would take the text too far away from
+its purpose; 'Documentation/admin-guide/module-signing.rst' and various web
+sides already explain everything needed in more detail.
+
+Temporarily disabling solutions like Secure Boot is another way to make your own
+Linux boot. On commodity x86 systems it is possible to do this in the BIOS Setup
+utility; the required steps vary a lot between machines and therefore cannot be
+described here.
+
+On mainstream x86 Linux distributions there is a third and universal option:
+disable all Secure Boot restrictions for your Linux environment. You can
+initiate this process by running ``mokutil --disable-validation``; this will
+tell you to create a one-time password, which is safe to write down. Now
+restart; right after your BIOS performed all self-tests the bootloader Shim will
+show a blue box with a message 'Press any key to perform MOK management'. Hit
+some key before the countdown exposes, which will open a menu. Choose 'Change
+Secure Boot state'. Shim's 'MokManager' will now ask you to enter three
+randomly chosen characters from the one-time password specified earlier. Once
+you provided them, confirm you really want to disable the validation.
+Afterwards, permit MokManager to reboot the machine.
+
+[:ref:`back to step-by-step guide <secureboot_bissbs>`]
+
+.. _bootworking_bisref:
+
+Boot the last kernel that was working
+-------------------------------------
+
+  *Boot into the last working kernel and briefly recheck if the feature that
+  regressed really works.* [:ref:`...<bootworking_bissbs>`]
+
+This will make later steps that cover creating and trimming the configuration do
+the right thing.
+
+[:ref:`back to step-by-step guide <bootworking_bissbs>`]
+
+.. _buildrequires_bisref:
+
+.. _diskspace_bisref:
+
+Space requirements
+------------------
+
+  *Ensure to have enough free space for building Linux.*
+  [:ref:`... <diskspace_bissbs>`]
+
+The numbers mentioned are rough estimates with a big extra charge to be on the
+safe side, so often you will need less.
+
+If you have space constraints, be sure to hay attention to the :ref:`step about
+debug symbols' <debugsymbols_bissbs>` and its :ref:`accompanying reference
+section' <debugsymbols_bisref>`, as disabling then will reduce the consumed disk
+space by quite a few gigabytes.
+
+[:ref:`back to step-by-step guide <diskspace_bissbs>`]
+
+.. _rangecheck_bisref:
+
+Bisection range
+---------------
+
+  *Determine the kernel versions considered 'good' and 'bad' throughout this
+  guide.* [:ref:`...<rangecheck_bissbs>`]
+
+Establishing the range of commits to be checked is mostly straightforward,
+except when a regression occurred when switching from a release of one stable
+series to a release of a later series (e.g. from 6.0.11 to 6.1.4). In that case
+Git will need some hand holding, as there is no straight line of descent.
+
+That's because with the release of 6.0 mainline carried on to 6.1 while the
+stable series 6.0.y branched to the side. It's therefore theoretically possible
+that the issue you face with 6.1.4 only worked in 6.0.11, as it was fixed by a
+commit that went into one of the 6.0.y releases, but never hit mainline or the
+6.1.y series. Thankfully that normally should not happen due to the way the
+stable/longterm maintainers maintain the code. It's thus pretty safe to assume
+6.0 as a 'good' kernel. That assumption will be tested anyway, as that kernel
+will be built and tested in the segment '2' of this guide; Git would force you
+to do this as well, if you tried bisecting between 6.0.11 and 6.1.13.
+
+[:ref:`back to step-by-step guide <rangecheck_bissbs>`]
+
+.. _sources_bisref:
+
+Install build requirements
+--------------------------
+
+  *Install all software required to build a Linux kernel.*
+  [:ref:`...<buildrequires_bissbs>`]
+
+The kernel is pretty stand-alone, but besides tools like the compiler you will
+sometimes need a few libraries to build one. How to install everything needed
+depends on your Linux distribution and the configuration of the kernel you are
+about to build.
+
+Here are a few examples what you typically need on some mainstream
+distributions:
+
+* Debian, Ubuntu, and derivatives::
+
+    sudo apt install bc binutils bison dwarves flex gcc git make openssl \
+      pahole perl-base libssl-dev libelf-dev
+
+* Fedora and derivatives::
+
+    sudo dnf install binutils /usr/include/{libelf.h,openssl/pkcs7.h} \
+      /usr/bin/{bc,bison,flex,gcc,git,openssl,make,perl,pahole}
+
+* openSUSE and derivatives::
+
+    sudo zypper install bc binutils bison dwarves flex gcc git make perl-base \
+      openssl openssl-devel libelf-dev
+
+In case you wonder why these lists include openssl and its development headers:
+they are needed for the Secure Boot support, which many distributions enable in
+their kernel configuration for x86 machines.
+
+Sometimes you will need tools for compression formats like bzip2, gzip, lz4,
+lzma, lzo, xz, or zstd as well.
+
+In case you want to adjust the build configuration with make targets like
+'menuconfig' or 'xconfig' later, ensure to also install development headers for
+ncurses and Qt5.
+
+You furthermore might need additional libraries and their development headers
+for tasks not covered in this guide. For example, zlib will be needed when
+building kernel tools from the tools/ directory;.
+
+[:ref:`back to step-by-step guide <buildrequires_bissbs>`]
+
+Download the sources using git
+------------------------------
+
+  *Retrieve the Linux mainline sources.*
+  [:ref:`...<sources_bissbs>`]
+
+The step-by-step guide outlines how to retrieve the Linux sources using a full
+Git clone of Linus' mainline repository. If you have an unreliable internet
+connection, you instead might want to use a 'Git bundle' to retrieve the
+sources; if downloading the complete repository would take too long or requires
+too much storage space, use a shallow clone instead.
+
+.. _sources_full:
+
+Downloading Linux mainline using a bundle
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Switch to you home directory and follow the instructions `kernel.org provides
+for this case <https://www.kernel.org/cloning-linux-from-a-bundle.html>`_.
+
+Afterwards add the stable Git repository as remote and all required
+stable/branches as explained in the step-by-step guide.
+
+.. _sources_shallow:
+
+Downloading Linux mainline using a shallow clone
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+First, execute the following command to retrieve the latest mainline codebase::
+
+    git clone -o mainline --no-checkout --depth 1 -b master \
+      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ~/linux/
+    cd ~/linux/
+
+Now deepen your clone's history to the second predecessor of the mainline
+release of your 'good' version. In case the latter are 6.0 or 6.0.11, 5.19 would
+be the first predecessor and 5.18 the second -- hence deepen the history up to
+the latter::
+
+    git fetch --shallow-exclude=v5.18 mainline
+
+Afterwards add the stable Git repository as remote and all required stable
+branches as explained in the step-by-step guide.
+
+Note, shallow clones have a few peculiar characteristics:
+
+ * For bisections the history needs to be deepend a few mainline versions
+   farther than it seems necessary, as explained above already. That's because
+   Git otherwise will be unable to revert or describe most of the commits within
+   a range (say v6.1..v6.2), as they are internally based on earlier kernels
+   releases (like v6.0-rc2 or 5.19-rc3).
+
+ * This document in most places uses ``git fetch`` with ``--shallow-exclude=``
+   to specify the earliest version you care about (or to be precise: its git
+   tag). You alternatively can use the parameter ``--shallow-since=`` to specify
+   an absolute (say ``'2023-07-15'``) or relative (``'12 months'``) date to
+   define the depth of the history you want to download. When using them while
+   bisecting mainline, ensure to deepen the history to at least 7 months before
+   the release of the mainline release your 'good' kernel is based on.
+
+ * Be warned, when deepening your clone you might encounter an error like
+   'fatal: error in object: unshallow cafecaca0c0dacafecaca0c0dacafecaca0c0da'.
+   In that case run ``git repack -d`` and try again.
+
+[:ref:`back to step-by-step guide <sources_bissbs>`]
+[:ref:`back to section intro <sources_bisref>`]
+
+.. _oldconfig_bisref:
+
+Start defining the build configuration for your kernel
+------------------------------------------------------
+
+  *Start preparing a kernel build configuration (the '.config' file).*
+  [:ref:`... <oldconfig_bissbs>`]
+
+*Note, this is the first of multiple steps in this guide that create or modify
+build artifacts. The commands used in this guide store them right in the source
+tree to keep things simple. In case you prefer storing the build artifacts
+separately, create a directory like '~/linux-builddir/' and add the parameter
+``O=~/linux-builddir/`` to all make calls used throughout this guide. You will
+have to point other commands there as well -- among them the ``./scripts/config
+[...]`` commands, which will require ``--file ~/linux-builddir/.config`` to
+locate the right build configuration.*
+
+Two things can easily go wrong when creating a .config file as advised:
+
+ * The oldconfig target will use a .config file from your build directory, if
+   one is already present there (e.g. '~/linux/.config'). That's totally fine if
+   that's what you intend (see next step), but in all other cases you want to
+   delete it. This for example is important in case you followed this guide
+   further, but due to problems come back here to redo the configuration from
+   scratch.
+
+ * Sometimes olddefconfig is unable to locate the .config file for your running
+   kernel and will use defaults, as briefly outlined in the guide. In that case
+   check if your distribution ships the configuration somewhere and manually put
+   it in the right place (e.g. '~/linux/.config') if it does. On distributions
+   where /proc/config.gz exists this can be achieved using this command::
+
+     zcat /proc/config.gz > .config
+
+   Once you put it there, run ``make olddefconfig`` again to adjust it to the
+   needs of the kernel about to be built.
+
+Note, the olddefconfig target will set any undefined build options to their
+default value. If you prefer to set such configuration options manually, use
+``make oldconfig`` instead. Then for each undefined configuration option you
+will be asked how to proceed; in case you are unsure what to answer, simply hit
+'enter' to apply the default value. Note though that for bisections you normally
+want to go with the defaults, as you otherwise might enable a new feature that
+causes a problem looking like regressions (for example due to security
+restrictions).
+
+Occasionally odd things happen when trying to use a config file prepared for one
+kernel (say 6.1) on an older mainline release -- especially if it is much older
+(say v5.15). That's one of the reasons why the previous step in the guide told
+you to boot the kernel where everything works. If you manually add a .config
+file you thus want to ensure it's from the working kernel and not from a one
+that shows the regression.
+
+In case you want to build kernels for another machine, locate its kernel build
+configuration; usually ``ls /boot/config-$(uname -r)`` will print its name. Copy
+that file to the build machine and store it as ~/linux/.config; afterwards run
+``make olddefconfig`` to adjust it.
+
+[:ref:`back to step-by-step guide <oldconfig_bissbs>`]
+
+.. _localmodconfig_bisref:
+
+Trim the build configuration for your kernel
+--------------------------------------------
+
+  *Disable any kernel modules apparently superfluous for your setup.*
+  [:ref:`... <localmodconfig_bissbs>`]
+
+As explained briefly in the step-by-step guide already: with localmodconfig it
+can easily happen that your self-built kernels will lack modules for tasks you
+did not perform at least once before utilizing this make target. That happens
+when a task requires kernel modules which are only autoloaded when you execute
+it for the first time. So when you never performed that task since starting your
+kernel the modules will not have been loaded -- and from localmodonfig's point
+of view look superfluous, which thus disables them to reduce the amount of code
+to be compiled.
+
+You can try to avoid this by performing typical tasks that often will autoload
+additional kernel modules: start a VM, establish VPN connections, loop-mount a
+CD/DVD ISO, mount network shares (CIFS, NFS, ...), and connect all external
+devices (2FA keys, headsets, webcams, ...) as well as storage devices with file
+systems you otherwise do not utilize (btrfs, ext4, FAT, NTFS, XFS, ...). But it
+is hard to think of everything that might be needed -- even kernel developers
+often forget one thing or another at this point.
+
+Do not let that risk bother you, especially when compiling a kernel only for
+testing purposes: everything typically crucial will be there. And if you forget
+something important you can turn on a missing feature manually later and quickly
+run the commands again to compile and install a kernel that has everything you
+need.
+
+But if you plan to build and use self-built kernels regularly, you might want to
+reduce the risk by recording which modules your system loads over the course of
+a few weeks. You can automate this with `modprobed-db
+<https://github.com/graysky2/modprobed-db>`_. Afterwards use ``LSMOD=<path>`` to
+point localmodconfig to the list of modules modprobed-db noticed being used::
+
+  yes '' | make LSMOD='${HOME}'/.config/modprobed.db localmodconfig
+
+That parameter also allows you to build trimmed kernels for another machine in
+case you copied a suitable .config over to use as base (see previous step). Just
+run ``lsmod > lsmod_foo-machine`` on that system and copy the generated file to
+your build's host home directory. Then run these commands instead of the one the
+step-by-step guide mentions::
+
+  yes '' | make LSMOD=~/lsmod_foo-machine localmodconfig
+
+[:ref:`back to step-by-step guide <localmodconfig_bissbs>`]
+
+.. _tagging_bisref:
+
+Tag the kernels about to be build
+---------------------------------
+
+  *Ensure all the kernels you will build are clearly identifiable using a
+  special tag and a unique version identifier.* [:ref:`... <tagging_bissbs>`]
+
+This allows you to differentiate your distribution's kernels from those created
+during this process, as the file or directories for the latter will contain
+'-local' in the name; it also helps picking the right entry in the boot menu and
+not lose track of you kernels, as their version numbers will look slightly
+confusing during the bisection.
+
+[:ref:`back to step-by-step guide <tagging_bissbs>`]
+
+.. _debugsymbols_bisref:
+
+Decide to enable or disable debug symbols
+-----------------------------------------
+
+  *Decide how to handle debug symbols.* [:ref:`... <debugsymbols_bissbs>`]
+
+Having debug symbols available can be important when your kernel throws a
+'panic', 'Oops', 'warning', or 'BUG' later when running, as then you will be
+able to find the exact place where the problem occurred in the code. But
+collecting and embedding the needed debug information takes time and consumes
+quite a bit of space: in late 2022 the build artifacts for a typical x86 kernel
+trimmed with localmodconfig consumed around 5 Gigabyte of space with debug
+symbols, but less than 1 when they were disabled. The resulting kernel image and
+modules are bigger as well, which increases storage requirements for /boot/ and
+load times.
+
+In case you want a small kernel and are unlikely to decode a stack trace later,
+you thus might want to disable debug symbols to avoid those downsides. If it
+later turns out that you need them, just enable them as shown and rebuild the
+kernel.
+
+You on the other hand definitely want to enable them for this process, if there
+is a decent chance that you need to decode a stack trace later. The section
+'Decode failure messages' in Documentation/admin-guide/reporting-issues.rst
+explains this process in more detail.
+
+[:ref:`back to step-by-step guide <debugsymbols_bissbs>`]
+
+.. _configmods_bisref:
+
+Adjust build configuration
+--------------------------
+
+  *Check if you might want to or have to adjust some kernel configuration
+  options.*
+
+Depending on your needs you at this point might want or have to adjust some
+kernel configuration options.
+
+.. _configmods_distros_bisref:
+
+Distro specific adjustments
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+  *Are you running* [:ref:`... <configmods_bissbs>`]
+
+The following sections help you to avoid build problems that are known to occur
+when following this guide on a few commodity distributions.
+
+**Debian:**
+
+ * Remove a stale reference to a certificate file that would cause your build to
+   fail::
+
+    ./scripts/config --set-str SYSTEM_TRUSTED_KEYS ''
+
+   Alternatively, download the needed certificate and make that configuration
+   option point to it, as `the Debian handbook explains in more detail
+   <https://debian-handbook.info/browse/stable/sect.kernel-compilation.html>`_
+   -- or generate your own, as explained in
+   Documentation/admin-guide/module-signing.rst.
+
+[:ref:`back to step-by-step guide <configmods_bissbs>`]
+
+.. _configmods_individual_bisref:
+
+Individual adjustments
+~~~~~~~~~~~~~~~~~~~~~~
+
+  *If you want to influence the other aspects of the configuration, do so
+  now.* [:ref:`... <configmods_bissbs>`]
+
+You at this point can use a command like ``make menuconfig`` to enable or
+disable certain features using a text-based user interface; to use a graphical
+configuration utility, call the make target ``xconfig`` or ``gconfig`` instead.
+All of them require development libraries from toolkits they are based on
+(ncurses, Qt5, Gtk2); an error message will tell you if something required is
+missing.
+
+[:ref:`back to step-by-step guide <configmods_bissbs>`]
+
+.. _saveconfig_bisref:
+
+Put the .config file aside
+--------------------------
+
+  *Reprocess the .config after the latest changes and store it in a safe place.*
+  [:ref:`... <saveconfig_bissbs>`]
+
+Put the .config you prepared aside, as you want to copy it back to the build
+directory every time  during this guide before you start building another
+kernel. That's because going back and forth between different versions can alter
+.config files in odd ways; those occasionally cause side effects that could
+confuse testing or in some cases render the result of your bisection
+meaningless.
+
+[:ref:`back to step-by-step guide <saveconfig_bissbs>`]
+
+.. _introlatestcheck_bisref:
+
+Try to reproduce the regression
+-------------------------------
+
+  *Verify the regression is not caused by some .config change and check if it
+  still occurs with the latest codebase.* [:ref:`... <introlatestcheck_bissbs>`]
+
+For some readers it might seem unnecessary to check the latest codebase at this
+point, especially if you did that already with a kernel prepared by your
+distributor or face a regression within a stable/longterm series. But it's
+highly recommended for these reasons:
+
+* You will run into any problems caused by your setup before you actually begin
+  a bisection. That will make it a lot easier to differentiate between 'this
+  most likely is some problem in my setup' and 'this change needs to be skipped
+  during the bisection, as the kernel sources at that stage contain an unrelated
+  problem that causes building or booting to fail'.
+
+* These steps will rule out if your problem is caused by some change in the
+  build configuration between the 'working' and the 'broken' kernel. This for
+  example can happen when your distributor enabled an additional security
+  feature in the newer kernel which was disabled or not yet supported by the
+  older kernel. That security feature might get into the way of something you
+  do -- in which case your problem from the perspective of the Linux kernel
+  upstream developers is not a regression, as
+  Documentation/admin-guide/reporting-regressions.rst explains in more detail.
+  You thus would waste your time if you'd try to bisect this.
+
+* If the cause for your regression was already fixed in the latest mainline
+  codebase, you'd perform the bisection for nothing. This holds true for a
+  regression you encountered with a stable/longterm release as well, as they are
+  often caused by problems in mainline changes that were backported -- in which
+  case the problem will have to be fixed in mainline first. Maybe it already was
+  fixed there and the fix is already in the process of being backported.
+
+* For regressions within a stable/longterm series it's furthermore crucial to
+  know if the issue is specific to that series or also happens in the mainline
+  kernel, as the report needs to be sent to different people:
+
+  * Regressions specific to a stable/longterm series are the stable team's
+    responsibility; mainline Linux developers might or might not care.
+
+  * Regressions also happening in mainline are something the regular Linux
+    developers and maintainers have to handle; the stable team does not care
+    and does not need to be involved in the report, they just should be told
+    to backport the fix once it's ready.
+
+  Your report might be ignored if you send it to the wrong party -- and even
+  when you get a reply there is a decent chance that developers tell you to
+  evaluate   which of the two cases it is before they take a closer look.
+
+[:ref:`back to step-by-step guide <introlatestcheck_bissbs>`]
+
+.. _checkoutmaster_bisref:
+
+Checkout the latest Linux codebase
+----------------------------------
+
+  *Checkout the latest Linux codebase.*
+  [:ref:`... <introlatestcheck_bissbs>`]
+
+In case you later want to recheck if an ever newer codebase might fix the
+problem, remember to run that ``git fetch --shallow-exclude [...]`` command
+again mentioned earlier to update your local Git repository.
+
+[:ref:`back to step-by-step guide <introlatestcheck_bissbs>`]
+
+.. _build_bisref:
+
+Build your kernel
+-----------------
+
+  *Build the image and the modules of your first kernel using the config file
+  you prepared.* [:ref:`... <build_bissbs>`]
+
+A lot can go wrong at this stage, but the instructions below will help you help
+yourself. Another subsection explains how to directly package your kernel up as
+deb, rpm or tar file.
+
+Dealing with build errors
+~~~~~~~~~~~~~~~~~~~~~~~~~
+
+When a build error occurs, it might be caused by some aspect of your machine's
+setup that often can be fixed quickly; other times though the problem lies in
+the code and can only be fixed by a developer. A close examination of the
+failure messages coupled with some research on the internet will often tell you
+which of the two it is. To perform such a investigation, restart the build
+process like this::
+
+  make V=1
+
+The ``V=1`` activates verbose output, which might be needed to see the actual
+error. To make it easier to spot, this command also omits the ``-j $(nproc
+--all)`` used earlier to utilize every CPU core in the system for the job -- but
+this parallelism also results in some clutter when failures occur.
+
+After a few seconds the build process should run into the error again. Now try
+to find the most crucial line describing the problem. Then search the internet
+for the most important and non-generic section of that line (say 4 to 8 words);
+avoid or remove anything that looks remotely system-specific, like your username
+or local path names like ``/home/username/linux/``. First try your regular
+internet search engine with that string, afterwards search Linux kernel mailing
+lists via `lore.kernel.org/all/ <https://lore.kernel.org/all/>`_.
+
+This most of the time will find something that will explain what is wrong; quite
+often one of the hits will provide a solution for your problem, too. If you
+do not find anything that matches your problem, try again from a different angle
+by modifying your search terms or using another line from the error messages.
+
+In the end, most trouble you are to run into has likely been encountered and
+reported by others already. That includes issues where the cause is not your
+system, but lies the code. If you run into one of those, you might thus find a
+solution (e.g. a patch) or workaround for your problem, too.
+
+Package your kernel up
+~~~~~~~~~~~~~~~~~~~~~~
+
+The step-by-step guide uses the default make targets (e.g. 'bzImage' and
+'modules' on x86) to build the image and the modules of your kernel, which later
+steps of the guide then install. You instead can also directly build everything
+and directly package it up by using one of the following targets:
+
+ * ``make -j $(nproc --all) bindeb-pkg`` to generate a deb package
+
+ * ``make -j $(nproc --all) binrpm-pkg`` to generate a rpm package
+
+ * ``make -j $(nproc --all) tarbz2-pkg`` to generate a bz2 compressed tarball
+
+This is just a selection of available make targets for this purpose, see
+``make help`` for others. You can also use these targets after running
+``make -j $(nproc --all)``, as they will pick up everything already built.
+
+If you employ the targets to generate deb or rpm packages, ignore the
+step-by-step guide's instructions on installing and removing your kernel;
+instead install and remove the packages using the package utility for the format
+(e.g. dpkg and rpm) or a package management utility build on top of them (apt,
+aptitude, dnf/yum, zypper, ...). Be aware that the packages generated using
+these two make targets are designed to work on various distributions utilizing
+those formats, they thus will sometimes behave differently than your
+distribution's kernel packages.
+
+[:ref:`back to step-by-step guide <build_bissbs>`]
+
+.. _install_bisref:
+
+Put the kernel in place
+-----------------------
+
+  *Install the kernel you just built.* [:ref:`... <install_bissbs>`]
+
+What you need to do after executing the command in the step-by-step guide
+depends on the existence and the implementation of an ``installkernel``
+executable. Many commodity Linux distributions ship such a kernel installer in
+'/sbin/' that does everything needed, hence there is nothing left for you
+except rebooting. But some distributions contain an installkernel that does
+only part of the job -- and a few lack it completely and leave all the work to
+you.
+
+If ``installkernel`` is found, the kernel's build system will delegate the
+actual installation of your kernel's image and related files to this executable.
+On almost all Linux distributions it will store the image as '/boot/vmlinuz-
+<kernelrelease identifier>' and put a 'System.map-<kernelrelease
+identifier>' alongside it. Your kernel will thus be installed in parallel to any
+existing ones, unless you already have one with exactly the same release name.
+
+Installkernel on many distributions will afterwards generate an 'initramfs'
+(often also called 'initrd'), which commodity distributions rely on for booting;
+hence be sure to keep the order of the two make targets used in the step-by-step
+guide, as things will go sideways if you install your kernel's image before its
+modules. Often installkernel will then add your kernel to the bootloader
+configuration, too. You have to take care of one or both of these tasks
+yourself, if your distributions installkernel doesn't handle them.
+
+A few distributions like Arch Linux and its derivatives totally lack an
+installkernel executable. On those just install the modules using the kernel's
+build system and then install the image and the System.map file manually::
+
+   sudo make modules_install
+   sudo install -m 0600 $(make -s image_name) /boot/vmlinuz-$(make -s kernelrelease)
+   sudo install -m 0600 System.map /boot/System.map-$(make -s kernelrelease)
+
+If your distribution boots with the help of an initramfs, now generate one for
+your kernel using the tools your distribution provides for this process.
+Afterwards add your kernel to your bootloader configuration and reboot.
+
+[:ref:`back to step-by-step guide <install_bissbs>`]
+
+.. _storagespace_bisref:
+
+Storage requirements per kernel
+-------------------------------
+
+  *Check how much storage space the kernel, its modules, and other related files
+  like the initramfs consume.* [:ref:`... <storagespace_bissbs>`]
+
+The kernels built during a bisection consume quite a bit of space in /boot/ and
+/lib/modules/, especially if you enabled debug symbols. That makes it easy to
+fill up volumes during a bisection -- and due to that even kernels which used to
+work earlier might fail to boot. To prevent that you will need to know how much
+space each installed kernel typically requires.
+
+Note, most of the time the pattern '/boot/*$(make -s kernelrelease)*' used in
+the guide will match all files needed to boot your kernel -- but neither the
+path nor the naming scheme are mandatory. On some distributions you thus will
+need to look in different places.
+
+[:ref:`back to step-by-step guide <storagespace_bissbs>`]
+
+.. _recheckbroken_bisref:
+
+Check the kernel built from the latest codebase
+-----------------------------------------------
+
+  *Reboot into the kernel you just built and check if the feature that regressed
+  is really broken there.* [:ref:`... <recheckbroken_bissbs>`]
+
+There are a couple of reasons why the regression you face might not show up with
+your own kernel built from the latest codebase. These are the most frequent:
+
+* The cause for the regression was fixed meanwhile.
+
+* The regression with the broken kernel was caused by a change in the build
+  configuration the provider of your kernel carried out.
+
+* Your problem might be a race condition that does not show up with your kernel;
+  the trimmed build configuration, a different setting for debug symbols, the
+  compiler used, and various other things can cause this.
+
+* In case you encountered the regression with a stable/longterm kernel it might
+  be a problem that is specific to that series; the next step in this guide will
+  check this.
+
+[:ref:`back to step-by-step guide <recheckbroken_bissbs>`]
+
+.. _recheckstablebroken_bisref:
+
+Check the kernel built from the latest stable/longterm codebase
+---------------------------------------------------------------
+
+  *Are you facing a regression within a stable/longterm release, but failed to
+  reproduce it with the kernel you just built using the latest mainline sources?
+  Then check if the latest codebase for the particular series might already fix
+  the problem.* [:ref:`... <recheckstablebroken_bissbs>`]
+
+If this kernel does not show the regression either, there most likely is no need
+for a bisection.
+
+[:ref:`back to step-by-step guide <recheckstablebroken_bissbs>`]
+
+.. _introworkingcheck_bisref:
+
+Ensure the 'good' version is really working well
+------------------------------------------------
+
+  *Check if the kernels you build work fine.*
+  [:ref:`... <introworkingcheck_bissbs>`]
+
+This section will reestablish a known working base. Skipping it might be
+appealing, but is usually a bad idea, as it does something important:
+
+It will ensure the .config file you prepared earlier actually works as expected.
+That is in your own interest, as trimming the configuration is not foolproof --
+and you might be building and testing ten or more kernels for nothing before
+starting to suspect something might be wrong with the build configuration.
+
+That alone is reason enough to spend the time on this, but not the only reason.
+
+Many readers of this guide normally run kernels that are patched, use add-on
+modules, or both. Those kernels thus are not considered 'vanilla' -- therefore
+it's possible that the thing that regressed might never have worked in vanilla
+builds of the 'good' version in the first place.
+
+There is a third reason for those that noticed a regression between
+stable/longterm kernels of different series (e.g. v6.0.13..v6.1.5): it will
+ensure the kernel version you assumed to be 'good' earlier in the process (e.g.
+v6.0) actually is working.
+
+[:ref:`back to step-by-step guide <introworkingcheck_bissbs>`]
+
+.. _recheckworking_bisref:
+
+Build your own version of the 'good' kernel
+-------------------------------------------
+
+  *Build your own variant of the working kernel and check if the feature that
+  regressed works as expected with it.* [:ref:`... <recheckworking_bissbs>`]
+
+In case the feature that broke with newer kernels does not work with your first
+self-built kernel, find and resolve the cause before moving on. There are a
+multitude of reasons why this might happen. Some ideas where to look:
+
+* Maybe localmodconfig did something odd and disabled the module required to
+  test the feature? Then you might want to recreate a .config file based on the
+  one from the last working kernel and skip trimming it down; manually disabling
+  some features in the .config might work as well to reduce the build time.
+
+* Maybe it's not a kernel regression and something that is caused by some fluke,
+  a broken initramfs (also known as initrd), new firmware files, or an updated
+  userland software?
+
+* Maybe it was a feature added to your distributor's kernel which vanilla Linux
+  at that point never supported?
+
+Note, if you found and fixed problems with the .config file, you want to use it
+to build another kernel from the latest codebase, as your earlier tests with
+mainline and the latest version from an affected stable/longterm series most
+likely has been flawed.
+
+[:ref:`back to step-by-step guide <recheckworking_bissbs>`]
+
+.. _bisectstart_bisref:
+
+Start the bisection
+-------------------
+
+  *Start the bisection and tell Git about the versions earlier established as
+  'good' and 'bad'.* [:ref:`... <bisectstart_bissbs>`]
+
+This will start the bisection process; the last of the commands will make Git
+checkout a commit round about half-way between the 'good' and the 'bad' changes
+for your to test.
+
+[:ref:`back to step-by-step guide <bisectstart_bissbs>`]
+
+.. _bisectbuild_bisref:
+
+Build a kernel from the bisection point
+---------------------------------------
+
+  *Build, install, and boot a kernel from the code Git checked out using the
+  same commands you used earlier.* [:ref:`... <bisectbuild_bissbs>`]
+
+There are two things worth of note here:
+
+* Occasionally building the kernel will fail or it might not boot due some
+  problem in the code at the bisection point. In that case run this command::
+
+    git bisect skip
+
+  Git will then checkout another commit nearby which with a bit of luck should
+  work better. Afterwards restart executing this step.
+
+* Those slightly odd looking version identifiers can happen during bisections,
+  because the Linux kernel subsystems prepare their changes for a new mainline
+  release (say 6.2) before its predecessor (e.g. 6.1) is finished. They thus
+  base them on a somewhat earlier point like v6.1-rc1 or even v6.0 -- and then
+  get merged for 6.2 without rebasing nor squashing them once 6.1 is out. This
+  leads to those slightly odd looking version identifiers coming up during
+  bisections.
+
+[:ref:`back to step-by-step guide <bisectbuild_bissbs>`]
+
+.. _bisecttest_bisref:
+
+Bisection checkpoint
+--------------------
+
+  *Check if the feature that regressed works in the kernel you just built.*
+  [:ref:`... <bisecttest_bissbs>`]
+
+Ensure what you tell Git is accurate: getting it wrong just one time will bring
+the rest of the bisection totally of course, hence all testing after that point
+will be for nothing.
+
+[:ref:`back to step-by-step guide <bisecttest_bissbs>`]
+
+.. _bisectlog_bisref:
+
+Put the bisection log away
+--------------------------
+
+  *Store Git's bisection log and the current .config file in a safe place.*
+  [:ref:`... <bisectlog_bissbs>`]
+
+As indicated above: declaring just one kernel wrongly as 'good' or 'bad' will
+render the end result of a bisection useless. In that case you'd normally have
+to restart the bisection from scratch. The log can prevent that, as it might
+allow someone to point out where a bisection likely went sideways -- and then
+instead of testing ten or more kernels you might only have to build a few to
+resolve things.
+
+The .config file is put aside, as there is a decent chance that developers might
+ask for it after you reported the regression.
+
+[:ref:`back to step-by-step guide <bisectlog_bissbs>`]
+
+.. _revert_bisref:
+
+Try reverting the culprit
+-------------------------
+
+  *Try reverting the culprit on top of the latest codebase to see if this fixes
+  your regression.* [:ref:`... <revert_bissbs>`]
+
+This is an optional step, but whenever possible one you should try: there is a
+decent chance that developers will ask you to perform this step when you bring
+the bisection result up. So give it a try, you are in the flow already, building
+one more kernel shouldn't be a big deal at this point.
+
+The step-by-step guide covers everything relevant already except one slightly
+rare thing: did you bisected a regression that also happened with mainline using
+a stable/longterm series, but Git failed to revert the commit in mainline? Then
+try to revert the culprit in the affected stable/longterm series -- and if that
+succeeds, test that kernel version instead.
+
+[:ref:`back to step-by-step guide <revert_bissbs>`]
+
+
+Supplementary tasks: cleanup during and after the bisection
+-----------------------------------------------------------
+
+.. _makeroom_bisref:
+
+Cleaning up during the bisection
+--------------------------------
+
+  *To remove one of the kernels you installed, look up its 'kernelrelease'
+  identifier.* [:ref:`... <makeroom_bissbs>`]
+
+The kernels you install during this process are easy to remove later, as its
+parts are only stored in two places and clearly identifiable. You thus do not
+need to worry to mess up your machine when you install a kernel manually (and
+thus bypass your distribution's packaging system): all parts of your kernels are
+relatively easy to remove later.
+
+One of the two places is a directory in /lib/modules/, which holds the modules
+for each installed kernel. This directory is named after the kernel's release
+identifier; hence, to remove all modules for one of the kernels you built,
+simply remove its modules directory in /lib/modules/.
+
+The other place is /boot/, where typically two up to five files will be placed
+during installation of a kernel. All of them usually contain the release name in
+their file name, but how many files and their exact name depends somewhat on
+your distribution's installkernel executable and its initramfs generator. On
+some distributions the ``kernel-install remove...`` command mentioned in the
+step-by-step guide will delete all of these files for you while also removing
+the menu entry for the kernel from your bootloader configuration. On others you
+have to take care of these two tasks yourself. The following command should
+interactively remove the three main files of a kernel with the release name
+'6.0-rc1-local-gcafec0cacaca0'::
+
+  rm -i /boot/{System.map,vmlinuz,initr}-6.0-rc1-local-gcafec0cacaca0
+
+Afterwards check for other files in /boot/ that have
+'6.0-rc1-local-gcafec0cacaca0' in their name and consider deleting them as well.
+Now remove the boot entry for the kernel from your bootloader's configuration;
+the steps to do that vary quite a bit between Linux distributions.
+
+Note, be careful with wildcards like '*' when deleting files or directories
+for kernels manually: you might accidentally remove files of a 6.0.11 kernel
+when all you want is to remove 6.0 or 6.0.1.
+
+[:ref:`back to step-by-step guide <makeroom_bissbs>`]
+
+Cleaning up after the bisection
+-------------------------------
+
+.. _finishingtouch_bisref:
+
+  *Once you have finished the bisection, do not immediately remove anything
+  you set up, as you might need a few things again.*
+  [:ref:`... <finishingtouch_bissbs>`]
+
+When you are really short of storage space removing the kernels as described in
+the step-by-step guide might not free as much space as you would like. In that
+case consider running ``rm -rf ~/linux/*`` as well now. This will remove the
+build artifacts and the Linux sources, but will leave the Git repository
+(~/linux/.git/) behind -- a simple ``git reset --hard`` thus will bring the
+sources back.
+
+Removing the repository as well would likely be unwise at this point: there is a
+decent chance developers will ask you to build another kernel to perform
+additional tests. This is often required to debug an issue or check proposed
+fixes. Before doing so you want to run the ``git fetch mainline`` command again
+followed by ``git checkout mainline/master`` to bring your clone up to date and
+checkout the latest codebase. Then apply the patch using ``git apply
+<filename>`` or ``git am <filename>`` and build yet another kernel using the
+familiar commands.
+
+Additional tests are also the reason why you want to keep the
+~/kernel-config-working file around for a few weeks.
+
+[:ref:`back to step-by-step guide <finishingtouch_bissbs>`]
+
+
+Additional reading material
+===========================
+
+Further sources
+---------------
+
+* The `man page for 'git bisect' <https://git-scm.com/docs/git-bisect>`_ and
+  `fighting regressions with 'git bisect' <https://git-scm.com/docs/git-bisect-lk2009.html>`_
+  in the Git documentation.
+* `Working with git bisect <https://nathanchance.dev/posts/working-with-git-bisect/>`_
+  from kernel developer Nathan Chancellor.
+* `Using Git bisect to figure out when brokenness was introduced <http://webchick.net/node/99>`_.
+* `Fully automated bisecting with 'git bisect run' <https://lwn.net/Articles/317154>`_.
+
+..
+   end-of-content
+..
+   This document is maintained by Thorsten Leemhuis <linux@leemhuis.info>. If
+   you spot a typo or small mistake, feel free to let him know directly and
+   he'll fix it. You are free to do the same in a mostly informal way if you
+   want to contribute changes to the text -- but for copyright reasons please CC
+   linux-doc@vger.kernel.org and 'sign-off' your contribution as
+   Documentation/process/submitting-patches.rst explains in the section 'Sign
+   your work - the Developer's Certificate of Origin'.
+..
+   This text is available under GPL-2.0+ or CC-BY-4.0, as stated at the top
+   of the file. If you want to distribute this text under CC-BY-4.0 only,
+   please use 'The Linux kernel development community' for author attribution
+   and link this as source:
+   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/plain/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
+
+..
+   Note: Only the content of this RST file as found in the Linux kernel sources
+   is available under CC-BY-4.0, as versions of this text that were processed
+   (for example by the kernel's build system) might contain content taken from
+   files which use a more restrictive license.
diff --git a/MAINTAINERS b/MAINTAINERS
index 8d1052fa6a6924..e6f984ea7d541a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6373,6 +6373,7 @@ L:	linux-doc@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/quickly-build-trimmed-linux.rst
 F:	Documentation/admin-guide/reporting-issues.rst
+F:	Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
 
 DOCUMENTATION SCRIPTS
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>

base-commit: 6fca09b64f2e78c8dfb7d091004789c46289baa2
-- 
2.43.0



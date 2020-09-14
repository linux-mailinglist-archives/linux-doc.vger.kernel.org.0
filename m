Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB4B026827E
	for <lists+linux-doc@lfdr.de>; Mon, 14 Sep 2020 04:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgINCSR (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 13 Sep 2020 22:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgINCSQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 13 Sep 2020 22:18:16 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31A6EC06174A;
        Sun, 13 Sep 2020 19:18:16 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id w7so11289035pfi.4;
        Sun, 13 Sep 2020 19:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5ctOhTHxOolnlh5TPIYvHhN0DI5aH/8Wn2gnRn9uyfU=;
        b=Q5LHpPGACyqsbY7QE8dJizCKdFa+fRxQbS5af9M0O3K6fplgNLy/mwTtw0PxZtJzMQ
         vsWhlwJRA2LeVg8EqQ0ZQi5SHVtGyfjbsjHG8Kvd560UsXg2Je/TiSPuZzCEm3KJkkeQ
         H6zCZ6ieJNaj4eNgb6nWFoUdlw6O1f4nH1R48dhWy2Jbnw16KAEUNMU5sq063Q98hZRk
         uW1U2izrJMpKaUaJRn+JLqq/2Dbn0ZYbrIhvPnTePt+f+80NnBLaMuCVl041MqRq9JnY
         XrYhXl0mnGs8QFpRlyIL8REXOgX+cpyi7l9S7DQM96QT83zm/gcii4OURUbJGqSUl4KJ
         JUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ctOhTHxOolnlh5TPIYvHhN0DI5aH/8Wn2gnRn9uyfU=;
        b=ATGztfpAnmgsM58NQfgEbYbr3kGarhg2jTsvbx45HMMLzzfEdJSEuk0GAfLcULnrv8
         LEmKEvhVRtYfiWnzeCjtEJvhwgfJ0/35tTIKp8A56SqWk1hh71alQuSM+PbC5j014kUN
         tBeCOwj0zkgDgHH5psIQE+qbnkGc9RIeNVf2a4M/XZH+3h6e6WKZtfjIUdNRNg2EeZx4
         hHhDmNsxcJx0hen7A+MEqDhogDWDpuYAKS2atV9xr43VFXpjW5x3NJLSEoIhQuKmArXM
         S7KSfGIYBuJMpw9N1FWRH3UNdE85U9BrJAxmMoCMYno6SfDvu8EYJtSBYDIr04wWVpBk
         hIOQ==
X-Gm-Message-State: AOAM530HY359Cia/ur14dvr3c84ie1cNL8snJdljsWvMWV6EqSGrqNl6
        XQM856oygk7k0qxlmsHebt2N3y7LvwWX3w==
X-Google-Smtp-Source: ABdhPJx72Hlhqco1iFweESzw6h/Gw+Dzg93zCAOwxlZB2NlZtygME8RtAyyQV8DgRxq+gsoFHe/ssQ==
X-Received: by 2002:a17:902:ab92:: with SMTP id f18mr12385449plr.12.1600049895446;
        Sun, 13 Sep 2020 19:18:15 -0700 (PDT)
Received: from dhcp-12-153.nay.redhat.com ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id o20sm7312743pgh.63.2020.09.13.19.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 19:18:14 -0700 (PDT)
From:   Hangbin Liu <liuhangbin@gmail.com>
To:     linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tim.Bird@sony.com,
        Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCHv4 kselftest next] selftests/run_kselftest.sh: make each test individually selectable
Date:   Mon, 14 Sep 2020 10:17:58 +0800
Message-Id: <20200914021758.420874-1-liuhangbin@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200911083053.2816576-1-liuhangbin@gmail.com>
References: <20200911083053.2816576-1-liuhangbin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, after generating run_kselftest.sh, there is no way to choose
which test we could run. All the tests are listed together and we have
to run all every time. This patch enhanced the run_kselftest.sh to make
the tests individually selectable. e.g.

  $ ./run_kselftest.sh -t "bpf size timers"

Before the patch:
================

$ cat run_kselftest.sh
\#!/bin/sh
BASE_DIR=$(realpath $(dirname $0))
cd $BASE_DIR
. ./kselftest/runner.sh
ROOT=$PWD
if [ "$1" = "--summary" ]; then
  logfile=$BASE_DIR/output.log
  cat /dev/null > $logfile
fi
[ -w /dev/kmsg ] && echo "kselftest: Running tests in android" >> /dev/kmsg
cd android
run_many        \
        "run.sh"
cd $ROOT
...<snip>...
[ -w /dev/kmsg ] && echo "kselftest: Running tests in zram" >> /dev/kmsg
cd zram
run_many        \
        "zram.sh"
cd $ROOT

After the patch:
===============

$ cat run_kselftest.sh
\#!/bin/sh
BASE_DIR=$(realpath $(dirname $0))
. ./kselftest/runner.sh
TESTS="android ...<snip>... filesystems/binderfs ...<snip>... zram"

run_android()
{
        [ -w /dev/kmsg ] && echo "kselftest: Running tests in android" >> /dev/kmsg
        cd android
        run_many        \
                "run.sh"
        cd $ROOT
}

...<snip>...

run_filesystems_binderfs()
{
        [ -w /dev/kmsg ] && echo "kselftest: Running tests in filesystems/binderfs" >> /dev/kmsg
        cd filesystems/binderfs
        run_many        \
                "binderfs_test"
        cd $ROOT
}

...<snip>...

run_zram()
{
        [ -w /dev/kmsg ] && echo "kselftest: Running tests in zram" >> /dev/kmsg
        cd zram
        run_many        \
                "zram.sh"
        cd $ROOT
}

usage()
{
        cat <<EOF
usage: ${0##*/} OPTS
        -s | --summary          Only print summary info and put detailed log in output.log
        -t | --tests            Test name you want to run specifically
        -h | --help             Show this usage info
EOF
}

while true; do
        case "$1" in
        -s | --summary ) logfile=$BASE_DIR/output.log; cat /dev/null > $logfile; shift ;;
        -t | --tests ) TESTS=$2; shift 2 ;;
        -h | --help ) usage; exit 0;;
        "" ) break;;
        * ) usage; exit 1;;
        esac
done

cd $BASE_DIR
ROOT=$PWD
for folder in $TESTS; do
        folder=$(echo $folder | tr -s '/-' '_')
        run_$folder
done

Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>

---
v4:
Add parameter -l to list available tests, suggested by Bird, Tim

v3:
1) rebase the patch to latest code
2) move `tr -s "/-" "_"` in for loop at the end so user could use test
   folder name directly. Before the fix, user need to use
   ./run_kselftest.sh -t 'networking_forwarding'. Now they can just run
   ./run_kselftest.sh -t 'networking/forwarding' directly.

v2: update document and commit description.
---
 Documentation/dev-tools/kselftest.rst |  8 +++++
 tools/testing/selftests/Makefile      | 51 +++++++++++++++++++++------
 tools/testing/selftests/lib.mk        |  2 +-
 3 files changed, 50 insertions(+), 11 deletions(-)

diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
index 469d115a95f1..7b92f9c177f6 100644
--- a/Documentation/dev-tools/kselftest.rst
+++ b/Documentation/dev-tools/kselftest.rst
@@ -151,6 +151,14 @@ note some tests will require root privileges::
    $ cd kselftest
    $ ./run_kselftest.sh
 
+Or you can run some specific test cases in the installed Kselftests by::
+
+   $ ./run_kselftest.sh -t "bpf size timers"
+
+You can view the available tests to run with::
+
+   $ ./run_kselftest.sh -l
+
 Packaging selftests
 ===================
 
diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 15c1c1359c50..4c8159dd2bd7 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -225,13 +225,9 @@ ifdef INSTALL_PATH
 	@# Ask all targets to emit their test scripts
 	echo "#!/bin/sh" > $(ALL_SCRIPT)
 	echo "BASE_DIR=\$$(realpath \$$(dirname \$$0))" >> $(ALL_SCRIPT)
-	echo "cd \$$BASE_DIR" >> $(ALL_SCRIPT)
 	echo ". ./kselftest/runner.sh" >> $(ALL_SCRIPT)
-	echo "ROOT=\$$PWD" >> $(ALL_SCRIPT)
-	echo "if [ \"\$$1\" = \"--summary\" ]; then" >> $(ALL_SCRIPT)
-	echo "  logfile=\$$BASE_DIR/output.log" >> $(ALL_SCRIPT)
-	echo "  cat /dev/null > \$$logfile" >> $(ALL_SCRIPT)
-	echo "fi" >> $(ALL_SCRIPT)
+	echo "TESTS=\"$(TARGETS)\"" >> $(ALL_SCRIPT)
+	echo "" >> $(ALL_SCRIPT);
 
 	@# While building run_kselftest.sh skip also non-existent TARGET dirs:
 	@# they could be the result of a build failure and should NOT be
@@ -239,15 +235,50 @@ ifdef INSTALL_PATH
 	for TARGET in $(TARGETS); do \
 		BUILD_TARGET=$$BUILD/$$TARGET;	\
 		[ ! -d $(INSTALL_PATH)/$$TARGET ] && echo "Skipping non-existent dir: $$TARGET" && continue; \
-		echo "[ -w /dev/kmsg ] && echo \"kselftest: Running tests in $$TARGET\" >> /dev/kmsg" >> $(ALL_SCRIPT); \
-		echo "cd $$TARGET" >> $(ALL_SCRIPT); \
-		echo -n "run_many" >> $(ALL_SCRIPT); \
+		echo "run_$$TARGET()" | tr -s "/-" "_" >> $(ALL_SCRIPT); \
+		echo "{" >> $(ALL_SCRIPT); \
+		echo -e "\t[ -w /dev/kmsg ] && echo \"kselftest: Running tests in $$TARGET\" >> /dev/kmsg" >> $(ALL_SCRIPT); \
+		echo -e "\tcd $$TARGET" >> $(ALL_SCRIPT); \
+		echo -en "\trun_many" >> $(ALL_SCRIPT); \
 		echo -n "Emit Tests for $$TARGET\n"; \
 		$(MAKE) -s --no-print-directory OUTPUT=$$BUILD_TARGET -C $$TARGET emit_tests >> $(ALL_SCRIPT); \
 		echo "" >> $(ALL_SCRIPT);	    \
-		echo "cd \$$ROOT" >> $(ALL_SCRIPT); \
+		echo -e "\tcd \$$ROOT" >> $(ALL_SCRIPT); \
+		echo "}" >> $(ALL_SCRIPT); \
+		echo "" >> $(ALL_SCRIPT); \
 	done;
 
+	echo "usage()" >> $(ALL_SCRIPT);
+	echo "{" >> $(ALL_SCRIPT);
+	echo -e "\tcat <<EOF" >> $(ALL_SCRIPT);
+	echo "usage: \$${0##*/} OPTS" >> $(ALL_SCRIPT);
+	echo -e "\t-s | --summary\t\tOnly print summary info and put detailed log in output.log" >> $(ALL_SCRIPT);
+	echo -e "\t-t | --tests\t\tTest name you want to run specifically" >> $(ALL_SCRIPT);
+	echo -e "\t-l | --list\t\tList the available tests" >> $(ALL_SCRIPT);
+	echo -e "\t-h | --help\t\tShow this usage info" >> $(ALL_SCRIPT);
+	echo "EOF" >> $(ALL_SCRIPT);
+	echo "}" >> $(ALL_SCRIPT);
+	echo "" >> $(ALL_SCRIPT);
+
+	echo "while true; do" >> $(ALL_SCRIPT);
+	echo -e "\tcase \"\$$1\" in" >> $(ALL_SCRIPT);
+	echo -e "\t-s | --summary ) logfile=\$$BASE_DIR/output.log; cat /dev/null > \$$logfile; shift ;;" >> $(ALL_SCRIPT);
+	echo -e "\t-t | --tests ) TESTS=\$$2; shift 2 ;;" >> $(ALL_SCRIPT);
+	echo -e "\t-l | --list ) echo \$$TESTS; exit 0 ;;" >> $(ALL_SCRIPT);
+	echo -e "\t-h | --help ) usage; exit 0 ;;" >> $(ALL_SCRIPT);
+	echo -e "\t\"\" ) break;;" >> $(ALL_SCRIPT);
+	echo -e "\t* ) usage; exit 1;;" >> $(ALL_SCRIPT);
+	echo -e "\tesac" >> $(ALL_SCRIPT);
+	echo "done" >> $(ALL_SCRIPT);
+	echo "" >> $(ALL_SCRIPT);
+
+	echo "cd \$$BASE_DIR" >> $(ALL_SCRIPT)
+	echo "ROOT=\$$PWD" >> $(ALL_SCRIPT)
+
+	echo "for folder in \$$TESTS; do" >> $(ALL_SCRIPT); \
+	echo -e "\tfolder=\$$(echo \$$folder | tr -s '/-' '_')" >> $(ALL_SCRIPT); \
+	echo -e "\trun_\$$folder" >> $(ALL_SCRIPT); \
+	echo "done" >> $(ALL_SCRIPT); \
 	chmod u+x $(ALL_SCRIPT)
 else
 	$(error Error: set INSTALL_PATH to use install)
diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 51124b962d56..3c4c94a5d184 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -108,7 +108,7 @@ emit_tests:
 	for TEST in $(TEST_GEN_PROGS) $(TEST_CUSTOM_PROGS) $(TEST_PROGS); do \
 		BASENAME_TEST=`basename $$TEST`;	\
 		echo "	\\";				\
-		echo -n "	\"$$BASENAME_TEST\"";	\
+		echo -ne "\t\t\"$$BASENAME_TEST\"";	\
 	done;						\
 
 # define if isn't already. It is undefined in make O= case.
-- 
2.25.4


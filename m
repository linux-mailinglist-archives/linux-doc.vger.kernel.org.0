Return-Path: <linux-doc+bounces-288-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A98507C9915
	for <lists+linux-doc@lfdr.de>; Sun, 15 Oct 2023 15:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E605B20B62
	for <lists+linux-doc@lfdr.de>; Sun, 15 Oct 2023 13:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B248463BA;
	Sun, 15 Oct 2023 13:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDE7185E
	for <linux-doc@vger.kernel.org>; Sun, 15 Oct 2023 13:10:59 +0000 (UTC)
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id BB119A2;
	Sun, 15 Oct 2023 06:10:56 -0700 (PDT)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 39FDAB6v026284;
	Sun, 15 Oct 2023 15:10:11 +0200
From: Willy Tarreau <w@1wt.eu>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>,
        security@kernel.org, corbet@lwn.net, workflows@vger.kernel.org,
        Willy Tarreau <w@1wt.eu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>, Solar Designer <solar@openwall.com>,
        Vegard Nossum <vegard.nossum@oracle.com>
Subject: [PATCH] Documentation: security-bugs.rst: linux-distros relaxed their rules
Date: Sun, 15 Oct 2023 15:09:59 +0200
Message-Id: <20231015130959.26242-1-w@1wt.eu>
X-Mailer: git-send-email 2.17.5
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

The linux-distros list relaxed their rules to try to adapt better to
how the Linux kernel works. Let's update the Coordination part to
explain why and when to contact them or not to and how to avoid trouble
in the future.

Link: https://www.openwall.com/lists/oss-security/2023/09/08/4
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Solar Designer <solar@openwall.com>
Cc: Vegard Nossum <vegard.nossum@oracle.com>
Acked-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---

This is the final version for merging. Changes since RFC:
  - s/BEFORE/UNTIL from Vegard
  - improved wording from Alexander
  - acked-by from Jiri

Thanks!
Willy

---
 Documentation/process/security-bugs.rst | 35 ++++++++++++++++++-------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 5a6993795bd2..692a3ba56cca 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -66,15 +66,32 @@ lifted, in perpetuity.
 Coordination with other groups
 ------------------------------
 
-The kernel security team strongly recommends that reporters of potential
-security issues NEVER contact the "linux-distros" mailing list until
-AFTER discussing it with the kernel security team.  Do not Cc: both
-lists at once.  You may contact the linux-distros mailing list after a
-fix has been agreed on and you fully understand the requirements that
-doing so will impose on you and the kernel community.
-
-The different lists have different goals and the linux-distros rules do
-not contribute to actually fixing any potential security problems.
+While the kernel security team solely focuses on getting bugs fixed,
+other groups focus on fixing issues in distros and coordinating
+disclosure between operating system vendors.  Coordination is usually
+handled by the "linux-distros" mailing list and disclosure by the
+public "oss-security" mailing list, both of which are closely related
+and presented in the linux-distros wiki:
+<https://oss-security.openwall.org/wiki/mailing-lists/distros>
+
+Please note that the respective policies and rules are different since
+the 3 lists pursue different goals.  Coordinating between the kernel
+security team and other teams is difficult since for the kernel security
+team occasional embargoes (as subject to a maximum allowed number of
+days) start from the availability of a fix, while for "linux-distros"
+they start from the initial post to the list regardless of the
+availability of a fix.
+
+As such, the kernel security team strongly recommends that as a reporter
+of a potential security issue you DO NOT contact the "linux-distros"
+mailing list UNTIL a fix is accepted by the affected code's maintainers
+and you have read the distros wiki page above and you fully understand
+the requirements that contacting "linux-distros" will impose on you and
+the kernel community.  This also means that in general it doesn't make
+sense to Cc: both lists at once, except maybe for coordination if and
+while an accepted fix has not yet been merged.  In other words, until a
+fix is accepted do not Cc: "linux-distros", and after it's merged do not
+Cc: the kernel security team.
 
 CVE assignment
 --------------
-- 
2.17.5



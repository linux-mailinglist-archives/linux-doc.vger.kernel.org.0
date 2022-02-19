Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A56D24BC33E
	for <lists+linux-doc@lfdr.de>; Sat, 19 Feb 2022 01:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236492AbiBSAQY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 18 Feb 2022 19:16:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235702AbiBSAQX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Feb 2022 19:16:23 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A332447562
        for <linux-doc@vger.kernel.org>; Fri, 18 Feb 2022 16:16:05 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id h6-20020a253a06000000b0061de83305f2so15297862yba.19
        for <linux-doc@vger.kernel.org>; Fri, 18 Feb 2022 16:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=t1Jpw+ueBOtsD6/0A+P0khb1gbXjD6yCm6h0DxHEboA=;
        b=pNQnxU1fILXMInmD4uqudCIT7Be0KkI0yr06/vuLrOZKOAyUYFI5sXtwM1+o9RxR72
         6+ebYk4+o42Gl9qAWaWQYOihlS/TSymMphgi7XQkxBkA5U8rJdkqh0IWAjljDlB/iSjT
         2wujuIskcm+4sAHbRr24reNg7ddXqEeBUIytY08mqr90KLmzWy86yHNSp7SNHBWl+UXo
         ooxyWZbuEdFW4Sq6VZVu2Jc3tlrHOXfz56zgD6htJPtNletRcvBlePF6UXy1Ql0iX8eh
         MZ6TxwA6vE5InaZxmK7u8gqVAC2ChsGBT3EwQLQoJpV4G2Kxd7wvm6D/7CBe3cdcW8l9
         eYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=t1Jpw+ueBOtsD6/0A+P0khb1gbXjD6yCm6h0DxHEboA=;
        b=rmOUIQ/Hxr/+rL0wj7YFZQLGK6DFILvs2oHElRlgg1hEiLDVoYC3wBk9Dk4wcB++G7
         ous6d1ldIHS77pdOnnqOiBiq1ph5gLaPJ8FHDyGcpxFjQAxJ9i6LxgaFgOCa/pWu3wJr
         7/z8+lSzJhilUKb3eOM24gMA5MkxnDwb5PKG4ezMkuj2IvOYMP9/jNGMr+0MEXFUwFU/
         ffEFnomy8FMZz/Um1tgRlD+Ks0fIa7iD6FcRZSfSYgfkVZD4Jvu+9GuOBRkI5dnJz05i
         ZwSJZNzKBm3YpJNZiiPOX062UXk7GG51Kx56kuhN9R+AprS87MIQAoADQy0W8jv2qOT9
         afOA==
X-Gm-Message-State: AOAM530+qGBJlkDV6aWWS8wLH+cTSj1OTOSndDN/85vQEnN6cvJTRz3d
        gueEmJN43VnTxSQY6zw6TZfh/97WBDY=
X-Google-Smtp-Source: ABdhPJzC9kF2aqyqMClNmlOiYw6vcsQjNtY3AucQyQXxwhWEncOEjhIW6BZgRa79F/iaudlt/FUR/zaaEd4=
X-Received: from khazhy-linux.svl.corp.google.com ([2620:15c:2cd:202:7d93:7487:6afd:f5f6])
 (user=khazhy job=sendgmr) by 2002:a25:3b17:0:b0:619:4463:a400 with SMTP id
 i23-20020a253b17000000b006194463a400mr9943708yba.36.1645229764835; Fri, 18
 Feb 2022 16:16:04 -0800 (PST)
Date:   Fri, 18 Feb 2022 16:16:01 -0800
Message-Id: <20220219001601.3534043-1-khazhy@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.473.g83b2b277ed-goog
Subject: [PATCH v2] scsi: docs: update notes about scsi_times_out
From:   Khazhismel Kumykov <khazhy@google.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     linux-doc@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, bvanassche@acm.org,
        Hannes Reinecke <hare@suse.com>,
        Khazhismel Kumykov <khazhy@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Most importantly: eh_timed_out() is not limited by scmd->allowed,
and can reset timer forever.

Fixes: c829c394165f ("[SCSI] FC transport : Avoid device offline cases by stalling aborts until device unblocked")

Signed-off-by: Khazhismel Kumykov <khazhy@google.com>
---
 Documentation/scsi/scsi_eh.rst | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/Documentation/scsi/scsi_eh.rst b/Documentation/scsi/scsi_eh.rst
index 7d78c2475615..885395dc1f15 100644
--- a/Documentation/scsi/scsi_eh.rst
+++ b/Documentation/scsi/scsi_eh.rst
@@ -95,19 +95,18 @@ function
 
     - BLK_EH_RESET_TIMER
 	This indicates that more time is required to finish the
-	command.  Timer is restarted.  This action is counted as a
-	retry and only allowed scmd->allowed + 1(!) times.  Once the
-	limit is reached, action for BLK_EH_DONE is taken instead.
+	command.  Timer is restarted.
 
     - BLK_EH_DONE
         eh_timed_out() callback did not handle the command.
 	Step #2 is taken.
 
- 2. scsi_abort_command() is invoked to schedule an asynchrous abort.
-    Asynchronous abort are not invoked for commands which the
-    SCSI_EH_ABORT_SCHEDULED flag is set (this indicates that the command
-    already had been aborted once, and this is a retry which failed),
-    or when the EH deadline is expired. In these case Step #3 is taken.
+ 2. scsi_abort_command() is invoked to schedule an asynchronous abort which may
+    issue a retry scmd->allowed + 1 times.  Asynchronous aborts are not invoked
+    for commands for which the SCSI_EH_ABORT_SCHEDULED flag is set (this
+    indicates that the command already had been aborted once, and this is a
+    retry which failed), when retries are exceeded, or when the EH deadline is
+    expired. In these cases Step #3 is taken.
 
  3. scsi_eh_scmd_add(scmd, SCSI_EH_CANCEL_CMD) is invoked for the
     command.  See [1-4] for more information.
-- 
2.35.1.473.g83b2b277ed-goog


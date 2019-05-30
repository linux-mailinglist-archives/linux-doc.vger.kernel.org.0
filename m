Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74A3E2E9E0
	for <lists+linux-doc@lfdr.de>; Thu, 30 May 2019 02:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbfE3AxY (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 May 2019 20:53:24 -0400
Received: from mail-yw1-f74.google.com ([209.85.161.74]:52557 "EHLO
        mail-yw1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727223AbfE3AxY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 May 2019 20:53:24 -0400
Received: by mail-yw1-f74.google.com with SMTP id b189so3886654ywa.19
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2019 17:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=d6X4/k5B5WeQgyIvpn8Af86NqovFLF22qTA1Y2V4Fe8=;
        b=Ax2EXMsdAnoEHIrqzhP0Cv23VlEaDoSoO1OWqhvxtcuBXmnYYLbiiBAZQlVXUUtGgA
         i6w+G4d54N8mfV0D6KY3vURUd55d8xA1pwqYEpTzjK68EmxEOCRJVDhq648b4GXT1jGV
         3YrMacqCMm6wtkWM9ach4dG7xfETTseNfVw9UM/pxIHth0Ji7tonp1P9tLbqoqqtynbi
         DiENSJNzIdEipIykCMGLgC1Nz8YKxon3Gno9T6HkP2TBj6bY9GFxNm0etPi64anLqTnl
         aFpqLIUEQL5Pswsuq9dgOrW+1PKzioUiwtMYbgzR/a96OB4IOOCPkunrKKKeoQnMXWxu
         4Y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=d6X4/k5B5WeQgyIvpn8Af86NqovFLF22qTA1Y2V4Fe8=;
        b=dbbfIpTjbNa8L1pcY3wnh0GraxGRy8s9g1KG7XiYr8m5jObdeUJ4uQV9spHNcgeG0w
         AlWLtMXocS0hH9kyM1/s7+vI9XlUHSe3xilWL6yu73TskfTMuUmTwVL5Vl2pdx+60DnP
         4ynOl5UNXLRG5sxFSvqTn0N4XLOh4sLTyheeZTBezsmAaSb8eUT/+XVBja8ctV1+eU2N
         PkO1HdxJKYtlC2BSobLMTWQMOYmVTHY6VihGpndRnor3d9bdYCfylnMhyyCb24II+hps
         SmSt2QDOpH37v7da/GwfU0okG1+hWNCGbrvVnRcl+p37dgC7s+W5/foWGmtPK8rdqQpL
         Z1EA==
X-Gm-Message-State: APjAAAUbd6v58IUtzbLi+ogF7Y4nTZyNOhJ9+ctbDJXc5O3jNRkD7Wbe
        l1Ph68sTA6FWCdUSGTOaBvwfv9/fpgc=
X-Google-Smtp-Source: APXvYqzY+oI/v3047+rLfAdqlDZ9Z79kMZvQRPmWfGPVRdyfWVyQ3mLlfGRyfTAwrOQom+6CDZKVd7elYDo=
X-Received: by 2002:a81:300c:: with SMTP id w12mr555304yww.57.1559177603199;
 Wed, 29 May 2019 17:53:23 -0700 (PDT)
Date:   Wed, 29 May 2019 17:49:04 -0700
In-Reply-To: <20190530004906.261170-1-drosen@google.com>
Message-Id: <20190530004906.261170-3-drosen@google.com>
Mime-Version: 1.0
References: <20190530004906.261170-1-drosen@google.com>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
Subject: [PATCH v3 2/4] f2fs: Fix root reserved on remount
From:   Daniel Rosenberg <drosen@google.com>
To:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-f2fs-devel@lists.sourceforge.net
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, kernel-team@android.com,
        Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On a remount, you can currently set root reserved if it was not
previously set. This can cause an underflow if reserved has been set to
a very high value, since then root reserved + current reserved could be
greater than user_block_count. inc_valid_block_count later subtracts out
these values from user_block_count, causing an underflow.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/f2fs/super.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 912e2619d581b..359fd68509d16 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -213,7 +213,8 @@ void f2fs_msg(struct super_block *sb, const char *level, const char *fmt, ...)
 
 static inline void limit_reserve_root(struct f2fs_sb_info *sbi)
 {
-	block_t limit = (sbi->user_block_count << 1) / 1000;
+	block_t limit = min((sbi->user_block_count << 1) / 1000,
+			sbi->user_block_count - sbi->reserved_blocks);
 
 	/* limit is 0.2% */
 	if (test_opt(sbi, RESERVE_ROOT) &&
-- 
2.22.0.rc1.257.g3120a18244-goog


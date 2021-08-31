Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 217983FCA92
	for <lists+linux-doc@lfdr.de>; Tue, 31 Aug 2021 17:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238833AbhHaPNr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 31 Aug 2021 11:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238810AbhHaPNq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Aug 2021 11:13:46 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ABF7C061764
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 08:12:51 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id u9so28253201wrg.8
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 08:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=norberthealth-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=BQ3AuVX6mZyzuOUN+hOwf5u88jP1dAIZKek8aWY9TyY=;
        b=CyiVaaR7rntoiVFAcRg/HbDoJf7hZOQMLB0bIBA3viQZ7rnJclofncR0EjiCkR3pLP
         k8OY6raDXoEykXZNSiS++sNIsbdoK4qo8UBl0sWeM43vBCFg2DcSs0W5jbxokzEwEkjz
         Der9men1P+xsorFxDao6za5AwwT2kd9GCB4t6ua8claosS5lgAedX6HVuyt9TtEWR1tF
         BXu/VQO8pKRZyzNpr2a2Mz9D/G4mpzHYCD+28jXpUtzmO2kQRC80MCX/0TAPsjLFQFxh
         7ealW34wwX7BX2yzcGPY5etMNULZsBiyoTzoN7KdH5IUzpQaQZ+BU0aRma6gI5Jl9ALV
         QmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BQ3AuVX6mZyzuOUN+hOwf5u88jP1dAIZKek8aWY9TyY=;
        b=RJ55A7RKBGF8FlNqrWcH56j79XWvQTCl4obP8Nlbxw1emXoKmj8f4kaveboie7nqLa
         hVNRyoj7g4fdQHZuzNyuugBThSkN2DQ19ky5khDbN/VZxc834AZgDIkKIco73yb3RTdg
         W5/y+bBKTScD/pw0LfhaszcJHz/aHn0lz/0kHVcF+k3k9yWih4CVWulNLKRG7Blu2vFE
         9eX0h8qLZSD6I4plfmDtSaJbzS7Lam7blJ12Byr0WCzmH6uJdNlW8SgXJxYGQjWXh6bP
         zUWlpeiSG9IsOZxfyo7ui45NnjNErkgrr/vWvTBrwr0+VN2vvthOAf4Rovj9seDdT5xn
         tyCQ==
X-Gm-Message-State: AOAM532fo6fEgscPG10vaQwbZWz+twzOiJj6gm+1QiY7ji6EHWLvzX9S
        afSxhNMtpk2hzgju2syHHqMQ0Q==
X-Google-Smtp-Source: ABdhPJwa9BrbIsVeJTl//BJKobesUnEx0CWsd6UA2vOlptG8in98HoGed/bBs9HDzHLOKTVsE7eMBA==
X-Received: by 2002:a5d:5107:: with SMTP id s7mr31356948wrt.283.1630422769690;
        Tue, 31 Aug 2021 08:12:49 -0700 (PDT)
Received: from localhost.localdomain (81.227.26.93.rev.sfr.net. [93.26.227.81])
        by smtp.gmail.com with ESMTPSA id l1sm16491374wrb.15.2021.08.31.08.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 08:12:49 -0700 (PDT)
From:   Roger Knecht <roger@norberthealth.com>
To:     Jiri Kosina <jkosina@suse.cz>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     Jiri Kosina <trivial@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Roger Knecht <roger@norberthealth.com>
Subject: [PATCH v4] Trivial comment fix for the CRC ITU-T polynom
Date:   Tue, 31 Aug 2021 17:11:25 +0200
Message-Id: <20210831151125.2401-1-roger@norberthealth.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch fixes a small typo in the CRC ITU-T polynom documentation.

The code comment says that the polynom is x^16 + x^12 + x^15 + 1, but the
correct polynom is x^16 + x^12 + x^5 + 1.

Quote from page 2 in the ITU-T V.41 specification:
  "2 Encoding and checking process

  The service bits and information bits, taken in conjunction, correspond
  to the coefficients of a message polynomial having terms from x^(n-1)
  (n = total number of bits in a block or sequence) down to x^16. This
  polynomial is divided, modulo 2, by the generating polynomial
  x^16 + x^12 + x^5 + 1. [...]"

Source: https://www.itu.int/rec/T-REC-V.41-198811-I/en)

The hex polynom 0x1021 and CRC code implementation are correct.

Signed-off-by: Roger Knecht <roger@norberthealth.com>
---
Changes:
  - Changed comment from /** to /* (the comment is not a kernel doc comment)

 include/linux/crc-itu-t.h | 2 +-
 lib/crc-itu-t.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/crc-itu-t.h b/include/linux/crc-itu-t.h
index a4367051e192..2f991a427ade 100644
--- a/include/linux/crc-itu-t.h
+++ b/include/linux/crc-itu-t.h
@@ -4,7 +4,7 @@
  *
  * Implements the standard CRC ITU-T V.41:
  *   Width 16
- *   Poly  0x1021 (x^16 + x^12 + x^15 + 1)
+ *   Poly  0x1021 (x^16 + x^12 + x^5 + 1)
  *   Init  0
  */
 
diff --git a/lib/crc-itu-t.c b/lib/crc-itu-t.c
index 1974b355c148..1d26a1647da5 100644
--- a/lib/crc-itu-t.c
+++ b/lib/crc-itu-t.c
@@ -7,7 +7,7 @@
 #include <linux/module.h>
 #include <linux/crc-itu-t.h>
 
-/** CRC table for the CRC ITU-T V.41 0x1021 (x^16 + x^12 + x^15 + 1) */
+/* CRC table for the CRC ITU-T V.41 0x1021 (x^16 + x^12 + x^5 + 1) */
 const u16 crc_itu_t_table[256] = {
 	0x0000, 0x1021, 0x2042, 0x3063, 0x4084, 0x50a5, 0x60c6, 0x70e7,
 	0x8108, 0x9129, 0xa14a, 0xb16b, 0xc18c, 0xd1ad, 0xe1ce, 0xf1ef,
-- 
2.17.1


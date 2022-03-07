Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C03F44D0570
	for <lists+linux-doc@lfdr.de>; Mon,  7 Mar 2022 18:43:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234597AbiCGRoJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Mar 2022 12:44:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234088AbiCGRoJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 12:44:09 -0500
Received: from mail-oo1-xc4a.google.com (mail-oo1-xc4a.google.com [IPv6:2607:f8b0:4864:20::c4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 561566D3A1
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 09:43:14 -0800 (PST)
Received: by mail-oo1-xc4a.google.com with SMTP id x8-20020a4a3948000000b00320c4f9ae47so4786114oog.15
        for <linux-doc@vger.kernel.org>; Mon, 07 Mar 2022 09:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=X/9lHEU+QGc0nI2nAACqYpQr+17HGhHYUvPPJfgT8kM=;
        b=pEwYMpn8oySjV6Utj6EEzgWsvnO6Xt0CD+gtOWs5SGolvSpzA/U83AP1iQmlQNCULe
         D+j6yyxbdHl7ae657D2pA2M3M77zItRbpe2nn2ckanXaGB40tKYQkdib6gqF3HbK86kF
         z9KfEYeO4e4/7jU+jrxUYtL5Hr4LnSn4U5gKD9gcEkBcNMBuvkN2UAUD5YpRlPIYHcyr
         mm0kDMKSzUngUob8AivOKkSpa0x3YZ+QBTDDs8xbRbtqyJzcJnYz/zlxraSAFVRX6WT9
         XKrGPBJJCitAGUsRqh4rLGq8D3OsxVPVZJXfLV+IFgDKbdpHCuJJC6mO493eXlhcLPwk
         Cp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=X/9lHEU+QGc0nI2nAACqYpQr+17HGhHYUvPPJfgT8kM=;
        b=uLZVkLt50Szm3STNr2R/UBMH2Sg/7Qe0GY1zQMhCbaFMmnS5Dx0b9ClKvaUkBPYkmd
         0+oSAxdrRidfmFr9Tx1o3+1DG1LR2b7o6C8LP5PsrkkXfrpgrFiU/vVy8bSqskVHMK+A
         XCUkblAJyRKprFY7lDu6JY+wA+9K5PMx8kqzmRCCR4zcMbIqmra0lKgcMQTDJL+tjuiw
         HyPa/zFIFWEr3gfwJE8VzF3mAIdh4xM2shb2jTWuE5WvF9nBRGNO/ywVq0e5FmobkfmF
         WpOOH4cneSMeMgHRQ7vn4Euwf4BJQZTe5rnNYIUPTaxgVgMrxvZxN3cZIeHcmUQ10kd7
         j6ww==
X-Gm-Message-State: AOAM533XNvy5k813lWmHoSa9r9anRZHvtF5GUvXU0Epjezu/2Aw8fImH
        Pda5r9pAwZdsEeqBMviPEKQbkd1VwnB8VtTA
X-Google-Smtp-Source: ABdhPJwPbR6U+LXQSNXuJaQrnwbRN5yAucZLYmovXxogrcCczRTFRvQNuvnNO06dthncEXV38v3s73s0NedMhZUz
X-Received: from cawhitelaw1.bld.corp.google.com ([2620:15c:183:200:f8ae:e848:13ef:8f61])
 (user=cawhitelaw job=sendgmr) by 2002:a05:6870:f150:b0:da:3ad6:c149 with SMTP
 id l16-20020a056870f15000b000da3ad6c149mr22667oac.51.1646674993664; Mon, 07
 Mar 2022 09:43:13 -0800 (PST)
Date:   Mon,  7 Mar 2022 10:43:01 -0700
Message-Id: <20220307174301.1852106-1-cawhitelaw@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
Subject: [PATCH] Documentation/process: Replace broken link with snapshot
From:   Clayton Whitelaw <cawhitelaw@google.com>
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, rostedt@goodmis.org,
        Clayton Whitelaw <cawhitelaw@google.com>
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

The link is for the reference article, "The perfect patch":
https://www.ozlabs.org/~akpm/stuff/tpp.txt

This link is down currently and apparently since at least 2022 Jan:
https://web.archive.org/web/20220112192643/https://www.ozlabs.org/~akpm/stuff/tpp.txt

Replace with most recent good snapshot, from 2021 Oct

Signed-off-by: Clayton Whitelaw <cawhitelaw@google.com>
---
 Documentation/process/submitting-patches.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 31ea120ce..2a4c4065d 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -802,7 +802,7 @@ References
 ----------
 
 Andrew Morton, "The perfect patch" (tpp).
-  <https://www.ozlabs.org/~akpm/stuff/tpp.txt>
+  <https://web.archive.org/web/20211008233254/https://www.ozlabs.org/~akpm/stuff/tpp.txt>
 
 Jeff Garzik, "Linux kernel patch submission format".
   <https://web.archive.org/web/20180829112450/http://linux.yyz.us/patch-format.html>
-- 
2.35.1.616.g0bdcbb4464-goog


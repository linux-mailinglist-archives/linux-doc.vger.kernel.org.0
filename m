Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE151C07FF
	for <lists+linux-doc@lfdr.de>; Thu, 30 Apr 2020 22:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbgD3UgS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 30 Apr 2020 16:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbgD3UgS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Apr 2020 16:36:18 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D19AC035495
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2020 13:36:18 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id v10so3768785qvr.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2020 13:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B784zdzXLuU3MW7w8JpAGL5gMXtYDpBs4T/kLswGdYI=;
        b=uMSIOfAsn2hFGW45mcZRbvdrR0oZuPg46JRxQwd1lkwbaW1tw6jN0wtEHppuz5Pymc
         n+Y4RPXGucXE1ycwIGNO881w3MuJPfHQ9+AukN0Kr7jXSLyDsPEfsp6+V26u5lEeAAXR
         raxEz/VZOC4NpQSPTOjRxCyXgHAIO+E2YIdOCDbeZzoFznoyUfS0yaPv4bfRbkFTk9Gp
         yKj2IQmVAY+fL0ZvvRZ8yoBmC3BDIEOfdVUBGaLgKLLiCi8RnDs9YjPiZFN2nlUESzwJ
         vUjhQAc65LmMgTJyyxiGcH25a+/n5eqfhxh71vFy+0kVmRU1druUsoLoMT8Of73qIoaG
         GMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=B784zdzXLuU3MW7w8JpAGL5gMXtYDpBs4T/kLswGdYI=;
        b=O3ASZ/GPaEzHsMH9rlV19iVqvpCoqL4zCcyz7pTWyQJlubijJLII3jV29HgJulDN5z
         /6BVN4MLAL8HhK9jfywx8E8iVKlPPLFWdHstHCyXZxZt4SAI008mR0GW/HfFgQslv3wq
         LB+QRuK0oh8HyBi3ianZ7FXxELbvOw6nyGDd6ccDj4y29Jj5FlmOozfzbyL97junwNLK
         QGmdagUc6uusO2QwvFLNygDjnLTu/oTHB7C0YVsVz114fD6G7rWXzUKgK0y2UPGAzz1k
         a96ozEyP8mjIfT1wAqqF0PYXBqewcjAtxqKIAuDa/o8nVqf7iFLT9IWG11ATEVU1w6L+
         rdqQ==
X-Gm-Message-State: AGi0PuYD4BdhBP4pxOfQP/1Q3boa5AR7mw9+6+wyzUbYP9P4x+zrTyJs
        bBKcSCqAhiYTlJQgDpJSyEJESycfAUJtYA==
X-Google-Smtp-Source: APiQypLRQfPe42Gh0WlpFSxgINU5DSIJ3P7SrZAZXQDw5bA7/LeWQ/gEeg9sdUq15sUWFrw4nBj+xg==
X-Received: by 2002:ad4:5a48:: with SMTP id ej8mr832303qvb.122.1588278977081;
        Thu, 30 Apr 2020 13:36:17 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id v5sm926589qkg.9.2020.04.30.13.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 13:36:16 -0700 (PDT)
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     linux-doc@vger.kernel.org
Cc:     mchehab@kernel.org, corbet@lwn.net, linux-kernel@vger.kernel.org,
        brendanhiggins@google.com, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] docs: coresight: fix `make htmldocs` warning
Date:   Thu, 30 Apr 2020 17:36:12 -0300
Message-Id: <20200430203612.90404-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix `make htmldocs` warning:

Documentation/trace/coresight/coresight-ect.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 Documentation/trace/coresight/coresight-ect.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/trace/coresight/coresight-ect.rst b/Documentation/trace/coresight/coresight-ect.rst
index ecc1e57012ef..a93e52abcf46 100644
--- a/Documentation/trace/coresight/coresight-ect.rst
+++ b/Documentation/trace/coresight/coresight-ect.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
+
 =============================================
 CoreSight Embedded Cross Trigger (CTI & CTM).
 =============================================
-- 
2.25.1


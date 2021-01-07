Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D59572ECEEA
	for <lists+linux-doc@lfdr.de>; Thu,  7 Jan 2021 12:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbhAGLnC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 7 Jan 2021 06:43:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727907AbhAGLnC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Jan 2021 06:43:02 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED04C0612F6
        for <linux-doc@vger.kernel.org>; Thu,  7 Jan 2021 03:42:22 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id r4so3332968pls.11
        for <linux-doc@vger.kernel.org>; Thu, 07 Jan 2021 03:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9LgQWsmOFElkiLf05U+26lKjk/BOB6UPEZTx7RDx+X8=;
        b=iDrhS3bvpsoJA//KOJIA8S6QmOm/T6S3WIhlulzR3yc6ZWw0DE5VdsQstr9G/C6Rav
         LMrI4fYZJ/OT83tH5gUtKsiUPorPLTi7I5lQF5ho7D9d79WBTDMFAjSbP5/ksRk9cVVS
         Z6/3sb2OKAXtwY8ZWiaNXeMmw6ZfczgYyPXmxVrx7RI72zX9/ubr2QiDHMJTyqygxmyQ
         houU/9IMLwrdFGaiIEL2VcEWa2ClokQpcIB5+uRniVvh3qtVu9l54dNjHTaLI7Ch4kBa
         Hs553dJx/t8N8rSYtMKKKfEvfIuqkn4MYG/aNHW8LEbO8eDVziPBoZvBi0qsab+qqQhV
         PqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9LgQWsmOFElkiLf05U+26lKjk/BOB6UPEZTx7RDx+X8=;
        b=eRG+yjcn98iSAGXR1jHh+90ZwUd0tWrcqYuLTQQGwbNDxmDfNAxypm8hX7NrNM4cRo
         jdRiLWk6Ss+cRnRJ//HwXsR1aZaCaJgU95/FMj0BbbNFDZ89QoF0MlkHaWE8Sy6REwbZ
         mj7ca4qFgikQglUwwQEN74rLacOx1wDy0DdfB4exLzsJD8h8FyEzvqtfeDZRhhl8t42S
         yzxhCUTl/CvdB8rwonqJRq0R0JRs1hr3oBSiyNcvoU+64gDi8pfw1434vsZRF8PTkdXP
         nHkDfHYCyiNpIf9NWC0s+PVy2g35sovs38QHAEcS/aEqM9QMjZj8bqLMjDrmGDRztkfr
         Cs1w==
X-Gm-Message-State: AOAM5327cIoazHwBFW9IVDBSpipKtpcHw3Z7/PWy4Q08kEi0PVis07u7
        A+cmfCUTur0NrCF+lMW94cXAJA==
X-Google-Smtp-Source: ABdhPJxzZ8oeKB/meYVSBeksDMO+gwFZyPlb9af11OzHmvmJ3fVK8ygHaa9PJ9gzmrHIVVfHzRPB2w==
X-Received: by 2002:a17:90a:902:: with SMTP id n2mr8851796pjn.126.1610019741338;
        Thu, 07 Jan 2021 03:42:21 -0800 (PST)
Received: from localhost ([122.172.20.109])
        by smtp.gmail.com with ESMTPSA id o1sm6196138pgq.1.2021.01.07.03.42.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Jan 2021 03:42:20 -0800 (PST)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        anmar.oueja@linaro.org, linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: kbuild: Fix section reference
Date:   Thu,  7 Jan 2021 17:12:08 +0530
Message-Id: <6f551ebb80f88e9b1bf6aa981f3c201409e1555c.1610019699.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Section 3.11 was incorrectly called 3.9, fix it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 Documentation/kbuild/makefiles.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index d36768cf1250..9f6a11881951 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -598,7 +598,7 @@ more details, with real examples.
 	explicitly added to $(targets).
 
 	Assignments to $(targets) are without $(obj)/ prefix. if_changed may be
-	used in conjunction with custom rules as defined in "3.9 Custom Rules".
+	used in conjunction with custom rules as defined in "3.11 Custom Rules".
 
 	Note: It is a typical mistake to forget the FORCE prerequisite.
 	Another common pitfall is that whitespace is sometimes significant; for
-- 
2.25.0.rc1.19.g042ed3e048af


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B72021D4E6
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jul 2020 13:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729143AbgGML1I (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 13 Jul 2020 07:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727890AbgGML1H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jul 2020 07:27:07 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F600C061755;
        Mon, 13 Jul 2020 04:27:07 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 653FEBC069;
        Mon, 13 Jul 2020 11:27:03 +0000 (UTC)
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
To:     bbrezillon@kernel.org, corbet@lwn.net,
        linux-i3c@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] docs: driver-api: i3c: Replace HTTP links with HTTPS ones
Date:   Mon, 13 Jul 2020 13:26:57 +0200
Message-Id: <20200713112657.33694-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +++++
X-Spam-Level: *****
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not just HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 Documentation/driver-api/i3c/protocol.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/i3c/protocol.rst b/Documentation/driver-api/i3c/protocol.rst
index dae3b6d32c6b..02653defa011 100644
--- a/Documentation/driver-api/i3c/protocol.rst
+++ b/Documentation/driver-api/i3c/protocol.rst
@@ -14,7 +14,7 @@ collisions are prevented, ...) please have a look at the I3C specification.
 This document is just a brief introduction to the I3C protocol and the concepts
 it brings to the table. If you need more information, please refer to the MIPI
 I3C specification (can be downloaded here
-http://resources.mipi.org/mipi-i3c-v1-download).
+https://resources.mipi.org/mipi-i3c-v1-download).
 
 Introduction
 ============
-- 
2.27.0


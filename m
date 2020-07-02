Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20ACE2125A9
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2020 16:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729556AbgGBOJ0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 2 Jul 2020 10:09:26 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:2677 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728216AbgGBOJ0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 2 Jul 2020 10:09:26 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 49yKhw2X8Vz9v2n7;
        Thu,  2 Jul 2020 16:09:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id HJdxPeFBxBME; Thu,  2 Jul 2020 16:09:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 49yKhw0zKlz9v2mV;
        Thu,  2 Jul 2020 16:09:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A37A8B9A0;
        Thu,  2 Jul 2020 16:09:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id COv8UasKhlrn; Thu,  2 Jul 2020 16:09:22 +0200 (CEST)
Received: from po16052vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr [10.25.210.22])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 0711D8B99A;
        Thu,  2 Jul 2020 16:09:22 +0200 (CEST)
Received: by po16052vm.idsi0.si.c-s.fr (Postfix, from userid 0)
        id EA79665B6E; Thu,  2 Jul 2020 14:09:21 +0000 (UTC)
Message-Id: <261923c075d1cb49d02493685e8585d4ea2a5197.1593698951.git.christophe.leroy@csgroup.eu>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] docs: powerpc: Clarify book3s/32 MMU families
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, corbet@lwn.net
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-doc@vger.kernel.org
Date:   Thu,  2 Jul 2020 14:09:21 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Documentation wrongly tells that book3s/32 CPU have hash MMU.

603 and e300 core only have software loaded TLB.

755, 7450 family and e600 core have both hash MMU and software loaded
TLB. This can be selected by setting a bit in HID2 (755) or
HID0 (others). At the time being this is not supported by the kernel.

Make this explicit in the documentation.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 Documentation/powerpc/cpu_families.rst | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/powerpc/cpu_families.rst b/Documentation/powerpc/cpu_families.rst
index 1e063c5440c3..9b84e045e713 100644
--- a/Documentation/powerpc/cpu_families.rst
+++ b/Documentation/powerpc/cpu_families.rst
@@ -9,7 +9,9 @@ and are supported by arch/powerpc.
 Book3S (aka sPAPR)
 ------------------
 
-- Hash MMU
+- Hash MMU (except 603 and e300)
+- Software loaded TLB (603 and e300)
+- Selectable Software loaded TLB in addition to hash MMU (755, 7450, e600)
 - Mix of 32 & 64 bit::
 
    +--------------+                 +----------------+
@@ -24,9 +26,9 @@ Book3S (aka sPAPR)
           |                                 |
           |                                 |
           v                                 v
-   +--------------+                 +----------------+      +-------+
-   |     604      |                 |    750 (G3)    | ---> | 750CX |
-   +--------------+                 +----------------+      +-------+
+   +--------------+    +-----+      +----------------+      +-------+
+   |     604      |    | 755 | <--- |    750 (G3)    | ---> | 750CX |
+   +--------------+    +-----+      +----------------+      +-------+
           |                                 |                   |
           |                                 |                   |
           v                                 v                   v
-- 
2.25.0


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBAB1F5EF4
	for <lists+linux-doc@lfdr.de>; Thu, 11 Jun 2020 01:59:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgFJX7O (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 10 Jun 2020 19:59:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:39940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726768AbgFJX7N (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 10 Jun 2020 19:59:13 -0400
Received: from kicinski-fedora-PC1C0HJN.thefacebook.com (unknown [163.114.132.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E746D206D9;
        Wed, 10 Jun 2020 23:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591833553;
        bh=d+49z8cyUPGq9+7nkqgIRhhCNyzOPpv3x03AHhYIAjA=;
        h=From:To:Cc:Subject:Date:From;
        b=tHJpD1C1AeiGujVXZgQfL+CyzlrzB4cQWVtkLD8zLf/tEFlvnAQs2WXzyPp+2RBSX
         FAAx07l8/AqEhJP4r5RxCRZXmblaO2nUAh4Tp1/GLwXnsRRq+wlL7UvwWB6ojJkq4C
         cpqfprTbvyBGXNSoWP9zl8LInnkYOnR7VybSkcwA=
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, vladimir.oltean@nxp.com,
        linux-doc@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net] docs: networkng: convert sja1105's devlink info to RTS
Date:   Wed, 10 Jun 2020 16:59:11 -0700
Message-Id: <20200610235911.426444-1-kuba@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A new file snuck into the tree after all existing documentation
was converted to RST. Convert sja1105's devlink info and move
it where the rest of the drivers are documented.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 .../networking/devlink-params-sja1105.txt     | 27 ----------
 Documentation/networking/devlink/index.rst    |  1 +
 Documentation/networking/devlink/sja1105.rst  | 49 +++++++++++++++++++
 3 files changed, 50 insertions(+), 27 deletions(-)
 delete mode 100644 Documentation/networking/devlink-params-sja1105.txt
 create mode 100644 Documentation/networking/devlink/sja1105.rst

diff --git a/Documentation/networking/devlink-params-sja1105.txt b/Documentation/networking/devlink-params-sja1105.txt
deleted file mode 100644
index 1d71742e270a..000000000000
--- a/Documentation/networking/devlink-params-sja1105.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-best_effort_vlan_filtering
-			[DEVICE, DRIVER-SPECIFIC]
-			Allow plain ETH_P_8021Q headers to be used as DSA tags.
-			Benefits:
-			- Can terminate untagged traffic over switch net
-			  devices even when enslaved to a bridge with
-			  vlan_filtering=1.
-			- Can terminate VLAN-tagged traffic over switch net
-			  devices even when enslaved to a bridge with
-			  vlan_filtering=1, with some constraints (no more than
-			  7 non-pvid VLANs per user port).
-			- Can do QoS based on VLAN PCP and VLAN membership
-			  admission control for autonomously forwarded frames
-			  (regardless of whether they can be terminated on the
-			  CPU or not).
-			Drawbacks:
-			- User cannot use VLANs in range 1024-3071. If the
-			  switch receives frames with such VIDs, it will
-			  misinterpret them as DSA tags.
-			- Switch uses Shared VLAN Learning (FDB lookup uses
-			  only DMAC as key).
-			- When VLANs span cross-chip topologies, the total
-			  number of permitted VLANs may be less than 7 per
-			  port, due to a maximum number of 32 VLAN retagging
-			  rules per switch.
-			Configuration mode: runtime
-			Type: bool.
diff --git a/Documentation/networking/devlink/index.rst b/Documentation/networking/devlink/index.rst
index c536db2cc0f9..7684ae5c4a4a 100644
--- a/Documentation/networking/devlink/index.rst
+++ b/Documentation/networking/devlink/index.rst
@@ -40,5 +40,6 @@ parameters, info versions, and other features it supports.
    mv88e6xxx
    netdevsim
    nfp
+   sja1105
    qed
    ti-cpsw-switch
diff --git a/Documentation/networking/devlink/sja1105.rst b/Documentation/networking/devlink/sja1105.rst
new file mode 100644
index 000000000000..e2679c274085
--- /dev/null
+++ b/Documentation/networking/devlink/sja1105.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================
+sja1105 devlink support
+=======================
+
+This document describes the devlink features implemented
+by the ``sja1105`` device driver.
+
+Parameters
+==========
+
+.. list-table:: Driver-specific parameters implemented
+  :widths: 5 5 5 85
+
+  * - Name
+    - Type
+    - Mode
+    - Description
+  * - ``best_effort_vlan_filtering``
+    - Boolean
+    - runtime
+    - Allow plain ETH_P_8021Q headers to be used as DSA tags.
+
+      Benefits:
+
+      - Can terminate untagged traffic over switch net
+        devices even when enslaved to a bridge with
+        vlan_filtering=1.
+      - Can terminate VLAN-tagged traffic over switch net
+        devices even when enslaved to a bridge with
+        vlan_filtering=1, with some constraints (no more than
+        7 non-pvid VLANs per user port).
+      - Can do QoS based on VLAN PCP and VLAN membership
+        admission control for autonomously forwarded frames
+        (regardless of whether they can be terminated on the
+        CPU or not).
+
+      Drawbacks:
+
+      - User cannot use VLANs in range 1024-3071. If the
+	switch receives frames with such VIDs, it will
+	misinterpret them as DSA tags.
+      - Switch uses Shared VLAN Learning (FDB lookup uses
+	only DMAC as key).
+      - When VLANs span cross-chip topologies, the total
+	number of permitted VLANs may be less than 7 per
+	port, due to a maximum number of 32 VLAN retagging
+	rules per switch.
-- 
2.26.2


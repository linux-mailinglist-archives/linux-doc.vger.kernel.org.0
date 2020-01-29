Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 339B914CD1E
	for <lists+linux-doc@lfdr.de>; Wed, 29 Jan 2020 16:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgA2PUN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 29 Jan 2020 10:20:13 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:47902 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726701AbgA2PUM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Jan 2020 10:20:12 -0500
Received: from [109.168.11.45] (port=33588 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iwp8U-004sQJ-2b; Wed, 29 Jan 2020 16:20:10 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/28] docs: i2c: summary: extend introduction
Date:   Wed, 29 Jan 2020 16:19:27 +0100
Message-Id: <20200129151953.31582-3-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129151953.31582-1-luca@lucaceresoli.net>
References: <20200129151953.31582-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


 - state the "official" name (I²C, not I2C, according to the spec) at
   the beginning but keep using the more practical I2C elsewhere
 - mention some known different names
 - add link to the specification document

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Jean Delvare <jdelvare@suse.de>

---

Changes in v2:
 - clarify sentence (Jean Delvare)
---
 Documentation/i2c/summary.rst | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
index 3a24eac17375..dbab737d5075 100644
--- a/Documentation/i2c/summary.rst
+++ b/Documentation/i2c/summary.rst
@@ -2,12 +2,18 @@
 I2C and SMBus
 =============
 
-I2C (pronounce: I squared C) is a protocol developed by Philips. It is a
-slow two-wire protocol (variable speed, up to 400 kHz), with a high speed
-extension (3.4 MHz).  It provides an inexpensive bus for connecting many
-types of devices with infrequent or low bandwidth communications needs.
-I2C is widely used with embedded systems.  Some systems use variants that
-don't meet branding requirements, and so are not advertised as being I2C.
+I²C (pronounce: I squared C and written I2C in the kernel documentation) is
+a protocol developed by Philips. It is a slow two-wire protocol (variable
+speed, up to 400 kHz), with a high speed extension (3.4 MHz).  It provides
+an inexpensive bus for connecting many types of devices with infrequent or
+low bandwidth communications needs.  I2C is widely used with embedded
+systems.  Some systems use variants that don't meet branding requirements,
+and so are not advertised as being I2C but come under different names,
+e.g. TWI (Two Wire Interface), IIC.
+
+The official I2C specification is the `"I2C-bus specification and user
+manual" (UM10204) <https://www.nxp.com/docs/en/user-guide/UM10204.pdf>`_
+published by NXP Semiconductors.
 
 SMBus (System Management Bus) is based on the I2C protocol, and is mostly
 a subset of I2C protocols and signaling.  Many I2C devices will work on an
-- 
2.25.0


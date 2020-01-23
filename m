Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28D7B1469E6
	for <lists+linux-doc@lfdr.de>; Thu, 23 Jan 2020 14:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbgAWNx7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 23 Jan 2020 08:53:59 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:46648 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726729AbgAWNx7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jan 2020 08:53:59 -0500
Received: from [109.168.11.45] (port=47192 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iucvl-000CNg-Oq; Thu, 23 Jan 2020 14:53:57 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/28] docs: i2c: smbus-protocol: remove unneeded colons from table
Date:   Thu, 23 Jan 2020 14:50:48 +0100
Message-Id: <20200123135103.20540-14-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200123135103.20540-1-luca@lucaceresoli.net>
References: <20200123135103.20540-1-luca@lucaceresoli.net>
MIME-Version: 1.0
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

These colons are not needed: the columns already nicely separate the
symbols from their description. They are also inconsistently preceded by
whitespace.

Remove the colons completely to simplify and clean up.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Jean Delvare <jdelvare@suse.de>

---

Changes in v2:
 - fix typo in commit message (Jean Delvare)
---
 Documentation/i2c/smbus-protocol.rst | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
index 8510eeda1dd0..fbadd4d25ad5 100644
--- a/Documentation/i2c/smbus-protocol.rst
+++ b/Documentation/i2c/smbus-protocol.rst
@@ -35,19 +35,19 @@ Key to symbols
 ==============
 
 =============== =============================================================
-S             : Start condition
-P             : Stop condition
-Rd/Wr (1 bit) : Read/Write bit. Rd equals 1, Wr equals 0.
-A, NA (1 bit) : Accept and reverse accept bit.
-Addr  (7 bits): I2C 7 bit address. Note that this can be expanded as usual to
+S               Start condition
+P               Stop condition
+Rd/Wr (1 bit)   Read/Write bit. Rd equals 1, Wr equals 0.
+A, NA (1 bit)   Accept and reverse accept bit.
+Addr  (7 bits)  I2C 7 bit address. Note that this can be expanded as usual to
                 get a 10 bit I2C address.
-Comm  (8 bits): Command byte, a data byte which often selects a register on
+Comm  (8 bits)  Command byte, a data byte which often selects a register on
                 the device.
-Data  (8 bits): A plain data byte. Sometimes, I write DataLow, DataHigh
+Data  (8 bits)  A plain data byte. Sometimes, I write DataLow, DataHigh
                 for 16 bit data.
-Count (8 bits): A data byte containing the length of a block operation.
+Count (8 bits)  A data byte containing the length of a block operation.
 
-[..]:           Data sent by I2C device, as opposed to data sent by the host
+[..]            Data sent by I2C device, as opposed to data sent by the host
                 adapter.
 =============== =============================================================
 
-- 
2.25.0


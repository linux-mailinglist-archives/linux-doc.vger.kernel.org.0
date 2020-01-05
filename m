Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0023C130A6C
	for <lists+linux-doc@lfdr.de>; Sun,  5 Jan 2020 23:52:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbgAEWvM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 5 Jan 2020 17:51:12 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:56645 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727212AbgAEWvL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Jan 2020 17:51:11 -0500
Received: from [37.160.42.38] (port=5507 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ioEjk-00GSqI-WF; Sun, 05 Jan 2020 23:51:09 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: [PATCH 08/26] docs: i2c: i2c-protocol: properly name start and stop conditions
Date:   Sun,  5 Jan 2020 23:49:54 +0100
Message-Id: <20200105225012.11701-8-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200105225012.11701-1-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
 <20200105225012.11701-1-luca@lucaceresoli.net>
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

In I2C there is no such thing as a "start bit" or a "stop bit". Use the
proper naming: "start condition" and "stop condition".

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Documentation/i2c/i2c-protocol.rst | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/i2c/i2c-protocol.rst b/Documentation/i2c/i2c-protocol.rst
index f289d7759a51..c090003f55ed 100644
--- a/Documentation/i2c/i2c-protocol.rst
+++ b/Documentation/i2c/i2c-protocol.rst
@@ -8,8 +8,8 @@ Key to symbols
 ==============
 
 =============== =============================================================
-S     (1 bit) : Start bit
-P     (1 bit) : Stop bit
+S             : Start condition
+P             : Stop condition
 Rd/Wr (1 bit) : Read/Write bit. Rd equals 1, Wr equals 0.
 A, NA (1 bit) : Accept and reverse accept bit.
 Addr  (7 bits): I2C 7 bit address. Note that this can be expanded as usual to
@@ -46,9 +46,9 @@ Combined transactions
 
 This corresponds to i2c_transfer().
 
-They are just like the above transactions, but instead of a stop bit P
-a start bit S is sent and the transaction continues. An example of
-a byte read, followed by a byte write::
+They are just like the above transactions, but instead of a stop
+condition P a start condition S is sent and the transaction continues.
+An example of a byte read, followed by a byte write::
 
   S Addr Rd [A] [Data] NA S Addr Wr [A] Data [A] P
 
@@ -77,8 +77,9 @@ I2C_M_NOSTART:
       S Addr Rd [A] [Data] NA Data [A] P
 
     If you set the I2C_M_NOSTART variable for the first partial message,
-    we do not generate Addr, but we do generate the startbit S. This will
-    probably confuse all other clients on your bus, so don't try this.
+    we do not generate Addr, but we do generate the start condition S.
+    This will probably confuse all other clients on your bus, so don't
+    try this.
 
     This is often used to gather transmits from multiple data buffers in
     system memory into something that appears as a single transfer to the
-- 
2.24.1


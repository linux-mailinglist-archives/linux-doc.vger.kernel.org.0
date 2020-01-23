Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 059F3146C07
	for <lists+linux-doc@lfdr.de>; Thu, 23 Jan 2020 15:58:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729098AbgAWO6K (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 23 Jan 2020 09:58:10 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:49151 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726811AbgAWO6J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jan 2020 09:58:09 -0500
Received: from [109.168.11.45] (port=47594 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iudvr-0005F5-0I; Thu, 23 Jan 2020 15:58:07 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/28] docs: i2c: smbus-protocol: fix kernel-doc function syntax
Date:   Thu, 23 Jan 2020 15:56:14 +0100
Message-Id: <20200123145626.8102-3-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200123145626.8102-1-luca@lucaceresoli.net>
References: <20200123135103.20540-1-luca@lucaceresoli.net>
 <20200123145626.8102-1-luca@lucaceresoli.net>
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

This clarifies these are functions (and would/will adds a hyperlink to the
function documentation if/when documented).

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 Documentation/i2c/smbus-protocol.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/i2c/smbus-protocol.rst b/Documentation/i2c/smbus-protocol.rst
index 997945e90419..3c0fb3a2044d 100644
--- a/Documentation/i2c/smbus-protocol.rst
+++ b/Documentation/i2c/smbus-protocol.rst
@@ -118,7 +118,7 @@ byte. But this time, the data is a complete word (16 bits)::
 
 Functionality flag: I2C_FUNC_SMBUS_READ_WORD_DATA
 
-Note the convenience function i2c_smbus_read_word_swapped is
+Note the convenience function i2c_smbus_read_word_swapped() is
 available for reads where the two data bytes are the other way
 around (not SMBus compliant, but very popular.)
 
@@ -152,7 +152,7 @@ specified through the Comm byte.::
 
 Functionality flag: I2C_FUNC_SMBUS_WRITE_WORD_DATA
 
-Note the convenience function i2c_smbus_write_word_swapped is
+Note the convenience function i2c_smbus_write_word_swapped() is
 available for writes where the two data bytes are the other way
 around (not SMBus compliant, but very popular.)
 
-- 
2.25.0


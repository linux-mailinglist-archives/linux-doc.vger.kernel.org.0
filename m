Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA08D1617C6
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2020 17:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728463AbgBQQUy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 Feb 2020 11:20:54 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:54946 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbgBQQUr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Feb 2020 11:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=CioumjlBTN7A4qdpnR3TkJBeJEN6B6nUp4WKwViYp3U=; b=TdcsnvN/sPFdV1hBPYWRhh7t8D
        lz6jdEuex0sZWrlfOA0fzw0STog3lYbvLLnr2A1xP/gdkHbq2l6G52yPPb/U7cH3Ix1bLU0dm3zXJ
        d3PeLEJylCaUJijryJdrLTk+zVWKX05R+pERRSHXLBGHpPD5879E8o/4oqjJGqwQulpOTFxZuJnZM
        6DqkBx6kPXT14d68k2K4/Dahph39r3YJGK50883uq2w5cU0w3w6hvKMgy+21q1ws2two/DZsfuP3u
        neNswDGNlJlKcjomOhgsa2txQhRLv4aJloh1Zx25jQG0v9sROmzEP6XFobt+F1cU2N4bUGTHY/skY
        7oMAjqjg==;
Received: from tmo-109-126.customers.d1-online.com ([80.187.109.126] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j3j8X-000426-TK; Mon, 17 Feb 2020 16:20:46 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1j3j8W-000fp7-02; Mon, 17 Feb 2020 17:20:44 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 07/24] docs: misc-devices/pci-endpoint-test.txt: convert to ReST
Date:   Mon, 17 Feb 2020 17:20:25 +0100
Message-Id: <2e856773e7fd637a492c7178d6dd10f0550f76d9.1581956285.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581956285.git.mchehab+huawei@kernel.org>
References: <cover.1581956285.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- use title markups;
- mark literal blocks.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../{ad525x_dpot.txt => ad525x_dpot.rst}      | 24 +++++++++----------
 Documentation/misc-devices/index.rst          |  1 +
 2 files changed, 13 insertions(+), 12 deletions(-)
 rename Documentation/misc-devices/{ad525x_dpot.txt => ad525x_dpot.rst} (85%)

diff --git a/Documentation/misc-devices/ad525x_dpot.txt b/Documentation/misc-devices/ad525x_dpot.rst
similarity index 85%
rename from Documentation/misc-devices/ad525x_dpot.txt
rename to Documentation/misc-devices/ad525x_dpot.rst
index 0c9413b1cbf3..6483ec254520 100644
--- a/Documentation/misc-devices/ad525x_dpot.txt
+++ b/Documentation/misc-devices/ad525x_dpot.rst
@@ -1,6 +1,8 @@
----------------------------------
-  AD525x Digital Potentiometers
----------------------------------
+.. SPDX-License-Identifier: GPL-2.0
+
+=============================
+AD525x Digital Potentiometers
+=============================
 
 The ad525x_dpot driver exports a simple sysfs interface.  This allows you to
 work with the immediate resistance settings as well as update the saved startup
@@ -8,9 +10,8 @@ settings.  Access to the factory programmed tolerance is also provided, but
 interpretation of this settings is required by the end application according to
 the specific part in use.
 
----------
-  Files
----------
+Files
+=====
 
 Each dpot device will have a set of eeprom, rdac, and tolerance files.  How
 many depends on the actual part you have, as will the range of allowed values.
@@ -24,23 +25,22 @@ and may vary greatly on a part-by-part basis.  For exact interpretation of
 this field, please consult the datasheet for your part.  This is presented
 as a hex file for easier parsing.
 
------------
-  Example
------------
+Example
+=======
 
 Locate the device in your sysfs tree.  This is probably easiest by going into
-the common i2c directory and locating the device by the i2c slave address.
+the common i2c directory and locating the device by the i2c slave address::
 
 	# ls /sys/bus/i2c/devices/
 	0-0022  0-0027  0-002f
 
 So assuming the device in question is on the first i2c bus and has the slave
-address of 0x2f, we descend (unrelated sysfs entries have been trimmed).
+address of 0x2f, we descend (unrelated sysfs entries have been trimmed)::
 
 	# ls /sys/bus/i2c/devices/0-002f/
 	eeprom0 rdac0 tolerance0
 
-You can use simple reads/writes to access these files:
+You can use simple reads/writes to access these files::
 
 	# cd /sys/bus/i2c/devices/0-002f/
 
diff --git a/Documentation/misc-devices/index.rst b/Documentation/misc-devices/index.rst
index 2d454b413aef..005547c1ad5d 100644
--- a/Documentation/misc-devices/index.rst
+++ b/Documentation/misc-devices/index.rst
@@ -14,6 +14,7 @@ fit into other categories.
 .. toctree::
    :maxdepth: 2
 
+   ad525x_dpot
    eeprom
    ibmvmc
    ics932s401
-- 
2.24.1


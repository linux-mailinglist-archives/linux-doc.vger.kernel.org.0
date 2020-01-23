Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFBF5146C2D
	for <lists+linux-doc@lfdr.de>; Thu, 23 Jan 2020 15:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729335AbgAWO6r (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 23 Jan 2020 09:58:47 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:44901 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729108AbgAWO6L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jan 2020 09:58:11 -0500
Received: from [109.168.11.45] (port=47594 helo=pc-ceresoli.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iudvt-0005F5-8T; Thu, 23 Jan 2020 15:58:09 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 22/28] docs: i2c: instantiating-devices: use monospace for sysfs attributes
Date:   Thu, 23 Jan 2020 15:56:20 +0100
Message-Id: <20200123145626.8102-9-luca@lucaceresoli.net>
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

Use a monospace (literal) formatting for better readability of sysfs
attributes.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Jean Delvare <jdelvare@suse.de>

---

Changes in v2:
 - reword commit message to not mention filenames
---
 Documentation/i2c/instantiating-devices.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/i2c/instantiating-devices.rst b/Documentation/i2c/instantiating-devices.rst
index 665bf00792ba..e558e0a77e0c 100644
--- a/Documentation/i2c/instantiating-devices.rst
+++ b/Documentation/i2c/instantiating-devices.rst
@@ -225,15 +225,15 @@ In general, the kernel should know which I2C devices are connected and
 what addresses they live at. However, in certain cases, it does not, so a
 sysfs interface was added to let the user provide the information. This
 interface is made of 2 attribute files which are created in every I2C bus
-directory: new_device and delete_device. Both files are write only and you
-must write the right parameters to them in order to properly instantiate,
-respectively delete, an I2C device.
+directory: ``new_device`` and ``delete_device``. Both files are write
+only and you must write the right parameters to them in order to properly
+instantiate, respectively delete, an I2C device.
 
-File new_device takes 2 parameters: the name of the I2C device (a string)
-and the address of the I2C device (a number, typically expressed in
-hexadecimal starting with 0x, but can also be expressed in decimal.)
+File ``new_device`` takes 2 parameters: the name of the I2C device (a
+string) and the address of the I2C device (a number, typically expressed
+in hexadecimal starting with 0x, but can also be expressed in decimal.)
 
-File delete_device takes a single parameter: the address of the I2C
+File ``delete_device`` takes a single parameter: the address of the I2C
 device. As no two devices can live at the same address on a given I2C
 segment, the address is sufficient to uniquely identify the device to be
 deleted.
-- 
2.25.0


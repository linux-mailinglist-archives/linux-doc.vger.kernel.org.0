Return-Path: <linux-doc+bounces-2971-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C45897F59FE
	for <lists+linux-doc@lfdr.de>; Thu, 23 Nov 2023 09:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A8021F20D67
	for <lists+linux-doc@lfdr.de>; Thu, 23 Nov 2023 08:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7D419BAB;
	Thu, 23 Nov 2023 08:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
X-Greylist: delayed 553 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 23 Nov 2023 00:29:20 PST
Received: from hi1smtp01.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9E5B9
	for <linux-doc@vger.kernel.org>; Thu, 23 Nov 2023 00:29:20 -0800 (PST)
Received: from hi2exch02.adit-jv.com (hi2exch02.adit-jv.com [10.72.92.28])
	by hi1smtp01.de.adit-jv.com (Postfix) with ESMTP id 825C2520165;
	Thu, 23 Nov 2023 09:20:05 +0100 (CET)
Received: from vmlxhi-118.adit-jv.com (10.72.93.77) by hi2exch02.adit-jv.com
 (10.72.92.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.34; Thu, 23 Nov
 2023 09:20:05 +0100
From: Hardik Gajjar <hgajjar@de.adit-jv.com>
To: <gregkh@linuxfoundation.org>, <stern@rowland.harvard.edu>,
	<corbet@lwn.net>
CC: <tj@kernel.org>, <rdunlap@infradead.org>, <paulmck@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <erosca@de.adit-jv.com>,
	<hgajjar@de.adit-jv.com>, <Martin.Mueller5@de.bosch.com>
Subject: [PATCH] usb: hubs: Decrease IN-endpoint poll interval for Microchip USB491x hub
Date: Thu, 23 Nov 2023 09:19:48 +0100
Message-ID: <20231123081948.58776-1-hgajjar@de.adit-jv.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: hi2exch02.adit-jv.com (10.72.92.28) To
 hi2exch02.adit-jv.com (10.72.92.28)

There is a potential delay in announcing downstream USB bus activity to
Linux USB drivers due to the default interrupt endpoint having a poll
interval of 256ms.

Microchip has recommended ignoring the device descriptor and reducing
that value to 32ms, as it was too late to modify it in silicon.

This patch aims to speed up the USB enumeration process, facilitating
the successful completion of Apple CarPlay certifications and enhancing
user experience when utilizing USB devices through the Microchip Multihost
Hub.

A new quirk, USB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL, accelerates the
notification process by changing the Endpoint interrupt poll interval
from 256ms to 32ms.

Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  4 ++++
 drivers/usb/core/config.c                       |  8 ++++++++
 drivers/usb/core/quirks.c                       | 11 +++++++++++
 include/linux/usb/quirks.h                      |  5 +++++
 4 files changed, 28 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 65731b060e3f..6b0a66f0e6bf 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6908,6 +6908,10 @@
 					pause after every control message);
 				o = USB_QUIRK_HUB_SLOW_RESET (Hub needs extra
 					delay after resetting its port);
+				p = USB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL (Set
+					bInterval to a Maximum of 9 to Reduce
+					default Poll Rate from 256 ms to
+					32 ms);
 			Example: quirks=0781:5580:bk,0a5c:5834:gij
 
 	usbhid.mousepoll=
diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index b19e38d5fd10..4edbb5922872 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -355,6 +355,14 @@ static int usb_parse_endpoint(struct device *ddev, int cfgno,
 				n = clamp(fls(d->bInterval), i, j);
 				i = j = n;
 			}
+
+			/*
+			 * This quirk limits bInterval to 9 (32 ms).
+			 */
+			if (udev->quirks & USB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL) {
+				n = clamp(fls(d->bInterval), i, min(j, 9));
+				i = j = n;
+			}
 			break;
 		default:		/* USB_SPEED_FULL or _LOW */
 			/*
diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 15e9bd180a1d..243ae5981cc8 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -138,6 +138,9 @@ static int quirks_param_set(const char *value, const struct kernel_param *kp)
 			case 'o':
 				flags |= USB_QUIRK_HUB_SLOW_RESET;
 				break;
+			case 'p':
+				flags |= USB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL;
+				break;
 			/* Ignore unrecognized flag characters */
 			}
 		}
@@ -211,6 +214,14 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* USB3503 */
 	{ USB_DEVICE(0x0424, 0x3503), .driver_info = USB_QUIRK_RESET_RESUME },
 
+	/* USB491x hubs need 32ms instead of 256ms bInterval */
+	{ USB_DEVICE(0x0424, 0x4913), .driver_info =
+			USB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL},
+	{ USB_DEVICE(0x0424, 0x4914), .driver_info =
+			USB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL},
+	{ USB_DEVICE(0x0424, 0x4915), .driver_info =
+			USB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL},
+
 	/* Microsoft Wireless Laser Mouse 6000 Receiver */
 	{ USB_DEVICE(0x045e, 0x00e1), .driver_info = USB_QUIRK_RESET_RESUME },
 
diff --git a/include/linux/usb/quirks.h b/include/linux/usb/quirks.h
index eeb7c2157c72..8fbcca4432bf 100644
--- a/include/linux/usb/quirks.h
+++ b/include/linux/usb/quirks.h
@@ -72,4 +72,9 @@
 /* device has endpoints that should be ignored */
 #define USB_QUIRK_ENDPOINT_IGNORE		BIT(15)
 
+/*
+ * Limits the bInterval value to 9 instead of default value 16
+ */
+#define USB_QUIRK_REDUCE_FRAME_INTR_BINTERVAL	BIT(16)
+
 #endif /* __LINUX_USB_QUIRKS_H */
-- 
2.17.1



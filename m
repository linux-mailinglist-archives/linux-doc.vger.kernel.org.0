Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75D9844CEDF
	for <lists+linux-doc@lfdr.de>; Thu, 11 Nov 2021 02:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233238AbhKKBiN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 10 Nov 2021 20:38:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233061AbhKKBiD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Nov 2021 20:38:03 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477EDC061766;
        Wed, 10 Nov 2021 17:35:14 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d24so7152899wra.0;
        Wed, 10 Nov 2021 17:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+yiYmzkxUVSInDju8gPU7tSSLCcqoCbKCN/KI4NbXKM=;
        b=SyYv7xWLd0rVYzQiD6tlVNO7wZKPWivhlHmm+dveLmzXyAezVYwmmawEtdc/t9e2DN
         gooWM3cipOu1/9v8hIfNCg1UHlhaitYVvDaliMHHRaFiZGB/3YwMheP+3omFv6kHmyaD
         Af321GxBJPhpyX2KH/IJlyj+8DuWgCUfFZ349Okrk3nuMgUFS3a3ac7ASwbnWVEO/GL3
         fs4dz7vDBURrNTMnmENJJ9U89xJKdQLsSGC83zra/iShU94PKnoOCVbVReKa+y69qTm4
         8eN2/oSaLROXdlXdZ80eaWBKJRgu8FUn9f4bbF47edbIv6cM8uIkXX3Ni69slelKxMeO
         FTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+yiYmzkxUVSInDju8gPU7tSSLCcqoCbKCN/KI4NbXKM=;
        b=Wfp7kS6djCgUrCG9b/OIEd04lkZJYvheyqXbOtBx8r2kuynyGQR3uzptz8D76SDOsI
         kLIyK6vTxtLSp8ISPPiCG3E6qQw/iokj4kDe59q+BOFcX7aumiivtaaMwwgFmtpRKR8L
         RGOKiQzdFHbcdvbbOhn089oIDS0QnnYbK00mmnaH8SyXha7F7aOlavdLoKcVv3Zh0p+f
         /nTeODoEy5T4FqQQYwMvqT9/EjF6nh71vJMJ5kYUVPZojS3zTtadDOinkKVXYYZGtp39
         mhsDx/ZWoD+/qbMa9pFVT6f1SsiPIJ5z69MgmQ2rQhlE+ax2nbDFB5YXnSR4wPZXMafN
         zI+Q==
X-Gm-Message-State: AOAM533cDTpcdz16+iRysF9z84jDTkL9Kpcs3y3r6OOBn+6hM6D0S695
        +VYJfkj/UL3tXx3r4N1Vtw4=
X-Google-Smtp-Source: ABdhPJyEFEj8MS70rsWQZsW0BBXGh8H8xJL3XBeKA76JK9PrM3UQmPBYIFt8x0oC1cBFQD1MOJEi/w==
X-Received: by 2002:adf:e5c7:: with SMTP id a7mr4144717wrn.318.1636594512789;
        Wed, 10 Nov 2021 17:35:12 -0800 (PST)
Received: from Ansuel-xps.localdomain (93-42-71-246.ip85.fastwebnet.it. [93.42.71.246])
        by smtp.googlemail.com with ESMTPSA id d8sm1369989wrm.76.2021.11.10.17.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 17:35:12 -0800 (PST)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Pavel Machek <pavel@ucw.cz>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        John Crispin <john@phrozen.org>, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [RFC PATCH v4 4/8] leds: trigger: netdev: rename and expose NETDEV trigger enum and struct
Date:   Thu, 11 Nov 2021 02:34:56 +0100
Message-Id: <20211111013500.13882-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211111013500.13882-1-ansuelsmth@gmail.com>
References: <20211111013500.13882-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A LED driver, to support hardware control, requires to support a specific
trigger and requires to elaborate his trigger_data struct.
Move netdev trigger data struct to leds.h to make it accessible by any
LED driver that wants to add support for hardware control for the
specific netdev trigger.
Also rename NETDEV trigger enum modes to a more symbolic and descriptive
name.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/leds/trigger/ledtrig-netdev.c | 48 ++++++++-------------------
 include/linux/leds.h                  | 27 +++++++++++++++
 2 files changed, 41 insertions(+), 34 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 66a81cc9b64d..01e4544fa7b0 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -36,26 +36,6 @@
  *
  */
 
-struct led_netdev_data {
-	spinlock_t lock;
-
-	struct delayed_work work;
-	struct notifier_block notifier;
-
-	struct led_classdev *led_cdev;
-	struct net_device *net_dev;
-
-	char device_name[IFNAMSIZ];
-	atomic_t interval;
-	unsigned int last_activity;
-
-	unsigned long mode;
-	bool carrier_link_up;
-#define NETDEV_LED_LINK	0
-#define NETDEV_LED_TX	1
-#define NETDEV_LED_RX	2
-};
-
 enum netdev_led_attr {
 	NETDEV_ATTR_LINK,
 	NETDEV_ATTR_TX,
@@ -76,7 +56,7 @@ static void set_baseline_state(struct led_netdev_data *trigger_data)
 	if (!trigger_data->carrier_link_up) {
 		led_set_brightness(led_cdev, LED_OFF);
 	} else {
-		if (test_bit(NETDEV_LED_LINK, &trigger_data->mode))
+		if (test_bit(TRIGGER_NETDEV_LINK, &trigger_data->mode))
 			led_set_brightness(led_cdev,
 					   led_cdev->blink_brightness);
 		else
@@ -85,8 +65,8 @@ static void set_baseline_state(struct led_netdev_data *trigger_data)
 		/* If we are looking for RX/TX start periodically
 		 * checking stats
 		 */
-		if (test_bit(NETDEV_LED_TX, &trigger_data->mode) ||
-		    test_bit(NETDEV_LED_RX, &trigger_data->mode))
+		if (test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) ||
+		    test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode))
 			schedule_delayed_work(&trigger_data->work, 0);
 	}
 }
@@ -153,13 +133,13 @@ static ssize_t netdev_led_attr_show(struct device *dev, char *buf,
 
 	switch (attr) {
 	case NETDEV_ATTR_LINK:
-		bit = NETDEV_LED_LINK;
+		bit = TRIGGER_NETDEV_LINK;
 		break;
 	case NETDEV_ATTR_TX:
-		bit = NETDEV_LED_TX;
+		bit = TRIGGER_NETDEV_TX;
 		break;
 	case NETDEV_ATTR_RX:
-		bit = NETDEV_LED_RX;
+		bit = TRIGGER_NETDEV_RX;
 		break;
 	default:
 		return -EINVAL;
@@ -182,13 +162,13 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 
 	switch (attr) {
 	case NETDEV_ATTR_LINK:
-		bit = NETDEV_LED_LINK;
+		bit = TRIGGER_NETDEV_LINK;
 		break;
 	case NETDEV_ATTR_TX:
-		bit = NETDEV_LED_TX;
+		bit = TRIGGER_NETDEV_TX;
 		break;
 	case NETDEV_ATTR_RX:
-		bit = NETDEV_LED_RX;
+		bit = TRIGGER_NETDEV_RX;
 		break;
 	default:
 		return -EINVAL;
@@ -358,21 +338,21 @@ static void netdev_trig_work(struct work_struct *work)
 	}
 
 	/* If we are not looking for RX/TX then return  */
-	if (!test_bit(NETDEV_LED_TX, &trigger_data->mode) &&
-	    !test_bit(NETDEV_LED_RX, &trigger_data->mode))
+	if (!test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) &&
+	    !test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode))
 		return;
 
 	dev_stats = dev_get_stats(trigger_data->net_dev, &temp);
 	new_activity =
-	    (test_bit(NETDEV_LED_TX, &trigger_data->mode) ?
+	    (test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) ?
 		dev_stats->tx_packets : 0) +
-	    (test_bit(NETDEV_LED_RX, &trigger_data->mode) ?
+	    (test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) ?
 		dev_stats->rx_packets : 0);
 
 	if (trigger_data->last_activity != new_activity) {
 		led_stop_software_blink(trigger_data->led_cdev);
 
-		invert = test_bit(NETDEV_LED_LINK, &trigger_data->mode);
+		invert = test_bit(TRIGGER_NETDEV_LINK, &trigger_data->mode);
 		interval = jiffies_to_msecs(
 				atomic_read(&trigger_data->interval));
 		/* base state is ON (link present) */
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 81d50269a446..bc3c54eb269a 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -505,6 +505,33 @@ static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
 
 #endif /* CONFIG_LEDS_TRIGGERS */
 
+/* Trigger specific trigger_data used by netdev trigger */
+#ifdef CONFIG_LEDS_TRIGGER_NETDEV
+struct led_netdev_data {
+	spinlock_t lock;
+
+	struct delayed_work work;
+	struct notifier_block notifier;
+
+	struct led_classdev *led_cdev;
+	struct net_device *net_dev;
+
+	char device_name[IFNAMSIZ];
+	atomic_t interval;
+	unsigned int last_activity;
+
+	unsigned long mode;
+	bool carrier_link_up;
+};
+
+/* Trigger specific bitmap blink mode used by netdev trigger */
+enum led_trigger_netdev_modes {
+	TRIGGER_NETDEV_LINK,
+	TRIGGER_NETDEV_TX,
+	TRIGGER_NETDEV_RX,
+};
+#endif
+
 /* Trigger specific functions */
 #ifdef CONFIG_LEDS_TRIGGER_DISK
 void ledtrig_disk_activity(bool write);
-- 
2.32.0


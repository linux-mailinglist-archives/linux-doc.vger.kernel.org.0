Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBEAFDEBD5
	for <lists+linux-doc@lfdr.de>; Mon, 21 Oct 2019 14:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728615AbfJUMP0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Oct 2019 08:15:26 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40719 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728610AbfJUMPZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Oct 2019 08:15:25 -0400
Received: by mail-pg1-f195.google.com with SMTP id 15so2366015pgt.7
        for <linux-doc@vger.kernel.org>; Mon, 21 Oct 2019 05:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=Sa4xZAx/AZis8Bith/bcGJfRn7RQ+aAIMqtybRUr7Os=;
        b=Ez1JoBF8psh8aBpdGOVZLQiOF+58fhCpBqjiyzg3Xv18V3SbWHD0rIM5wAHbfmiynx
         KyjD5whzmXc4m4gRu/iKapr5eCvLXXFuXgh4GtJn7JJ2HEU+JTLOivOTil60kyLO7IKh
         QIw8NaKmE1Itlz5GscdcE/IRiGyOa56gsNhy+RR0oZdaccxdcpd6yRZjPZrYaDCghC5U
         C/l9H4LTcmV3gJxnLLV43tYp3sGue5rd0JeOyVB/TKPKxK5Dhywj9OEAO4w7GZ/3MFJi
         VjRHNeQWxA6mLVqY48BfStEXV+080Xlj2GNOxE3NO3xjZDL49m27XLUqz+xYyGahwkjJ
         Pebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=Sa4xZAx/AZis8Bith/bcGJfRn7RQ+aAIMqtybRUr7Os=;
        b=hqs3VYwKJF7BTCsLZcLhJ3w6sTt6XZ66xZ4IfOkn7ytSGuc1EqzwclsHGYJb/bGslV
         mqYuWxgNUhshmcqRhHq3HIYhsHYEVhIxvUF5cyakXbXnumIDLrNf+yBysgbcF3/3hTHc
         ChY/NQnq3P+j9yBXyzXrd/GRuUPneMmI3a3fUp87/+YeGpQamreV/LNrOjHpRd4wjahI
         AxWyP5s30fDC6sImJe7sPlSpVKiwGdvcUdMP5SbJwTkHnPi//RzIIu3O8t3G5Iq9TjM7
         BhCAUwqLkaN1r6ck/BbPEOcrjGlY7AKcXTHKnpLpxONo30mZlSU4SPNSjrddk7uZPIn7
         mBGg==
X-Gm-Message-State: APjAAAUosYKFvrZN2BjHCi7U1Nht+C2lWilxuq3cQM/a9AJ9h84X20fZ
        UP0YjRRZESlWG+JZtRQoxF2KKA==
X-Google-Smtp-Source: APXvYqyXgffwzemjiiGcNy5wmH6kNuMf1/Dycbq3FbUv/fMiS77lueUj9nuedPC8b6CPbUWRW78pjw==
X-Received: by 2002:a63:ff46:: with SMTP id s6mr25612864pgk.337.1571660124376;
        Mon, 21 Oct 2019 05:15:24 -0700 (PDT)
Received: from localhost ([49.248.62.222])
        by smtp.gmail.com with ESMTPSA id w14sm17543158pge.56.2019.10.21.05.15.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 05:15:23 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        sudeep.holla@arm.com, bjorn.andersson@linaro.org,
        edubezval@gmail.com, agross@kernel.org, tdas@codeaurora.org,
        swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Ben Segall <bsegall@google.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-doc@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH v5 1/6] thermal: Remove netlink support
Date:   Mon, 21 Oct 2019 17:45:10 +0530
Message-Id: <8ff02cf62186c7a54fff325fad40a2e9ca3affa6.1571656014.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571656014.git.amit.kucheria@linaro.org>
References: <cover.1571656014.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571656014.git.amit.kucheria@linaro.org>
References: <cover.1571656014.git.amit.kucheria@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are no users of netlink messages for thermal inside the kernel.
Remove the code and adjust the documentation.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 .../driver-api/thermal/sysfs-api.rst          |  26 ++---
 drivers/thermal/thermal_core.c                | 101 +-----------------
 include/linux/thermal.h                       |  11 --
 3 files changed, 7 insertions(+), 131 deletions(-)

diff --git a/Documentation/driver-api/thermal/sysfs-api.rst b/Documentation/driver-api/thermal/sysfs-api.rst
index fab2c9b36d084..b40b1f8391481 100644
--- a/Documentation/driver-api/thermal/sysfs-api.rst
+++ b/Documentation/driver-api/thermal/sysfs-api.rst
@@ -725,24 +725,10 @@ method, the sys I/F structure will be built like this::
     |---temp1_input:		37000
     |---temp1_crit:		100000
 
-4. Event Notification
+4. Export Symbol APIs
 =====================
 
-The framework includes a simple notification mechanism, in the form of a
-netlink event. Netlink socket initialization is done during the _init_
-of the framework. Drivers which intend to use the notification mechanism
-just need to call thermal_generate_netlink_event() with two arguments viz
-(originator, event). The originator is a pointer to struct thermal_zone_device
-from where the event has been originated. An integer which represents the
-thermal zone device will be used in the message to identify the zone. The
-event will be one of:{THERMAL_AUX0, THERMAL_AUX1, THERMAL_CRITICAL,
-THERMAL_DEV_FAULT}. Notification can be sent when the current temperature
-crosses any of the configured thresholds.
-
-5. Export Symbol APIs
-=====================
-
-5.1. get_tz_trend
+4.1. get_tz_trend
 -----------------
 
 This function returns the trend of a thermal zone, i.e the rate of change
@@ -751,14 +737,14 @@ are supposed to implement the callback. If they don't, the thermal
 framework calculated the trend by comparing the previous and the current
 temperature values.
 
-5.2. get_thermal_instance
+4.2. get_thermal_instance
 -------------------------
 
 This function returns the thermal_instance corresponding to a given
 {thermal_zone, cooling_device, trip_point} combination. Returns NULL
 if such an instance does not exist.
 
-5.3. thermal_notify_framework
+4.3. thermal_notify_framework
 -----------------------------
 
 This function handles the trip events from sensor drivers. It starts
@@ -768,14 +754,14 @@ and does actual throttling for other trip points i.e ACTIVE and PASSIVE.
 The throttling policy is based on the configured platform data; if no
 platform data is provided, this uses the step_wise throttling policy.
 
-5.4. thermal_cdev_update
+4.4. thermal_cdev_update
 ------------------------
 
 This function serves as an arbitrator to set the state of a cooling
 device. It sets the cooling device to the deepest cooling state if
 possible.
 
-6. thermal_emergency_poweroff
+5. thermal_emergency_poweroff
 =============================
 
 On an event of critical trip temperature crossing. Thermal framework
diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index d4481cc8958fe..cced0638b686f 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -19,8 +19,6 @@
 #include <linux/reboot.h>
 #include <linux/string.h>
 #include <linux/of.h>
-#include <net/netlink.h>
-#include <net/genetlink.h>
 #include <linux/suspend.h>
 
 #define CREATE_TRACE_POINTS
@@ -1464,97 +1462,6 @@ struct thermal_zone_device *thermal_zone_get_zone_by_name(const char *name)
 }
 EXPORT_SYMBOL_GPL(thermal_zone_get_zone_by_name);
 
-#ifdef CONFIG_NET
-static const struct genl_multicast_group thermal_event_mcgrps[] = {
-	{ .name = THERMAL_GENL_MCAST_GROUP_NAME, },
-};
-
-static struct genl_family thermal_event_genl_family __ro_after_init = {
-	.module = THIS_MODULE,
-	.name = THERMAL_GENL_FAMILY_NAME,
-	.version = THERMAL_GENL_VERSION,
-	.maxattr = THERMAL_GENL_ATTR_MAX,
-	.mcgrps = thermal_event_mcgrps,
-	.n_mcgrps = ARRAY_SIZE(thermal_event_mcgrps),
-};
-
-int thermal_generate_netlink_event(struct thermal_zone_device *tz,
-				   enum events event)
-{
-	struct sk_buff *skb;
-	struct nlattr *attr;
-	struct thermal_genl_event *thermal_event;
-	void *msg_header;
-	int size;
-	int result;
-	static unsigned int thermal_event_seqnum;
-
-	if (!tz)
-		return -EINVAL;
-
-	/* allocate memory */
-	size = nla_total_size(sizeof(struct thermal_genl_event)) +
-	       nla_total_size(0);
-
-	skb = genlmsg_new(size, GFP_ATOMIC);
-	if (!skb)
-		return -ENOMEM;
-
-	/* add the genetlink message header */
-	msg_header = genlmsg_put(skb, 0, thermal_event_seqnum++,
-				 &thermal_event_genl_family, 0,
-				 THERMAL_GENL_CMD_EVENT);
-	if (!msg_header) {
-		nlmsg_free(skb);
-		return -ENOMEM;
-	}
-
-	/* fill the data */
-	attr = nla_reserve(skb, THERMAL_GENL_ATTR_EVENT,
-			   sizeof(struct thermal_genl_event));
-
-	if (!attr) {
-		nlmsg_free(skb);
-		return -EINVAL;
-	}
-
-	thermal_event = nla_data(attr);
-	if (!thermal_event) {
-		nlmsg_free(skb);
-		return -EINVAL;
-	}
-
-	memset(thermal_event, 0, sizeof(struct thermal_genl_event));
-
-	thermal_event->orig = tz->id;
-	thermal_event->event = event;
-
-	/* send multicast genetlink message */
-	genlmsg_end(skb, msg_header);
-
-	result = genlmsg_multicast(&thermal_event_genl_family, skb, 0,
-				   0, GFP_ATOMIC);
-	if (result)
-		dev_err(&tz->device, "Failed to send netlink event:%d", result);
-
-	return result;
-}
-EXPORT_SYMBOL_GPL(thermal_generate_netlink_event);
-
-static int __init genetlink_init(void)
-{
-	return genl_register_family(&thermal_event_genl_family);
-}
-
-static void genetlink_exit(void)
-{
-	genl_unregister_family(&thermal_event_genl_family);
-}
-#else /* !CONFIG_NET */
-static inline int genetlink_init(void) { return 0; }
-static inline void genetlink_exit(void) {}
-#endif /* !CONFIG_NET */
-
 static int thermal_pm_notify(struct notifier_block *nb,
 			     unsigned long mode, void *_unused)
 {
@@ -1607,13 +1514,9 @@ static int __init thermal_init(void)
 	if (result)
 		goto unregister_governors;
 
-	result = genetlink_init();
-	if (result)
-		goto unregister_class;
-
 	result = of_parse_thermal_zones();
 	if (result)
-		goto exit_netlink;
+		goto unregister_class;
 
 	result = register_pm_notifier(&thermal_pm_nb);
 	if (result)
@@ -1622,8 +1525,6 @@ static int __init thermal_init(void)
 
 	return 0;
 
-exit_netlink:
-	genetlink_exit();
 unregister_class:
 	class_unregister(&thermal_class);
 unregister_governors:
diff --git a/include/linux/thermal.h b/include/linux/thermal.h
index e45659c759209..d9111aebb97d6 100644
--- a/include/linux/thermal.h
+++ b/include/linux/thermal.h
@@ -544,15 +544,4 @@ static inline void thermal_notify_framework(struct thermal_zone_device *tz,
 { }
 #endif /* CONFIG_THERMAL */
 
-#if defined(CONFIG_NET) && IS_ENABLED(CONFIG_THERMAL)
-extern int thermal_generate_netlink_event(struct thermal_zone_device *tz,
-						enum events event);
-#else
-static inline int thermal_generate_netlink_event(struct thermal_zone_device *tz,
-						enum events event)
-{
-	return 0;
-}
-#endif
-
 #endif /* __THERMAL_H__ */
-- 
2.17.1


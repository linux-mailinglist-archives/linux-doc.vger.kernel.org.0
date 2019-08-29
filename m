Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F626A12DE
	for <lists+linux-doc@lfdr.de>; Thu, 29 Aug 2019 09:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727959AbfH2HqX (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 29 Aug 2019 03:46:23 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:34411 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727956AbfH2HqW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 03:46:22 -0400
Received: by mail-pf1-f202.google.com with SMTP id i2so1862396pfe.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 00:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=BNYZzlx9aTQ+LCgQZ8IG6mRelU0sVitbFkM6D5hbnnk=;
        b=LBG2uKzUyf+lgCiiz1TCYPvqtTg8O75lmZkz3K9OnVAOegYlB2t8YC0L5P2YU6zU5j
         hMLIBnxwaAnmCIb3RjfHdxwX7hzF4AwQL0ymNEJ9RIhELNDRGn3q76ImBKR/jtT7JmW4
         G9BDxC3L/EXqCFj/8/eY75Qu3105luXea9dY4/owBiGMk9pp5/WKeuwdONwXpWGBHqTK
         Np6bsfEOV0Foi+N5sRYmp0kxzgoRgRlGXKpiZDsH9DCcL97pi0t1okzaQsuNnHPjgobv
         SemQ2cAXS+wRtE4/D4FAZMMtN5x1ekLi9jOXnbZRtdybxOFMNEFGLiaqcuWZJPzHYFna
         1zVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=BNYZzlx9aTQ+LCgQZ8IG6mRelU0sVitbFkM6D5hbnnk=;
        b=OEIKVe6VRyiBApOZ1s2X7FxXydR7Xs0xgovWX9fcJ5nvNyN8lj4RWd58x5ynYHy3B4
         PaPfDjKK0NpMvaxQO55UTkDLpIe+ezdhkByICoR+JwGXBQiaEaAzE1QmMIBQ6VS5073M
         Ii5Jzuz+HSDzZKmvTfTMh6++KRJKzVHeS3U/zOmUJKev2edg4Njz7lBYI4rn0KMqKivb
         vVe4KFE/KyRnlsmsBrQ2jRlpBIZ3+/5CwLwv0OSTgXEx0n5dCziTSuyviCRe876Y3QF1
         vqeJgaoPBckTONK/H3prO7fvrMcCjV54Z1rE8IixcAJAZHCzZV8aQ8Taz7sMX3mozYk8
         OBSA==
X-Gm-Message-State: APjAAAU5IjqSmi2C5PkM3XSX7mf4oFmiOCBcs0crkIz6BUCs2GM7mkaN
        Iu473VhgYbV+qSkS1Gh8czrLI8Du0A9FbTg=
X-Google-Smtp-Source: APXvYqx+RvJoMMYz7ltcPQy/uFdoUYJU6ahjc36Dl7f/s2wwI7J6sQL8aP+UHuzb8PASIQh6oHx8vPGvic4jh1k=
X-Received: by 2002:a65:4243:: with SMTP id d3mr7249704pgq.119.1567064781369;
 Thu, 29 Aug 2019 00:46:21 -0700 (PDT)
Date:   Thu, 29 Aug 2019 00:46:00 -0700
In-Reply-To: <20190829074603.70424-1-saravanak@google.com>
Message-Id: <20190829074603.70424-5-saravanak@google.com>
Mime-Version: 1.0
References: <20190829074603.70424-1-saravanak@google.com>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
Subject: [PATCH v10 4/7] of/platform: Pause/resume sync state during init and of_platform_populate()
From:   Saravana Kannan <saravanak@google.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-acpi@vger.kernel.org, clang-built-linux@googlegroups.com,
        David Collins <collinsd@codeaurora.org>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When all the top level devices are populated from DT during kernel
init, the supplier devices could be added and probed before the
consumer devices are added and linked to the suppliers. To avoid the
sync_state() callback from being called prematurely, pause the
sync_state() callbacks before populating the devices and resume them
at late_initcall_sync().

Similarly, when children devices are populated from a module using
of_platform_populate(), there could be supplier-consumer dependencies
between the children devices that are populated. To avoid the same
problem with sync_state() being called prematurely, pause and resume
sync_state() callbacks across of_platform_populate().

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/of/platform.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index b47a2292fe8e..d93891a05f60 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -480,6 +480,7 @@ int of_platform_populate(struct device_node *root,
 	pr_debug("%s()\n", __func__);
 	pr_debug(" starting at: %pOF\n", root);
 
+	device_links_supplier_sync_state_pause();
 	for_each_child_of_node(root, child) {
 		rc = of_platform_bus_create(child, matches, lookup, parent, true);
 		if (rc) {
@@ -487,6 +488,8 @@ int of_platform_populate(struct device_node *root,
 			break;
 		}
 	}
+	device_links_supplier_sync_state_resume();
+
 	of_node_set_flag(root, OF_POPULATED_BUS);
 
 	of_node_put(root);
@@ -518,6 +521,7 @@ static int __init of_platform_default_populate_init(void)
 	if (!of_have_populated_dt())
 		return -ENODEV;
 
+	device_links_supplier_sync_state_pause();
 	/*
 	 * Handle certain compatibles explicitly, since we don't want to create
 	 * platform_devices for every node in /reserved-memory with a
@@ -538,6 +542,14 @@ static int __init of_platform_default_populate_init(void)
 	return 0;
 }
 arch_initcall_sync(of_platform_default_populate_init);
+
+static int __init of_platform_sync_state_init(void)
+{
+	if (of_have_populated_dt())
+		device_links_supplier_sync_state_resume();
+	return 0;
+}
+late_initcall_sync(of_platform_sync_state_init);
 #endif
 
 int of_platform_device_destroy(struct device *dev, void *data)
-- 
2.23.0.187.g17f5b7556c-goog


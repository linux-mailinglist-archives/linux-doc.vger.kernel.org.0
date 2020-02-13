Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3534315C8A7
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2020 17:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbgBMQwK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Feb 2020 11:52:10 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33026 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728156AbgBMQwI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Feb 2020 11:52:08 -0500
Received: by mail-wr1-f67.google.com with SMTP id u6so7589561wrt.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2020 08:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oJuZlZp89pOsXq+0VjXQ9jH+YMeD48viPFbAUV42/7c=;
        b=am+o3vVNolOAaASmrjBUw9hY20zh4HtDIeCV6yutj5xzyXVGB72Y16IHxHQIChWN4K
         RwEtBXyPJzyBdLrUiuDB9WebfVID313RPtxibqDBWL2qI4fEdVhWvQdYBtq8iutE2Txo
         w88Wt4/3NYU97+1x1rVFsDxgWkSkf5Y5U5yAYg/nOTIQTDbrGTepdUcz0DlVUZ3/K36x
         9H8N+uDIR/4lAvu+ulNTEYXWpYhtxoIrTTyYBvEDAkg3aGBagLnZaGfdsHrcMOkeYCLH
         gUkMaS0Nl4Eix25KyyEsKtyXrPM+71nsvKDJsWYCA2NZQ4m0FRLUlADHZ2WFOr3VOT/B
         q1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oJuZlZp89pOsXq+0VjXQ9jH+YMeD48viPFbAUV42/7c=;
        b=YyrRV+HER1MgWeeSi0N1xWzHp9D0YMJgaCgtOUYVTjuqjRtMZgN6z9azqGk/h2mYKz
         KaytW6e2X+5P57UA4/29FBuEgkH7uyxieNPeaKHwdV3qlVcqmYH0VNUwfE6Y+ORq6lpD
         +LkJBX6f4IJTzWU09avLBkFgaXneYEzW5xDbEp4RWI4lGRmGQrbQDTqHR7GtV+o1L6g5
         g1ah7ivinpevOnC0gnQTbOBJH4K/Nk3wL7iX4N4mrNHA0pvGT1WXub9Po+0/0B42H91h
         VSwml9T0zjGo2FTukE++0bUewwtMDN90EipYjg0iOezCgE6bJLNtRhGXW6h/xy5jNMA6
         mveQ==
X-Gm-Message-State: APjAAAXTTZ2ZCXqmnSHhz+WlCyyUX5VKz+pUsa4480alRENln8HuSL5o
        nGQAeVpzf5XCoQmWH7jFRzhzgw==
X-Google-Smtp-Source: APXvYqyRdKXRvNXU931mCSFJbrbPQ+3L84wtnv9cjPTz5Ed5dcoIv/1s7/DTUZ9TwVfpeh22DgxFBg==
X-Received: by 2002:adf:f1c6:: with SMTP id z6mr21737194wro.279.1581612727305;
        Thu, 13 Feb 2020 08:52:07 -0800 (PST)
Received: from localhost.localdomain ([2001:171b:2276:930:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id y6sm3484807wrl.17.2020.02.13.08.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 08:52:06 -0800 (PST)
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     bhelgaas@google.com, will@kernel.org, robh+dt@kernel.org,
        lorenzo.pieralisi@arm.com, joro@8bytes.org,
        baolu.lu@linux.intel.com, linux-doc@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
        iommu@lists.linux-foundation.org
Cc:     corbet@lwn.net, mark.rutland@arm.com, liviu.dudau@arm.com,
        sudeep.holla@arm.com, guohanjun@huawei.com, rjw@rjwysocki.net,
        lenb@kernel.org, robin.murphy@arm.com, dwmw2@infradead.org,
        amurray@thegoodpenguin.co.uk, frowand.list@gmail.com
Subject: [PATCH 03/11] PCI: OF: Check whether the host bridge supports ATS
Date:   Thu, 13 Feb 2020 17:50:41 +0100
Message-Id: <20200213165049.508908-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213165049.508908-1-jean-philippe@linaro.org>
References: <20200213165049.508908-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Copy the ats-supported flag into the pci_host_bridge structure.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/pci/controller/pci-host-common.c | 1 +
 drivers/pci/of.c                         | 9 +++++++++
 include/linux/of_pci.h                   | 3 +++
 3 files changed, 13 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index 250a3fc80ec6..a6ac927be291 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -92,6 +92,7 @@ int pci_host_common_probe(struct platform_device *pdev,
 		return ret;
 	}
 
+	of_pci_host_check_ats(bridge);
 	platform_set_drvdata(pdev, bridge->bus);
 	return 0;
 }
diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 81ceeaa6f1d5..4b8a877f1e9f 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -576,6 +576,15 @@ int pci_parse_request_of_pci_ranges(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(pci_parse_request_of_pci_ranges);
 
+void of_pci_host_check_ats(struct pci_host_bridge *bridge)
+{
+	struct device_node *np = bridge->bus->dev.of_node;
+
+	if (!np)
+		return;
+
+	bridge->ats_supported = of_property_read_bool(np, "ats-supported");
+}
 #endif /* CONFIG_PCI */
 
 /**
diff --git a/include/linux/of_pci.h b/include/linux/of_pci.h
index 29658c0ee71f..2d0af410438c 100644
--- a/include/linux/of_pci.h
+++ b/include/linux/of_pci.h
@@ -7,12 +7,14 @@
 
 struct pci_dev;
 struct device_node;
+struct pci_host_bridge;
 
 #if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_PCI)
 struct device_node *of_pci_find_child_device(struct device_node *parent,
 					     unsigned int devfn);
 int of_pci_get_devfn(struct device_node *np);
 void of_pci_check_probe_only(void);
+void of_pci_host_check_ats(struct pci_host_bridge *bridge);
 #else
 static inline struct device_node *of_pci_find_child_device(struct device_node *parent,
 					     unsigned int devfn)
@@ -26,6 +28,7 @@ static inline int of_pci_get_devfn(struct device_node *np)
 }
 
 static inline void of_pci_check_probe_only(void) { }
+static inline void of_pci_host_check_ats(struct pci_host_bridge *bridge) { }
 #endif
 
 #if IS_ENABLED(CONFIG_OF_IRQ)
-- 
2.25.0


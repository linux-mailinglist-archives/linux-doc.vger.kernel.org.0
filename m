Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BEE815C8CF
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2020 17:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgBMQwV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Feb 2020 11:52:21 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40681 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728180AbgBMQwO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Feb 2020 11:52:14 -0500
Received: by mail-wm1-f67.google.com with SMTP id t14so7543986wmi.5
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2020 08:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U26fffvgwp71+SNBZes7kN68yqENzqleBMzpKeSvYfk=;
        b=Iz+vmyg7ylIYn6p7q9yd68KiPD4WwU9BkBaQerkI2NZdwzP5RRGj2wGHMVtCtezAPj
         u9bwehyH/NAlF9xyvFYYt9G82ostbC0FdUsO6U9xm/GVk0pYppfITCABiL8OFgK4KdC2
         VSZYeLfzQQvXfnC5qPGdZHw1KHNVOQSizYQ6Pgc6n8542Kng0v8keVX+xH1LbP7xSSpg
         uIi6TMeDA0Kv/w5GdtWY083xSiqHItXR9sT7EPm3ixtOzf66CJlPNnc4N/CWisrWmkjI
         Ybt5zO3XS7dRVC8RKFKepqhMG7zvG3xAiFjhjBL1ATOBv5o4hB54Wk8Nh2QMNFzB8P5f
         ppFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U26fffvgwp71+SNBZes7kN68yqENzqleBMzpKeSvYfk=;
        b=kKWWiL1MffuZ+gtd2PYn0wsKK7FOT+99UcXKyuQsixUUzxcBd5YXSjJY0nQ70oKRSH
         GwjVinuFOTCkJ5vtbG8Z2ISKbxxE2vhT9dQX8Znj1Xm1K072yrANELvm4Mil+8vRTXdZ
         Ajqt8YqUEC2SC/OH2QJBUKJdtrs0zcWN81wSmhIpZSc3t4AMeU9s7OGn3EUr//VJ7+p3
         umYRr5K+UMlLWZ3ozmtILFT0zuIeDaj+XKTjG4HKuda4BF4SLPchPSuSGhDzoAq9bA7D
         jRaQnJIkJZiTtgvGMrbRio6Va6JbYhW8eWHR6AqQEN7txXFE/VC526WA7M7dEcttOPE+
         heuA==
X-Gm-Message-State: APjAAAXpcJjEnKm88Kr/gJk5FBxO0d95HzHcchwiCE3QpLyDzEhn0/ud
        21WOhu3Egbt3hgp6UNkWvd851w==
X-Google-Smtp-Source: APXvYqwEOVyFHf6MJNfobIBMxCR5I4cYgsgZ8hgKlRwEfXmjyl79QF77D1oEmVHeHNVbhhjKa0kvHw==
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr6550304wma.62.1581612732115;
        Thu, 13 Feb 2020 08:52:12 -0800 (PST)
Received: from localhost.localdomain ([2001:171b:2276:930:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id y6sm3484807wrl.17.2020.02.13.08.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 08:52:11 -0800 (PST)
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
Subject: [PATCH 07/11] iommu/arm-smmu-v3: Use pci_ats_supported()
Date:   Thu, 13 Feb 2020 17:50:45 +0100
Message-Id: <20200213165049.508908-8-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213165049.508908-1-jean-philippe@linaro.org>
References: <20200213165049.508908-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The new pci_ats_supported() function checks if a device supports ATS and
is allowed to use it.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/arm-smmu-v3.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 034ad9671b83..bd2cfd946a36 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -2577,26 +2577,14 @@ static void arm_smmu_install_ste_for_dev(struct arm_smmu_master *master)
 	}
 }
 
-#ifdef CONFIG_PCI_ATS
 static bool arm_smmu_ats_supported(struct arm_smmu_master *master)
 {
-	struct pci_dev *pdev;
+	struct device *dev = master->dev;
 	struct arm_smmu_device *smmu = master->smmu;
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(master->dev);
-
-	if (!(smmu->features & ARM_SMMU_FEAT_ATS) || !dev_is_pci(master->dev) ||
-	    !(fwspec->flags & IOMMU_FWSPEC_PCI_RC_ATS) || pci_ats_disabled())
-		return false;
 
-	pdev = to_pci_dev(master->dev);
-	return !pdev->untrusted && pdev->ats_cap;
+	return (smmu->features & ARM_SMMU_FEAT_ATS) && dev_is_pci(dev) &&
+		pci_ats_supported(to_pci_dev(dev));
 }
-#else
-static bool arm_smmu_ats_supported(struct arm_smmu_master *master)
-{
-	return false;
-}
-#endif
 
 static void arm_smmu_enable_ats(struct arm_smmu_master *master)
 {
-- 
2.25.0


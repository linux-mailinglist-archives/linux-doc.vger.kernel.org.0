Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91C3A15C8C2
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2020 17:52:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728333AbgBMQwS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Feb 2020 11:52:18 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39356 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728316AbgBMQwQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Feb 2020 11:52:16 -0500
Received: by mail-wm1-f66.google.com with SMTP id c84so7564672wme.4
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2020 08:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wTgN36L9uPFUOqE7HndfB97BUOtINMq0mCE8mycdOyM=;
        b=h4qZTMifV+QK3yL9EkymCELnFi2Hv8hakZ6Oj0s96dY7GJFrgMKCn30S2Ywj+ho06c
         G1z/vJUYVgp930BEncxrzfViReqSQZvR5tpAUoQpeAE9wlhWdhjhfKEcYz5MXbWKswTn
         SgbBuIzImA3vusaiMbYCRw5fSUguq7jz2pS+xGIjY6BAWyZpS4wqHQg0jUSMe9i6JKOp
         G8wx73fJcUThfZ34y6GFa8Soek65Pb+ir92kRHXEbMnqMfHxuVxm7Y6y46nzw2PTpQu6
         vrFVOifSf4dKW7mNbiEzJglMqVYyc7Kp6ywzll7N+y1dApi+fUMeJEALomvPIMYONOq2
         3lRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wTgN36L9uPFUOqE7HndfB97BUOtINMq0mCE8mycdOyM=;
        b=mEdE1NtHHN4TxUcoPZk9bF6cI4LSvD/7EXXYD2Vu161uWH7umis5fLJqov9Ol/IJWc
         rtSVbzNFyTDj5F4BSMRnBCwg8kIF9L8bXf+9/teCQ1sSHC7r43WJrIb/JV9Dx3oyupfT
         OMmR2TkeTCFbgcf927D2T08o4NzsRzxZnKUctBe4OKTDg+aHIvD02UMVgwUwmVJ7UfAK
         nYU2SzqdQWVHu95eI/eZlxovtKq4X9Kns2zIrL0LxtDBkOQqUzA+qV0Kxt8xw6gx9+0D
         YbQwlCiYgSwheA/9R0gbwACKCytIkmnhCEGYhUdhGFfFZ4MT0Ib10X+4ou46PCeWqP3x
         GaYw==
X-Gm-Message-State: APjAAAWDMrR3sUabL6mseeOnX671WA+sEZUxxLlRg9Um71dWCx69z/Ni
        1GX45JoNppcJjyhsWg8ZREjAlQ==
X-Google-Smtp-Source: APXvYqxeuBETG18S4wku3Iin/3qX33/TOMOmaCOT/c4VstZL8FCL2GVweIV/jiGdNA4N0MW7TnICxg==
X-Received: by 2002:a7b:ce8b:: with SMTP id q11mr6982434wmj.100.1581612734339;
        Thu, 13 Feb 2020 08:52:14 -0800 (PST)
Received: from localhost.localdomain ([2001:171b:2276:930:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id y6sm3484807wrl.17.2020.02.13.08.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 08:52:13 -0800 (PST)
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
Subject: [PATCH 09/11] ACPI/IORT: Drop ATS fwspec flag
Date:   Thu, 13 Feb 2020 17:50:47 +0100
Message-Id: <20200213165049.508908-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213165049.508908-1-jean-philippe@linaro.org>
References: <20200213165049.508908-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Now that the ats_supported flag is in the host bridge structure where it
belongs, we can remove it from the per-device fwspec structure.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/acpi/arm64/iort.c | 11 -----------
 include/linux/iommu.h     |  4 ----
 2 files changed, 15 deletions(-)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index d99d7f5b51e1..f634641b3699 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -924,14 +924,6 @@ static int arm_smmu_iort_xlate(struct device *dev, u32 streamid,
 	return ret;
 }
 
-static bool iort_pci_rc_supports_ats(struct acpi_iort_node *node)
-{
-	struct acpi_iort_root_complex *pci_rc;
-
-	pci_rc = (struct acpi_iort_root_complex *)node->node_data;
-	return pci_rc->ats_attribute & ACPI_IORT_ATS_SUPPORTED;
-}
-
 static int iort_iommu_xlate(struct device *dev, struct acpi_iort_node *node,
 			    u32 streamid)
 {
@@ -1026,9 +1018,6 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
 		info.node = node;
 		err = pci_for_each_dma_alias(to_pci_dev(dev),
 					     iort_pci_iommu_init, &info);
-
-		if (!err && iort_pci_rc_supports_ats(node))
-			dev->iommu_fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
 	} else {
 		int i = 0;
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index d1b5f4d98569..1739f8a7a4b4 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -589,15 +589,11 @@ struct iommu_fwspec {
 	const struct iommu_ops	*ops;
 	struct fwnode_handle	*iommu_fwnode;
 	void			*iommu_priv;
-	u32			flags;
 	u32			num_pasid_bits;
 	unsigned int		num_ids;
 	u32			ids[1];
 };
 
-/* ATS is supported */
-#define IOMMU_FWSPEC_PCI_RC_ATS			(1 << 0)
-
 /**
  * struct iommu_sva - handle to a device-mm bond
  */
-- 
2.25.0


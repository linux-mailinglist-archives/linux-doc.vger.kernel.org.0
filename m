Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6766515C8BC
	for <lists+linux-doc@lfdr.de>; Thu, 13 Feb 2020 17:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgBMQwO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 13 Feb 2020 11:52:14 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39422 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728156AbgBMQwM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Feb 2020 11:52:12 -0500
Received: by mail-wr1-f68.google.com with SMTP id y11so7543328wrt.6
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2020 08:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ok2VflFFpn82omTuxL3VzAJ/IWmjkZJAtl6hkoQPLn0=;
        b=ym2NkCwbZ8ok/8h7pLkDQzEx2pDfzAtJPMb4rPMByTvSy/oalugI/V5JdlFt4HfW0j
         dy3n/NgRB22hO7k5AqHtguWMskUiv6FfYdBSQyDs10POhlzx5r3Vyc1FaOYaTQLHwy3D
         d/8qFXw1yuseQLQstm8SGLXypdyYjPtns0heVSXOt17xr7Gjayy5ml6DMHoZdGpLN4uR
         PLVvrsya1vzI+JVp2LsgFgtKyDGVGeg9zlaQ0JehE8kpbLtrOJIiKPukUtWFMOIbg3h5
         n4b2lOMzwyI0KIeO33JNGTjnIbr+aYSAgVteGDFxKWsP2wx2WH1MYBWCTwhGa9YgQj03
         s+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ok2VflFFpn82omTuxL3VzAJ/IWmjkZJAtl6hkoQPLn0=;
        b=cLcV/nHJZIAvVpRHd2/P6QcpL/zQx5gznfIO3vb4mtu7iRc1anEMq+VtLhPc8POCFo
         +Camr5/IcufylCLj7aGTPSx1EphqmfCiG1nTjw3qz5IcYxyG2z4/5RkIGAlxxOFO096Q
         g3GG3dYRzVl98N4cUAy6innSvAAkWQUne0VLAsQz95JjqN4Q9CGSEWeul31GCJaxiDRV
         y3deP/X0Z+bJ2Kf7U33KATQCXJ7JIC2ErMsjmJ36IYtZKCNuGqotm3GnWhJ+7kEBsSFk
         c+nx972Gt6zDUcbfZZYqjR/rSzxQL8OWGhvRJjyAB6G1577ncKH9SVTBi+zt1LVSvMSc
         kIBw==
X-Gm-Message-State: APjAAAWYnQqw2Eco2rSV/QMl0nrWDl1/KB6vpM1aGuqE7BN05DC+Nu9T
        ctb+ZmnWaYIadHfPMMw0SXSgGQ==
X-Google-Smtp-Source: APXvYqxMXp/ilBRu+no890FzgqKyNs9xsIMVwvkwTf8WIMQwsdZIOnE4gjEVHQ+8qUzRVZx0noCWuw==
X-Received: by 2002:adf:f382:: with SMTP id m2mr22276136wro.163.1581612730849;
        Thu, 13 Feb 2020 08:52:10 -0800 (PST)
Received: from localhost.localdomain ([2001:171b:2276:930:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id y6sm3484807wrl.17.2020.02.13.08.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 08:52:10 -0800 (PST)
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
Subject: [PATCH 06/11] iommu/amd: Use pci_ats_supported()
Date:   Thu, 13 Feb 2020 17:50:44 +0100
Message-Id: <20200213165049.508908-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200213165049.508908-1-jean-philippe@linaro.org>
References: <20200213165049.508908-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pci_ats_supported() function checks if a device supports ATS and is
allowed to use it.  In addition to checking that the device has an ATS
capability and that the global pci=noats is not set
(pci_ats_disabled()), it also checks if a device is untrusted (plugged
into an external-facing port such as thunderbolt).

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/amd_iommu.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index aac132bd1ef0..084f0b2e132e 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -291,16 +291,15 @@ static struct iommu_group *acpihid_device_group(struct device *dev)
 static bool pci_iommuv2_capable(struct pci_dev *pdev)
 {
 	static const int caps[] = {
-		PCI_EXT_CAP_ID_ATS,
 		PCI_EXT_CAP_ID_PRI,
 		PCI_EXT_CAP_ID_PASID,
 	};
 	int i, pos;
 
-	if (pci_ats_disabled())
+	if (!pci_ats_supported(pdev))
 		return false;
 
-	for (i = 0; i < 3; ++i) {
+	for (i = 0; i < 2; ++i) {
 		pos = pci_find_ext_capability(pdev, caps[i]);
 		if (pos == 0)
 			return false;
@@ -3040,11 +3039,8 @@ int amd_iommu_device_info(struct pci_dev *pdev,
 
 	memset(info, 0, sizeof(*info));
 
-	if (!pci_ats_disabled()) {
-		pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_ATS);
-		if (pos)
-			info->flags |= AMD_IOMMU_DEVICE_FLAG_ATS_SUP;
-	}
+	if (pci_ats_supported(pdev))
+		info->flags |= AMD_IOMMU_DEVICE_FLAG_ATS_SUP;
 
 	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_PRI);
 	if (pos)
-- 
2.25.0


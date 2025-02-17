Return-Path: <linux-doc+bounces-38339-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FAAA382F4
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 13:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D18DD3B0E0B
	for <lists+linux-doc@lfdr.de>; Mon, 17 Feb 2025 12:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB607219EB8;
	Mon, 17 Feb 2025 12:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="H2HroW0h"
X-Original-To: linux-doc@vger.kernel.org
Received: from pv50p00im-zteg10011401.me.com (pv50p00im-zteg10011401.me.com [17.58.6.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75612218AD8
	for <linux-doc@vger.kernel.org>; Mon, 17 Feb 2025 12:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739795239; cv=none; b=CXHUeo4uaS3xTKRUmPYkZ38nIWTwPO+Hw/EZS4jQnV0jzMTCTcldv8rOC5PivVXaC5OFIyds0DypPY3jrjas6G08Di3Us265vND18XvwUJl37FOahFAjZXE/a3FXTErTY0Ho+5qCcZTcrLYdiuSju0cuz+ONLkeNootBBIIxhkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739795239; c=relaxed/simple;
	bh=+dIR+LeHo5kZKBeudNiXzL2GMb5J0NlWFTmwEAPjc9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tMZCw1hdRUzSh6qUPDqebW+nQMmvAumZ5NX/6GIuWLhKUcTLfqOrsx+JI1Jr827P34/E6n5NWndZ8qGMDRSyAE4V48n5SMh/Wmfd3nh/aYiT1luYfSUeOSuDB2O6trTxlJt6x8fMYdvMnXTQkd0GEDznBKkJ4cWDaSq9UIW1Ab0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=H2HroW0h; arc=none smtp.client-ip=17.58.6.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=Pi7+rTG0m4v7zpGViDVCQo5NVyykXLI+pXUfY4RsiVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=H2HroW0hTMUdfZo6MiZQpBP0aiBenvObYk4BxCYgvT4X03H46ggvOUXWM2lPw2vvk
	 w022AOgNWDITlcqbRiViKm2tcLXPgKZkB4wY1iYG7PwJdo+JBeKwV8461EdTT2SYcl
	 XOqJZdSxDVxolxgFqNqjWQ/clrLDbg718Ej0EJWQPvOLLy/ROqQY6op6M5rSzmjw8E
	 RstWGaeZxxxsMwBk5HEcmA7wmDjEFITFfgiiyflCgZVIYqMQeZM1ux0lNBT0RC1WOi
	 lxem4cysWmn4ZYZvYRtkG8/X5Cl9hheDMXvbJrmd4+SRHQs97e45TjjeMiEvYkkVth
	 6M8sFD3k9zpfg==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-zteg10011401.me.com (Postfix) with ESMTPSA id 920DE34BA68E;
	Mon, 17 Feb 2025 12:27:12 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Mon, 17 Feb 2025 20:26:46 +0800
Subject: [PATCH v2] PCI: endpoint: Remove API devm_pci_epc_destroy()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-remove_api-v2-1-b169c9117045@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAAUrs2cC/23MQQrCMBCF4auUWRvJpKQYV95DisRxamfRpiYal
 JK7G7t2+T943wqJo3CCY7NC5CxJwlzD7Bqg0c93VnKrDUYbqw1qFXkKmS9+EeVoQPbOOo0M9bB
 EHuS9Yee+9ijpGeJnszP+1r9MRoXq4Lm7th233tLp8RKSmfYUJuhLKV/lE89WpgAAAA==
X-Change-ID: 20250210-remove_api-9cf1ea95901e
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-pci@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: aO8HdjU9xAh7e-Xl860WkIUQwEJ0m9eN
X-Proofpoint-ORIG-GUID: aO8HdjU9xAh7e-Xl860WkIUQwEJ0m9eN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=878
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2502170109
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

Static devm_pci_epc_match() is only invoked by API devm_pci_epc_destroy()
and the API has not had callers since 2017-04-10 when it was introduced.

Remove both the API and the static function.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
Changes in v2:
- Correct commit message error pointed out by Manivannan Sadhasivam.
- Link to v1: https://lore.kernel.org/r/20250210-remove_api-v1-1-8ae6b36e3a5c@quicinc.com
---
 Documentation/PCI/endpoint/pci-endpoint.rst |  7 +++----
 drivers/pci/endpoint/pci-epc-core.c         | 25 -------------------------
 include/linux/pci-epc.h                     |  1 -
 3 files changed, 3 insertions(+), 30 deletions(-)

diff --git a/Documentation/PCI/endpoint/pci-endpoint.rst b/Documentation/PCI/endpoint/pci-endpoint.rst
index 35f82f2d45f5ef155b657e337e1eef51b85e68ac..599763aa01ca9d017b59c2c669be92a850e171c4 100644
--- a/Documentation/PCI/endpoint/pci-endpoint.rst
+++ b/Documentation/PCI/endpoint/pci-endpoint.rst
@@ -57,11 +57,10 @@ by the PCI controller driver.
    The PCI controller driver can then create a new EPC device by invoking
    devm_pci_epc_create()/pci_epc_create().
 
-* devm_pci_epc_destroy()/pci_epc_destroy()
+* pci_epc_destroy()
 
-   The PCI controller driver can destroy the EPC device created by either
-   devm_pci_epc_create() or pci_epc_create() using devm_pci_epc_destroy() or
-   pci_epc_destroy().
+   The PCI controller driver can destroy the EPC device created by
+   pci_epc_create() using pci_epc_destroy().
 
 * pci_epc_linkup()
 
diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index 9e9ca5f8e8f860a57d49ce62597b0f71ef6009ba..cf2e19b80551a2e02136a4411fc61b13e1556d7a 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -25,13 +25,6 @@ static void devm_pci_epc_release(struct device *dev, void *res)
 	pci_epc_destroy(epc);
 }
 
-static int devm_pci_epc_match(struct device *dev, void *res, void *match_data)
-{
-	struct pci_epc **epc = res;
-
-	return *epc == match_data;
-}
-
 /**
  * pci_epc_put() - release the PCI endpoint controller
  * @epc: epc returned by pci_epc_get()
@@ -931,24 +924,6 @@ void pci_epc_destroy(struct pci_epc *epc)
 }
 EXPORT_SYMBOL_GPL(pci_epc_destroy);
 
-/**
- * devm_pci_epc_destroy() - destroy the EPC device
- * @dev: device that wants to destroy the EPC
- * @epc: the EPC device that has to be destroyed
- *
- * Invoke to destroy the devres associated with this
- * pci_epc and destroy the EPC device.
- */
-void devm_pci_epc_destroy(struct device *dev, struct pci_epc *epc)
-{
-	int r;
-
-	r = devres_release(dev, devm_pci_epc_release, devm_pci_epc_match,
-			   epc);
-	dev_WARN_ONCE(dev, r, "couldn't find PCI EPC resource\n");
-}
-EXPORT_SYMBOL_GPL(devm_pci_epc_destroy);
-
 static void pci_epc_release(struct device *dev)
 {
 	kfree(to_pci_epc(dev));
diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index e818e3fdcded95ca053db074eb75484a2876ea6b..82a26945d038d3e45e2bbbfe3c60b7ef647f247a 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -257,7 +257,6 @@ __devm_pci_epc_create(struct device *dev, const struct pci_epc_ops *ops,
 struct pci_epc *
 __pci_epc_create(struct device *dev, const struct pci_epc_ops *ops,
 		 struct module *owner);
-void devm_pci_epc_destroy(struct device *dev, struct pci_epc *epc);
 void pci_epc_destroy(struct pci_epc *epc);
 int pci_epc_add_epf(struct pci_epc *epc, struct pci_epf *epf,
 		    enum pci_epc_interface_type type);

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250210-remove_api-9cf1ea95901e

Best regards,
-- 
Zijun Hu <quic_zijuhu@quicinc.com>



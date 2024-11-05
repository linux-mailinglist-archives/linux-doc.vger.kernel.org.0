Return-Path: <linux-doc+bounces-29949-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 693779BD4D9
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2024 19:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D3462840D7
	for <lists+linux-doc@lfdr.de>; Tue,  5 Nov 2024 18:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A741EF956;
	Tue,  5 Nov 2024 18:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEMz7gY4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620641EF0B6;
	Tue,  5 Nov 2024 18:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730831920; cv=none; b=ePbrTmATTkR36+N3iWxd1f3Dw2rFgn4eiVOpaDy8N4W8Q9FbkyazqY1v3WGVn/wSsFpKKZMMq8uZLARAfEf5UMIA0yurSapnnXeM2IKePvUi9c+sS9nybhhRfUh6D6jHnsvt3PdnRGj3ZNX3vTcxXVEJYohN4Nt/nq2NU4p2oOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730831920; c=relaxed/simple;
	bh=2ZhFBttdobWud2tuhagfk0O3rCiwtU2iznWM3QuMAVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2sZ4isvd7Mrdw2GVLFns3HgZ8VXHI891t7b0Nzzjrti3POnaJzvM2ge4p2rd2+58er81eA5evtlTebdLyutYHk4kGmw/9YxEFPkW82tm+X77qS2SH421dv/EA7EdKDVch4Om3Q9UDQTalPyffnS7qmBCwJPXGPji/Vdj1RzcCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEMz7gY4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730831918; x=1762367918;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=2ZhFBttdobWud2tuhagfk0O3rCiwtU2iznWM3QuMAVU=;
  b=kEMz7gY4BYqH9rv8yZPLXxG0rRAVmSfeKCeSZm5/2VORb0l+qkb6Llw9
   fLozkTlVra7YoQ0reErgnUKW5Rr3sgKMoF6kdMCUo9MHiEZq27ExAwGM7
   itiVJc5sD257p/EdjC8kAdy/fXkJHFxulNJqG/4/EttZWB2LkUzJ1YH+G
   YAO0na1USLqHY37nxL3Chdu+2Msd4MPKwsopFjAMeeACaRL0soZgj39Wi
   WYnOYA71eCeDt2nxlpj7p2unjXS0Xx3XfR6TZuvnEkU+TO2h/SlVr1ca/
   ELgnWh3zicjhFNJDLS/F0IkMOS69TthS9GGrcrwAkzxovI6AK/NlMKypH
   g==;
X-CSE-ConnectionGUID: 0uFgHMrJTY6QTiAGZwVY0g==
X-CSE-MsgGUID: gBKEceJ8RUSNAMaVqM9PUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30708412"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="30708412"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 10:38:38 -0800
X-CSE-ConnectionGUID: fjZxFlD7RZeat0j4O3zDJw==
X-CSE-MsgGUID: 9hQgpTW1Q4mu+RsNkEzbZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="84948723"
Received: from spandruv-mobl4.amr.corp.intel.com (HELO localhost) ([10.125.109.247])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 10:38:37 -0800
From: Ira Weiny <ira.weiny@intel.com>
Date: Tue, 05 Nov 2024 12:38:26 -0600
Subject: [PATCH v6 04/27] cxl/pci: Delay event buffer allocation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-dcd-type2-upstream-v6-4-85c7fa2140fe@intel.com>
References: <20241105-dcd-type2-upstream-v6-0-85c7fa2140fe@intel.com>
In-Reply-To: <20241105-dcd-type2-upstream-v6-0-85c7fa2140fe@intel.com>
To: Dave Jiang <dave.jiang@intel.com>, Fan Ni <fan.ni@samsung.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Navneet Singh <navneet.singh@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>, 
 Davidlohr Bueso <dave@stgolabs.net>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Li Ming <ming4.li@intel.com>
X-Mailer: b4 0.15-dev-2a633
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730831904; l=1315;
 i=ira.weiny@intel.com; s=20221211; h=from:subject:message-id;
 bh=2ZhFBttdobWud2tuhagfk0O3rCiwtU2iznWM3QuMAVU=;
 b=46b3vXf3Bh4Jnmf0JLAQwZYgyjAzukuyKXEYsxexg+YsjIL44uxRsAogE0JlLAD0LVT94nxj8
 DgbZJ9ccDbEDYhN4B3teAWEdLsb7LtUciRWebbP9GUqSlOTieprOruN
X-Developer-Key: i=ira.weiny@intel.com; a=ed25519;
 pk=noldbkG+Wp1qXRrrkfY1QJpDf7QsOEthbOT7vm0PqsE=

The event buffer does not need to be allocated if something has failed in
setting up event irq's.

In prep for adjusting event configuration for DCD events move the buffer
allocation to the end of the event configuration.

Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Fan Ni <fan.ni@samsung.com>
Reviewed-by: Li Ming <ming4.li@intel.com>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/cxl/pci.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
index 188412d45e0d266b19f7401a1cdc51ed6fb0ea0a..295779c433b2a2e377995b53a70ff2a3158b0a8e 100644
--- a/drivers/cxl/pci.c
+++ b/drivers/cxl/pci.c
@@ -764,10 +764,6 @@ static int cxl_event_config(struct pci_host_bridge *host_bridge,
 		return 0;
 	}
 
-	rc = cxl_mem_alloc_event_buf(mds);
-	if (rc)
-		return rc;
-
 	rc = cxl_event_get_int_policy(mds, &policy);
 	if (rc)
 		return rc;
@@ -781,6 +777,10 @@ static int cxl_event_config(struct pci_host_bridge *host_bridge,
 		return -EBUSY;
 	}
 
+	rc = cxl_mem_alloc_event_buf(mds);
+	if (rc)
+		return rc;
+
 	rc = cxl_event_irqsetup(mds);
 	if (rc)
 		return rc;

-- 
2.47.0



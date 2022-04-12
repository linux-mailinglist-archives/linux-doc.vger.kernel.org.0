Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C02F04FCF58
	for <lists+linux-doc@lfdr.de>; Tue, 12 Apr 2022 08:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348716AbiDLGWr (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 Apr 2022 02:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiDLGWp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Apr 2022 02:22:45 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B1235269;
        Mon, 11 Apr 2022 23:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649744428; x=1681280428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=27fhujJg9XeamIFp4xQX/ElmnkUA7hiBTOhcEq2lNV4=;
  b=j7pvt2/1W9dMI0x9mqWoDFghsgvzQVYzpBW0XwP3udbVlCQ4LYwu5G+1
   bj9rwmlXbJcAfY9juXSdqVa7jcYa2F2WY259HkBwgU/EErVL0PplyWhmn
   NGGywOpGlVEbf9sSqk/j5UlZwhFyQZs3tgxkuENbvEmoKAFJgQTp29GBj
   gO8Bcec+scqBmRjk8HoQzBTzP+MulzTJ7EJ1Mz8+VcQw1Oy2TWin/+dZw
   geUzfOcCAYL1Wxi2yTNn7xoe5sZII/DELpnss/O9BuAZ9MDyoJPvtczBk
   BzzCqllJrXeGutht7lIW8qsB8xYPJa9k1lSu3BAqOGAa8dobpX/eXZrtY
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="262467193"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; 
   d="scan'208";a="262467193"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 23:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; 
   d="scan'208";a="724305381"
Received: from unknown (HELO localhost.localdomain.sh.intel.com) ([10.238.175.107])
  by orsmga005.jf.intel.com with ESMTP; 11 Apr 2022 23:20:25 -0700
From:   Tianfei Zhang <tianfei.zhang@intel.com>
To:     hao.wu@intel.com, trix@redhat.com, mdf@kernel.org,
        yilun.xu@intel.com, linux-fpga@vger.kernel.org,
        linux-doc@vger.kernel.org, rdunlap@infradead.org
Cc:     corbet@lwn.net, Tianfei zhang <tianfei.zhang@intel.com>
Subject: [PATCH v6 1/2] fpga: dfl: check feature type before parse irq info
Date:   Tue, 12 Apr 2022 02:17:04 -0400
Message-Id: <20220412061705.53721-2-tianfei.zhang@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20220412061705.53721-1-tianfei.zhang@intel.com>
References: <20220412061705.53721-1-tianfei.zhang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tianfei zhang <tianfei.zhang@intel.com>

Previously the feature IDs defined are unique, no matter
which feature type. But currently we want to extend its
usage to have a per-type feature ID space, so this patch
adds feature type checking as well just before look into
feature ID for different features which have irq info.

Signed-off-by: Tianfei zhang <tianfei.zhang@intel.com>
---
v4:
  - Fix the git commit from Hao's comments.
  - Split documentation into another patch.
v3:
  - Remove "Fixes" in commit log with Hao's comment, this is a
    extension not a bug fix.
v2:
  - add DFL Feature ID Registry in documentation.
---
 drivers/fpga/dfl.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/fpga/dfl.c b/drivers/fpga/dfl.c
index 599bb21d86af..6bff39ff21a0 100644
--- a/drivers/fpga/dfl.c
+++ b/drivers/fpga/dfl.c
@@ -940,9 +940,12 @@ static int parse_feature_irqs(struct build_feature_devs_info *binfo,
 {
 	void __iomem *base = binfo->ioaddr + ofst;
 	unsigned int i, ibase, inr = 0;
+	enum dfl_id_type type;
 	int virq;
 	u64 v;
 
+	type = feature_dev_id_type(binfo->feature_dev);
+
 	/*
 	 * Ideally DFL framework should only read info from DFL header, but
 	 * current version DFL only provides mmio resources information for
@@ -957,22 +960,25 @@ static int parse_feature_irqs(struct build_feature_devs_info *binfo,
 	 * code will be added. But in order to be compatible to old version
 	 * DFL, the driver may still fall back to these quirks.
 	 */
-	switch (fid) {
-	case PORT_FEATURE_ID_UINT:
-		v = readq(base + PORT_UINT_CAP);
-		ibase = FIELD_GET(PORT_UINT_CAP_FST_VECT, v);
-		inr = FIELD_GET(PORT_UINT_CAP_INT_NUM, v);
-		break;
-	case PORT_FEATURE_ID_ERROR:
-		v = readq(base + PORT_ERROR_CAP);
-		ibase = FIELD_GET(PORT_ERROR_CAP_INT_VECT, v);
-		inr = FIELD_GET(PORT_ERROR_CAP_SUPP_INT, v);
-		break;
-	case FME_FEATURE_ID_GLOBAL_ERR:
-		v = readq(base + FME_ERROR_CAP);
-		ibase = FIELD_GET(FME_ERROR_CAP_INT_VECT, v);
-		inr = FIELD_GET(FME_ERROR_CAP_SUPP_INT, v);
-		break;
+	if (type == PORT_ID) {
+		switch (fid) {
+		case PORT_FEATURE_ID_UINT:
+			v = readq(base + PORT_UINT_CAP);
+			ibase = FIELD_GET(PORT_UINT_CAP_FST_VECT, v);
+			inr = FIELD_GET(PORT_UINT_CAP_INT_NUM, v);
+			break;
+		case PORT_FEATURE_ID_ERROR:
+			v = readq(base + PORT_ERROR_CAP);
+			ibase = FIELD_GET(PORT_ERROR_CAP_INT_VECT, v);
+			inr = FIELD_GET(PORT_ERROR_CAP_SUPP_INT, v);
+			break;
+		}
+	} else if (type == FME_ID) {
+		if (fid == FME_FEATURE_ID_GLOBAL_ERR) {
+			v = readq(base + FME_ERROR_CAP);
+			ibase = FIELD_GET(FME_ERROR_CAP_INT_VECT, v);
+			inr = FIELD_GET(FME_ERROR_CAP_SUPP_INT, v);
+		}
 	}
 
 	if (!inr) {
-- 
2.26.2


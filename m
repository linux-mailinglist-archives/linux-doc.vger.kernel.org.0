Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19064157FA1
	for <lists+linux-doc@lfdr.de>; Mon, 10 Feb 2020 17:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727921AbgBJQX7 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 10 Feb 2020 11:23:59 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:58690 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727726AbgBJQX7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Feb 2020 11:23:59 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 6B08D27E0814;
        Mon, 10 Feb 2020 17:23:57 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id k0GTntSN_HCj; Mon, 10 Feb 2020 17:23:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id C445727E07AE;
        Mon, 10 Feb 2020 17:23:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu C445727E07AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1581351836;
        bh=xH6ZpUKj6BxNFLkQBfAkpBuvpGpnwireMkJA00lcFBY=;
        h=From:To:Date:Message-Id;
        b=N5JN5HKgbaQgokI5R3tLVcPkvcccjbCrPI0kmu/xiMGhZcwg7bZV9yj1UWVzE8NY3
         ttxs4jpq3n4MWZvK27OzMuf+Py3l51ACuX601OXtMISjjqIup/sGPZUaoFmXzURO3Z
         YY0QOavrcC/WI1w5Ez3Z0CuL8Ln5oM7W76+xo4AU=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id OioEQEtN5Q1z; Mon, 10 Feb 2020 17:23:56 +0100 (CET)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 9C6ED27E079C;
        Mon, 10 Feb 2020 17:23:56 +0100 (CET)
From:   Clement Leger <cleger@kalray.eu>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-remoteproc@vger.kernel.org
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Clement Leger <cleger@kalray.eu>
Subject: [PATCH v4 1/5] remoteproc: Use u64 len for da_to_va
Date:   Mon, 10 Feb 2020 17:22:05 +0100
Message-Id: <20200210162209.23149-2-cleger@kalray.eu>
X-Mailer: git-send-email 2.15.0.276.g89ea799
In-Reply-To: <20200210162209.23149-1-cleger@kalray.eu>
References: <527785289.2852303.1581062223707.JavaMail.zimbra@kalray.eu>
 <20200210162209.23149-1-cleger@kalray.eu>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With upcoming changes in elf loader for elf64 support, section size will
be a u64. When used with da_to_va, this will potentially lead to
overflow if using the current "int" type for len argument. Change
da_to_va prototype to use a u64 for len and fix all users of this
function.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/remoteproc/imx_rproc.c           | 11 ++++++-----
 drivers/remoteproc/keystone_remoteproc.c |  4 ++--
 drivers/remoteproc/qcom_q6v5_adsp.c      |  2 +-
 drivers/remoteproc/qcom_q6v5_mss.c       |  2 +-
 drivers/remoteproc/qcom_q6v5_pas.c       |  2 +-
 drivers/remoteproc/qcom_q6v5_wcss.c      |  2 +-
 drivers/remoteproc/qcom_wcnss.c          |  2 +-
 drivers/remoteproc/remoteproc_core.c     |  2 +-
 drivers/remoteproc/remoteproc_internal.h |  2 +-
 drivers/remoteproc/st_slim_rproc.c       |  4 ++--
 drivers/remoteproc/wkup_m3_rproc.c       |  4 ++--
 include/linux/remoteproc.h               |  2 +-
 12 files changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 3e72b6f38d4b..f497f5b49b18 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -186,7 +186,7 @@ static int imx_rproc_stop(struct rproc *rproc)
 }
 
 static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
-			       int len, u64 *sys)
+			       u64 len, u64 *sys)
 {
 	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
 	int i;
@@ -203,19 +203,19 @@ static int imx_rproc_da_to_sys(struct imx_rproc *priv, u64 da,
 		}
 	}
 
-	dev_warn(priv->dev, "Translation failed: da = 0x%llx len = 0x%x\n",
+	dev_warn(priv->dev, "Translation failed: da = 0x%llx len = 0x%llx\n",
 		 da, len);
 	return -ENOENT;
 }
 
-static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
+static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
 {
 	struct imx_rproc *priv = rproc->priv;
 	void *va = NULL;
 	u64 sys;
 	int i;
 
-	if (len <= 0)
+	if (len == 0)
 		return NULL;
 
 	/*
@@ -235,7 +235,8 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
 		}
 	}
 
-	dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%x va = 0x%p\n", da, len, va);
+	dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%llx va = 0x%p\n",
+		da, len, va);
 
 	return va;
 }
diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 5c4658f00b3d..466093f48814 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -246,7 +246,7 @@ static void keystone_rproc_kick(struct rproc *rproc, int vqid)
  * can be used either by the remoteproc core for loading (when using kernel
  * remoteproc loader), or by any rpmsg bus drivers.
  */
-static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
+static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
 {
 	struct keystone_rproc *ksproc = rproc->priv;
 	void __iomem *va = NULL;
@@ -255,7 +255,7 @@ static void *keystone_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
 	size_t size;
 	int i;
 
-	if (len <= 0)
+	if (len == 0)
 		return NULL;
 
 	for (i = 0; i < ksproc->num_mems; i++) {
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index e953886b2eb7..7518e67a49e5 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -270,7 +270,7 @@ static int adsp_stop(struct rproc *rproc)
 	return ret;
 }
 
-static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
+static void *adsp_da_to_va(struct rproc *rproc, u64 da, u64 len)
 {
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
 	int offset;
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 471128a2e723..248febde6fc1 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1148,7 +1148,7 @@ static int q6v5_stop(struct rproc *rproc)
 	return 0;
 }
 
-static void *q6v5_da_to_va(struct rproc *rproc, u64 da, int len)
+static void *q6v5_da_to_va(struct rproc *rproc, u64 da, u64 len)
 {
 	struct q6v5 *qproc = rproc->priv;
 	int offset;
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index db4b3c4bacd7..cf2cd609c90d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -159,7 +159,7 @@ static int adsp_stop(struct rproc *rproc)
 	return ret;
 }
 
-static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
+static void *adsp_da_to_va(struct rproc *rproc, u64 da, u64 len)
 {
 	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
 	int offset;
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index f93e1e4a1cc0..3a6b82a16961 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -406,7 +406,7 @@ static int q6v5_wcss_stop(struct rproc *rproc)
 	return 0;
 }
 
-static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, int len)
+static void *q6v5_wcss_da_to_va(struct rproc *rproc, u64 da, u64 len)
 {
 	struct q6v5_wcss *wcss = rproc->priv;
 	int offset;
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index dc135754bb9c..f893219e45a8 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -287,7 +287,7 @@ static int wcnss_stop(struct rproc *rproc)
 	return ret;
 }
 
-static void *wcnss_da_to_va(struct rproc *rproc, u64 da, int len)
+static void *wcnss_da_to_va(struct rproc *rproc, u64 da, u64 len)
 {
 	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
 	int offset;
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 307df98347ba..9e6d3c6a60ee 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -185,7 +185,7 @@ EXPORT_SYMBOL(rproc_va_to_pa);
  * here the output of the DMA API for the carveouts, which should be more
  * correct.
  */
-void *rproc_da_to_va(struct rproc *rproc, u64 da, int len)
+void *rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
 {
 	struct rproc_mem_entry *carveout;
 	void *ptr = NULL;
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 493ef9262411..004867061721 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -50,7 +50,7 @@ void rproc_exit_sysfs(void);
 void rproc_free_vring(struct rproc_vring *rvring);
 int rproc_alloc_vring(struct rproc_vdev *rvdev, int i);
 
-void *rproc_da_to_va(struct rproc *rproc, u64 da, int len);
+void *rproc_da_to_va(struct rproc *rproc, u64 da, u64 len);
 phys_addr_t rproc_va_to_pa(void *cpu_addr);
 int rproc_trigger_recovery(struct rproc *rproc);
 
diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
index 04492fead3c8..fc01cd879b60 100644
--- a/drivers/remoteproc/st_slim_rproc.c
+++ b/drivers/remoteproc/st_slim_rproc.c
@@ -174,7 +174,7 @@ static int slim_rproc_stop(struct rproc *rproc)
 	return 0;
 }
 
-static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
+static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
 {
 	struct st_slim_rproc *slim_rproc = rproc->priv;
 	void *va = NULL;
@@ -191,7 +191,7 @@ static void *slim_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
 		}
 	}
 
-	dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%x va = 0x%pK\n",
+	dev_dbg(&rproc->dev, "da = 0x%llx len = 0x%llx va = 0x%pK\n",
 		da, len, va);
 
 	return va;
diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
index 3984e585c847..91485b467407 100644
--- a/drivers/remoteproc/wkup_m3_rproc.c
+++ b/drivers/remoteproc/wkup_m3_rproc.c
@@ -80,14 +80,14 @@ static int wkup_m3_rproc_stop(struct rproc *rproc)
 	return 0;
 }
 
-static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, int len)
+static void *wkup_m3_rproc_da_to_va(struct rproc *rproc, u64 da, u64 len)
 {
 	struct wkup_m3_rproc *wkupm3 = rproc->priv;
 	void *va = NULL;
 	int i;
 	u32 offset;
 
-	if (len <= 0)
+	if (len == 0)
 		return NULL;
 
 	for (i = 0; i < WKUPM3_MEM_MAX; i++) {
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 16ad66683ad0..f84bd5fe0211 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -374,7 +374,7 @@ struct rproc_ops {
 	int (*start)(struct rproc *rproc);
 	int (*stop)(struct rproc *rproc);
 	void (*kick)(struct rproc *rproc, int vqid);
-	void * (*da_to_va)(struct rproc *rproc, u64 da, int len);
+	void * (*da_to_va)(struct rproc *rproc, u64 da, u64 len);
 	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
 	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
 			  int offset, int avail);
-- 
2.15.0.276.g89ea799


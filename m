Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74C485A5094
	for <lists+linux-doc@lfdr.de>; Mon, 29 Aug 2022 17:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbiH2Pse (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Aug 2022 11:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230245AbiH2PsQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Aug 2022 11:48:16 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D3096FD3;
        Mon, 29 Aug 2022 08:48:13 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27TCGPk3011168;
        Mon, 29 Aug 2022 17:48:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=lv/3vnqZ8jwV794amFy0wMNry6vdf7xH+N6oCNtSneI=;
 b=Tl0VP+XH6BpIRtBr/O4c8/141b7sC9ytsCVX1cCTvKY+LlfOi9MQv2ceBNSkE9NIdyyE
 r6Br0jNkJKi+qspsWtltMfBRuoo9wCNFEVA0YkuPp2f/8lMpkc+Vb3aH3AXZSbg5Q5QW
 TWLjkRgSWPZTwutGwHWqKPBPgwhFXMtY22eX6vfRZQ+HE6TtWHPQgNXQOeqC+DdDR1EG
 kgCMoO7W/pVBt0qDC/qCn6g5LqiEyOInZn9dqlZDC+ryddTHdGFKVWB5fguLKEZ3KYd9
 sZRYCLtXmHbOu/nz702YP4+VyalAXYslicxXS6cqgkQsDu08ffPeNiBifAVc3FcawRkX Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j7a5htn9x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 29 Aug 2022 17:48:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EAFAD100034;
        Mon, 29 Aug 2022 17:48:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E5847236935;
        Mon, 29 Aug 2022 17:48:00 +0200 (CEST)
Received: from localhost (10.75.127.118) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Mon, 29 Aug
 2022 17:48:00 +0200
From:   Amelie Delaunay <amelie.delaunay@foss.st.com>
To:     Jonathan Corbet <corbet@lwn.net>, Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC:     <linux-doc@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Marek Vasut <marex@denx.de>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: [RESEND PATCH v3 5/6] dmaengine: stm32-dma: add support to trigger STM32 MDMA
Date:   Mon, 29 Aug 2022 17:46:45 +0200
Message-ID: <20220829154646.29867-6-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829154646.29867-1-amelie.delaunay@foss.st.com>
References: <20220829154646.29867-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.118]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

STM32 MDMA can be triggered by STM32 DMA channels transfer complete.
The "request line number" triggering STM32 MDMA is the STM32 DMAMUX channel
id set by stm32-dmamux driver in dma_spec->args[3].

stm32-dma driver fills the struct stm32_dma_mdma_config used to configure
the MDMA with struct dma_slave_config .peripheral_config/.peripheral_size.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/dma/stm32-dma.c | 47 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/stm32-dma.c b/drivers/dma/stm32-dma.c
index 6aa281561f38..4891a1767e5a 100644
--- a/drivers/dma/stm32-dma.c
+++ b/drivers/dma/stm32-dma.c
@@ -140,6 +140,7 @@
 #define STM32_DMA_THRESHOLD_FTR_MASK	GENMASK(1, 0)
 #define STM32_DMA_DIRECT_MODE_MASK	BIT(2)
 #define STM32_DMA_ALT_ACK_MODE_MASK	BIT(4)
+#define STM32_DMA_MDMA_STREAM_ID_MASK	GENMASK(19, 16)
 
 enum stm32_dma_width {
 	STM32_DMA_BYTE,
@@ -193,6 +194,19 @@ struct stm32_dma_desc {
 	struct stm32_dma_sg_req sg_req[];
 };
 
+/**
+ * struct stm32_dma_mdma_config - STM32 DMA MDMA configuration
+ * @stream_id: DMA request to trigger STM32 MDMA transfer
+ * @ifcr: DMA interrupt flag clear register address,
+ *        used by STM32 MDMA to clear DMA Transfer Complete flag
+ * @tcf: DMA Transfer Complete flag
+ */
+struct stm32_dma_mdma_config {
+	u32 stream_id;
+	u32 ifcr;
+	u32 tcf;
+};
+
 struct stm32_dma_chan {
 	struct virt_dma_chan vchan;
 	bool config_init;
@@ -207,6 +221,8 @@ struct stm32_dma_chan {
 	u32 mem_burst;
 	u32 mem_width;
 	enum dma_status status;
+	bool trig_mdma;
+	struct stm32_dma_mdma_config mdma_config;
 };
 
 struct stm32_dma_device {
@@ -386,6 +402,13 @@ static int stm32_dma_slave_config(struct dma_chan *c,
 
 	memcpy(&chan->dma_sconfig, config, sizeof(*config));
 
+	/* Check if user is requesting DMA to trigger STM32 MDMA */
+	if (config->peripheral_size) {
+		config->peripheral_config = &chan->mdma_config;
+		config->peripheral_size = sizeof(chan->mdma_config);
+		chan->trig_mdma = true;
+	}
+
 	chan->config_init = true;
 
 	return 0;
@@ -561,6 +584,10 @@ static void stm32_dma_start_transfer(struct stm32_dma_chan *chan)
 	sg_req = &chan->desc->sg_req[chan->next_sg];
 	reg = &sg_req->chan_reg;
 
+	/* When DMA triggers STM32 MDMA, DMA Transfer Complete is managed by STM32 MDMA */
+	if (chan->trig_mdma && chan->dma_sconfig.direction != DMA_MEM_TO_DEV)
+		reg->dma_scr &= ~STM32_DMA_SCR_TCIE;
+
 	reg->dma_scr &= ~STM32_DMA_SCR_EN;
 	stm32_dma_write(dmadev, STM32_DMA_SCR(chan->id), reg->dma_scr);
 	stm32_dma_write(dmadev, STM32_DMA_SPAR(chan->id), reg->dma_spar);
@@ -710,6 +737,8 @@ static void stm32_dma_handle_chan_done(struct stm32_dma_chan *chan, u32 scr)
 
 	if (chan->desc->cyclic) {
 		vchan_cyclic_callback(&chan->desc->vdesc);
+		if (chan->trig_mdma)
+			return;
 		stm32_dma_sg_inc(chan);
 		/* cyclic while CIRC/DBM disable => post resume reconfiguration needed */
 		if (!(scr & (STM32_DMA_SCR_CIRC | STM32_DMA_SCR_DBM)))
@@ -1085,6 +1114,10 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_slave_sg(
 	else
 		chan->chan_reg.dma_scr &= ~STM32_DMA_SCR_PFCTRL;
 
+	/* Activate Double Buffer Mode if DMA triggers STM32 MDMA and more than 1 sg */
+	if (chan->trig_mdma && sg_len > 1)
+		chan->chan_reg.dma_scr |= STM32_DMA_SCR_DBM;
+
 	for_each_sg(sgl, sg, sg_len, i) {
 		ret = stm32_dma_set_xfer_param(chan, direction, &buswidth,
 					       sg_dma_len(sg),
@@ -1106,6 +1139,8 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_slave_sg(
 		desc->sg_req[i].chan_reg.dma_spar = chan->chan_reg.dma_spar;
 		desc->sg_req[i].chan_reg.dma_sm0ar = sg_dma_address(sg);
 		desc->sg_req[i].chan_reg.dma_sm1ar = sg_dma_address(sg);
+		if (chan->trig_mdma)
+			desc->sg_req[i].chan_reg.dma_sm1ar += sg_dma_len(sg);
 		desc->sg_req[i].chan_reg.dma_sndtr = nb_data_items;
 	}
 
@@ -1193,8 +1228,11 @@ static struct dma_async_tx_descriptor *stm32_dma_prep_dma_cyclic(
 		desc->sg_req[i].chan_reg.dma_spar = chan->chan_reg.dma_spar;
 		desc->sg_req[i].chan_reg.dma_sm0ar = buf_addr;
 		desc->sg_req[i].chan_reg.dma_sm1ar = buf_addr;
+		if (chan->trig_mdma)
+			desc->sg_req[i].chan_reg.dma_sm1ar += period_len;
 		desc->sg_req[i].chan_reg.dma_sndtr = nb_data_items;
-		buf_addr += period_len;
+		if (!chan->trig_mdma)
+			buf_addr += period_len;
 	}
 
 	desc->num_sgs = num_periods;
@@ -1476,6 +1514,7 @@ static void stm32_dma_set_config(struct stm32_dma_chan *chan,
 		chan->threshold = STM32_DMA_FIFO_THRESHOLD_NONE;
 	if (FIELD_GET(STM32_DMA_ALT_ACK_MODE_MASK, cfg->features))
 		chan->chan_reg.dma_scr |= STM32_DMA_SCR_TRBUFF;
+	chan->mdma_config.stream_id = FIELD_GET(STM32_DMA_MDMA_STREAM_ID_MASK, cfg->features);
 }
 
 static struct dma_chan *stm32_dma_of_xlate(struct of_phandle_args *dma_spec,
@@ -1615,6 +1654,12 @@ static int stm32_dma_probe(struct platform_device *pdev)
 		chan->id = i;
 		chan->vchan.desc_free = stm32_dma_desc_free;
 		vchan_init(&chan->vchan, dd);
+
+		chan->mdma_config.ifcr = res->start;
+		chan->mdma_config.ifcr += STM32_DMA_IFCR(chan->id);
+
+		chan->mdma_config.tcf = STM32_DMA_TCI;
+		chan->mdma_config.tcf <<= STM32_DMA_FLAGS_SHIFT(chan->id);
 	}
 
 	ret = dma_async_device_register(dd);
-- 
2.25.1


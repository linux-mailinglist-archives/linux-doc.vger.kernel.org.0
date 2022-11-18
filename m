Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 901A262FD27
	for <lists+linux-doc@lfdr.de>; Fri, 18 Nov 2022 19:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242819AbiKRSwN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 18 Nov 2022 13:52:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242880AbiKRSv5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Nov 2022 13:51:57 -0500
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46FB78FF8B;
        Fri, 18 Nov 2022 10:51:56 -0800 (PST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.3ffe.de (Postfix) with ESMTPSA id 3C7522766;
        Fri, 18 Nov 2022 19:51:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
        t=1668797490;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Vf16gWJ1GyfciocCQD1RZkkIH5SCpMTosBKmHY2lDE8=;
        b=znKxPN089tx3g391L8xjuIGA7iKtuVw28MxSpCK5jjDPiGYyeRiHgp6Pr/q6WhjAWA+X+O
        G1wPN0drIorkhMHYO8WQ1+7Aymuuvz5sQWoIi96vQa9QEDt5XQ5nubd8NEEb0nSq8/vbWI
        cE5nkdwVM9xo9xa6GQaY7yljj59LNJzNMSV9NA+6BfvtkFRgQEWehpcpUYWHUQJdpjvey+
        T1tnCMHQgMCC6Tcbq9xgIM6g5qdFYXGiMdzPxLWsLnZKTXyP5pkymLm9h13PNFTGv2Viip
        dazI/O6k34LIdQxuRm5FXpnAgpbz0086rUChdFBSq7S6N2LPOEtXxP3jHd5LyA==
From:   Michael Walle <michael@walle.cc>
To:     Jonathan Corbet <corbet@lwn.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v3 11/18] nvmem: core: allow to modify a cell before adding it
Date:   Fri, 18 Nov 2022 19:51:11 +0100
Message-Id: <20221118185118.1190044-12-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221118185118.1190044-1-michael@walle.cc>
References: <20221118185118.1190044-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Provide a way to modify a cell before it will get added. This is useful
to attach a custom post processing hook via a layout.

Signed-off-by: Michael Walle <michael@walle.cc>
---
changes since v2:
 - none

changes since v1:
 - new patch

 drivers/nvmem/core.c           | 4 ++++
 include/linux/nvmem-provider.h | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index f0c0bf3b8b25..264a15d26c7c 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -694,6 +694,7 @@ static int nvmem_validate_keepouts(struct nvmem_device *nvmem)
 
 static int nvmem_add_cells_from_of(struct nvmem_device *nvmem)
 {
+	struct nvmem_layout *layout = nvmem->layout;
 	struct device *dev = &nvmem->dev;
 	struct nvmem_cell_entry *cell;
 	struct device_node *child;
@@ -730,6 +731,9 @@ static int nvmem_add_cells_from_of(struct nvmem_device *nvmem)
 
 		info.np = of_node_get(child);
 
+		if (layout && layout->fixup_cell_info)
+			layout->fixup_cell_info(nvmem, layout, &info);
+
 		ret = nvmem_add_one_cell(nvmem, &info);
 		kfree(info.name);
 		if (ret) {
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 1930496d8854..bfaba5227ac9 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -157,6 +157,8 @@ struct nvmem_cell_table {
  * @add_cells:		Will be called if a nvmem device is found which
  *			has this layout. The function will add layout
  *			specific cells with nvmem_add_one_cell().
+ * @fixup_cell_info:	Will be called before a cell is added. Can be
+ *			used to modify the nvmem_cell_info.
  * @owner:		Pointer to struct module.
  * @node:		List node.
  *
@@ -170,6 +172,9 @@ struct nvmem_layout {
 	const struct of_device_id *of_match_table;
 	int (*add_cells)(struct device *dev, struct nvmem_device *nvmem,
 			 struct nvmem_layout *layout);
+	void (*fixup_cell_info)(struct nvmem_device *nvmem,
+				struct nvmem_layout *layout,
+				struct nvmem_cell_info *cell);
 
 	/* private */
 	struct module *owner;
-- 
2.30.2


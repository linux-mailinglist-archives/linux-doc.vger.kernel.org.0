Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C838644CFF
	for <lists+linux-doc@lfdr.de>; Tue,  6 Dec 2022 21:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiLFUIQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 6 Dec 2022 15:08:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbiLFUH7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Dec 2022 15:07:59 -0500
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20A02FFD2;
        Tue,  6 Dec 2022 12:07:57 -0800 (PST)
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.3ffe.de (Postfix) with ESMTPSA id 92BF13BD7;
        Tue,  6 Dec 2022 21:07:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
        t=1670357275;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nAM+HKLY4gwei738koUpxz8j63ybVeXrZ8wbJ288zE4=;
        b=AUgFUvzRmM1rgG3BIAQ4rpM66D1miFQGVwHZLxV/q8a9tB4ELv1z2vsQTiEh8WmgcvkHYH
        Y09RaAencibKdSQ/GxvipGorKtG0I8IToLFxwshOAK6r9Pj9TtrCOvD8261mR0M1C3Zjp0
        eVJu8nk+OUYBV6zgAs2mvIRzxOJIvdu6xNJwFjjvu7M9YHzb1nYThY1Jr5+l7Gm850Cbkf
        VTZeFGZd/cFHBh69tdJEHWqIKy3y/0Lm39NgX+FzUCULHDY1bKDFKkshIDyui7/g7CJjJD
        by1EYO+liyvohzyLeTSlew4KK69w9JpH65cAdiRID3itZAdAxPRRvTt4/9goXg==
From:   Michael Walle <michael@walle.cc>
To:     Jonathan Corbet <corbet@lwn.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Michael Walle <michael@walle.cc>,
        Dan Carpenter <error27@gmail.com>
Subject: [PATCH v5 21/21] MAINTAINERS: Add myself as ONIE tlv NVMEM layout maintainer
Date:   Tue,  6 Dec 2022 21:07:40 +0100
Message-Id: <20221206200740.3567551-22-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221206200740.3567551-1-michael@walle.cc>
References: <20221206200740.3567551-1-michael@walle.cc>
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

From: Miquel Raynal <miquel.raynal@bootlin.com>

Following the introduction of the bindings for this NVMEM parser and the
layout driver, add myself as maintainer.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
changes since v4:
 - none

changes since v3:
 - none

changes since v2:
 - new patch

 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 92e90fd7a19c..73a5b8d7c2f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15529,6 +15529,12 @@ L:	linux-hwmon@vger.kernel.org
 S:	Maintained
 F:	drivers/hwmon/oxp-sensors.c
 
+ONIE TLV NVMEM LAYOUT DRIVER
+M:	Miquel Raynal <miquel.raynal@bootlin.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/nvmem/layouts/onie,tlv-layout.yaml
+F:	drivers/nvmem/layouts/onie-tlv.c
+
 ONION OMEGA2+ BOARD
 M:	Harvey Hunt <harveyhuntnexus@gmail.com>
 L:	linux-mips@vger.kernel.org
-- 
2.30.2


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54875C176E
	for <lists+linux-doc@lfdr.de>; Sun, 29 Sep 2019 19:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730833AbfI2Rga (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 29 Sep 2019 13:36:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:49030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730790AbfI2Rga (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 29 Sep 2019 13:36:30 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 327E021925;
        Sun, 29 Sep 2019 17:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569778588;
        bh=0Aqdg5Rcg5WWheNYUhJwI5jz/7qigaqtY/pqcbi9bjo=;
        h=From:To:Cc:Subject:Date:From;
        b=EPWD/iq48kh16/BMCco9kXhCar4e2XtVHb5bhwkGtHdOPTx8Bs7PmJyT9K7TnDv7a
         fx0t49xj2vrRXoeSAImo+7eCnsRY+O1LmmRC3vfggLOxAuSrOiQhRRqMRjOaNExMlI
         q4Ey5Jf6ul3oW877b+BGzJVm3e9Q7gL7Yk0Ly9dQ=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Artur Rojek <contact@artur-rojek.eu>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, od@zcrc.me,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.9 01/13] clk: jz4740: Add TCU clock
Date:   Sun, 29 Sep 2019 13:36:11 -0400
Message-Id: <20190929173625.10003-1-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>

[ Upstream commit 73dd11dc1a883d4c994d729dc9984f4890001157 ]

Add the missing TCU clock to the list of clocks supplied by the CGU for
the JZ4740 SoC.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Paul Burton <paul.burton@mips.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: James Hogan <jhogan@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: od@zcrc.me
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/ingenic/jz4740-cgu.c       | 6 ++++++
 include/dt-bindings/clock/jz4740-cgu.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/ingenic/jz4740-cgu.c b/drivers/clk/ingenic/jz4740-cgu.c
index 510fe7e0c8f1c..79f0d48ec875b 100644
--- a/drivers/clk/ingenic/jz4740-cgu.c
+++ b/drivers/clk/ingenic/jz4740-cgu.c
@@ -211,6 +211,12 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 		.parents = { JZ4740_CLK_EXT, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 5 },
 	},
+
+	[JZ4740_CLK_TCU] = {
+		"tcu", CGU_CLK_GATE,
+		.parents = { JZ4740_CLK_EXT, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR, 1 },
+	},
 };
 
 static void __init jz4740_cgu_init(struct device_node *np)
diff --git a/include/dt-bindings/clock/jz4740-cgu.h b/include/dt-bindings/clock/jz4740-cgu.h
index 43153d3e9bd26..ff7c27bc98e37 100644
--- a/include/dt-bindings/clock/jz4740-cgu.h
+++ b/include/dt-bindings/clock/jz4740-cgu.h
@@ -33,5 +33,6 @@
 #define JZ4740_CLK_ADC		19
 #define JZ4740_CLK_I2C		20
 #define JZ4740_CLK_AIC		21
+#define JZ4740_CLK_TCU		22
 
 #endif /* __DT_BINDINGS_CLOCK_JZ4740_CGU_H__ */
-- 
2.20.1


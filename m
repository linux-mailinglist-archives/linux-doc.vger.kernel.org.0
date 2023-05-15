Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 707DD702387
	for <lists+linux-doc@lfdr.de>; Mon, 15 May 2023 07:50:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238122AbjEOFuO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 May 2023 01:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238258AbjEOFuJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 May 2023 01:50:09 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCD2D26B2
        for <linux-doc@vger.kernel.org>; Sun, 14 May 2023 22:49:51 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1ab1b79d3a7so84192705ad.3
        for <linux-doc@vger.kernel.org>; Sun, 14 May 2023 22:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129791; x=1686721791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/iGXLwFtJb/ikFg1cYTajKxo15m1ntUjHJP3AtJxPHQ=;
        b=dzjo8FojeRcnufXLfXC0KBxuYEA22LD3hfHOwXg4ZDuLKLv0BrqZuH8SGOB++jp5uO
         wzKiYKHcGFS22nfktsiZ/0soliO+6KwkV1F/CT4cSacQXjZNHJvQslYLfkfOySySRtSC
         8UjaZJDHoN+NS64WsDBJKuPA3FJoVOmbNNpbeSntaVz+MYmRbJtjWSbb0awzzHpNTzQM
         iMrORsenLXTKP1MfGL3i50980w+juwmbTsihGPxC1TFAomikj8sy7z3tZ5zOxuVobKLf
         PO/dJlkFK4Nme80wJtwvZuMrtkTbpTOttq+0KOfxO/f5tg65WVxizgRj349mCeC4zcqw
         YAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129791; x=1686721791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iGXLwFtJb/ikFg1cYTajKxo15m1ntUjHJP3AtJxPHQ=;
        b=AvmI1cCNNmZcrWK6UXZZvzAMCKZFX2FTO1YwVOvMW9Rr8YgXS2zTbeyLyAnuFpHpqp
         Hny/S8TTTltvTlCvm/qYfGS1gPB9rT06KZs8uotazyj5jb9YQBU49+IOuoPDfFtoO7dy
         eG+hTOFo+lkePI5yot4cvxSIEM/dFcf66hM2lrpCQuOD3GXCa4fXE/yxbSOowS5lbAbI
         On2j7CwwmYVAOOXy0VwReZ2aHNMSlyr0OnFWxYZefqqf1+gAkcrn8LHvI4Sr0zxnipHX
         MRxocwluPqmWVks07xc0fW/jdtS3iS5rMIj+keg/TNgwRRPJBcpQHNZ1kgyCWOEok3vs
         v0bA==
X-Gm-Message-State: AC+VfDwO87EwdCg6nd/eiclKFhHM9rOD4y18MnJvEsLFJSbfnflPNzLd
        bF9lEy5Hxi4EKO2xBCJN1pRz2qQk624xg62t1Jw=
X-Google-Smtp-Source: ACHHUZ5Z2n4/ARSq3kgTidyaSTNrk+RwN40D33bxOlnfkr8ZPEoD5Bs6K7sM3BLGphGdcRXft9Eprw==
X-Received: by 2002:a17:902:e5cf:b0:1ad:e3a8:3bf with SMTP id u15-20020a170902e5cf00b001ade3a803bfmr12750021plf.21.1684129790858;
        Sun, 14 May 2023 22:49:50 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:49:50 -0700 (PDT)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        llvm@lists.linux.dev
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Weili Qian <qianweili@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Marc Zyngier <maz@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>
Subject: [PATCH V6 02/21] platform/surface: Disable for RISC-V
Date:   Mon, 15 May 2023 11:19:09 +0530
Message-Id: <20230515054928.2079268-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With CONFIG_ACPI enabled for RISC-V, this driver gets enabled
in allmodconfig build. However, RISC-V doesn't support sub-word
atomics which is used by this driver and hence allmodconfig
build will fail.

There is currently no plan to support this driver for RISC-V. So,
disable this driver for RISC-V even when ACPI is enabled.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 drivers/platform/surface/aggregator/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/aggregator/Kconfig b/drivers/platform/surface/aggregator/Kconfig
index c114f9dd5fe1..88afc38ffdc5 100644
--- a/drivers/platform/surface/aggregator/Kconfig
+++ b/drivers/platform/surface/aggregator/Kconfig
@@ -4,7 +4,7 @@
 menuconfig SURFACE_AGGREGATOR
 	tristate "Microsoft Surface System Aggregator Module Subsystem and Drivers"
 	depends on SERIAL_DEV_BUS
-	depends on ACPI
+	depends on ACPI && !RISCV
 	select CRC_CCITT
 	help
 	  The Surface System Aggregator Module (Surface SAM or SSAM) is an
-- 
2.34.1


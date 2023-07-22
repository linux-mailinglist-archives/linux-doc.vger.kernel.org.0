Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3FCD75DBE8
	for <lists+linux-doc@lfdr.de>; Sat, 22 Jul 2023 13:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjGVLfI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 22 Jul 2023 07:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbjGVLfH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Jul 2023 07:35:07 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB6D269F
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 04:35:05 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3159d5e409dso2437745f8f.0
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 04:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690025704; x=1690630504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TI4WEo8JBa7BZd/mm79h4G4Y9fT6R4+52BHu8koh6+Q=;
        b=GcLKCNdhfz9AtVp8vPinQcaHhYG4hgecZqRq5JQrY942MZ3nkQu53lwsnvSHsAssYd
         eu4qOhlWAi/ryUU+DZnGsHkL6J0C9AhN94UoGdWVlcS2T5RmFcYyUuA+zg0SfJO0kbY1
         UNH7JjmiZY8uxzA/IaUA1f8Ps1GhxwmURxo97pSXrFIZD4s9LlGp3jUDlh4CEstUIG4+
         2oUBBCOUBH84+6SNu8SMqg4MfDGZb3oKExpaNqGY1/POvysle4gzlFm5GCh75/m/IRAy
         +QAHCbY/UE0eXAeNVaNoWgRshZo0hEx5YuegIosh8gzOLY+do02zvLhSje0YwBP/Pny5
         eEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690025704; x=1690630504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TI4WEo8JBa7BZd/mm79h4G4Y9fT6R4+52BHu8koh6+Q=;
        b=JQln5ConYyobHL2fJFr/VZ/RSA6KhEJ915F7t6bqNEtrqFaAAvPHsfTy5L9fg/pGgQ
         FMfNh/56T0pSu3YnNGsQjRVtU5kbcBSkYOSYENHQW5gpH086ml6c1k4Tgk+o/xF0ZXUx
         XDnytrAHosaMpC1QTykhEkswqRqcCr6Pd8bfhA/UTF+vhyTkw/MiqJ3D4sokzFmbUu0y
         QpkOrYDsSwWKAQ5PNmt9dTuMyCZLr6lcxjhCA8InxrkgvJglb9cmyfOpR/hpuR8djXeF
         Cft9xuVaqd1iVSW36jD7jxh7UZ9J9aa4Jj0qfAy8TePeiHcMtLqSc/EbAAZDhHPJLCzp
         rjsQ==
X-Gm-Message-State: ABy/qLbwt7IR/wNnM1ZcztlCKJpb3hH0nYYyHfHDWHh3foxQMOAIlufC
        8WRE8xcub1n9G15B93vzkWt+j1PyWfEiTTsq+Wk=
X-Google-Smtp-Source: APBJJlEVUSbNLiyfrVKWFMO5MdJL/wRkRpJQQubQvCsbTl7xbGOd+kXBKY85bijDDTDE7ntSB/CoiQ==
X-Received: by 2002:adf:fa48:0:b0:311:b18:9ca4 with SMTP id y8-20020adffa48000000b003110b189ca4mr7402449wrr.17.1690025704047;
        Sat, 22 Jul 2023 04:35:04 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v4-20020adff684000000b0031431fb40fasm6694886wrp.89.2023.07.22.04.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 04:35:03 -0700 (PDT)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Song Shuai <songshuaishuai@tinylab.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>,
        Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v5 1/3] Documentation: arm: Add bootargs to the table of added DT parameters
Date:   Sat, 22 Jul 2023 13:34:43 +0200
Message-Id: <20230722113445.630714-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The bootargs node is also added by the EFI stub in the function
update_fdt(), so add it to the table.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Song Shuai <songshuaishuai@tinylab.org>
---
- Changes in v5:
  * Rebase on top of docs-next

 Documentation/arch/arm/uefi.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm/uefi.rst b/Documentation/arch/arm/uefi.rst
index baebe688a006..2b7ad9bd7cd2 100644
--- a/Documentation/arch/arm/uefi.rst
+++ b/Documentation/arch/arm/uefi.rst
@@ -50,7 +50,7 @@ The stub populates the FDT /chosen node with (and the kernel scans for) the
 following parameters:
 
 ==========================  ======   ===========================================
-Name                        Size     Description
+Name                        Type     Description
 ==========================  ======   ===========================================
 linux,uefi-system-table     64-bit   Physical address of the UEFI System Table.
 
@@ -67,4 +67,6 @@ linux,uefi-mmap-desc-ver    32-bit   Version of the mmap descriptor format.
 
 kaslr-seed                  64-bit   Entropy used to randomize the kernel image
                                      base address location.
+
+bootargs                    String   Kernel command line
 ==========================  ======   ===========================================
-- 
2.39.2


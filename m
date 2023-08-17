Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65C977F752
	for <lists+linux-doc@lfdr.de>; Thu, 17 Aug 2023 15:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351044AbjHQNJT (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 17 Aug 2023 09:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351148AbjHQNIs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Aug 2023 09:08:48 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B07793594
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 06:08:20 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99c3c8adb27so1042511266b.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 06:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1692277657; x=1692882457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TI4WEo8JBa7BZd/mm79h4G4Y9fT6R4+52BHu8koh6+Q=;
        b=vB1JjgNnYRYIGaf7JSJrPw3vQhtSiLbPIiRuS8F+dMBz7l9Ezb280tjcdqTRNjUNS1
         vGwIXoPDvhsHyBc4tYUR4/X92hqFciBNxmRv5roV6Bw8PljdTqJ9WHDo7oj/AsVbxJjV
         /c8786uf4yTLw7cKhEXg9/PpGqdnh2rGBEucW8AosdbhckX6CQiZwkiKpf7tz0utrC+K
         7qDivPtPENr/tHMoDw9xdsdddwyaulCHlIJXAdRh3fdg0JW9/9FJmQJewpKrB0L0GhQU
         cMd1Q20z2zLldhY1SVLGQCF7VaTpvRD/VU2ae+nu2aeeiJg0Mpkbw4Of82cler629Mbm
         JY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692277657; x=1692882457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TI4WEo8JBa7BZd/mm79h4G4Y9fT6R4+52BHu8koh6+Q=;
        b=lXtnhmHwQD6ew0qHvRWgaeHV99rou/JeWN1oCHmsZ8A0vOeDYW0IvUnWkGAxU9ZL/d
         mj5UAzD81S4aCXQ3Pm4Pbykod6zkdJ2eJwXwX66X+KvEkfhjGrOk8FUnJnADMWUlc6AD
         3lxA+UBDj1K8MfUFVI1mvvS+XG6HUXmc9WAdWO6Re7fMXbCEpTebDsJURBJ+RBmkioiw
         w9nowENr2b2C13tIb2uHM+B/nLXvbOqJQREZWkbDtRgLfK9+S3osAAHSyb5gInsMB/G2
         tJXVxbh659XTPvm4gpWjAJkm7MTut39ivsGL+nwcb+sPDChLydmZqTasgmen4auZbH8L
         ycuA==
X-Gm-Message-State: AOJu0YyMEB7+E0SQibEJMSUDw9HuZb0FZSCwRx6FO2avYmrTifldRuiC
        S6LbU8uCNxmIpGAqmF83Re5UrQ==
X-Google-Smtp-Source: AGHT+IEuOGz6Ic3C9ppPiDWIIRGMKEkWVcsX7LpLAMv38XoWrqVy0+63u/IO19hIcaWenrDygouLTw==
X-Received: by 2002:a17:906:3058:b0:99c:a23b:b4f4 with SMTP id d24-20020a170906305800b0099ca23bb4f4mr4019871ejd.2.1692277656978;
        Thu, 17 Aug 2023 06:07:36 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([77.205.22.0])
        by smtp.gmail.com with ESMTPSA id k8-20020a1709061c0800b0099d9b50d786sm6863021ejg.199.2023.08.17.06.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 06:07:36 -0700 (PDT)
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
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>,
        Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 1/3] Documentation: arm: Add bootargs to the table of added DT parameters
Date:   Thu, 17 Aug 2023 15:07:32 +0200
Message-Id: <20230817130734.10387-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
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


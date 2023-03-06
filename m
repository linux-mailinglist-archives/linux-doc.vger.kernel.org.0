Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0382D6ABBCB
	for <lists+linux-doc@lfdr.de>; Mon,  6 Mar 2023 11:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbjCFKVb (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 6 Mar 2023 05:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbjCFKVR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Mar 2023 05:21:17 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4834B241FD
        for <linux-doc@vger.kernel.org>; Mon,  6 Mar 2023 02:21:11 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso4833333wmp.4
        for <linux-doc@vger.kernel.org>; Mon, 06 Mar 2023 02:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+Ect6Q4Z/51Ss7kNoue4ZgIVIoWQVVZbpFfKkrpRUw=;
        b=eKLpoO9ARR6byQoI3KfBvzhVk6oe6tP+suH4MHwkIJcy/wnL2MWwPVlq3KLS4NJYuC
         npg5z0T2YBn/ekgqpnS/gNer4hyqDKqYzgmIxENE3SgezTEwqliE0zYvr1fPH2GwQmt9
         jcx1NZi01pxBQ8XJzaRbcQsUYYsPfqsPA8Xrv5yjnuSnQHXj/GpNSw6rf6ah3jgmbxsg
         5zflN2ad7NQHZvZAnNO7AQDSJOT5MmVleuf7siqRD5syVZugGRJ+AhyVsYNsIzfeu+J7
         VpepoXaaVFgjZInk8H50HM4y5yJKfoYFvZxa+/DInESeQ0WBP4e+4PFuGrx7eKGY+RhS
         PH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+Ect6Q4Z/51Ss7kNoue4ZgIVIoWQVVZbpFfKkrpRUw=;
        b=HNoWsNmrI8OcVJ522vDT0yPuNxK6hE+AmcKaoP9GLSTbvWW6w/y6qfx68nEyRwwgYY
         WkSjTgLSf3jShu56ds7OTGdwPrxLf12qfpLbiel+auSI9ZtKquKCzEWJpYZhmY24NzLj
         vYwOEgYf+rKIpTxrklRi9UfGhTmEXWTasa1BzUCbiBiM0kCSrUiveskJhjO2o6AhRYS3
         CBUo/q18hCTPJNms9gpRo53AUegJmy8HDNxwL3fM5ncXqnjboH2hCLVzhInFjxPwur2b
         MTVKn3UmyWvyKaNBYX5IQpHrO1KT2jI2cjTaZNLOTbEBw9NOFkq/nG3NbN4CUIg6bXjM
         RAdg==
X-Gm-Message-State: AO0yUKW1cghaAHGF5jlhfMir53IxSNF+usBGDs+NqOCuKLrVWzgVNYhR
        /UpCIHrifZ4VGgpHtFxrdipxnA==
X-Google-Smtp-Source: AK7set/wPuCwO2+/CS8VAJ7eTry4Cq+2CHA4Y8YGXKD1MQFrurlRBakmEmc3JjUrX5cCPEVIcMP5rQ==
X-Received: by 2002:a05:600c:5254:b0:3eb:432d:8279 with SMTP id fc20-20020a05600c525400b003eb432d8279mr9240197wmb.13.1678098069733;
        Mon, 06 Mar 2023 02:21:09 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v18-20020a05600c15d200b003e20a6fd604sm9521693wmf.4.2023.03.06.02.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:21:09 -0800 (PST)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@rivosinc.com>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v5 15/26] arc: Remove empty <uapi/asm/setup.h>
Date:   Mon,  6 Mar 2023 11:04:57 +0100
Message-Id: <20230306100508.1171812-16-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 arch/arc/include/asm/setup.h      | 1 -
 arch/arc/include/uapi/asm/setup.h | 6 ------
 2 files changed, 7 deletions(-)
 delete mode 100644 arch/arc/include/uapi/asm/setup.h

diff --git a/arch/arc/include/asm/setup.h b/arch/arc/include/asm/setup.h
index 028a8cf76206..fe45ff4681bc 100644
--- a/arch/arc/include/asm/setup.h
+++ b/arch/arc/include/asm/setup.h
@@ -7,7 +7,6 @@
 
 
 #include <linux/types.h>
-#include <uapi/asm/setup.h>
 
 #define COMMAND_LINE_SIZE 256
 
diff --git a/arch/arc/include/uapi/asm/setup.h b/arch/arc/include/uapi/asm/setup.h
deleted file mode 100644
index a6d4e44938be..000000000000
--- a/arch/arc/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,6 +0,0 @@
-/*
- * setup.h is part of userspace header ABI so UAPI scripts have to generate it
- * even if there's nothing to export - causing empty <uapi/asm/setup.h>
- * However to prevent "patch" from discarding it we add this placeholder
- * comment
- */
-- 
2.37.2


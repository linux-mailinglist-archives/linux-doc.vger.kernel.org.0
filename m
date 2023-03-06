Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4DB76ABCC0
	for <lists+linux-doc@lfdr.de>; Mon,  6 Mar 2023 11:31:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbjCFKbE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 6 Mar 2023 05:31:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbjCFKav (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Mar 2023 05:30:51 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 464CF25E23
        for <linux-doc@vger.kernel.org>; Mon,  6 Mar 2023 02:30:26 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso7800075wmi.4
        for <linux-doc@vger.kernel.org>; Mon, 06 Mar 2023 02:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678098625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXAvkdr/KDgKti1Qk0fGZtxrB/HUuKAsHe829QuSuFY=;
        b=pgS35aCdmrPQvRmz+iyfEoK2FRpACPPCY0MT6mFvJKkIUhbtwnSzkh1nDZ4dLg4N66
         6ZVDArxRLTZLYfBKXHPjVVXFk3ykL/Ll+SunOskkjFEC44CCkzVmJzYhiA/SpJcgPsXD
         iaxTAEzNvivOqXbfNob2LDlmKw0ZcaqlzVRuIFVk8cR0s+FUBB5x+NoBb99m7FdgTTah
         vZAnZAMHkL7V18QXzPHaCpzGGQWELRiT2WyIpZNXSgzp7qcnCjdjYhSVinAF3g/DsyXX
         44dOQ7eQm940d/z5SFQ+4xJwQrGMZMea8UaCvouMgKgVikT1M0ZwEubwwnmdMLP5t9Zo
         iu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678098625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXAvkdr/KDgKti1Qk0fGZtxrB/HUuKAsHe829QuSuFY=;
        b=UWlxnre4QdOkzkrGBhfzksToEcED8EpQQDlKIWuhYj1QDDOrJm4Y75nsUb1JL6b6sd
         i7PABBGyoOfvubxvm9d0oROxREGvBpL0KqPL1bNJFe18biWGtwh2WBx0uMogNBWYa/PO
         pW2XzNYEFIDCIyGu+6GvS/Y+pkgUDjY+D7ugxnedfx/TmUYSeBi0eUg4jp/s8TMOmfz/
         xDs07b/IcYkDAG/jLeYtmYsg/NQB0OYg/5eRzrkSu1mGr+W231xA8OJ+4LdF5ndHG2zw
         tXDslKZkq1F/zOZq6VLF99W+q2LMPtdHIQNA/fPH+VZstJhDzGQv61Elst4fgs6otuyo
         oEkA==
X-Gm-Message-State: AO0yUKWrm44pRYtWd2hHb3ZziFhFttF/tVfQu2t6R0LkL8VTKVJcugd/
        MFDiz1CVmclmm7SqCk7GZcEPUA==
X-Google-Smtp-Source: AK7set9mPKitCfuwffMa4942mc5rcJfQ8KgUB3nP8TvnUmyeh9L6WaWHYflu+MFIUn26b3DlN/zC2w==
X-Received: by 2002:a05:600c:4ece:b0:3de:d52:2cd2 with SMTP id g14-20020a05600c4ece00b003de0d522cd2mr9065487wmq.4.1678098625091;
        Mon, 06 Mar 2023 02:30:25 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id y33-20020a05600c342100b003e21f20b646sm9913265wmp.21.2023.03.06.02.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:30:24 -0800 (PST)
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
        Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 24/26] mips: Remove empty <uapi/asm/setup.h>
Date:   Mon,  6 Mar 2023 11:05:06 +0100
Message-Id: <20230306100508.1171812-25-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230306100508.1171812-1-alexghiti@rivosinc.com>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Palmer Dabbelt <palmer@rivosinc.com>

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/mips/include/uapi/asm/setup.h | 5 -----
 1 file changed, 5 deletions(-)
 delete mode 100644 arch/mips/include/uapi/asm/setup.h

diff --git a/arch/mips/include/uapi/asm/setup.h b/arch/mips/include/uapi/asm/setup.h
deleted file mode 100644
index 157c3c392fb4..000000000000
--- a/arch/mips/include/uapi/asm/setup.h
+++ /dev/null
@@ -1,5 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef _UAPI_MIPS_SETUP_H
-#define _UAPI_MIPS_SETUP_H
-
-#endif /* _UAPI_MIPS_SETUP_H */
-- 
2.37.2


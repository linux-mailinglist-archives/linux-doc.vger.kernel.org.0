Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 551C86A7F74
	for <lists+linux-doc@lfdr.de>; Thu,  2 Mar 2023 11:02:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230040AbjCBKBx (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 2 Mar 2023 05:01:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbjCBKAx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Mar 2023 05:00:53 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1124A3E626
        for <linux-doc@vger.kernel.org>; Thu,  2 Mar 2023 02:00:27 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id f11so4016718wrv.8
        for <linux-doc@vger.kernel.org>; Thu, 02 Mar 2023 02:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677751162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILvb9GZC9A1qdpzGm/54DVnwfbD0aC1FwyW+Sl0y38Q=;
        b=iEFVfsrb5OtcQreF8wlM/GwKwWXjAdiB5zFZjDGOkxsfSSW2ix9k7XafXuRFWHkNIw
         TQUj1z5ar2C0vEVfH9chUCmNH/nteRlN1JdwyEUKTQ48/qxc5zj7lbxM6oIumNApIlqo
         K5VLD6wVEEWQMgZjLuZL0KrTQGr9096IfMMlinEHKNGLif5eFvYvdBjXluO8Ix1w5R4U
         RJY91d9JKU56mcqJltFuMP1hPTP3suLy9poPdP2dzMNCJAeF1wsN9BU7pj1S6IwmR5Pr
         qxXd+GuaTvJtDc6/YI8Kl6o8vw4aO5d1givhUukt4+tiF5HMj/+lNEF0nfMftS0WTvNr
         b4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677751162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILvb9GZC9A1qdpzGm/54DVnwfbD0aC1FwyW+Sl0y38Q=;
        b=KeDMpe+vKEzmBDn8GxgfMYBQrqD1AVE0tR544UQ1cAA937RTiuQcVSozPY8qoWhdtN
         Exp/sNF8GzxCZfR+P26Q7ZlxlHBXljzZyGFZkCi2fIPkNclm9zYu1wdmpja+Wio0AOcR
         68W1sb/qb1Xy9yjRHI5/APQqwDZFySZLM8KrsepHopmm9jrFZoqHjrZ/+WMv/fJ2k+9+
         R9qF3f2E4Gk98x8q3gAe0t9K0IzyHm7LobLWWee/vfVhUEi0mjL14IZ8mHs9LiJu6ZcW
         0lLlyE5I8CyvTH3dD0FcqgRzB36mLDYhxRGI2/Zw/GpoCBH8+ENMjoqFx0G3ptNdlion
         0USQ==
X-Gm-Message-State: AO0yUKVu5omjGa3lx5eDrSAciJ2535FYBU1PEqOCS3S5WYgXYqJUMvpa
        Y65MD9ZyS3qmwJVADBcEq6Zv6g==
X-Google-Smtp-Source: AK7set/ZaZqc8Pqp5NMCbp2YvB641qs31ffprFtxgjh4YFRfODcsMY9Ph9awlpUQ4nOMh9NRpwbCrA==
X-Received: by 2002:adf:db90:0:b0:2c5:8d06:75c2 with SMTP id u16-20020adfdb90000000b002c58d0675c2mr7214454wri.35.1677751161891;
        Thu, 02 Mar 2023 01:59:21 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id s17-20020adff811000000b002c758fe9689sm14771605wrp.52.2023.03.02.01.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 01:59:21 -0800 (PST)
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
To:     Jonathan Corbet <corbet@lwn.net>,
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
Cc:     Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 23/24] mips: Remove empty <uapi/asm/setup.h>
Date:   Thu,  2 Mar 2023 10:35:38 +0100
Message-Id: <20230302093539.372962-24-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
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


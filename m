Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 160C96A988B
	for <lists+linux-doc@lfdr.de>; Fri,  3 Mar 2023 14:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbjCCNhI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Mar 2023 08:37:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbjCCNhF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Mar 2023 08:37:05 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4419A11EBE
        for <linux-doc@vger.kernel.org>; Fri,  3 Mar 2023 05:37:00 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id p3-20020a17090ad30300b0023a1cd5065fso2313131pju.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Mar 2023 05:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFClBCEHVbePO27Fju+ZNSU82apTBuXNOZbPa4NKUXM=;
        b=BaGOIcvg8yJWm+BIvCQOan2HHyyVeJEeaVJeASwbhGxl7BQSCOpwN9u25ktOOtlKqo
         uKJs2wjzyHW2sl5DzomdnOjELA3eXTKPy20+cTaCZlK5KRqdoFa0j8owuweg12R+tsdK
         BwxvWflFFoGEPgmpNarq6mKLDF6x2GZQbaAgGGa3IXZjyytIOKd8MXddS8OXGK68BcsO
         AjQcAGXJtcY20mIjMqoVKR7EuNbpxaV/NlOgxeZqwKIILS6n3ucL7q5YablSFhkqVBoN
         6vHdUn9huE+cJoGdX7bPLS81LIsRXLdCh04zY4Wd4w0eQDc/4m20oy/DZTzbNOySH83z
         gDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFClBCEHVbePO27Fju+ZNSU82apTBuXNOZbPa4NKUXM=;
        b=wRPwuw0lFH2BN+uaF7jVjUYzmWldoj8tjlDlQb/ukaUaDrkC23G7Jj3bB+ku2mwV5x
         t62ZNSjYgCqKzPcedDxeD8iJpurbwaPQV7IpNaGAeaKKzek9ECfpENgx7wD+uo0pzCxv
         uNKasMQMwrlji1CG0gAZtwJm6NjBmK7KoHRecZbmypNLrSLsWImtaS1JAbh1o+OSjcK7
         0kI6MDdezIsNP41mMkKLxtE7xqzaernvfFb54X02pC7tQP7Z3uDyXFpNJkHhQHtfWPdR
         fhsalf1DUQLa5Y86PkL2zP2KbwpQOFw3WXzoJvtMraW5tBVvrfMKJFcxHd1Rr6yRscB2
         G5Xw==
X-Gm-Message-State: AO0yUKWFETdcVsEQEp0zZbPewt20yW183WmmL96n2c/444rgEFI9jEuq
        eu+0kBoW4PtXOs9pwqIF71viVw==
X-Google-Smtp-Source: AK7set9rVAiWhWsuT5gKj6VGWXOC1pbmjRIxn98S9isZGtuhj7j9KMQuPfPis1dh/e9gvtSrvJNi4w==
X-Received: by 2002:a17:902:b28b:b0:19e:639a:e72c with SMTP id u11-20020a170902b28b00b0019e639ae72cmr1754516plr.52.1677850619796;
        Fri, 03 Mar 2023 05:36:59 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:36:59 -0800 (PST)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Anup Patel <apatel@ventanamicro.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Atish Patra <atishp@rivosinc.com>,
        'Conor Dooley ' <conor.dooley@microchip.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        Anup Patel <anup@brainfault.org>
Subject: [PATCH V3 01/20] riscv: move sbi_init() earlier before jump_label_init()
Date:   Fri,  3 Mar 2023 19:06:28 +0530
Message-Id: <20230303133647.845095-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Jisheng Zhang <jszhang@kernel.org>

We call jump_label_init() in setup_arch() is to use static key
mechanism earlier, but riscv jump label relies on the sbi functions,
If we enable static key before sbi_init(), the code path looks like:
  static_branch_enable()
    ..
      arch_jump_label_transform()
        patch_text_nosync()
          flush_icache_range()
            flush_icache_all()
              sbi_remote_fence_i() for CONFIG_RISCV_SBI case
                __sbi_rfence()

Since sbi isn't initialized, so NULL deference! Here is a typical
panic log:

[    0.000000] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[    0.000000] Oops [#1]
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.18.0-rc7+ #79
[    0.000000] Hardware name: riscv-virtio,qemu (DT)
[    0.000000] epc : 0x0
[    0.000000]  ra : sbi_remote_fence_i+0x1e/0x26
[    0.000000] epc : 0000000000000000 ra : ffffffff80005826 sp : ffffffff80c03d50
[    0.000000]  gp : ffffffff80ca6178 tp : ffffffff80c0ad80 t0 : 6200000000000000
[    0.000000]  t1 : 0000000000000000 t2 : 62203a6b746e6972 s0 : ffffffff80c03d60
[    0.000000]  s1 : ffffffff80001af6 a0 : 0000000000000000 a1 : 0000000000000000
[    0.000000]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
[    0.000000]  a5 : 0000000000000000 a6 : 0000000000000000 a7 : 0000000000080200
[    0.000000]  s2 : ffffffff808b3e48 s3 : ffffffff808bf698 s4 : ffffffff80cb2818
[    0.000000]  s5 : 0000000000000001 s6 : ffffffff80c9c345 s7 : ffffffff80895aa0
[    0.000000]  s8 : 0000000000000001 s9 : 000000000000007f s10: 0000000000000000
[    0.000000]  s11: 0000000000000000 t3 : ffffffff80824d08 t4 : 0000000000000022
[    0.000000]  t5 : 000000000000003d t6 : 0000000000000000
[    0.000000] status: 0000000000000100 badaddr: 0000000000000000 cause: 000000000000000c
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---

Fix this issue by moving sbi_init() earlier before jump_label_init()

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 376d2827e736..2d45a416d283 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -270,6 +270,7 @@ void __init setup_arch(char **cmdline_p)
 	*cmdline_p = boot_command_line;
 
 	early_ioremap_setup();
+	sbi_init();
 	jump_label_init();
 	parse_early_param();
 
@@ -287,7 +288,6 @@ void __init setup_arch(char **cmdline_p)
 	misc_mem_init();
 
 	init_resources();
-	sbi_init();
 
 #ifdef CONFIG_KASAN
 	kasan_init();
-- 
2.34.1


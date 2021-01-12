Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6E92F349A
	for <lists+linux-doc@lfdr.de>; Tue, 12 Jan 2021 16:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404871AbhALPsL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 12 Jan 2021 10:48:11 -0500
Received: from smtprelay07.ispgateway.de ([134.119.228.100]:27817 "EHLO
        smtprelay07.ispgateway.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405747AbhALPsL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Jan 2021 10:48:11 -0500
X-Greylist: delayed 310 seconds by postgrey-1.27 at vger.kernel.org; Tue, 12 Jan 2021 10:48:10 EST
Received: from [79.249.9.239] (helo=pi.koderer.com)
        by smtprelay07.ispgateway.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92.3)
        (envelope-from <marc@koderer.com>)
        id 1kzLlF-0002We-N8; Tue, 12 Jan 2021 16:39:09 +0100
From:   Marc Koderer <marc@koderer.com>
To:     linux-doc@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Marc Koderer <marc@koderer.com>
Subject: [PATCH] samples/kprobes: Add ARM support
Date:   Tue, 12 Jan 2021 16:40:54 +0100
Message-Id: <20210112154054.17138-1-marc@koderer.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Df-Sender: bWFyY0Brb2RlcmVyLmNvbQ==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Plenty of architectures are already supported and this adds ARM
support.

Signed-off-by: Marc Koderer <marc@koderer.com>
---
 samples/kprobes/kprobe_example.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/samples/kprobes/kprobe_example.c b/samples/kprobes/kprobe_example.c
index 365905cb24b1..65a1188a8b3b 100644
--- a/samples/kprobes/kprobe_example.c
+++ b/samples/kprobes/kprobe_example.c
@@ -44,6 +44,10 @@ static int __kprobes handler_pre(struct kprobe *p, struct pt_regs *regs)
 			" pstate = 0x%lx\n",
 		p->symbol_name, p->addr, (long)regs->pc, (long)regs->pstate);
 #endif
+#ifdef CONFIG_ARM
+	pr_info("<%s> pre_handler: p->addr = 0x%p, pc = 0x%lx, cpsr = 0x%lx\n",
+		p->symbol_name, p->addr, (long)regs->ARM_pc, (long)regs->ARM_cpsr);
+#endif
 #ifdef CONFIG_S390
 	pr_info("<%s> pre_handler: p->addr, 0x%p, ip = 0x%lx, flags = 0x%lx\n",
 		p->symbol_name, p->addr, regs->psw.addr, regs->flags);
@@ -73,6 +77,10 @@ static void __kprobes handler_post(struct kprobe *p, struct pt_regs *regs,
 	pr_info("<%s> post_handler: p->addr = 0x%p, pstate = 0x%lx\n",
 		p->symbol_name, p->addr, (long)regs->pstate);
 #endif
+#ifdef CONFIG_ARM
+	pr_info("<%s> post_handler: p->addr = 0x%p, cpsr = 0x%lx\n",
+		p->symbol_name, p->addr, (long)regs->ARM_cpsr);
+#endif
 #ifdef CONFIG_S390
 	pr_info("<%s> pre_handler: p->addr, 0x%p, flags = 0x%lx\n",
 		p->symbol_name, p->addr, regs->flags);
-- 
2.20.1


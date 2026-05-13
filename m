Return-Path: <linux-doc+bounces-87265-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCIaBlDUA2ol/AEAu9opvQ
	(envelope-from <linux-doc+bounces-87265-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 03:30:56 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6940D52BE37
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 03:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2E0530E002A
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 01:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F5F372070;
	Wed, 13 May 2026 01:29:09 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C3BF368D76;
	Wed, 13 May 2026 01:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778635748; cv=none; b=ofxDJfzf1horVKWTwez0Yw6MZKkEpq0D6XrxwOv1pkjuwOa/ylKRNYeG00YC2TcM5KwobQFdM3cQ7qBChfvgqrv9DOwMRFV/TCOOG2V7Kah3TsXOHrzmau7HlMQDT9g1RTq0hAjfXBTtToHCPsTv6MoRzuUycCILbeyv6PsuY70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778635748; c=relaxed/simple;
	bh=fL0F+bjgSqP79DMSIZXVR4xEgoB6+maAaLLECLWNAKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HehNNucnN3ZmSQzkvJmYCz4sRdOOhnm/vvtSSrkNp1N+n2CF/OOT9C0Hy0x50fW/G4/GJ8iZnMyKrgnGaKHscloSwY7sWY4jeIgrFR9iGvBQ2DjqrRk+uthCd4EjU4Y3lcGGewkK5c/cCM/32LEQcvr4v6znVKDllX/Anljmess=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.57.136])
	by gateway (Coremail) with SMTP id _____8DxsOrc0wNqB1gJAA--.28698S3;
	Wed, 13 May 2026 09:29:00 +0800 (CST)
Received: from localhost.cn (unknown [10.40.57.136])
	by front1 (Coremail) with SMTP id qMiowJCxOMHJ0wNqr7eAAA--.34539S3;
	Wed, 13 May 2026 09:28:50 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	tglx@linutronix.de,
	jiaxun.yang@flygoat.com,
	maobibo@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH v12 1/4] Docs/LoongArch: Add advanced extended IRQ model (redirection) description
Date: Wed, 13 May 2026 09:28:32 +0800
Message-ID: <20260513012839.2856463-2-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260513012839.2856463-1-zhangtianyang@loongson.cn>
References: <20260513012839.2856463-1-zhangtianyang@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=yes
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxOMHJ0wNqr7eAAA--.34539S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUBmb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1q6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21le4C262xC7I0v67AEwI8IwI1l57
	IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE
	14v26r1q6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2
	IYc2Ij64vIr41lw4CEx2IqxVAFz4v204v26I0v724l42xK82IYc2Ij64vIr41l4I8I3I0E
	4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUJVWUGwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUoxR6UUUUU
X-Rspamd-Queue-Id: 6940D52BE37
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_RCPT(0.00)[linux-doc];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhangtianyang@loongson.cn,linux-doc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.960];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87265-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[loongson.cn];
	DBL_BLOCKED_OPENRESOLVER(0.00)[loongson.cn:email,loongson.cn:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Introduce a new advanced extended IRQ model with redirect interrupt
controllers. When the redirect interrupt controller is enabled, the
routing target of MSI interrupts is no longer a specific CPU and vector
number, but a specific redirect entry. The actual CPU and vector number
used are described by the redirect entry.

Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 .../arch/loongarch/irq-chip-model.rst         | 35 +++++++++++++++++++
 .../zh_CN/arch/loongarch/irq-chip-model.rst   | 34 ++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/Documentation/arch/loongarch/irq-chip-model.rst b/Documentation/arch/loongarch/irq-chip-model.rst
index 8f5c3345109e..774d40dc6a7e 100644
--- a/Documentation/arch/loongarch/irq-chip-model.rst
+++ b/Documentation/arch/loongarch/irq-chip-model.rst
@@ -181,6 +181,41 @@ go to PCH-PIC/PCH-LPC and gathered by EIOINTC, and then go to CPUINTC directly::
              | Devices |
              +---------+
 
+Advanced Extended IRQ model (with redirection)
+==============================================
+
+In this model, IPI (Inter-Processor Interrupt) and CPU Local Timer interrupt go
+to CPUINTC directly, CPU UARTS interrupts go to LIOINTC, PCH-MSI interrupts go
+to REDIRECT for remapping it to AVECINTC, and then go to CPUINTC directly, while
+all other devices interrupts go to PCH-PIC/PCH-LPC and gathered by EIOINTC, and
+then go to CPUINTC directly::
+
+ +-----+     +-----------------------+     +-------+
+ | IPI | --> |        CPUINTC        | <-- | Timer |
+ +-----+     +-----------------------+     +-------+
+              ^          ^          ^
+              |          |          |
+              |    +----------+     |
+       +---------+ | AVECINTC | +---------+     +-------+
+       | EIOINTC | +----------+ | LIOINTC | <-- | UARTs |
+       +---------+ | REDIRECT | +---------+     +-------+
+            ^      +----------+
+            |            ^
+            |            |
+       +---------+  +---------+
+       | PCH-PIC |  | PCH-MSI |
+       +---------+  +---------+
+         ^     ^           ^
+         |     |           |
+ +---------+ +---------+ +---------+
+ | Devices | | PCH-LPC | | Devices |
+ +---------+ +---------+ +---------+
+                  ^
+                  |
+             +---------+
+             | Devices |
+             +---------+
+
 ACPI-related definitions
 ========================
 
diff --git a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
index d4ff80de47b6..87b58aee92e1 100644
--- a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
+++ b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
@@ -174,6 +174,40 @@ CPU串口（UARTs）中断发送到LIOINTC，PCH-MSI中断发送到AVECINTC，
              | Devices |
              +---------+
 
+高级扩展IRQ模型 (带重定向)
+==========================
+
+在这种模型里面，IPI（Inter-Processor Interrupt）和CPU本地时钟中断直接发送到CPUINTC，
+CPU串口（UARTs）中断发送到LIOINTC，PCH-MSI中断首先发送到REDIRECT模块,完成重定向后发
+送到AVECINTC，而后通过AVECINTC直接送达CPUINTC，而其他所有设备的中断则分别发送到所连
+接的PCH-PIC/PCH-LPC，然后由EIOINTC统一收集，再直接到达CPUINTC::
+
+ +-----+     +-----------------------+     +-------+
+ | IPI | --> |        CPUINTC        | <-- | Timer |
+ +-----+     +-----------------------+     +-------+
+              ^          ^          ^
+              |          |          |
+              |    +----------+     |
+       +---------+ | AVECINTC | +---------+     +-------+
+       | EIOINTC | +----------+ | LIOINTC | <-- | UARTs |
+       +---------+ | REDIRECT | +---------+     +-------+
+            ^      +----------+
+            |            ^
+            |            |
+       +---------+  +---------+
+       | PCH-PIC |  | PCH-MSI |
+       +---------+  +---------+
+         ^     ^           ^
+         |     |           |
+ +---------+ +---------+ +---------+
+ | Devices | | PCH-LPC | | Devices |
+ +---------+ +---------+ +---------+
+                  ^
+                  |
+             +---------+
+             | Devices |
+             +---------+
+
 ACPI相关的定义
 ==============
 
-- 
2.20.1



Return-Path: <linux-doc+bounces-74631-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFHlNdUdfGmAKgIAu9opvQ
	(envelope-from <linux-doc+bounces-74631-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 30 Jan 2026 03:56:21 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1FBB6A18
	for <lists+linux-doc@lfdr.de>; Fri, 30 Jan 2026 03:56:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3B423015473
	for <lists+linux-doc@lfdr.de>; Fri, 30 Jan 2026 02:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63162334C11;
	Fri, 30 Jan 2026 02:56:04 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F22922FE060;
	Fri, 30 Jan 2026 02:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769741764; cv=none; b=LvSxuGXrLhJpDnNZo1btmYcVUnFlQ86fGyv4h8Bv77hoBBM3oCZ5uSCSF5MV/3Dp1MXW9NWKyZ8UH6vWY1kenXVeL2gpcUvkFH6QuDh+qFm3qRXK/IrIxe09uX7SWv2ezx1AqHBqqCR7juF+dVe4iEUDxYG3NRQK+y7bzYzIggU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769741764; c=relaxed/simple;
	bh=iHXr+8W41Xjj6s21oOqnU/6PlZeCg5CZvSmWzwgP91k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNikuav27RDPJjR32U4KbkRh5HWpZb+R4CdodrzqDhbHC7d2B4skRniaxPt9bZpHi6baGZBa+BKUp3eOrGCcIt1cs7W5uo3JgrMEpiNUqLx++DqJwXS652SsIG/zox1R8eF9xbZvDKdP4bGhCVNZfeXYQ5VYpqJHdTzD884Yiuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.40.57.136])
	by gateway (Coremail) with SMTP id _____8Axz8O8HXxpWyQOAA--.46808S3;
	Fri, 30 Jan 2026 10:55:56 +0800 (CST)
Received: from localhost.localdomain (unknown [10.40.57.136])
	by front1 (Coremail) with SMTP id qMiowJCxHOGzHXxpRvM5AA--.45456S4;
	Fri, 30 Jan 2026 10:55:55 +0800 (CST)
From: Tianyang Zhang <zhangtianyang@loongson.cn>
To: chenhuacai@kernel.org,
	kernel@xen0n.name,
	corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	tglx@linutronix.de,
	jiaxun.yang@flygoat.com,
	peterz@infradead.org,
	wangliupu@loongson.cn,
	lvjianmin@loongson.cn,
	maobibo@loongson.cn,
	siyanteng@cqsoftware.com.cn,
	gaosong@loongson.cn,
	yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: [PATCH v9 2/4] irqchip/irq-loongson.h:irq-loongson.h preparation for Redirect irqchip
Date: Fri, 30 Jan 2026 10:55:41 +0800
Message-ID: <20260130025545.2140543-3-zhangtianyang@loongson.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260130025545.2140543-1-zhangtianyang@loongson.cn>
References: <20260130025545.2140543-1-zhangtianyang@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxHOGzHXxpRvM5AA--.45456S4
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGFy8AF1rXrW5WrW3Zw4kKrX_yoW5Jw1rpF
	W5Aay29r48tF4xXry5Gw1kJFy3ZFyxKrZrtayfGayfXFZ8Gws7WFy7tas5ZFy8Gr48ua4I
	9r40qF1UuFs8A3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUmjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1q6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
	Ij64vIr41lF7xvrVCFI7AF6II2Y40_Zr0_Gr1UMxkF7I0En4kS14v26r1q6r43MxAIw28I
	cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8
	ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43
	ZEXa7IUnKFAPUUUUU==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[loongson.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TAGGED_FROM(0.00)[bounces-74631-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FROM_NEQ_ENVFROM(0.00)[zhangtianyang@loongson.cn,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[loongson.cn:mid,loongson.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C1FBB6A18
X-Rspamd-Action: no action

Adjusted definitions and macro from loongson-avec.c to irq-loongson.h,
including:
1 marco AVEC_MSG_OFFSET
2 struct avecintc_data
3 Make avecintc_sync public

Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
---
 drivers/irqchip/irq-loongarch-avec.c | 12 +-----------
 drivers/irqchip/irq-loongson.h       | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
index ba556c008cf3..70aa34439370 100644
--- a/drivers/irqchip/irq-loongarch-avec.c
+++ b/drivers/irqchip/irq-loongarch-avec.c
@@ -24,7 +24,6 @@
 #define VECTORS_PER_REG		64
 #define IRR_VECTOR_MASK		0xffUL
 #define IRR_INVALID_MASK	0x80000000UL
-#define AVEC_MSG_OFFSET		0x100000
 
 #ifdef CONFIG_SMP
 struct pending_list {
@@ -47,15 +46,6 @@ struct avecintc_chip {
 
 static struct avecintc_chip loongarch_avec;
 
-struct avecintc_data {
-	struct list_head	entry;
-	unsigned int		cpu;
-	unsigned int		vec;
-	unsigned int		prev_cpu;
-	unsigned int		prev_vec;
-	unsigned int		moving;
-};
-
 static inline void avecintc_enable(void)
 {
 	u64 value;
@@ -85,7 +75,7 @@ static inline void pending_list_init(int cpu)
 	INIT_LIST_HEAD(&plist->head);
 }
 
-static void avecintc_sync(struct avecintc_data *adata)
+void avecintc_sync(struct avecintc_data *adata)
 {
 	struct pending_list *plist;
 
diff --git a/drivers/irqchip/irq-loongson.h b/drivers/irqchip/irq-loongson.h
index 11fa138d1f44..1f11d799bf0a 100644
--- a/drivers/irqchip/irq-loongson.h
+++ b/drivers/irqchip/irq-loongson.h
@@ -6,6 +6,17 @@
 #ifndef _DRIVERS_IRQCHIP_IRQ_LOONGSON_H
 #define _DRIVERS_IRQCHIP_IRQ_LOONGSON_H
 
+#define AVEC_MSG_OFFSET		0x100000
+
+struct avecintc_data {
+	struct list_head        entry;
+	unsigned int            cpu;
+	unsigned int            vec;
+	unsigned int            prev_cpu;
+	unsigned int            prev_vec;
+	unsigned int            moving;
+};
+
 int find_pch_pic(u32 gsi);
 
 int liointc_acpi_init(struct irq_domain *parent,
@@ -24,4 +35,12 @@ int pch_msi_acpi_init(struct irq_domain *parent,
 					struct acpi_madt_msi_pic *acpi_pchmsi);
 int pch_msi_acpi_init_avec(struct irq_domain *parent);
 
+int redirect_acpi_init(struct irq_domain *parent);
+
+#ifdef CONFIG_SMP
+void avecintc_sync(struct avecintc_data *adata);
+#else
+static inline void avecintc_sync(struct avecintc_data *adata) {}
+#endif
+
 #endif /* _DRIVERS_IRQCHIP_IRQ_LOONGSON_H */
-- 
2.41.0



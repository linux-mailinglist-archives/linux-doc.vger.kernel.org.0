Return-Path: <linux-doc+bounces-95916-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M9MSCONsT2oRggIAu9opvQ
	(envelope-from <linux-doc+bounces-95916-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 11:41:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4865072F10A
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 11:41:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b="ZRx15tb/";
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95916-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-95916-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CE59A308FA5F
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 09:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0281E3EFFA7;
	Thu,  9 Jul 2026 09:31:27 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580A33F0A9C;
	Thu,  9 Jul 2026 09:31:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589486; cv=none; b=NSO1aHu8rvzC2qcWFVNYzy3yXNLI2C/X4BJnJ3ceH8hcyZpx6A5xN4FaNwGqgk/qRpswpQu1mWNp4YMPOjbKQ1MclpUCXL9jJzc+EJv34CYsD+bZ2wNxAhZvxTkj/aoV+hsjx0OVlU75Gn6F7NOhXafo2SjHAfuBq9/POnn5F1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589486; c=relaxed/simple;
	bh=vtzJ3Iarg9bUBEMQ+Xa9rBbeKTYfDQ940O0mEZg1XwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S5rdWL+OfW82jegA8A6hBns2UkFUfOe6LWm3GTxDR2VeNdeYa41mEyot0yzvoJg+PyiKK7nfOW/oLyFUJ2w8jDOaaDnrc0K87t8WfNiGqZaajRvpvKD9zEbdF0B0fsTJDGkk1Ndvsjm++AoVrCNXt+0xgqykDb9lRfvLJ4mEduU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZRx15tb/; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56AB8357E;
	Thu,  9 Jul 2026 02:31:20 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 820D63F66F;
	Thu,  9 Jul 2026 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783589484; bh=vtzJ3Iarg9bUBEMQ+Xa9rBbeKTYfDQ940O0mEZg1XwA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZRx15tb/SjAcXbKF3QFICaf48fdVOERLK7woP40/XZJ2G1RyaXzkPwK5ECl2EtXMT
	 aJqpe7CldXNbvGarufKIYgq4rfhYpRBqrkZlSrAfHjix18ApY6DVNLJbFCKVx7YOYX
	 cklarO737e+nZ6gEoYvF7ySHEnqI2VkMdvhU5P8U=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	corbet@lwn.net,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	dave.martin@arm.com
Subject: [PATCH v5 1/3] x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
Date: Thu,  9 Jul 2026 10:31:09 +0100
Message-ID: <20260709093111.367851-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709093111.367851-1-ben.horgan@arm.com>
References: <20260709093111.367851-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-95916-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ben.horgan@arm.com,m:james.morse@arm.com,m:reinette.chatre@intel.com,m:fenghuay@nvidia.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:corbet@lwn.net,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:dave.martin@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[ben.horgan@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:from_mime,arm.com:email,arm.com:mid,arm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4865072F10A

From: Dave Martin <dave.martin@arm.com>

On MPAM systems the rounding behaviour of the MBA control would be improved
if the rounding in the fs/resctrl code is removed but this is not the
case for x86. To allow any rounding or conversion of the bandwidth value
provided by the user to be specified by the arch code a new arch hook is
required.

Introduce resctrl_arch_preconvert_bw(), and add its x86 implementation.
This is currently unused in resctrl but when plumbed in it will replace the
call to roundup() in bw_validate().

Signed-off-by: Dave Martin <dave.martin@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
---
Changes since Dave's v2:
Split from larger patch and add commit message
Update kernel-doc (Reinette)

Changes since v3:
Swap parameter order (Reinette)
Change summary prefix include fs/resctrl (Reinette)
val -> @val
Add Reinette's R-b

Changes since v4:
Set author to Dave as he wrote the patch
---
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
 include/linux/resctrl.h                   | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
index b20e705606b8..81a08526d3d1 100644
--- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
+++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
@@ -16,9 +16,15 @@
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
 #include <linux/cpu.h>
+#include <linux/math.h>
 
 #include "internal.h"
 
+u32 resctrl_arch_preconvert_bw(const struct rdt_resource *r, u32 val)
+{
+	return roundup(val, (unsigned long)r->membw.bw_gran);
+}
+
 int resctrl_arch_update_one(struct rdt_resource *r, struct rdt_ctrl_domain *d,
 			    u32 closid, enum resctrl_conf_type t, u32 cfg_val)
 {
diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
index 73ff522448a0..1ebd4b90043a 100644
--- a/include/linux/resctrl.h
+++ b/include/linux/resctrl.h
@@ -504,6 +504,25 @@ bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
  */
 int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
 
+/**
+ * resctrl_arch_preconvert_bw() - Prepare bandwidth control value for arch use.
+ * @r:		Resource whose schema was written.
+ * @val:	Bandwidth control value written to the schemata file by userspace.
+ *
+ * Convert the user provided bandwidth control value to an appropriate form for
+ * consumption by the hardware driver for resource @r. Converted value is stored
+ * in rdt_ctrl_domain::staged_config[] for later consumption by
+ * resctrl_arch_update_domains(). Is not called when MBA software controller is
+ * enabled.
+ *
+ * Architectures for which this pre-conversion hook is not useful should supply
+ * an implementation of this function that just returns @val unmodified.
+ *
+ * Return:
+ * The converted value.
+ */
+u32 resctrl_arch_preconvert_bw(const struct rdt_resource *r, u32 val);
+
 /*
  * Update the ctrl_val and apply this config right now.
  * Must be called on one of the domain's CPUs.
-- 
2.43.0



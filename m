Return-Path: <linux-doc+bounces-95185-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LB45Bd3ZS2q0bQEAu9opvQ
	(envelope-from <linux-doc+bounces-95185-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 18:37:49 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A657135F6
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 18:37:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=DpV8Zz5y;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95185-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-95185-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9C71730EF9D9
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 16:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6960A39EF20;
	Mon,  6 Jul 2026 16:06:57 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B980242CAF2;
	Mon,  6 Jul 2026 16:06:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354017; cv=none; b=JT7PsdTe4u11Nj2ye+kD6p72dpjJO5b9pPa9CXAJp6LPJOtKPQtmApU2FKSqbajVgIW1Jcl/KUZupwbqjfTtpY9ur3Ndip9Je09Z6Aj0i4lCgre1/cTmGS4YsAvOF1VZnZB5/WjaU139p++SFbebVf6gTXsYPM4q4lPmq8DVYs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354017; c=relaxed/simple;
	bh=SgSLAmpEHjQVvI3w3XPeQkB8UDBA1FlyFSv8NkcsKME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KS68VYuO1Mo3Rr5IUn+XhS6WNwGRFndoLHqoyXZ0G04i2fAWMZMwEU61bF8Onuy/oc3pSJsNgrwZaqxSPuMb/PPbW7GQpl3/dZnkUxeJGbbdCFg1fHRXQh+kXTyDCkyV8c+6OPMSSc0EAAgvC5OOJtEbtWMh3TzhSN6lDNf+PPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DpV8Zz5y; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6F0D1BCA;
	Mon,  6 Jul 2026 09:06:50 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E0CF93F905;
	Mon,  6 Jul 2026 09:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783354015; bh=SgSLAmpEHjQVvI3w3XPeQkB8UDBA1FlyFSv8NkcsKME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DpV8Zz5yn6JaDRYQoZD9lVZFmu14vmLQbfXsXSfBSNGCFGS7luIjjP9Qqf8oqqyNB
	 +KZLdtwCHikV+GXqIEBRDichY0xdV144CV7u0Prsx9zaM4XVKHTPY3sOwhTXpFXir6
	 Opqb7CZaY6zyrQ7bYmPaZhMdV6olelyxV/ypDIrA=
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
Subject: [PATCH v4 1/3] x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
Date: Mon,  6 Jul 2026 17:06:37 +0100
Message-ID: <20260706160639.2136674-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706160639.2136674-1-ben.horgan@arm.com>
References: <20260706160639.2136674-1-ben.horgan@arm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[bounces-95185-lists,linux-doc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:from_mime,arm.com:email,arm.com:mid,arm.com:dkim,intel.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82A657135F6

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



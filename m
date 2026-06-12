Return-Path: <linux-doc+bounces-92239-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DlJgNhyMLGq0SQQAu9opvQ
	(envelope-from <linux-doc+bounces-92239-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 00:45:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5480967CDD0
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 00:45:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=gPZUchLa;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92239-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92239-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1E8BC3250498
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 22:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B013DB62B;
	Fri, 12 Jun 2026 22:40:31 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474364071DE;
	Fri, 12 Jun 2026 22:40:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781304031; cv=none; b=e51GYl3xcUn84HSwpgh4HsFD+vdWDBoPxAAc1YrU5nlSF8mvlfwABxBGYn32owqzXNqmMH36QtsMWSPNAt2lCr5/vNfXxECvhJXV0ai+MlewSMcFn+0JkDg2RLl3gBzH5bUUnuxGcxABf3b0q4PwPhOShmHUbQscGcs1pm/m/Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781304031; c=relaxed/simple;
	bh=GI0vwR1LEStmargetn1ql1v3LHVWj/3AFAUhwSQd72k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ickxUg3acZq/isI0lQX8ntUTmxskoj0MuOjge01ZLYZWt59WFCTdYu8Fk9WjcYto02D2j31PtGZen2p+w4Z+DFBu4uJf7NEDNV1NXmZyYWWTCfi1lOjOMY7cUFCWCIeuXWekaZE/7FxJsaY9IiguswebzCCNOLuOfdgG9aPrzh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gPZUchLa; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D71DF4A09;
	Fri, 12 Jun 2026 15:40:24 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0B103FB7F;
	Fri, 12 Jun 2026 15:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781304029; bh=GI0vwR1LEStmargetn1ql1v3LHVWj/3AFAUhwSQd72k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gPZUchLafmLmBTG6kU1XxPqRe5FZiTCIOutLUAYXpDRSVnwCv/siq+mk6Ghh0tIQq
	 xzSi4vWou+YoRuAEGKyrrBAZYIOXRXqQO+8GZVsqPNnLqn22bE58SsPjlDmUW+UXh8
	 M0U/7Qqc9TeITAG3++SznwWKjEA1q9pcngEehzZY=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v4 27/31] firmware: arm_scmi: stlmfs: Add generation file
Date: Fri, 12 Jun 2026 23:37:57 +0100
Message-ID: <20260612223802.1337232-28-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612223802.1337232-1-cristian.marussi@arm.com>
References: <20260612223802.1337232-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,gmail.com,linaro.org,st.com,oss.nxp.com,amd.com,ti.com,arm.com,linux.dev,meta.com];
	TAGGED_FROM(0.00)[bounces-92239-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:arm-scmi@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:sudeep.holla@kernel.org,m:james.quinlan@broadcom.com,m:f.fainelli@gmail.com,m:vincent.guittot@linaro.org,m:etienne.carriere@st.com,m:peng.fan@oss.nxp.com,m:michal.simek@amd.com,m:d-gole@ti.com,m:jic23@kernel.org,m:elif.topuz@arm.com,m:lukasz.luba@arm.com,m:philip.radford@arm.com,m:brauner@kernel.org,m:souvik.chakravarty@arm.com,m:leitao@kernel.org,m:kas@kernel.org,m:puranjay@kernel.org,m:usama.arif@linux.dev,m:kernel-team@meta.com,m:cristian.marussi@arm.com,m:ffainelli@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[cristian.marussi@arm.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,arm.com:dkim,arm.com:email,arm.com:mid,arm.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5480967CDD0

Add a read-only generation file to be used for monitoring configuration
changes across an instance: first read after the open returns the current
value, then it blocks till next confiuration change is detected.

Generation file supports also poll system call to monitor chamges.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v3 --> v4
 - added stlmfs tag in $SUBJECT
---
 .../firmware/arm_scmi/scmi_system_telemetry.c | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/firmware/arm_scmi/scmi_system_telemetry.c b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
index c83d9763d479..df45fc212e13 100644
--- a/drivers/firmware/arm_scmi/scmi_system_telemetry.c
+++ b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
@@ -19,12 +19,14 @@
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
+#include <linux/poll.h>
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/sprintf.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
+#include <linux/wait.h>
 
 #include <uapi/linux/scmi.h>
 
@@ -1368,6 +1370,91 @@ static const struct file_operations available_interv_fops = {
 	.release = scmi_tlm_priv_release,
 };
 
+struct scmi_tlm_gen_priv {
+	unsigned int last_seen;
+	struct wait_queue_head *wq;
+	struct scmi_tlm_buffer tb;
+};
+
+static int scmi_tlm_generation_open(struct inode *ino, struct file *filp)
+{
+	struct scmi_tlm_inode *tlmi = to_tlm_inode(ino);
+	struct scmi_tlm_setup *tsp = tlmi->tsp;
+	struct scmi_tlm_gen_priv *gen;
+
+	gen = kzalloc_obj(*gen);
+	if (!gen)
+		return -ENOMEM;
+
+	gen->wq = tsp->ops->event_wq_get(tsp->ph);
+	if (!gen->wq) {
+		kfree(gen);
+		return -ENOMEM;
+	}
+
+	gen->last_seen = SCMI_TLM_GENERATION_INVALID;
+	filp->private_data = gen;
+
+	return nonseekable_open(ino, filp);
+}
+
+static ssize_t
+scmi_tlm_generation_read(struct file *filp, char __user *buf,
+			 size_t count, loff_t *ppos)
+{
+	struct scmi_tlm_inode *tlmi = to_tlm_inode(file_inode(filp));
+	struct scmi_tlm_gen_priv *gen = filp->private_data;
+	struct scmi_telemetry_info *info = (struct scmi_telemetry_info *)tlmi->priv;
+	unsigned int c;
+
+	if (*ppos == gen->tb.used)
+		gen->tb.used = *ppos = 0;
+
+	if (!gen->tb.used) {
+		int ret;
+
+		ret = wait_event_interruptible(*gen->wq,
+					       (c = atomic_read(&info->generation)) !=
+					       gen->last_seen);
+		if (ret)
+			return -ERESTARTSYS;
+
+		gen->last_seen = c;
+		gen->tb.used = scnprintf(gen->tb.buf, SCMI_TLM_MAX_BUF_SZ, "%u\n", c);
+	}
+
+	return simple_read_from_buffer(buf, count, ppos, gen->tb.buf, gen->tb.used);
+}
+
+static __poll_t scmi_tlm_generation_poll(struct file *filp, poll_table *wait)
+{
+	struct scmi_tlm_inode *tlmi = to_tlm_inode(file_inode(filp));
+	struct scmi_telemetry_info *info = (struct scmi_telemetry_info *)tlmi->priv;
+	struct scmi_tlm_gen_priv *gen = filp->private_data;
+
+	poll_wait(filp, gen->wq, wait);
+	if (atomic_read(&info->generation) != gen->last_seen)
+		return EPOLLIN | EPOLLRDNORM;
+
+	return 0;
+}
+
+static int scmi_tlm_generation_release(struct inode *ino, struct file *filp)
+{
+	struct scmi_tlm_gen_priv *gen = filp->private_data;
+
+	kfree(gen);
+
+	return 0;
+}
+
+static const struct file_operations generation_fops = {
+	.open = scmi_tlm_generation_open,
+	.read = scmi_tlm_generation_read,
+	.poll = scmi_tlm_generation_poll,
+	.release = scmi_tlm_generation_release,
+};
+
 static const struct scmi_tlm_class tlm_tops[] = {
 	TLM_ANON_CLASS("all_des_enable", TLM_IS_STATE,
 		       S_IFREG | 0666, &all_des_fops, NULL),
@@ -1383,6 +1470,8 @@ static const struct scmi_tlm_class tlm_tops[] = {
 		       S_IFREG | 0444, &de_impl_vers_fops, NULL),
 	TLM_ANON_CLASS("tlm_enable", 0,
 		       S_IFREG | 0666, &tlm_enable_fops, NULL),
+	TLM_ANON_CLASS("generation", 0,
+		       S_IFREG | 0444, &generation_fops, NULL),
 	TLM_ANON_CLASS(NULL, 0, 0, NULL, NULL),
 };
 
-- 
2.54.0



Return-Path: <linux-doc+bounces-94819-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HI14LKCxR2qCdgAAu9opvQ
	(envelope-from <linux-doc+bounces-94819-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 14:57:04 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DC5702965
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 14:57:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=ZzJTiBBc;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94819-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94819-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DE0A3052E77
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 12:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBF03D5674;
	Fri,  3 Jul 2026 12:37:39 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70A213D566E;
	Fri,  3 Jul 2026 12:37:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082259; cv=none; b=hXUUN1g9qGgqg07RgXE0L204aTRvRrXjL6ABn/B8pzVHUowZe6yYpuLWgxAlNa4ub53lto0eyd49RTFmO4mDEmfYcN16fdmIl8CEMGehoko6J8leMzZtupbwQKqxyEQfborYLl08oZ9eO/6kRNSgzujRzpyAMyQ9rRVdprB6Gog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082259; c=relaxed/simple;
	bh=jvjodvs0U4OgJFMqI3b7Qcmm6ZP6cglCkfubUmLkqB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sqlpc9K+DBaxYdzB4FUWPWyXswBeHd+3nDUwgKzrP7M/kWCiuAPFn6YtZlbGVY6YxXhjY+ED9VKl83tNQFujNxelUpp2rZn55XSQmxsoodlIDsczjE2uRtDKSVWolH0qZ644uILXJkT/msbw98l4yOxOFheVsZKhUdWJVgSzbXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZzJTiBBc; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6A291F60;
	Fri,  3 Jul 2026 05:37:33 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7F7513F905;
	Fri,  3 Jul 2026 05:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783082258; bh=jvjodvs0U4OgJFMqI3b7Qcmm6ZP6cglCkfubUmLkqB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZzJTiBBcV6IOJsbqFRzVQAouJuw477U5sPXHXtMpd6qVs+nRq98ygipBWEl8csgkH
	 euzNZah3h5RkrS3NSMsqBNfnchWJn3GXRLIIgKIVTAVeKTxTarq0J8T1U//Q5OHKgv
	 6yBMzwQ+Ytqk4kqLuBYn6b3flS9Y7WoOFJhqHF/M=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
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
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v5 18/23] firmware: arm_scmi: Expose per-instance identifier
Date: Fri,  3 Jul 2026 13:35:56 +0100
Message-ID: <20260703123601.381275-19-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703123601.381275-1-cristian.marussi@arm.com>
References: <20260703123601.381275-1-cristian.marussi@arm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,gmail.com,linaro.org,st.com,oss.nxp.com,amd.com,ti.com,arm.com,linux.dev,meta.com];
	TAGGED_FROM(0.00)[bounces-94819-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:arm-scmi@vger.kernel.org,m:linux-doc@vger.kernel.org,m:sudeep.holla@kernel.org,m:james.quinlan@broadcom.com,m:f.fainelli@gmail.com,m:vincent.guittot@linaro.org,m:etienne.carriere@st.com,m:peng.fan@oss.nxp.com,m:michal.simek@amd.com,m:d-gole@ti.com,m:jic23@kernel.org,m:elif.topuz@arm.com,m:lukasz.luba@arm.com,m:philip.radford@arm.com,m:brauner@kernel.org,m:david@kernel.org,m:souvik.chakravarty@arm.com,m:leitao@kernel.org,m:kas@kernel.org,m:puranjay@kernel.org,m:usama.arif@linux.dev,m:kernel-team@meta.com,m:cristian.marussi@arm.com,m:ffainelli@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:from_mime,arm.com:email,arm.com:mid,arm.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 31DC5702965

When multiple SCMI instances are configured, the SCMI stack probes and
it is initialized multiple times: one core stack for each defined instance.

Each istance is simply identified internally with a number and such number
is already exposed to the user to name the root of the per-instance debugfs
subtree, if enabled.

Expose such unique identifier to the SCMI drivers so that they can use
that same identifier when in need to name their per-instance resources.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/driver.c | 1 +
 include/linux/scmi_protocol.h      | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index d54d155e69a8..619d01523729 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3297,6 +3297,7 @@ static int scmi_probe(struct platform_device *pdev)
 	idr_init(&info->rx_idr);
 
 	handle = &info->handle;
+	handle->id = info->id;
 	handle->dev = info->dev;
 	handle->version = &info->version;
 	handle->devm_protocol_acquire = scmi_devm_protocol_acquire;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index c932390b9a09..b90913235225 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -1109,6 +1109,10 @@ struct scmi_notify_ops {
 /**
  * struct scmi_handle - Handle returned to ARM SCMI clients for usage.
  *
+ * @id: A unique positive natural integer identifying the SCMI Instance
+ *	associated with this handle to be used across all drivers for
+ *	naming purposes: same identifier used internally as the root for
+ *	the debugfs per-instance tree.
  * @dev: pointer to the SCMI device
  * @version: pointer to the structure containing SCMI version information
  * @devm_protocol_acquire: devres managed method to get hold of a protocol,
@@ -1135,6 +1139,7 @@ struct scmi_notify_ops {
  * @notify_ops: pointer to set of notifications related operations
  */
 struct scmi_handle {
+	unsigned int id;
 	struct device *dev;
 	struct scmi_base_info *version;
 
-- 
2.54.0



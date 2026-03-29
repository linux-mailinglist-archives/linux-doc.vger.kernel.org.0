Return-Path: <linux-doc+bounces-81670-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOPKAoVVyWkuxgUAu9opvQ
	(envelope-from <linux-doc+bounces-81670-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 29 Mar 2026 18:38:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7210E35306A
	for <lists+linux-doc@lfdr.de>; Sun, 29 Mar 2026 18:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 333A0301105F
	for <lists+linux-doc@lfdr.de>; Sun, 29 Mar 2026 16:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2323815DC;
	Sun, 29 Mar 2026 16:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cpf0wzZf"
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD55381B04;
	Sun, 29 Mar 2026 16:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774802095; cv=none; b=FgPuTNnNNhB7dMbnU1IR+nEXrVkAw9O2wj5IlTiIZOrkKNGOWBDWGGEtZjFUxhoOlhhE3/eidD1621t1MyBgaZ+XxjrhPhTKaCXHTmTv3xZ7XsTWZ4P4jJ+eYn4SYzvgs5oHsiX6QBmpsBn4OdzczGf65QH/4FCtqGreApmepjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774802095; c=relaxed/simple;
	bh=2AXFZJAe7/vLYkhP+0K7ubk1Q8YcProSflrM6zXzIIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXnpO3mwv6nM4nwlKas0RbfWOSqzyZllQpcoWdIlOtPW0l2e0jFBX/m9tLu8vwar5kJU6zmeMKQ5Xa0vqeuZk2eZuURK7jgiSuc3BnltKurItgUDmkIXCylBXhXzEc70veJmemmUNXt/CmV9u1du8QXwQ6Li6PybOktVB/leTOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cpf0wzZf; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A31E3627;
	Sun, 29 Mar 2026 09:34:47 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EDA63F915;
	Sun, 29 Mar 2026 09:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774802093; bh=2AXFZJAe7/vLYkhP+0K7ubk1Q8YcProSflrM6zXzIIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cpf0wzZfNZb7qBly/L0YuUrrJgHLmP0cneROm9p/1oRbsI0us57t3pB6h8GKL7ZVi
	 6RIsoBviP6UfqKq0J1nxNiKgu9dPzxXAVjL8K9lnQaR+vGu/kA43mRYucly+csNrQ2
	 kPzqpmds9R3HRXcw9NB0INFMt8oQK6szZa+jHbFU=
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
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	jonathan.cameron@huawei.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	brauner@kernel.org,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v3 12/24] firmware: arm_scmi: Add support for Telemetry reset
Date: Sun, 29 Mar 2026 17:33:23 +0100
Message-ID: <20260329163337.637393-13-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329163337.637393-1-cristian.marussi@arm.com>
References: <20260329163337.637393-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,gmail.com,linaro.org,st.com,oss.nxp.com,amd.com,ti.com,huawei.com,arm.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-81670-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7210E35306A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for Telemetry operations needed to request platform to
reset telemetry current configuration and data events values.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v2 --> v3
 - split from monolithic Telemetry patch
 - use scmi_telemetry_de_unlink
---
 drivers/firmware/arm_scmi/telemetry.c | 44 +++++++++++++++++++++++++++
 include/linux/scmi_protocol.h         |  2 ++
 2 files changed, 46 insertions(+)

diff --git a/drivers/firmware/arm_scmi/telemetry.c b/drivers/firmware/arm_scmi/telemetry.c
index 61eaad817db4..ff0a5a8f6f57 100644
--- a/drivers/firmware/arm_scmi/telemetry.c
+++ b/drivers/firmware/arm_scmi/telemetry.c
@@ -2456,6 +2456,49 @@ static int scmi_telemetry_des_sample_get(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static void scmi_telemetry_local_resources_reset(struct telemetry_info *ti)
+{
+	struct scmi_telemetry_res_info *rinfo;
+
+	/* Get rinfo as it is...without triggering an enumeration */
+	rinfo = __scmi_telemetry_resources_get(ti);
+	/* Clear all local state...*/
+	for (int i = 0; i < rinfo->num_des; i++) {
+		rinfo->des[i]->enabled = false;
+		rinfo->des[i]->tstamp_enabled = false;
+
+		scmi_telemetry_de_unlink(rinfo->des[i]);
+	}
+	for (int i = 0; i < rinfo->num_groups; i++) {
+		rinfo->grps[i].enabled = false;
+		rinfo->grps[i].tstamp_enabled = false;
+		rinfo->grps[i].current_mode = SCMI_TLM_ONDEMAND;
+		rinfo->grps[i].active_update_interval = 0;
+	}
+}
+
+static int scmi_telemetry_reset(const struct scmi_protocol_handle *ph)
+{
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, TELEMETRY_RESET, sizeof(u32), 0, &t);
+	if (ret)
+		return ret;
+
+	put_unaligned_le32(0, t->tx.buf);
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		struct telemetry_info *ti = ph->get_priv(ph);
+
+		scmi_telemetry_local_resources_reset(ti);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
 static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.info_get = scmi_telemetry_info_get,
 	.de_lookup = scmi_telemetry_de_lookup,
@@ -2467,6 +2510,7 @@ static const struct scmi_telemetry_proto_ops tlm_proto_ops = {
 	.de_data_read = scmi_telemetry_de_data_read,
 	.des_bulk_read = scmi_telemetry_des_bulk_read,
 	.des_sample_get = scmi_telemetry_des_sample_get,
+	.reset = scmi_telemetry_reset,
 };
 
 /**
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5f05df297064..fc3b5493dc1a 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -963,6 +963,7 @@ struct scmi_telemetry_de_sample {
  *		    the ones belonging to a specific group when provided.
  *		    This causes an immediate update platform-side of all the
  *		    enabled DEs.
+ * @reset: reset configuration and telemetry data.
  */
 struct scmi_telemetry_proto_ops {
 	const struct scmi_telemetry_info __must_check *(*info_get)
@@ -989,6 +990,7 @@ struct scmi_telemetry_proto_ops {
 	int __must_check (*des_sample_get)(const struct scmi_protocol_handle *ph,
 					   int grp_id, int *num_samples,
 					   struct scmi_telemetry_de_sample *samples);
+	int (*reset)(const struct scmi_protocol_handle *ph);
 };
 
 /**
-- 
2.53.0



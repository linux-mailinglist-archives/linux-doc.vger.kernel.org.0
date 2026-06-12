Return-Path: <linux-doc+bounces-92238-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1cVNNwCMLGqpSQQAu9opvQ
	(envelope-from <linux-doc+bounces-92238-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 00:45:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DB067CDC1
	for <lists+linux-doc@lfdr.de>; Sat, 13 Jun 2026 00:45:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=fkDoszFJ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92238-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92238-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8371324BAF1
	for <lists+linux-doc@lfdr.de>; Fri, 12 Jun 2026 22:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961B8406285;
	Fri, 12 Jun 2026 22:40:27 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3DF63EFFC8;
	Fri, 12 Jun 2026 22:40:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781304027; cv=none; b=ShZQZlwPnzqwzcCbR0Pv0TqgpQWlilQdBGpFTqvOqVP/GyC4ORSDk1ARB+d+aep/pjdWqmunGN0q5v14hspKOc1jwysvzWKbl/q/nJ1g4cQymcGtPYqtg4Vg3vBUvAVsLxVEzFT8XjFhxq7UD7Gu5iHls5JjR/so69WJhy6XYyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781304027; c=relaxed/simple;
	bh=LqAFIQOzWsZZ1f4YVWDCPJKEayziLPMgzmXHTS+j+d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qJU0JmJdVMdhsNwQXcxMuAVbCsgNZMHiSwePUNjoYaFdzR+mD+7MKjXoZ1ICoGzwogREjH0ObI7PN1YKjbGE6QdPj0mmeV06pfyaIH/4ZKtl+T8syg0vIMKUmg38opFiX0BhT3RKWdu26gdIPnN5raZ55yCyrabP2U8Asae76qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fkDoszFJ; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97CF93543;
	Fri, 12 Jun 2026 15:40:20 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A4113FB7F;
	Fri, 12 Jun 2026 15:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781304025; bh=LqAFIQOzWsZZ1f4YVWDCPJKEayziLPMgzmXHTS+j+d8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fkDoszFJVKpPXpqXNuYv5hHk5klDSDyF56xK0IYU8HwlApf3usktjn7YO46T6RwRl
	 uVE8wC8Z5HxlDSmUX+BFsHY+DjAJcCrFTnBPOKOS7p2Mv7HRiroSEPe0JMnxMGScx1
	 9iDTvps/llxzysFrrMJEzC07b/5noKIurxvSaLxs=
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
Subject: [PATCH v4 26/31] fs/stlmfs: Document alternative topological view
Date: Fri, 12 Jun 2026 23:37:56 +0100
Message-ID: <20260612223802.1337232-27-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612223802.1337232-1-cristian.marussi@arm.com>
References: <20260612223802.1337232-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,broadcom.com,gmail.com,linaro.org,st.com,oss.nxp.com,amd.com,ti.com,arm.com,linux.dev,meta.com];
	TAGGED_FROM(0.00)[bounces-92238-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:arm-scmi@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:sudeep.holla@kernel.org,m:james.quinlan@broadcom.com,m:f.fainelli@gmail.com,m:vincent.guittot@linaro.org,m:etienne.carriere@st.com,m:peng.fan@oss.nxp.com,m:michal.simek@amd.com,m:d-gole@ti.com,m:jic23@kernel.org,m:elif.topuz@arm.com,m:lukasz.luba@arm.com,m:philip.radford@arm.com,m:brauner@kernel.org,m:souvik.chakravarty@arm.com,m:leitao@kernel.org,m:kas@kernel.org,m:puranjay@kernel.org,m:usama.arif@linux.dev,m:kernel-team@meta.com,m:cristian.marussi@arm.com,m:ffainelli@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER(0.00)[cristian.marussi@arm.com,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,arm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36DB067CDC1

The human readable interface presents an alternative view based on the
discovered topological relations between the DEs.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v3 --> v4
 - renamed to by-components
v2 --> v3
 - completed FS tree description
 - renamed components to by_components
---
 Documentation/filesystems/stlmfs.rst | 72 ++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/filesystems/stlmfs.rst b/Documentation/filesystems/stlmfs.rst
index 0c7b7c006709..b5b3cd649775 100644
--- a/Documentation/filesystems/stlmfs.rst
+++ b/Documentation/filesystems/stlmfs.rst
@@ -143,6 +143,7 @@ create the following directory structure::
 	|-- all_des_enable
 	|-- all_des_tstamp_enable
 	|-- available_update_intervals_ms
+	|-- by-components/
 	|-- control
 	|-- current_update_interval_ms
 	|-- de_implementation_version
@@ -233,6 +234,77 @@ values, as in::
 	|-- intervals_discrete
 	`-- tstamp_enable
 
+by-components/
+-----------
+
+An alternative topological view of the des/ directory based on the topology
+relationship information described in des/ ::
+
+	by-components/
+	├── cpu
+	│   ├── 0
+	│   │   ├── celsius
+	│   │   │   └── 0
+	│   │   │       └── 0x00000001[pe_0] -> ../../../../../des/0x00000001
+	│   │   └── cycles
+	│   │       ├── 0
+	│   │       │   └── 0x00001010[] -> ../../../../../des/0x00001010
+	│   │       └── 1
+	│   │           └── 0x00002020[] -> ../../../../../des/0x00002020
+	│   ├── 1
+	│   │   └── celsius
+	│   │       └── 0
+	│   │           └── 0x00000002[pe_1] -> ../../../../../des/0x00000002
+	│   └── 2
+	│       └── celsius
+	│           └── 0
+	│               └── 0x00000003[pe_2] -> ../../../../../des/0x00000003
+	├── interconnnect
+	│   └── 0
+	│       └── hertz
+	│           └── 0
+	│               ├── 0x0000A008[A008_de] -> ../../../../../des/0x0000A008
+	│               └── 0x0000A00B[] -> ../../../../../des/0x0000A00B
+	├── mem_cntrl
+	│   └── 0
+	│      	├── bps
+	│       │   └── 0
+	│       │       └── 0x0000A00A[] -> ../../../../../des/0x0000A00A
+	│       ├── celsius
+	│      	│   └── 0
+	│       │       └── 0x0000A007[DRAM_temp] -> ../../../../../des/0x0000A007
+	│       └── joules
+	│           └── 0
+	│               └── 0x0000A002[DRAM_energy] -> ../../../../../des/0x0000A002
+	├── periph
+	│   ├── 0
+	│   │  	└── messages
+	│   │       └── 0
+	│   │           └── 0x00000016[device_16] -> ../../../../../des/0x00000016
+	│   ├── 1
+	│   │   └── messages
+	│   │       └── 0
+	│   │           └── 0x00000017[device_17] -> ../../../../../des/0x00000017
+	│   └── 2
+	│       └── messages
+	│           └── 0
+	│               └── 0x00000018[device_18] -> ../../../../../des/0x00000018
+	└── unspec
+		└── 0
+		    ├── celsius
+		    │	└── 0
+		    │       └── 0x0000A005[] -> ../../../../../des/0x0000A005
+		    ├── counts
+		    │   └── 0
+		    │       └── 0x0000A00C[] -> ../../../../../des/0x0000A00C
+		    ├── joules
+		    │   └── 0
+		    │       ├── 0x0000A000[SOC_Energy] -> ../../../../../des/0x0000A000
+		    │       └── 0x0000A001[] -> ../../../../../des/0x0000A001
+		    └── state
+			└── 0
+			    └── 0x0000A010[] -> ../../../../../des/0x0000A010
+
 Alternative Binary Interfaces - Special files
 =============================================
 
-- 
2.54.0



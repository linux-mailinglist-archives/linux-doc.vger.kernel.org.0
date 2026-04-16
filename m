Return-Path: <linux-doc+bounces-83616-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KG3lOfgg4WnMpQAAu9opvQ
	(envelope-from <linux-doc+bounces-83616-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 16 Apr 2026 19:48:40 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 895AB41345A
	for <lists+linux-doc@lfdr.de>; Thu, 16 Apr 2026 19:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A28093222744
	for <lists+linux-doc@lfdr.de>; Thu, 16 Apr 2026 17:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3873E51C3;
	Thu, 16 Apr 2026 17:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="FvNmD4ZN"
X-Original-To: linux-doc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8973B34E761;
	Thu, 16 Apr 2026 17:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776360951; cv=none; b=rucJD+KqF8s4N43L8DtfOJJheUnEERRXjcdOvq2Sacyh3NvNx6tQtPCUIskh0yPTLYaEL0wXZ0DXvQthlc6N8QcgJnKbtVmlM9NhUMzV/NzDl/owcZbP+f9lpJawM8NEGgHY0BYglTWrKoVipBjrZVYCiM5L9/uVyjd/haJMPB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776360951; c=relaxed/simple;
	bh=qlnOmayLZWq5+rChCXv5r4L985/F8fnSk8pZa60Husk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uvrRv2xYIyNAbC79DOchIM7QFM9wa0bw8LKVlcDTs9gljJtDTFdW1JO+60JgRoqDsa7JLx/CFvLX10Crj9eNR6gueL5JwtRl9PhdtxQSmp3C2488Bc9F/pASVNZjUZamErk25xo5Xre99jY43YaJobJbdwRDO5R67RMBgPd33Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=FvNmD4ZN; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from narnia.corp.microsoft.com (unknown [40.78.12.246])
	by linux.microsoft.com (Postfix) with ESMTPSA id 1FB7520B7001;
	Thu, 16 Apr 2026 10:35:45 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1FB7520B7001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776360946;
	bh=cYnQboYCTOnpw9a+m4bi+A/DVRLWzC/s3FksZgUhAyQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FvNmD4ZNoZWB+eYu8P7p9wnl5R2/PbVBr7X53PL7+4HVc0LuxsUk1fSIe20bOIaOY
	 SVfTGRPocwa406oF3QiFTvCa1BLCM6G9wpIuNSYoCEkxs0hC4dcJpDOdKhFaPLqR+j
	 yiCJMk0bmL4f3I3MvU9kunmxfN6nsDi6CAPsNkxs=
From: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James.Bottomley@HansenPartnership.com,
	dhowells@redhat.com,
	Fan Wu <wufan@kernel.org>,
	Ryan Foster <foster.ryan.r@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Song Liu <song@kernel.org>
Subject: [PATCH v4 08/10] hornet: Add a light skeleton data extractor scripts
Date: Thu, 16 Apr 2026 10:33:29 -0700
Message-ID: <20260416173500.176716-9-bboscaccy@linux.microsoft.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260416173500.176716-1-bboscaccy@linux.microsoft.com>
References: <20260416173500.176716-1-bboscaccy@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.microsoft.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.microsoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[linux.microsoft.com,lwn.net,paul-moore.com,namei.org,hallyn.com,digikod.net,google.com,treblig.org,linux-foundation.org,HansenPartnership.com,redhat.com,kernel.org,gmail.com,infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-83616-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bboscaccy@linux.microsoft.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.microsoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.microsoft.com:dkim,linux.microsoft.com:mid]
X-Rspamd-Queue-Id: 895AB41345A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These script eases light skeleton development against Hornet by
generating a data payloads which can be used for signing a light
skeleton binary using gen_sig.

Signed-off-by: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
---
 scripts/hornet/extract-insn.sh | 27 +++++++++++++++++++++++++++
 scripts/hornet/extract-map.sh  | 27 +++++++++++++++++++++++++++
 scripts/hornet/extract-skel.sh | 27 +++++++++++++++++++++++++++
 3 files changed, 81 insertions(+)
 create mode 100755 scripts/hornet/extract-insn.sh
 create mode 100755 scripts/hornet/extract-map.sh
 create mode 100755 scripts/hornet/extract-skel.sh

diff --git a/scripts/hornet/extract-insn.sh b/scripts/hornet/extract-insn.sh
new file mode 100755
index 0000000000000..52338f057ff6b
--- /dev/null
+++ b/scripts/hornet/extract-insn.sh
@@ -0,0 +1,27 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2025 Microsoft Corporation
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of version 2 of the GNU General Public
+# License as published by the Free Software Foundation.
+
+function usage() {
+    echo "Sample script for extracting instructions"
+    echo "autogenerated eBPF lskel headers"
+    echo ""
+    echo "USAGE: header_file"
+    exit
+}
+
+ARGC=$#
+
+EXPECTED_ARGS=1
+
+if [ $ARGC -ne $EXPECTED_ARGS ] ; then
+    usage
+else
+    printf $(gcc -E $1 | grep "opts_insn" | \
+		 awk -F"=" '{print $2}' | sed 's/;\+$//' | sed 's/\"//g')
+fi
diff --git a/scripts/hornet/extract-map.sh b/scripts/hornet/extract-map.sh
new file mode 100755
index 0000000000000..c309f505c6238
--- /dev/null
+++ b/scripts/hornet/extract-map.sh
@@ -0,0 +1,27 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2025 Microsoft Corporation
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of version 2 of the GNU General Public
+# License as published by the Free Software Foundation.
+
+function usage() {
+    echo "Sample script for extracting instructions"
+    echo "autogenerated eBPF lskel headers"
+    echo ""
+    echo "USAGE: header_file"
+    exit
+}
+
+ARGC=$#
+
+EXPECTED_ARGS=1
+
+if [ $ARGC -ne $EXPECTED_ARGS ] ; then
+    usage
+else
+    printf $(gcc -E $1 | grep "opts_data" | \
+		 awk -F"=" '{print $2}' | sed 's/;\+$//' | sed 's/\"//g')
+fi
diff --git a/scripts/hornet/extract-skel.sh b/scripts/hornet/extract-skel.sh
new file mode 100755
index 0000000000000..6550a86b89917
--- /dev/null
+++ b/scripts/hornet/extract-skel.sh
@@ -0,0 +1,27 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Copyright (c) 2025 Microsoft Corporation
+#
+# This program is free software; you can redistribute it and/or
+# modify it under the terms of version 2 of the GNU General Public
+# License as published by the Free Software Foundation.
+
+function usage() {
+    echo "Sample script for extracting instructions and map data out of"
+    echo "autogenerated eBPF lskel headers"
+    echo ""
+    echo "USAGE: header_file field"
+    exit
+}
+
+ARGC=$#
+
+EXPECTED_ARGS=2
+
+if [ $ARGC -ne $EXPECTED_ARGS ] ; then
+    usage
+else
+    printf $(gcc -E $1 | grep "static const char opts_$2" | \
+		 awk -F"=" '{print $2}' | sed 's/;\+$//' | sed 's/\"//g')
+fi
-- 
2.53.0



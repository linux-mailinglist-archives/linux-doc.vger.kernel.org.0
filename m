Return-Path: <linux-doc+bounces-85787-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FX1EYRO+WkV7wIAu9opvQ
	(envelope-from <linux-doc+bounces-85787-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 03:57:24 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D814C5DA8
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 03:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEF5B301DE00
	for <lists+linux-doc@lfdr.de>; Tue,  5 May 2026 01:57:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359E635F8A8;
	Tue,  5 May 2026 01:57:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from 45.77.215.144.jer.cx (45.77.215.144.jer.cx [45.77.215.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B384826E6F2
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 01:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.77.215.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777946241; cv=none; b=dIXRq+jslpB59HM6Hdy0D12e8BCcQUIjZ2tdhsMI34WPjwcqb/LBt8MrZJ9V5E0qdDn2umxdotrfA6vONf8CiFW0gym74qzQzwrhcSwhVIIEqACFiTuDXUuhzh4IYFbEHBZNExchsY4nw/USg3mXVYun8wu3FJ/Kz7xH1tbsn8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777946241; c=relaxed/simple;
	bh=n6X3nGxgF9Vxwz4ItB3eu5McBQ0NKf3Id6XEsLVpvRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UaDih1CC54TTWq9W53l9VClrKSA0/bENFN/TyfoLk4CDMfZ6flTTOIshbIDhA+Ez1WOhMVTHOdCzHCmXaigz2VzFPojX1j0V+Z8XJlw7LzXgeFAx2w9Z4oul+fF4oK+glavI1QXlM5GhDQbzIK122qb4CWcjMasEDrYSqBK4zPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jer.cx; spf=pass smtp.mailfrom=jer.cx; arc=none smtp.client-ip=45.77.215.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jer.cx
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jer.cx
Received: from Amphibian (unknown [10.0.0.3])
	by 45.77.215.144.jer.cx (Postfix) with ESMTPSA id CF3F22001AE;
	Mon,  4 May 2026 18:48:44 -0700 (PDT)
From: Jeremy Bobbin <jer@jer.cx>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Jeremy Bobbin <jer@jer.cx>
Subject: [PATCH] fix broken links in bpf, driver_api & filesystem documentation
Date: Mon,  4 May 2026 18:48:38 -0700
Message-ID: <20260505014839.2670290-1-jer@jer.cx>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 91D814C5DA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[jer@jer.cx,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85787-lists,linux-doc=lfdr.de];
	DMARC_NA(0.00)[jer.cx: no valid DMARC record];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]

bpf/linux-notes.rst: broken link to ISA standard documentation
driver-api/thermal/intel_dptf.rst: two broken links to filesystem quota

Signed-off-by: Jeremy Bobbin <jer@jer.cx>
---
 Documentation/bpf/linux-notes.rst               | 2 +-
 Documentation/driver-api/thermal/intel_dptf.rst | 2 +-
 Documentation/filesystems/ext4/super.rst        | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/bpf/linux-notes.rst b/Documentation/bpf/linux-notes.rst
index 00d2693de025..9c7b703ae4e5 100644
--- a/Documentation/bpf/linux-notes.rst
+++ b/Documentation/bpf/linux-notes.rst
@@ -46,7 +46,7 @@ Legacy BPF Packet access instructions
 =====================================
 
 As mentioned in the `ISA standard documentation
-<instruction-set.html#legacy-bpf-packet-access-instructions>`_,
+<standardization/instruction-set.html#legacy-bpf-packet-access-instructions>`_,
 Linux has special eBPF instructions for access to packet data that have been
 carried over from classic BPF to retain the performance of legacy socket
 filters running in the eBPF interpreter.
diff --git a/Documentation/driver-api/thermal/intel_dptf.rst b/Documentation/driver-api/thermal/intel_dptf.rst
index 4adfa1eb74db..1a4d7eedbb68 100644
--- a/Documentation/driver-api/thermal/intel_dptf.rst
+++ b/Documentation/driver-api/thermal/intel_dptf.rst
@@ -81,7 +81,7 @@ DPTF ACPI Drivers interface
 
 ``data_vault`` (RO)
 	Binary thermal table. Refer to
-	https:/github.com/intel/thermal_daemon for decoding
+	https://github.com/intel/thermal_daemon for decoding
 	thermal table.
 
 ``production_mode`` (RO)
diff --git a/Documentation/filesystems/ext4/super.rst b/Documentation/filesystems/ext4/super.rst
index 9a59cded9bd7..d06e4ae96d16 100644
--- a/Documentation/filesystems/ext4/super.rst
+++ b/Documentation/filesystems/ext4/super.rst
@@ -408,11 +408,11 @@ The ext4 superblock is laid out as follows in
    * - 0x240
      - __le32
      - s_usr_quota_inum
-     - Inode number of user `quota <quota>`__ file.
+     - Inode number of user `quota </filesystems/quota.html>`__ file.
    * - 0x244
      - __le32
      - s_grp_quota_inum
-     - Inode number of group `quota <quota>`__ file.
+     - Inode number of group `quota </filesystems/quota.html>`__ file.
    * - 0x248
      - __le32
      - s_overhead_blocks
@@ -712,7 +712,7 @@ the following:
    * - 0x80
      - This filesystem has a snapshot (RO_COMPAT_HAS_SNAPSHOT).
    * - 0x100
-     - `Quota <Quota>`__ (RO_COMPAT_QUOTA).
+     - `Quota </filesystems/quota.html>`__ (RO_COMPAT_QUOTA).
    * - 0x200
      - This filesystem supports “bigalloc”, which means that file extents are
        tracked in units of clusters (of blocks) instead of blocks
-- 
2.53.0



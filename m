Return-Path: <linux-doc+bounces-85400-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKFPOcJA9GnJ/wEAu9opvQ
	(envelope-from <linux-doc+bounces-85400-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 01 May 2026 07:57:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0E74AA893
	for <lists+linux-doc@lfdr.de>; Fri, 01 May 2026 07:57:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DCB3301D07E
	for <lists+linux-doc@lfdr.de>; Fri,  1 May 2026 05:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A7C34A3A5;
	Fri,  1 May 2026 05:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="EwI+l9V3"
X-Original-To: linux-doc@vger.kernel.org
Received: from outbound.ms.icloud.com (p-west3-cluster6-host7-snip4-6.eps.apple.com [57.103.75.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73B6346ADA
	for <linux-doc@vger.kernel.org>; Fri,  1 May 2026 05:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.75.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777614978; cv=none; b=Nm1I+ax+PEklPBhZqu5KI95uoNKu1NlcmkDf3uCtgom6rbRyQBiedZPN9/nodubpYHcFysXeivOVYrn5GVhUUqoyrah6+OXQ98/he61NcO36J2bA7U83Hzb3bT+pt5jBmPcFmU1UCb2zEWUcQ6hmvLpLYyv7mosN/HcqC98SYog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777614978; c=relaxed/simple;
	bh=fe5qUdEup0HLb2HrLDxT1324Rwy5SIK9P92A+sggjFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ClEzlnOiXdRCdTqFBH4DhuCswntKbqAYGvPWG8tUBCLZL3NrVKvGepOkoBNqEOmoYcU5j28uLXmDRbblKs8OB4+YHuwYPZr3GuEcl9Ui7mOxvkQT5AgSSrsDvCR6QMgCwDI0X8kDYzM8Jd/cgYSqghQoqmolAdvib+h5+geNBd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=EwI+l9V3; arc=none smtp.client-ip=57.103.75.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-8 (Postfix) with ESMTPS id B115A180013D;
	Fri, 01 May 2026 05:56:13 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhAA0MFWgFeAUEdXwFLVxQEFEYGVg1dE0wLcwRUB10FXVZQAlpLVBQEFEYGVg1dE0wLcwRUB10FXVZQAlpLQBMESgZNXw5eHwQXRhlVBEceXVZeHhkCURxWDVdDVARfUEkMQVBsWgBHF0gdXRlZb1BdHA4EVAddBV1WUAJaS18ZXUUPXwdZBEAMSAJAQwNCL1oXREBBWh9DFEgDWARcBUQBSwReDytGFVcbVgNDRVEfVEYTGU4bV01QG18CQg8=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1777614977; x=1780206977; bh=i/MDV/SdEyba8CAl8JXsfJJlaWhqdQgOiCYK9KUK3R4=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=EwI+l9V3Eq8DZJruLYfJo2dpxYir0zhLiB6TNlieOp7ifXH23lRVEDJC2EU/hq2wz3FO6ybNlfeB5udpXES9bVb4DDPjRx5qGhQeG0RGpS4aeYJlQVqt9gMmBBN+OMqNrOjOHmlA5zrDnza9xoLCQ3Zt37WtiivxOz+wlzcSE/lQsBRuRKtpOJa8Xve9bT7AyzxRExricclw1cf7QwdUFqYSbxqL27mRqA+uuLwh4JFiZvxAMyxdRzSXF29n50bgq85Gcp07zwj4wGta2LzNMkxiF8wkih1e//DMnTvkPyfovmUaHWPCPe6x3NrUb6QI6aD2R4Dxb0NFmsnDNoTkXQ==
Received: from [127.0.0.1] (unknown [17.57.154.37])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-8 (Postfix) with ESMTPSA id DB5BF1800108;
	Fri, 01 May 2026 05:56:07 +0000 (UTC)
From: Luka Bai <lukafocus@icloud.com>
Date: Fri, 01 May 2026 13:55:44 +0800
Subject: [PATCH 3/5] mm: add pmd level THP COW judgement helpers
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-thp_cow-v1-3-005377483738@tencent.com>
References: <20260501-thp_cow-v1-0-005377483738@tencent.com>
In-Reply-To: <20260501-thp_cow-v1-0-005377483738@tencent.com>
To: linux-mm@kvack.org
Cc: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <npache@redhat.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Jann Horn <jannh@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Kairui Song <kasong@tencent.com>, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
 Luka Bai <lukabai@tencent.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777614950; l=1685;
 i=lukabai@tencent.com; s=20260501; h=from:subject:message-id;
 bh=l3c8ZOwbATo+2PT4NYOAUghe4sk42dQjWN37S7JdcBg=;
 b=TSo2qM8r3KPPphClijLCEpGTnjI/pFC9+a8AQTQmdnuguNqhfa6BphAbJgkEVtcBJUMnH5Yi1
 ukFPpvM8SE3DKy0cbu0hqLnkQgMtbzyqiZoO3sLbQG5tG9zz+vGRHPR
X-Developer-Key: i=lukabai@tencent.com; a=ed25519;
 pk=KeaVteSWd00GIAjFyWZnuFsKAKixjga1ZkLMcI66nPM=
X-Authority-Info-Out: v=2.4 cv=No3cssdJ c=1 sm=1 tr=0 ts=69f4407f
 cx=c_apl:c_pps:t_out a=qkKslKyYc0ctBTeLUVfTFg==:117 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=x7bEGLp0ZPQA:10 a=UaoJkeuwEpQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=GvQkQWPkAAAA:8 a=JogxrxylMUJFqwMgd1oA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: hB3IhlfY35IDEelkOKd30xeVKZ4dDTn9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDA1MyBTYWx0ZWRfX//GBnMBXJ+C+
 gHIiUEpz5ykqv7rnL7hYpfRWgqfJ+r3gKMPEjydZWch8zDPRgnyic8lbsqmz7W3j9NORpehDbpm
 HKuQctCjN/YpeWJWQpUmbYiEkaC5JrIxyy1VYLmK2OeCTZUFp/ZJTLlnSzwEPF9GWO0BvAqBwZH
 92Ej9piDwed/XU5gqf3lLyK9lyoPcVTUFAwXQRhq6IyviOvKDCRzX5nIdOLVel7x3tE0paAqprv
 knKjDu7zC5UVTLsD/eKxfTzl6wKAa+LQOLDzaRlo39GVGxC/5cSWeEIKnzNoLLM02pYqJyPLP3f
 NLHOvfOkNVMRy2QeQMYWg8GVvr1m0kohvEJxV0b1t4BN80PB9t1gM0vd7O3QsI=
X-Proofpoint-GUID: hB3IhlfY35IDEelkOKd30xeVKZ4dDTn9
X-Rspamd-Queue-Id: 4E0E74AA893
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[icloud.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[icloud.com:s=1a1hai];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-85400-lists,linux-doc=lfdr.de];
	FREEMAIL_FROM(0.00)[icloud.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukafocus@icloud.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[icloud.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,icloud.com:dkim,tencent.com:mid,tencent.com:email]

From: Luka Bai <lukabai@tencent.com>

We add hugepage_cow_always and hugepage_cow_madvise as two convenient
helpers to decide whether we want to do THP COW under each specific
circumstance.

Also, we add a helper hugepage_cow_enabled to help us know the setup
more easily. THP COW is only opened when hugepage is globally enabled
or madvise enabled.

Signed-off-by: Luka Bai <lukabai@tencent.com>
---
 include/linux/huge_mm.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 2a62f0f92f68..3e5c6da3905b 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -203,6 +203,38 @@ static inline bool hugepage_global_always(void)
 			(1<<TRANSPARENT_HUGEPAGE_FLAG);
 }
 
+static inline bool hugepage_cow_always(void)
+{
+	return transparent_hugepage_flags &
+			(1<<TRANSPARENT_HUGEPAGE_COW_FLAG);
+}
+
+static inline bool hugepage_cow_madvise(void)
+{
+	return transparent_hugepage_flags &
+			(1<<TRANSPARENT_HUGEPAGE_REQ_MADV_COW_FLAG);
+}
+
+static inline bool hugepage_cow_enabled(struct vm_area_struct *vma)
+{
+	vm_flags_t vm_flags = vma->vm_flags;
+
+	/* anonymous THP need to be enabled first */
+	if (!hugepage_global_always() &&
+		(!hugepage_global_enabled() || !(vm_flags & VM_HUGEPAGE)))
+		return false;
+
+	/* always enables all the THP COW */
+	if (hugepage_cow_always())
+		return true;
+
+	/* madvise enables THP cow only when vm_flags says so */
+	if (hugepage_cow_madvise() && (vm_flags & VM_THP_COW))
+		return true;
+
+	return false;
+}
+
 static inline int highest_order(unsigned long orders)
 {
 	return fls_long(orders) - 1;

-- 
2.52.0



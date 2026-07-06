Return-Path: <linux-doc+bounces-95211-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nixHKEvtS2pPdAEAu9opvQ
	(envelope-from <linux-doc+bounces-95211-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 20:00:43 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F8271435B
	for <lists+linux-doc@lfdr.de>; Mon, 06 Jul 2026 20:00:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fP5YRTWc;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95211-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-95211-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E7A433036124
	for <lists+linux-doc@lfdr.de>; Mon,  6 Jul 2026 17:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967D2422553;
	Mon,  6 Jul 2026 17:55:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7E442CB0F
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 17:55:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783360526; cv=none; b=IrAWYtEifBfN8o81gmWM0wdiNCu9Wej3jsSMGhICVpg0GHbFQ+dh27nnwelXDW8bquMXJ8Lz/MkMh6I7+KY6ZRLgsdtM6CxB2rZC1ZfvowIQkVNsDoxiKlLCupFwSmzWc9aaatXrSqm4tJ/F2WqGm7+Bf53y/Q433twdVcBTkcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783360526; c=relaxed/simple;
	bh=Qwjjdhxc1DcpvjFxKNOKhBVoMAZizvPc+3Ojfi5wZJw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sTvSacK+CDIKCTrI/YVjN2+Oi0Q3Kv8Ca48lHpL1BPW9akWc7lTdrvftWVJjv0sxSH7/SppDDF5JOvZDhKlb3xI+H5hZ8umkg6UWw48c6vu8vwDNYVwVkmrspy5CrRXUgmz/DRfgurmH5l3S/2i6St67DBGpbjhuA3OUSzUXJxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fP5YRTWc; arc=none smtp.client-ip=209.85.210.174
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-845ea8924fdso3685710b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 10:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783360524; x=1783965324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gda9EnNaq+fnHp+pBJqOcXDPF8q5yM+z5/crGMT/FCk=;
        b=fP5YRTWcInXEJpUGE6ALaVUQKlMIDWpYrtQ8iVOdjSaKcOg4OecNE8nUEKCN9NzM47
         FRytmT3f5odfFRHq/wWOBqFc/lKgBmBZsb37MnzgH+JE3GutvoFHgHMQau7zIsZqnIXd
         6FlEJpcFGZI7VcfKlBUabrHpfDOc7obMSUgcDdJUca3g3+NSbXm2TvWVyFV5bp+LorKw
         4nYP9ibGcA1Nxd5R4/aa00yVS3vSVlbDe4eq9ambDLfEC3VTqUs3YJIa7OEyM8UQ3oPk
         W8AWUiOTSS5HiPr+ADlbOkk24oqMueiyIRY/qJae3GQsk6IhwHZBI201AnCKx8184jbb
         aKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360524; x=1783965324;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gda9EnNaq+fnHp+pBJqOcXDPF8q5yM+z5/crGMT/FCk=;
        b=DyfraWFZTt2+keC/9hem3E5r3dbQ/fkrDrg++AYgrm2r6hmLahafmrVwhMbJg5PXgu
         vMKuvaqwuZ55+Q2xXUT2y/Q1qTj/v6rZCzZC8RiM9w5mOMhzg77T8brvrD2UPMDqCKfx
         Vr5Qm+dANtAGqcCJ4gHU5dQZ0c0MCsbFZ7Y7RK6H6K8y3rrlHMJlNCm0xKkcgIaJUM96
         Z9yseLxuz7kPnHR0o3tuFPEut45UW0M75F6v2JBI6XSdDm6UFsU+uBmMsFOYJyWwQBW0
         p8Kmb486v0E4V/7Z00X2LGNimgyACIJjS+iZU/dAbSKMGXome9tXElDJzMszSE4OcH7T
         vHtA==
X-Gm-Message-State: AOJu0YxS13nP5A7n75j8y6H5pVxdE7zLj9kXQtk8I64lD3wtQ62oJe5w
	wbQqBcyOd0p8jVOGkwEzZPO0cTtQUtlVIY/pzc35EtOyAupOvtnfksrp
X-Gm-Gg: AfdE7cl4ahlcMuMmV7o/Vm3OEzyuYvqWV1KBhE0bWtkh8BQ/HlNoB2gZwpzXYUmAOvv
	o6QfswrGo3SO3UCbCGNIEDyuGin3gvv7UOhkSWNib6i7MSGMVTzlva7JOyBWiUaEogO6KdhEPkF
	aN+NZgWMGndXMfXQNQrs2JbyL8xuINNQyq8bx3ZNonHBmxcFTqUpLbHi/DjiFRJbwaWqzdeMZHz
	k+dkaKTQwY4gvlWBYMZuIemxoFyyQDFWMRM5s/e1ra8bKNyeB5OSIg/cICMmNip53Tn7uqGUEs2
	j2FpD4N3PPsWK+d2lPrzIE44IkutEdHoeZUqzXL8L2bPxWvcfJTaUmvfA9zoal75P0+bS1pzslh
	xC0t5/14LXi+mk3dQf4guVaAssC5anQaU76B6blgsSAjMN5t7QN2MNLJfGlrVbnd3lm4cnYarDO
	ZzD3iSchJHhQZdc0HcgsLR468bLiZV2yA84AINwVfeYcx0npvyK49zsMvfB98=
X-Received: by 2002:a05:6a00:2a08:b0:847:7ece:3426 with SMTP id d2e1a72fcca58-84826da830amr1487737b3a.58.1783360524459;
        Mon, 06 Jul 2026 10:55:24 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net. [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b95c89sm4375268b3a.15.2026.07.06.10.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:55:23 -0700 (PDT)
Subject: [PATCH v6 4/4] mshv: Use hmm_range_fault_unlocked() for region faults
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 akpm@linux-foundation.org, david@kernel.org, jgg@ziepe.ca, corbet@lwn.net,
 leon@kernel.org, ljs@kernel.org, mhocko@suse.com, rppt@kernel.org,
 shuah@kernel.org, skhan@linuxfoundation.org, surenb@google.com,
 vbabka@kernel.org, skinsburskii@gmail.com, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, linux-hyperv@vger.kernel.org
Date: Mon, 06 Jul 2026 10:55:21 -0700
Message-ID: <178336052192.504354.1841795575701703197.stgit@skinsburskii>
In-Reply-To: <178336023903.504354.7500950448226027718.stgit@skinsburskii>
References: <178336023903.504354.7500950448226027718.stgit@skinsburskii>
User-Agent: StGit/0.19
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95211-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oracle.com,linux-foundation.org,kernel.org,ziepe.ca,lwn.net,suse.com,linuxfoundation.org,google.com,gmail.com,microsoft.com];
	FORGED_SENDER(0.00)[skinsburskii@gmail.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:Liam.Howlett@oracle.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:jgg@ziepe.ca,m:corbet@lwn.net,m:leon@kernel.org,m:ljs@kernel.org,m:mhocko@suse.com,m:rppt@kernel.org,m:shuah@kernel.org,m:skhan@linuxfoundation.org,m:surenb@google.com,m:vbabka@kernel.org,m:skinsburskii@gmail.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:linux-hyperv@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skinsburskii@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[skinsburskii:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30F8271435B

Convert mshv_region_hmm_fault_and_lock() to use
hmm_range_fault_unlocked() instead of taking mmap_read_lock() around
hmm_range_fault() directly.

This lets the HMM helper own the mmap read lock and allows the MSHV fault
path to handle mappings whose fault handlers may drop mmap_lock, including
userfaultfd-backed VMAs. The existing caller already retries on -EBUSY
after refreshing the mmu_interval_notifier sequence, so no control flow
change is needed beyond using the unlocked helper.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/hv/mshv_regions.c |   14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/hv/mshv_regions.c b/drivers/hv/mshv_regions.c
index 6d65e5b42152..04676f06c5c7 100644
--- a/drivers/hv/mshv_regions.c
+++ b/drivers/hv/mshv_regions.c
@@ -388,13 +388,11 @@ int mshv_region_get(struct mshv_mem_region *region)
  *
  * This function performs the following steps:
  * 1. Reads the notifier sequence for the HMM range.
- * 2. Acquires a read lock on the memory map.
- * 3. Handles HMM faults for the specified range.
- * 4. Releases the read lock on the memory map.
- * 5. If successful, locks the memory region mutex.
- * 6. Verifies if the notifier sequence has changed during the operation.
+ * 2. Handles HMM faults for the specified range.
+ * 3. If successful, locks the memory region mutex.
+ * 4. Verifies if the notifier sequence has changed during the operation.
  *    If it has, releases the mutex and returns -EBUSY to match with
- *    hmm_range_fault() return code for repeating.
+ *    hmm_range_fault_unlocked() so the caller retries the range fault.
  *
  * Return: 0 on success, a negative error code otherwise.
  */
@@ -404,9 +402,7 @@ static int mshv_region_hmm_fault_and_lock(struct mshv_mem_region *region,
 	int ret;
 
 	range->notifier_seq = mmu_interval_read_begin(range->notifier);
-	mmap_read_lock(region->mreg_mni.mm);
-	ret = hmm_range_fault(range);
-	mmap_read_unlock(region->mreg_mni.mm);
+	ret = hmm_range_fault_unlocked(range);
 	if (ret)
 		return ret;
 




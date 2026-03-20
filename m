Return-Path: <linux-doc+bounces-80429-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOWUF8ugvWkM/wIAu9opvQ
	(envelope-from <linux-doc+bounces-80429-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 20:32:27 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 166002E004A
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 20:32:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22614308F8E3
	for <lists+linux-doc@lfdr.de>; Fri, 20 Mar 2026 19:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3A83F164A;
	Fri, 20 Mar 2026 19:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5jDX5eZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7233F0769
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 19:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774034884; cv=none; b=IFQFNbbALxLY5cqLKdPVL1H2S+AmqgR+coA+pYZCBvDVCyskcgAgVVWFDmjg/DTaq9rYSm2OsixPNv8/cGf/25PavoGIMwc+2C9Z4QQYXscw5gXCDSe6JVPK6bEt2ouKKXdI/yxvzEeSezq91Y4aV0GUrLNF/GYCJzk77bstFNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774034884; c=relaxed/simple;
	bh=XUG2nMpJeoG6B9ljhBEIzGZmx65mAIf5essHdmFCXwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G99Z0S2lcn185WlbcI5qfnJbdsUWm2sGF8GfMSvQ0wdltKCafmVkfBjMv4i7UCVxTCuoKeVLjzU2dlo141sHGbsLUNIzVUcfeGn0VJOfWJ1E8CpE8bRB8Lz9/p8Hd9JT0qkj1r1cnoxNALRxkPnV9VMkq781twMz4pJLM8Sum5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5jDX5eZ; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d1872504cbso2094129a34.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 12:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774034880; x=1774639680; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNNnmWHnRUZm7wwtDTGZLy0ujBXuugSXcNtRiTK4tAk=;
        b=G5jDX5eZ2N8vsVsh3AW57fvTO13stWOPKCHCVBnmLB4ZPbwTv00jDue2osfhDFzEks
         fGdVlICJszPw/EexqrvkznTjgMQg3KbljDqR3v+P09CElbo+dsZg1o81ElQNyee5C2Wk
         VBZ8ukXobDw939y8Ugqp9E9ZujgA1K6zjUOjFAbIEZg5ex7r9+GTM45vDOfXItFoK1Q9
         tZeJd1w6gJF/jKvXOtOoCYBDlvIN413msPNVfJ2q+ahyYU7uHBa/l3QjdliHjx62tUVN
         +Gk/yI9gC6mEVn3DOOoaaB6aPhkksIL992akGZGAHYThBkDPotx27/7NEQ8Pxtiwu9mF
         1rkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774034880; x=1774639680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XNNnmWHnRUZm7wwtDTGZLy0ujBXuugSXcNtRiTK4tAk=;
        b=tGpHnSBBQHpuNR6jpDvayzKJjKSf74PC/miYJUcl1nzo2ZlbC0XqhUcaZjCRtj88dl
         HVVen6HEg9OaIyU7qlOX4hXis/XCN29Sdu8ol8GRqmT3hZqqXMf4BV7AozG9ERifV4XI
         tfYD0+WE5LI6HtV+GJHfN0gxuKNswFk+7EYXyJEn2R1tSqEuVShMsiTcBGiCSDpxSJ51
         5K73MrFIgZsQOUi8jxIWHorqdNBhw0qqEj0DIXlhIWwIrBnkvh7ZC1N6zCANEEsNomsb
         4aRffrmjtjX4xif1BFg3pE/Hahqo4WsFc4NCvdfu455PYz0WStmh7PZa7KJdQGZ/TRcl
         d2NA==
X-Forwarded-Encrypted: i=1; AJvYcCU2izBcfZO6NfNSANfBxrOiLtWIp57fXLbLxAO75pRM1N9Qbn3VOhHgT3ZT7p9bv7nGBPUiIg75dWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWmaLZ8D+hM8eR1g4g37c8NpSfpwtXjojDW08UwZ1g3xB+/gSf
	MBpTRHzFm9YueESjYN8+bUG08URNabfLNd6sw0V2FvJVOAQSr915HXsD
X-Gm-Gg: ATEYQzzj3XOwQDKFRyPdnTr2fxlG3ZuF1WfBMGOFl8QsiyMg7Ceo1iWYtoeVYIAYvwX
	j+Lv3Slr1SVBJwzDontQkptKpYu2prb9z8cUJDidW8hXnU+T31bOW/zvF2EsElcvck3ybiShUPV
	ipHwp9qvfxaKxEaiibBv7xVBCh/zKnveJpDnklw4NIax9CzfwbBfpKGk0U+dHfXKGrunUoQRp2Q
	qPq3itXbI24pWqazIXervBmoHKmdpkN1Gy5oCDaketHdhxwhLqdgf1uNNHgqHOGMa51Q4EdwGid
	S3wlZx9P5oGUrELHqBznbPfj2iQRbCrQ2Uxy9grKiMU309kFOyvjQFsywTS5biq4wEIgVAH64+7
	a+uDjLYR3oauM4Q2NRXta9Qh31mMwl8LW9aGKDCziUzXRbfjBfrKfaieHKqkW1ypA23NILxY/Ni
	g4dY5JtF9K2nC8dCnvVq1wJyVo/Rt4JKEcA4Qdu56Gtw==
X-Received: by 2002:a05:6830:2c08:b0:7d7:4eaa:8b82 with SMTP id 46e09a7af769-7d7da7d0888mr4861812a34.17.1774034879806;
        Fri, 20 Mar 2026 12:27:59 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7eae27691sm2931366a34.24.2026.03.20.12.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 12:27:59 -0700 (PDT)
From: Nhat Pham <nphamcs@gmail.com>
To: kasong@tencent.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	apopple@nvidia.com,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	bhe@redhat.com,
	byungchul@sk.com,
	cgroups@vger.kernel.org,
	chengming.zhou@linux.dev,
	chrisl@kernel.org,
	corbet@lwn.net,
	david@kernel.org,
	dev.jain@arm.com,
	gourry@gourry.net,
	hannes@cmpxchg.org,
	hughd@google.com,
	jannh@google.com,
	joshua.hahnjy@gmail.com,
	lance.yang@linux.dev,
	lenb@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pm@vger.kernel.org,
	lorenzo.stoakes@oracle.com,
	matthew.brost@intel.com,
	mhocko@suse.com,
	muchun.song@linux.dev,
	npache@redhat.com,
	nphamcs@gmail.com,
	pavel@kernel.org,
	peterx@redhat.com,
	peterz@infradead.org,
	pfalcato@suse.de,
	rafael@kernel.org,
	rakie.kim@sk.com,
	roman.gushchin@linux.dev,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	shakeel.butt@linux.dev,
	shikemeng@huaweicloud.com,
	surenb@google.com,
	tglx@kernel.org,
	vbabka@suse.cz,
	weixugc@google.com,
	ying.huang@linux.alibaba.com,
	yosry.ahmed@linux.dev,
	yuanchu@google.com,
	zhengqi.arch@bytedance.com,
	ziy@nvidia.com,
	kernel-team@meta.com,
	riel@surriel.com
Subject: [PATCH v5 15/21] zswap: do not start zswap shrinker if there is no physical swap slots
Date: Fri, 20 Mar 2026 12:27:29 -0700
Message-ID: <20260320192735.748051-16-nphamcs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260320192735.748051-1-nphamcs@gmail.com>
References: <20260320192735.748051-1-nphamcs@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[oracle.com,linux-foundation.org,nvidia.com,google.com,kernel.org,linux.alibaba.com,redhat.com,sk.com,vger.kernel.org,linux.dev,lwn.net,arm.com,gourry.net,cmpxchg.org,gmail.com,kvack.org,intel.com,suse.com,infradead.org,suse.de,huaweicloud.com,suse.cz,bytedance.com,meta.com,surriel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-80429-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nphamcs@gmail.com,linux-doc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.881];
	RCPT_COUNT_GT_50(0.00)[54];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 166002E004A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When swap is virtualized, we no longer pre-allocate a slot on swapfile
for each zswap entry. Do not start the zswap shrinker if there is no
physical swap slots available.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/zswap.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/zswap.c b/mm/zswap.c
index c5e1d252cb463..9d1822753d321 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1211,6 +1211,14 @@ static unsigned long zswap_shrinker_count(struct shrinker *shrinker,
 	if (!zswap_shrinker_enabled || !mem_cgroup_zswap_writeback_enabled(memcg))
 		return 0;
 
+	/*
+	 * When swap is virtualized, we do not have any swap slots on swapfile
+	 * preallocated for zswap objects. If there is no slot available, we
+	 * cannot writeback and should just bail out here.
+	 */
+	if (!get_nr_swap_pages())
+		return 0;
+
 	/*
 	 * The shrinker resumes swap writeback, which will enter block
 	 * and may enter fs. XXX: Harmonize with vmscan.c __GFP_FS
-- 
2.52.0



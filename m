Return-Path: <linux-doc+bounces-85927-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCqNOm8Q+mntIgMAu9opvQ
	(envelope-from <linux-doc+bounces-85927-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 17:44:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB73A4D0730
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 17:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CA6983037C8E
	for <lists+linux-doc@lfdr.de>; Tue,  5 May 2026 15:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0249249218A;
	Tue,  5 May 2026 15:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cN32cNin"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681BF48C8CB
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 15:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995575; cv=none; b=NxRruvtzq84sPxildCiBuTXeB6HVNevhtgAT8GPTZHiofAVBSvrUPYW2SF3U099Jfr/XSaiIqCMBxeNtEK5P/2semIp6kZx/KKGc/UCdoF6b9X7XxcJ+dZixixuLp/Ly9njzgw8ie71GOUCyRUBrYhyHMiXWPjj4Xd2axRlWuNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995575; c=relaxed/simple;
	bh=WJv7TbTBHsX/A9NDJmolsXLXY2Rt5GLjEbUFUMhf4TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nGTSVUBquTVgt+Pd1+wL2b6LkWbI4/NXpyJdfXy3BCQGNN9Qh/VzHgROOqkZSCvXGMQG/AHE0WC6Uhp+7emOyz0Ux64iG/BeNu+ua75ov/pabYNlDKHpY0Rhi+pxXf+cjHCvT5umeKNg8aRcachTpqbfI9DY70jydcS4CRqjNyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cN32cNin; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-42c0b0ffac1so2289435fac.2
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 08:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777995571; x=1778600371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O97PAflqjjtCiKkA3gTz4fMVjeIt3GdTmnKsTZ8H7Z8=;
        b=cN32cNintGy2+tB7v2MIB9ZIOITD2tfOWGVEA09gxvIhPKazxQfqL9DCB7daniMBb1
         qfFMeL7QI4bOk7GZmjHBSQR+gOtKehWxoY1ikc5kxnWaJ+h1GQ1YrnHt4ljs+7O2IOeb
         ntrooqYPXibYLljXw+rgTXod8/DngJwpzIy53BjMxy/bOtcgD7IuxiWleJT6vfJyoKAX
         2t4cihlAtmrTZ97OUXnOUR4tbtJV9cwRIxwxiJ964Fg1AxKxoQ+z2/hLTj01wbR4foET
         uAXXaq2Kmd+Ru8VMtXx8BTbTzt2C4JZ2Z1bc/bCXKVW8Vt1ddHDAFnkmiExWijHShWFL
         Fzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777995571; x=1778600371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O97PAflqjjtCiKkA3gTz4fMVjeIt3GdTmnKsTZ8H7Z8=;
        b=Lp5XSDFNwVbU6xeM8lnE3EjYhK1Ol10L30ACIuWjBiioye6RDW3cq/MHiQpT3+obE6
         CCaXmEFFX+r8v6tZFYKeiu+RbySU5j8fxraaYcasmC26BsUJjcRqqJa3g7ZLXI1O0/Ti
         1XI4sKSb1N7bJd0MdR/U2fTDBAdK/sWFg2OeQIGV4SN7iHRHSO9jS1VAnGuceK77XdH9
         nJqHPVzYL/wV1MnqHign/6ybf15UtNY5aeAvslkqlYPsLFkMZ4741Prux1aXk747Z6V3
         RUBBpsm4BMBWk9szi7+EccOmZA0qX4m/UUfOGsyVfQQVmfMPly/VGVgi96StxeISzYYo
         b6Vg==
X-Forwarded-Encrypted: i=1; AFNElJ9fudYPFfiW/6cmF2XJOg8jSkK3cVUY+Y7FNMgM5/qreWfIw+l6nJiy0ET2CqGT27xJ3z8F04/WMks=@vger.kernel.org
X-Gm-Message-State: AOJu0YxObg7RVkhYDJNg7yqlnGDwVXf4x7thIPpFUdg/2MVKm4GKjou7
	nbemJ0LT4JQkGkP0bZM7KlTShVszVvt+KwYGXUl6vPcX88A1dv+D9C7e
X-Gm-Gg: AeBDieshT85mV/PYKu2iiEA34eOKd+T9V1ujPbY84GboEORoZJpIuZF6pyaEhoBp07h
	G996OVvirb458sqPH7rrWvIuTCGLfGSl+TKKavISIe0kkfGuAgl/pGG6wrBE6GUa9Wd5ivBJyMa
	iRQt31c0a8w3zPpeIxHnyTXk5E6LZI0Nmryego3MFuOALYJs+Bnnm4vEBJvuU5C92BfOoya+s+i
	+tpryTQ1hQPqtXyFw7mA4P0EyP16Ceq/x0E20VNPqoorwXdq2lHChFbN5mUGLV5x2Gjc0BT50uL
	tUHygFEhYPsqsagF4ElmTM/blOm6FdEV6VLLAuOrHuG/iRRa6d1ah510bOaUgstNgqxjX87u/mH
	1fjBdyNDDW+MznedvZEpG1SPM+mx6891dpBPCu+6wDfSLiXTGuSC/JSJ0TK3wfdcTz4+Fwkcm56
	eXQ8hz4ZD/vNV5IrxepLMxzPxdn+EouLPQG/DLEFGFxxzAI3AiSrvTohw=
X-Received: by 2002:a05:6871:3861:b0:417:a283:9c81 with SMTP id 586e51a60fabf-43476281571mr7457002fac.35.1777995571187;
        Tue, 05 May 2026 08:39:31 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:7::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43454d35e5bsm13955814fac.15.2026.05.05.08.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:39:30 -0700 (PDT)
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
	riel@surriel.com,
	haowenchao22@gmail.com
Subject: [PATCH v6 15/22] zswap: do not start zswap shrinker if there is no physical swap slots
Date: Tue,  5 May 2026 08:38:44 -0700
Message-ID: <20260505153854.1612033-16-nphamcs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260505153854.1612033-1-nphamcs@gmail.com>
References: <20260505153854.1612033-1-nphamcs@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EB73A4D0730
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oracle.com,linux-foundation.org,nvidia.com,google.com,kernel.org,linux.alibaba.com,redhat.com,sk.com,vger.kernel.org,linux.dev,lwn.net,arm.com,gourry.net,cmpxchg.org,gmail.com,kvack.org,intel.com,suse.com,infradead.org,suse.de,huaweicloud.com,suse.cz,bytedance.com,meta.com,surriel.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85927-lists,linux-doc=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[sin.lore.kernel.org:server fail];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[nphamcs@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

When swap is virtualized, we no longer pre-allocate a slot on swapfile
for each zswap entry. Do not start the zswap shrinker if there is no
physical swap slots available.

Signed-off-by: Nhat Pham <nphamcs@gmail.com>
---
 mm/zswap.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/mm/zswap.c b/mm/zswap.c
index e8aa9201ea30..751687b7e2b9 100644
--- a/mm/zswap.c
+++ b/mm/zswap.c
@@ -1214,6 +1214,14 @@ static unsigned long zswap_shrinker_count(struct shrinker *shrinker,
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



Return-Path: <linux-doc+bounces-90055-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC2UHPTIGWpXzAgAu9opvQ
	(envelope-from <linux-doc+bounces-90055-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 19:12:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE126062F5
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 19:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 744573191435
	for <lists+linux-doc@lfdr.de>; Fri, 29 May 2026 16:58:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 952A93FFAC9;
	Fri, 29 May 2026 16:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlC9vDfB"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7283FF1B1
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 16:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073829; cv=none; b=VLB3KeonGEIoxNLj+FPz41LXZeUHO7EQU+H5StE363AbXz/zDE1ZDWZ7TF/NWUMgeICVvrM0jjnGSoheOaxQcBk1WCmcwzDIottd/FjuR9uAsiW+Jq43JcR7cuRpLLO0dyIhygZVCXb/E7PIBaWWPvZmAjTCUrZIOBv0G2QD8Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073829; c=relaxed/simple;
	bh=MZuP9HdtIsahZDma/nE0553s75DZEcFis7HHFW5CR1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JKsuUGPkC8EDQ5bxzVuZg7Nw2NX6CA4wJvMLJtxnY6iV58e/3/biUItMbKZMAqDRhjA+itIcDd88G8dF1vPZWmAevqI6zojRaEyIKT2Kfv3YOPSUPAxkoj0iTlgXiGjlG3rWynj0EXLwWvLG8oBAI2RFVxZAuAfYVuL8LzIG3+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlC9vDfB; arc=none smtp.client-ip=209.85.210.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-7dcdd23fcdfso7698343a34.3
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 09:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780073826; x=1780678626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOfd8pSjBXyzWHpK5lKV8S/iJy+QOz+9xXLc+9tqa5o=;
        b=RlC9vDfBeczWtWM2O+JCYILKDf/oRcTBR/YSjeguGerOR5rYBSIAKGGypr/SLyZ3dd
         n/ljEN64iND9SaCuCmFcktWngx9GHaqWVyUjVsxTCR8039udzdWccjZNcmjtT4bh10hi
         RJc5Q7uqeXk85M2q5yDiywBZcqCanPekfm2D3MVm7354tbEqLHOFZklYUOb07z+d6kEF
         ev0Y3+GAGGL2y8Dz/gIE6VdZMZWwCQGC3PS46Z/LqLgY7oRCsN5SReUBBiF2MivHLeJM
         R6O7Cx3hhbFcxo8+v6T6EnO/GRO88hxImXGTUJEyq6+3deXxnXvAw3FfWDUp0OjYwDH6
         NA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780073826; x=1780678626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aOfd8pSjBXyzWHpK5lKV8S/iJy+QOz+9xXLc+9tqa5o=;
        b=hH9oicHBUWZA06XaHPo5S26+UM2dwmcAU3pKm/bcP2YZ3mNCVbNKAhPvY0TI/ia6CM
         W8AUDm6767I+5Ftm4rLe3ge/XXGtX+O/7Ee1py6tAJgncWYe60L06ddG5NdKbm8ZHzSR
         ZF+YLJ30A7CU8O76e03k2Yart/BDtWLnqyuX19LU2CCtkvKJPxmJ4AmfRAwRJuKnhAG3
         3RzGGKM/HvND/uOJQ0TGVrC1YRTkhZCJkIMhp6vxVuxz6vytYYtwkH1vlE+8TsQITFBW
         ZTzoATkAQlhQh8C46mMzB9Bu2NIS2nPVtwG9mZwkHqqZciRdWFV72Hz1DLZRPDslbrq+
         sBoA==
X-Forwarded-Encrypted: i=1; AFNElJ9GsRlIw8SAT7VxMqEA1pclgfNBRFo5nPuU+app3NW+JRdkYi1mwSAEA/gOPkJZtZl0YStmBRhybP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YySDLlSM5MJ9h1y6FeSMlbDWsdQN53wcyuB6+YYfkMGgTN5KTrP
	cr/msCFbzTXQM4+nUDVZ1yMMp11FHV+GRxWDMNRxgID0bItkQqY+AAw=
X-Gm-Gg: Acq92OHE3ZFw4DVia5oFa2Q6l4gAkdBHWXoRU0AUokVLGoEg9ItFZvwSow7Mlkcsfd+
	VUVeW9neU0Z7Nk7OGt+IlMX6XpjP0EAz0T4GFt1j24cO/R2O2W9qbZIBnJFlpVExvCnvnxDyxXq
	8iHBKbKPvqsefOH5sMDFlwu4d7yK6Oivcb2WIqoOiLp0NrMFW8bo2Lf+wx7t3fXbBO8eY51YOTv
	4Iw/GffLbTgvLubeCewMcPot+mpDCV3IopPjtHHvpaF9brihiDHpqVBGn5A12+eZSXJ1g6S5Fn2
	HUjWUcAkPL2/zDp8hEMeL+GzPa8SQSef9hr5iYtj8q/IXDzoE99hWBBcr17xFafGdAQ0atOVLs0
	7cQfmicVheHhoRf9ytVAq3bAVQ0mvMDe12u9q1wC80A4ism1ziLg1kgAi6qITEqj990v9n0Qff+
	ewI20A5Te8qP98W9CRgw9sQEFTQPrnFtFl07IPEVkWO1vu7uxeKYS/Mq+cwR2S/Kzjf4oCAKKNv
	ik/srIVs8il4eqT7tza6YU=
X-Received: by 2002:a05:6830:83a1:b0:7e5:f831:508f with SMTP id 46e09a7af769-7e6a1dc5519mr438211a34.15.1780073825697;
        Fri, 29 May 2026 09:57:05 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e695d176dasm1812846a34.16.2026.05.29.09.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 09:57:04 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	akinobu.mita@gmail.com,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	ravis.opensrc@gmail.com
Subject: [RFC PATCH 3/6] mm/damon/sysfs: install perf_events on apply
Date: Fri, 29 May 2026 09:56:37 -0700
Message-ID: <20260529165640.820-4-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529165640.820-1-ravis.opensrc@gmail.com>
References: <20260529165640.820-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,lwn.net,gmail.com,micron.com,sk.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90055-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,lists.linux.dev,kvack.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ravisopensrc@gmail.com,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1AE126062F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Call damon_sysfs_add_perf_events() from damon_sysfs_apply_inputs() so
events configured under sample/perf_events/ get attached to the
damon_ctx when the kdamond starts.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/sysfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/damon/sysfs.c b/mm/damon/sysfs.c
index 9f71871a249d8..bc4a931fe3f0a 100644
--- a/mm/damon/sysfs.c
+++ b/mm/damon/sysfs.c
@@ -2092,6 +2092,9 @@ static int damon_sysfs_apply_inputs(struct damon_ctx *ctx,
 		return err;
 	err = damon_sysfs_set_sample_control(&ctx->sample_control,
 			sys_ctx->attrs->sample);
+	if (err)
+		return err;
+	err = damon_sysfs_add_perf_events(ctx, sys_ctx->attrs->sample);
 	if (err)
 		return err;
 	err = damon_sysfs_add_targets(ctx, sys_ctx->targets);
-- 
2.43.0



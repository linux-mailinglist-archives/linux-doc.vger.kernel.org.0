Return-Path: <linux-doc+bounces-61508-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D280DB93B29
	for <lists+linux-doc@lfdr.de>; Tue, 23 Sep 2025 02:34:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93E48447404
	for <lists+linux-doc@lfdr.de>; Tue, 23 Sep 2025 00:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43CA21DC198;
	Tue, 23 Sep 2025 00:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4y5rP/3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240AF1C7015
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 00:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758587638; cv=none; b=PxNEk0wU3G6cBSUu9pWp1oRA2if1QbMuHjaE8PmMDbmbqMLHtjEAIhgEBOIWVUmzSFY/BIXc75RdjNLTkWnn8NU0ZxcCBcT+otqcgL7le5K0FuXoRfhW1CYruFpNSMp3C91SxyaE+k1aIHeWa7Q00wAJb+vd3bcRR3OjYsNIHT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758587638; c=relaxed/simple;
	bh=EIuqb+bEXzHKheYSg8/gT99wnpLEGYyBUdzthx12unM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cHumit1QcaGOrdrXoknEjNfLptSt8+2yHiqD/RoOe2D9V613OVBWcDtPH30QrWNyW8lPRxdzcd2ld96wDlLhcjP6sLCl3WumJmfl5mQ9C0Hxft0FaPt6EPydXDTK5YMOV/TpYm0m5hQmvJvzzwOsG7jbVcKrBV4xsTPnxGjRcyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4y5rP/3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-271067d66fbso25882415ad.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Sep 2025 17:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758587635; x=1759192435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vApv1A8U/+p+Slbx14eQKwBqtf6JexlqDhpDLkVD4XQ=;
        b=k4y5rP/3axS9MdonLYX3xhcRiKET5eSdG1oobLiCXTAt60PMq9x2fLL1r4Vx7wBmmA
         BhEL8gS/vWO3rOt8ReMlHGj+rrYm8/8HQLQ2baQQc6/F9B4xqj3ztSoRi+TRLcj3ECl6
         7dCMqrc1bVd3e2qIStZIVWhSF+vL8jxwQFaE8rIA1d24mNEIU0UCbQXF0r6RL/D67RUa
         oGvXmEUslG0yx6l8o0hNQKBLaPxDxAOmP0tR1E4XT/812bQGPuf90MJpuAfwmv4Wj8OZ
         t+8o8fnHHv3miuwB547WbsdwcjZWOOcRtClTKlTlYegw33fq3+pWuhoM7AColJmI70oJ
         z0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758587635; x=1759192435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vApv1A8U/+p+Slbx14eQKwBqtf6JexlqDhpDLkVD4XQ=;
        b=LROUy0WFxu7krKw07pLiW+2AxaNke+/DUxcv+XJuoKb+nKQ6yTCI7aKKGZZlCZB8Tp
         +kgUZTT1c26Otgfkb3hsgNXGt94YfqSJkhtuRdpO/94lLLqAC6KTsg4nW2mfNTomDO5I
         8GOWUnlgzvL6eHwGu8v47M93fuaaiB6cUkZoe5E7R5wjH3O4rs3ww2Iuf8p247JsUjGo
         IT6V+gxccqaD4KzXS6L4qNsRYtKVmWfwwkHpsgQv2Va01aYez6SqFJ89RJKfv8ek2XtU
         UpTMV6MI5Ccei1WxvaP2eIh674tvczSl8Ehn0gvE2Kcq3IBfyzd7VQ5MuiSA5tlBfymM
         geDw==
X-Forwarded-Encrypted: i=1; AJvYcCW/gY8qdHs8YdNiMj5xQOePwj80VT7gReyIHtZIJMZHwixCZYL/BUaMkJgxdoqnxqMjtjiB7ir2zpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDuSKTUsFVgcH0TRTLUhyGyb/kCKnSPJesQy1R+XrC1i+RQycP
	jXo07rbrHT5YbAub4jiFrGJtjfnyarAyDgrE7WnSpNb/FRoyzbg/quW5
X-Gm-Gg: ASbGncu5WyzhKFjaIZhaR9yEoPiq5hzKGzyXtLfi+XjF2a0fLVTEassM21SUQbuMEhe
	2LXi1/xveb2MPjxi+mLJ1RzVpMJxSL+CK6n8l52kjv2Uf03VXgH/P1uDMSLXG9MFHrfMsqgGm4L
	sT2vYrZQuFXIr8vBVPYoYbmPVX3WQ0zBpRiK1VwWMEZvRfDDYfN9pdtR0UxCr6bAcigBJI6fPzL
	eJNNtu4G9BDFZ/xdsEtoA1aocDs2M+PW3GnHxSsPVDd4yWBu3a/bS59D7H8s+1+QX83txlnx39Z
	INEchlL5aszUS3+1Wjqb7gJxzmn2WjCrf6JQ/ZrzkbPFw8DWYPKUH3QN5gBrfGOX5AKiZpuw3aV
	JdRx8hTYd42OFYvxpFSeiDd5YNyfLbCsyJhkmAbtUQtK7C6/7Uiug6pO8pmo=
X-Google-Smtp-Source: AGHT+IFYTpNSjfUD4M2hqi+bqTZwEMz3Dj9iqDCa9q6c/0wRbqwF/PnO6+RzUOlJ1m1U0d+6bAdDOA==
X-Received: by 2002:a17:902:fc8f:b0:25c:982e:2b1d with SMTP id d9443c01a7336-27cc7da64famr8085685ad.59.1758587635368;
        Mon, 22 Sep 2025 17:33:55 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:9::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802df446sm144936935ad.68.2025.09.22.17.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 17:33:55 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org,
	miklos@szeredi.hu
Cc: djwong@kernel.org,
	hch@infradead.org,
	linux-block@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	hsiangkao@linux.alibaba.com,
	kernel-team@meta.com
Subject: [PATCH v4 02/15] iomap: move read/readahead bio submission logic into helper function
Date: Mon, 22 Sep 2025 17:23:40 -0700
Message-ID: <20250923002353.2961514-3-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250923002353.2961514-1-joannelkoong@gmail.com>
References: <20250923002353.2961514-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the read/readahead bio submission logic into a separate helper.
This is needed to make iomap read/readahead more generically usable,
especially for filesystems that do not require CONFIG_BLOCK.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 fs/iomap/buffered-io.c | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 7e65075b6345..f8b985bb5a6b 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -367,6 +367,14 @@ struct iomap_readpage_ctx {
 	struct readahead_control *rac;
 };
 
+static void iomap_bio_submit_read(struct iomap_readpage_ctx *ctx)
+{
+	struct bio *bio = ctx->bio;
+
+	if (bio)
+		submit_bio(bio);
+}
+
 static void iomap_bio_read_folio_range(const struct iomap_iter *iter,
 		struct iomap_readpage_ctx *ctx, loff_t pos, size_t plen)
 {
@@ -392,8 +400,7 @@ static void iomap_bio_read_folio_range(const struct iomap_iter *iter,
 		gfp_t orig_gfp = gfp;
 		unsigned int nr_vecs = DIV_ROUND_UP(length, PAGE_SIZE);
 
-		if (ctx->bio)
-			submit_bio(ctx->bio);
+		iomap_bio_submit_read(ctx);
 
 		if (ctx->rac) /* same as readahead_gfp_mask */
 			gfp |= __GFP_NORETRY | __GFP_NOWARN;
@@ -488,13 +495,10 @@ int iomap_read_folio(struct folio *folio, const struct iomap_ops *ops)
 	while ((ret = iomap_iter(&iter, ops)) > 0)
 		iter.status = iomap_read_folio_iter(&iter, &ctx);
 
-	if (ctx.bio) {
-		submit_bio(ctx.bio);
-		WARN_ON_ONCE(!ctx.cur_folio_in_bio);
-	} else {
-		WARN_ON_ONCE(ctx.cur_folio_in_bio);
+	iomap_bio_submit_read(&ctx);
+
+	if (!ctx.cur_folio_in_bio)
 		folio_unlock(folio);
-	}
 
 	/*
 	 * Just like mpage_readahead and block_read_full_folio, we always
@@ -560,12 +564,10 @@ void iomap_readahead(struct readahead_control *rac, const struct iomap_ops *ops)
 	while (iomap_iter(&iter, ops) > 0)
 		iter.status = iomap_readahead_iter(&iter, &ctx);
 
-	if (ctx.bio)
-		submit_bio(ctx.bio);
-	if (ctx.cur_folio) {
-		if (!ctx.cur_folio_in_bio)
-			folio_unlock(ctx.cur_folio);
-	}
+	iomap_bio_submit_read(&ctx);
+
+	if (ctx.cur_folio && !ctx.cur_folio_in_bio)
+		folio_unlock(ctx.cur_folio);
 }
 EXPORT_SYMBOL_GPL(iomap_readahead);
 
-- 
2.47.3



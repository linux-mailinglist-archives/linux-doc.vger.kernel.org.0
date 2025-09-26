Return-Path: <linux-doc+bounces-61871-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6CFBA2162
	for <lists+linux-doc@lfdr.de>; Fri, 26 Sep 2025 02:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D28A77BAC2E
	for <lists+linux-doc@lfdr.de>; Fri, 26 Sep 2025 00:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43F001E1E00;
	Fri, 26 Sep 2025 00:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6X+FMtn"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD4D1D618C
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 00:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758846584; cv=none; b=KxyrfUszweoxJZBzdH9bYYB2mv8IuIE9pMPP1sFz3M+FkIN1Hqg70SnlJ9sMk/KI5kj1hYkO3WbJhMHjOzzDGmsMmqMOfs6PUfKwwpcyPZY+Yq63BFVxHaTOef4HMAbNM6ITPaLqlXjTL8UVGWgSUWWTOhaMBh6WHjhx6G1M5u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758846584; c=relaxed/simple;
	bh=ZJKn2aUxwVXrXo21+pZx6cBCh+fmZr2QcyaMhglPP5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ndcu3igdskVDu2MMQnHMfCzsLqa3OGxIHm4bUmIkLT3sxX4x0zi0B+rbNUfU+GGGzY5gjsmHmAKD3k1AwvpDMlcmg5z7QdaiWzHdTqiJzRSKCc1NlAZlOz9rBWQnxp+FUnogAqjoHDF2O6jGe/mRQAVXphU8iG7V6Qn0a3J31Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6X+FMtn; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-26e68904f0eso17386305ad.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 17:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758846582; x=1759451382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfpa58E21gi9e/RAKTk39wwAnWAES7lJ4fXxRAP7/fA=;
        b=E6X+FMtnWLfGdD87MYCUgtYFZjE3zqbtYDcgYbH3CRPmFvbyanYQU657FEQFv88noW
         F20yLDpYiV1n39fCL9p2NPB9r+Q3xV0Ro/zv9jvwWSgeVqN6zxTQxcuy6NPOGL4dn8Zy
         gFySXlXBJB42W+qrt+nft0juLEIvtqwcYlo7KmwsXXNk08ZhCqzz3KHduVe11p4KTR9y
         s/MkzsLHxwgzDEKRyFG4Hzb3RA5no639i4v/z+n8nio8zOMsX+iD9ht9bZwhJnwShFUq
         5l69L/tXfgU1qwmUeoCLofYA6vkwlRCME7H9fT9jyw5u87pHhWmQNY6uaY/R1pjVDgC/
         XSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758846582; x=1759451382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfpa58E21gi9e/RAKTk39wwAnWAES7lJ4fXxRAP7/fA=;
        b=FM6JQazAMja1sJaMVT/MsgMfAwUKKHcI8IjousHrCTcy7TZGvqS8HZkcIUwchEW8+f
         zkFIGbbGHsdiDsNwSgeAECBqQK77VCvih+xlnKIKZLi4jWOST7x2Tty3c3phrK9W6Dj1
         u/i8Z1h0824xiYI6N8HPTiqCyq4i4mV9QUR33OYVLgKASqstISZcpxtVO6IqpTEnjpMP
         Yxhw85g2lUfiFeAT3q7qw9V9c8HQ4Qxoi0uDRGNctw19gVPowUnukuRr3bkXbRpF7HYK
         8B6yeRw95e+BIrOMayfcZLH9Bj9pn6XFA00QZdSttPXZt5quDswGH7iFyk8UFcpj9wKQ
         q/gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgkTKgGJ8U6wNzhh1QvUUphho9SNuUl++093h76UdepKTGVSCo9mGFNLAAiAjQNqoLdM0uOoljFc8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6uTfWO8LX+WQCGAsHVFDxTRugDSAq2gN2ZcM2XWE2e7D5zI/S
	fRmu1BXEebmv3ZAhM62hcoI7mnstwyLY3hW2dAGitkUqzjgBRVg3VpOs
X-Gm-Gg: ASbGnctX8uaHHVoVsuX++OQoPyxklRZA8FnpN1KFk3ItSBCTxb7UcHt7MgvYArtsUdz
	sXlwjDUAdxB6Re4dLk+CSWbQUS6PubLNMBsMmsNuoaHtApIOo75kYvXgsCSfSY4GWiijuSRTfsF
	bh/RG0sr4+0loWxndNb0hh6eA2M0SIZG0u1ORrcIZUzHCJozDZa692WVi3vV2jEaJFOfGqkQltP
	rmPvPKYCjGGccMoMX6MWBYY1ZEQVjaBBBAQvvsZ2ePeeqYPvGqH06TbfbFNbFBpm1BvfYnnDgN6
	G+w/EeHAN5/Vh6yfqskdMxORS6tEBJBzDSewyih0JM8zxHmVyXL1Coxn6FY9vBC1hhB8QfOS4F0
	430BDBCII+ff6e9rQgOKu+nT9WMs0iJLTGUlyLgRIHTzJjukdaDml0FJeqUQ=
X-Google-Smtp-Source: AGHT+IEkvHARpHr6lASCpYYJKhWtkl83Q5YPMtQqvQsOsQI6v9aOaa5WPfigq1o+4kPYb7qTz8Gvvw==
X-Received: by 2002:a17:903:b06:b0:276:d3e:6844 with SMTP id d9443c01a7336-27ed4a7e7d9mr49611825ad.33.1758846581629;
        Thu, 25 Sep 2025 17:29:41 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:4::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6716240sm36366015ad.54.2025.09.25.17.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 17:29:41 -0700 (PDT)
From: Joanne Koong <joannelkoong@gmail.com>
To: brauner@kernel.org,
	miklos@szeredi.hu
Cc: djwong@kernel.org,
	hch@infradead.org,
	hsiangkao@linux.alibaba.com,
	linux-block@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	kernel-team@meta.com,
	linux-xfs@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v5 11/14] iomap: make iomap_read_folio() a void return
Date: Thu, 25 Sep 2025 17:26:06 -0700
Message-ID: <20250926002609.1302233-12-joannelkoong@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250926002609.1302233-1-joannelkoong@gmail.com>
References: <20250926002609.1302233-1-joannelkoong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No errors are propagated in iomap_read_folio(). Change
iomap_read_folio() to a void return to make this clearer to callers.

Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 fs/iomap/buffered-io.c | 9 +--------
 include/linux/iomap.h  | 2 +-
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 86c8094e5cc8..f9ae72713f74 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -459,7 +459,7 @@ static int iomap_read_folio_iter(struct iomap_iter *iter,
 	return 0;
 }
 
-int iomap_read_folio(const struct iomap_ops *ops,
+void iomap_read_folio(const struct iomap_ops *ops,
 		struct iomap_read_folio_ctx *ctx)
 {
 	struct folio *folio = ctx->cur_folio;
@@ -480,13 +480,6 @@ int iomap_read_folio(const struct iomap_ops *ops,
 		ctx->ops->submit_read(ctx);
 
 	iomap_read_end(folio, bytes_pending);
-
-	/*
-	 * Just like mpage_readahead and block_read_full_folio, we always
-	 * return 0 and just set the folio error flag on errors.  This
-	 * should be cleaned up throughout the stack eventually.
-	 */
-	return 0;
 }
 EXPORT_SYMBOL_GPL(iomap_read_folio);
 
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 37435b912755..6d864b446b6e 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -338,7 +338,7 @@ static inline bool iomap_want_unshare_iter(const struct iomap_iter *iter)
 ssize_t iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *from,
 		const struct iomap_ops *ops,
 		const struct iomap_write_ops *write_ops, void *private);
-int iomap_read_folio(const struct iomap_ops *ops,
+void iomap_read_folio(const struct iomap_ops *ops,
 		struct iomap_read_folio_ctx *ctx);
 void iomap_readahead(const struct iomap_ops *ops,
 		struct iomap_read_folio_ctx *ctx);
-- 
2.47.3



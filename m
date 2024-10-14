Return-Path: <linux-doc+bounces-27463-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D3499D855
	for <lists+linux-doc@lfdr.de>; Mon, 14 Oct 2024 22:37:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C300E1C22224
	for <lists+linux-doc@lfdr.de>; Mon, 14 Oct 2024 20:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD3D1D131A;
	Mon, 14 Oct 2024 20:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BixPJo1U"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB2A1D0E11
	for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 20:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728938215; cv=none; b=B/PJloEI5KxmRR3BYHDUz2CN0JE79Ex1RTwiLhv0XbEd67LYSBI9kgasyAneO3vR88s87UoVLy5iG1Ksb/K/4ABCBdVxYHK63YUqx9JhG1rnTx/sWp77kIr0U6zIdpWW7tx4XtBLgi/+b6P1Z9vAmKraUsOfaaQIMF3QDYx+bZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728938215; c=relaxed/simple;
	bh=WyPp5GR9nupFuOlmPfHdOFY1s2UJmv4QO9RmmtWeFdk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nHPzMoLZnwvH3srMOF3sTdMvxRrZmEjX5baEFX+mtFVtYZKl0hOgn8xHJAzgYnltMU3x4jyB0KtJeURZWuL0VzoQ9J+kbLYsmlHNwmYlY/8zabzCpiFcjAjhXCPj8HDG5brNuV8bjp/P/PvGN8AkfX2cdS4+Tk5W1Wb6ql4jDJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BixPJo1U; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e321d26b38so80977967b3.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Oct 2024 13:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728938213; x=1729543013; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OBL7Vs4MVDC9S11JwgZ8NOTxmnHjmsqVGP9nKZ/sLKY=;
        b=BixPJo1U8Nkgk5wwILfszlCYdTGZZ3HQJeoN35OeGfLSvXmfhRNz0HzB8ezpupfJTp
         3jt82WqGldh0ipsA6TdAv7XQZzBww21AOJuvcUaIDF1MZAgNm5WPbuWiKo8pMXA4diaJ
         rsjDnwrFuk83+I23OWNi4VBcRhpDQJyqtDPkV4XElJCzUNeS8a9dksoZRBUdCofOBSWp
         Ns1h80t2ZqjUrSo+XVHazawkx1EjcGu4imaGhMaOjwAFVYG+/oo3zf13gzUprUS4LMeA
         Ech0jhwMfocq/GExYP6d8NOlHaAeKax+dj4gtKzMCjtMjLCTsrkVzmoVlTfGTUfAPnM7
         vrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728938213; x=1729543013;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OBL7Vs4MVDC9S11JwgZ8NOTxmnHjmsqVGP9nKZ/sLKY=;
        b=ZcJLc3nkjVEZUpg2HIFN/ZdBHktBqGLWnJqYU2wC4X5/fw6PV5iAvuinf4qIivHzNk
         Lr6J/r1XN5goxNVMTSoybrhu3jhPKEH0oD4oSm9TVPmQUdZUtOwuS7ksZ6/iWfFteozI
         +B1sEGIbXSjDpwdrd/H+uPbrFMBk3lnXO5QSk/d6S19g23x2ChLEN/AW0TJpv32zVM39
         74tkZ5i6km3zHB1tPjxEr0nVkHvw9T6TWdGwXjIT1cEYhJBmcMagVbWnw1SFW1Uqaz7l
         aoqGEOHQvXo+oEXWgGeK4wuQAmOJUx3OjAo8al7XZad682s2JmzK43btt3Zcq2as7IW/
         yIwA==
X-Forwarded-Encrypted: i=1; AJvYcCUFyDL/Fgbfd/Jd8cdlUguUF33C1PPLlPNbVSNknd+y4O6t8vvi9dhzi2CMcRAtDcd4g8tdvHZGuQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YweI1wi7tEK3qJMpMZ1gv8bckwplULBztOZXlsY6vpjbfxdIpOW
	JRp9HvbELz6i5LhTizIUTqfqDIsGfP4pJxnMSS8Ln6id+4MeVfVLCE/Vcxy0v9W0VINQ7btleSr
	AQA==
X-Google-Smtp-Source: AGHT+IF2H6wJeGtAPLdmfc0iDyPr+v9IGwfu4WR2zrx8HQDicf0QvWblIiwnCcZ6i4e+0edwH2bII6UptCk=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:915:bdd7:e08a:7997])
 (user=surenb job=sendgmr) by 2002:a05:690c:7446:b0:62c:f6fd:5401 with SMTP id
 00721157ae682-6e347b4b2edmr460147b3.6.1728938212594; Mon, 14 Oct 2024
 13:36:52 -0700 (PDT)
Date: Mon, 14 Oct 2024 13:36:42 -0700
In-Reply-To: <20241014203646.1952505-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241014203646.1952505-1-surenb@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241014203646.1952505-2-surenb@google.com>
Subject: [PATCH v3 1/5] maple_tree: add mas_for_each_rev() helper
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de, 
	mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, thuth@redhat.com, 
	tglx@linutronix.de, bp@alien8.de, xiongwei.song@windriver.com, 
	ardb@kernel.org, david@redhat.com, vbabka@suse.cz, mhocko@suse.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net, 
	willy@infradead.org, liam.howlett@oracle.com, pasha.tatashin@soleen.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	jhubbard@nvidia.com, yuzhao@google.com, vvvvvv@google.com, 
	rostedt@goodmis.org, iamjoonsoo.kim@lge.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kernel-team@android.com, surenb@google.com, 
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>
Content-Type: text/plain; charset="UTF-8"

Add mas_for_each_rev() function to iterate maple tree nodes in reverse
order.

Suggested-by: Liam R. Howlett <Liam.Howlett@Oracle.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/maple_tree.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index c2c11004085e..e7e2caa1a95a 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -592,6 +592,20 @@ static __always_inline void mas_reset(struct ma_state *mas)
 #define mas_for_each(__mas, __entry, __max) \
 	while (((__entry) = mas_find((__mas), (__max))) != NULL)
 
+/**
+ * mas_for_each_rev() - Iterate over a range of the maple tree in reverse order.
+ * @__mas: Maple Tree operation state (maple_state)
+ * @__entry: Entry retrieved from the tree
+ * @__min: minimum index to retrieve from the tree
+ *
+ * When returned, mas->index and mas->last will hold the entire range for the
+ * entry.
+ *
+ * Note: may return the zero entry.
+ */
+#define mas_for_each_rev(__mas, __entry, __min) \
+	while (((__entry) = mas_find_rev((__mas), (__min))) != NULL)
+
 #ifdef CONFIG_DEBUG_MAPLE_TREE
 enum mt_dump_format {
 	mt_dump_dec,
-- 
2.47.0.rc1.288.g06298d1525-goog



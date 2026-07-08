Return-Path: <linux-doc+bounces-95776-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zzJcHomQTmojPgIAu9opvQ
	(envelope-from <linux-doc+bounces-95776-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 20:01:45 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2867E72963D
	for <lists+linux-doc@lfdr.de>; Wed, 08 Jul 2026 20:01:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=nBE7jnVJ;
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-95776-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-95776-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AE723039571
	for <lists+linux-doc@lfdr.de>; Wed,  8 Jul 2026 18:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27A2492514;
	Wed,  8 Jul 2026 18:01:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FCF3BBFAF
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 18:01:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783533695; cv=none; b=HW9IuKxLRiV+qeHP8i0Em8kNt+xdQVGmLiyO51Jl0JpIdgtY4klnnLO9uMbRmwhcKE/uLGv01rPljM5DtNzm9a7dz9dWZmKyJU2J6AI07c0+SM+0eV/NEpqL8l4Y/JO9I+WDBOW7wL6xCteWeN215IpFwgeOd5Hk35aw6KnAdlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783533695; c=relaxed/simple;
	bh=N1S8GOpNY9rJIvCjWYzyBQXGCCBEGOD6GmjSrRHajy0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=otkORKBQtVRqxfzKW8sJFv0EFMm7/+1bqHK2MRylowb5gMt65K4KV3IRDzrT0W0IwySXYr3CfI0+RTcMjHi0qdx/W8BE4I+BbDPzoFYWf9lBzSdLs/zmVRXDQrMzGNcbtLaKN2WUH/oLk91T33sBJruHcmnCGSyy1UlBEytlTok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abhishekbapat.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nBE7jnVJ; arc=none smtp.client-ip=209.85.216.73
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-38827cee19eso126037a91.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 11:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783533694; x=1784138494; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLJpSpD1IM/2/PSTnk3FZM0FGzokCq3B5xO8uzDBMuw=;
        b=nBE7jnVJvGBh5INb3uVEgCyAmwOI1l0e0ZZKc5psWcBvYS68bhetmL3hHvy8CwaKOP
         1yyW7AtTNh0hf1os0gH8hF73fU0yP7P0BmyTU3oywWaovFVPmW9lXoHeCo54wpFsQfCi
         ydXqXFz9QbHLNyLOdHHQ20veLkBRrh9I+9JSz4JWAmJ8LahaS6lZew9PBKayqqpgP9QI
         dUzepWCnuS5xJs8wE0rpdLKljQW1qkaiuzplpSwGESVnLqMM9pr03aCRlFizR33Al2pR
         It3pJ+s00/Hu1/a57wit1O697MQqYpChULp8cFEvc4GooFOBX03H5ciPro+FPEhJuWO5
         TS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783533694; x=1784138494;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NLJpSpD1IM/2/PSTnk3FZM0FGzokCq3B5xO8uzDBMuw=;
        b=FfkNzFSyBu1HwknNBQ79wWOOrZ9DYCwhs14CdHF0bbBpBIlNVNX4lX5HjvUFlBkiQF
         OnJNR66hFZJEOFdRXvn4jWQWimq06EO9i76Y8kRFgiI6R2AT7+JUw3hDSJcMDrC8cNIw
         Txanw158Ge1DwOm/XCxfGwCvdNPqxPB5uaT+M7GxOzPwK95zmoRO8/Oung3K/B+/FnlP
         CJMlxKpkLmLiNNK57aResK7Ji+kKImI9M3rseyGRBQdIjeE1gH1PPuSjO5gV+nabFpQd
         OgMlviZuBJyBsXUHHb5N+emvCE4X0ND6E3uQBiekvhgsTPcKs2wPAfbdx49bC6MQzILK
         1yRg==
X-Forwarded-Encrypted: i=1; AHgh+RrfbNgIDCFd7ZknwNFhoe1tYpBL7dZ/NpueNq1C2Wb1mtk0NEhzwtPm9A6w25kQCHoyCMJbbb0Gufk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTMqPn3GHOKkZPx3AWDURAOcQs8xFt9TRw4X8CbiE9qj9laOgH
	lUneWeo5uHz8XNJxIVGQlLF+iawoQKtCZ1rV5yLG+68kfkPBEJJIUF95ZImAQU3skx0F1QAJDzi
	1HBAneUUzh3+gZ5SU8UCBkh7w2xRzlsKa+Q==
X-Received: from dybgs35.prod.google.com ([2002:a05:7301:20a3:b0:2f9:af7:504e])
 (user=abhishekbapat job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:41:b0:381:2684:519c with SMTP id 98e67ed59e1d1-3893f694d9dmr3449270a91.6.1783533693427;
 Wed, 08 Jul 2026 11:01:33 -0700 (PDT)
Date: Wed,  8 Jul 2026 18:01:26 +0000
In-Reply-To: <cover.1783532853.git.abhishekbapat@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1783532853.git.abhishekbapat@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <396a5e4bc3b2990223ab355f2cd3ceb6aa15499e.1783532853.git.abhishekbapat@google.com>
Subject: [PATCH v8 4/6] alloc_tag: add accuracy based filtering to ioctl
From: Abhishek Bapat <abhishekbapat@google.com>
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Hao Ge <hao.ge@linux.dev>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Sourav Panda <souravpanda@google.com>, Abhishek Bapat <abhishekbapat@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95776-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[abhishekbapat@google.com,linux-doc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:surenb@google.com,m:akpm@linux-foundation.org,m:kent.overstreet@linux.dev,m:hao.ge@linux.dev,m:skhan@linuxfoundation.org,m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:souravpanda@google.com,m:abhishekbapat@google.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhishekbapat@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2867E72963D

Extend the allocinfo filtering mechanism to allow users to filter tags
based on their accuracy.

Signed-off-by: Abhishek Bapat <abhishekbapat@google.com>
Acked-by: Hao Ge <hao.ge@linux.dev>
Acked-by: Suren Baghdasaryan <surenb@google.com>
---
 include/uapi/linux/alloc_tag.h | 4 ++++
 mm/alloc_tag.c                 | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/uapi/linux/alloc_tag.h b/include/uapi/linux/alloc_tag.h
index 0de5fc180790..270f693b1822 100644
--- a/include/uapi/linux/alloc_tag.h
+++ b/include/uapi/linux/alloc_tag.h
@@ -31,6 +31,8 @@ struct allocinfo_tag {
 	char function[ALLOCINFO_STR_SIZE];
 	char filename[ALLOCINFO_STR_SIZE];
 	__u64 lineno;
+	/* filter criteria only; see allocinfo_counter.accurate for actual accuracy */
+	__u64 inaccurate;
 };
 
 /* The alignment ensures 32-bit compatible interfaces are not broken */
@@ -50,6 +52,7 @@ enum {
 	ALLOCINFO_FILTER_FUNCTION,
 	ALLOCINFO_FILTER_FILENAME,
 	ALLOCINFO_FILTER_LINENO,
+	ALLOCINFO_FILTER_INACCURATE,
 	ALLOCINFO_FILTER_MIN_SIZE,
 	ALLOCINFO_FILTER_MAX_SIZE,
 	__ALLOCINFO_FILTER_LAST = ALLOCINFO_FILTER_MAX_SIZE
@@ -59,6 +62,7 @@ enum {
 #define ALLOCINFO_FILTER_MASK_FUNCTION		(1 << ALLOCINFO_FILTER_FUNCTION)
 #define ALLOCINFO_FILTER_MASK_FILENAME		(1 << ALLOCINFO_FILTER_FILENAME)
 #define ALLOCINFO_FILTER_MASK_LINENO		(1 << ALLOCINFO_FILTER_LINENO)
+#define ALLOCINFO_FILTER_MASK_INACCURATE	(1 << ALLOCINFO_FILTER_INACCURATE)
 #define ALLOCINFO_FILTER_MASK_MIN_SIZE		(1 << ALLOCINFO_FILTER_MIN_SIZE)
 #define ALLOCINFO_FILTER_MASK_MAX_SIZE		(1 << ALLOCINFO_FILTER_MAX_SIZE)
 
diff --git a/mm/alloc_tag.c b/mm/alloc_tag.c
index 27aa47c4c1cc..2c819fa9eafa 100644
--- a/mm/alloc_tag.c
+++ b/mm/alloc_tag.c
@@ -252,6 +252,8 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
 			   struct alloc_tag_counters *counters,
 			   bool *fetched_counters)
 {
+	bool inaccurate;
+
 	if (!filter || !filter->mask)
 		return true;
 
@@ -277,6 +279,12 @@ static bool matches_filter(struct codetag *ct, struct allocinfo_filter *filter,
 	    ct->lineno != filter->fields.lineno)
 		return false;
 
+	if (filter->mask & ALLOCINFO_FILTER_MASK_INACCURATE) {
+		inaccurate = !!(ct->flags & CODETAG_FLAG_INACCURATE);
+		if (inaccurate != !!(filter->fields.inaccurate))
+			return false;
+	}
+
 	if (filter->mask & (ALLOCINFO_FILTER_MASK_MIN_SIZE | ALLOCINFO_FILTER_MASK_MAX_SIZE)) {
 		if (!*fetched_counters) {
 			*counters = allocinfo_prefetch_counters(ct);
-- 
2.55.0.795.g602f6c329a-goog



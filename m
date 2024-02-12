Return-Path: <linux-doc+bounces-9031-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EA9851FE3
	for <lists+linux-doc@lfdr.de>; Mon, 12 Feb 2024 22:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D4F2B23EAE
	for <lists+linux-doc@lfdr.de>; Mon, 12 Feb 2024 21:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1311E4E1C4;
	Mon, 12 Feb 2024 21:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M/12o5m4"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42E94CE11
	for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 21:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707773980; cv=none; b=SLO5PquXvRqLCBIfn/aX6R7Out8/vvlvJY4psNl2SzTC4LVRVlkp5REBRhEwix6MHhCMQ6bgsAkA7mesJ1kTpHKt4U2eRD3ZG3pCJcZ0n4VdpegIypJ62gvQ89AYujzVTKH1UN3u7n4QPhGTuwZW65PxwHbE5dAYnMPROmsuXbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707773980; c=relaxed/simple;
	bh=xFlCSB2BhnykCmQeRsN0j73C4UQlJIZav61x4g1IDdg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ChJ27d4Oa6btZa8tHV/PiVQXFXFNpn3oKEsn3cPnzq7HvTCGNhv2qfzypevIVcaiGpuVZ0Jc9uO6vR356pvAXxV0uM5NFcCNlNuv+TghRuMfPiTmfts4gq8NCfHO64x2eK/bEWmc/3qJKAAqTSb3Yd1do0IA4DnbmHbc0qCYmgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M/12o5m4; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-604ab15463aso4568707b3.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 13:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707773977; x=1708378777; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G9b+4SdACUtX02zckFp4W9j//70BE65Et6Qs8xfY7vk=;
        b=M/12o5m4O5L7Cmffsgn+3ctDjJPoIyHgXvE3XohbdSYRip+xxol1RqJnieBh2IzGMa
         IDFtU90EoNVA82v18P0o/JWnTomPM6uY3ZQAPrr4ahvpyZMDM+dStxQlBD5eqVRlffgF
         snXt0E61LpPpNQ+XIhMNHZrgGIQeSOT0H4s4bTt2zOL2BAmWPW0WMIVI3taQ5KYC3WgQ
         vOC0dGwchTHXwYRDyWMILr6gMYkQrxa9+ZQNR3UQzbopOalvnHuoAosmbAWDeNx6txbq
         JjE9mAOFaYIen/RqAR4IL+CSiZDMxLttO3VY8u4Q5LDRwiraX7gghY0g3/Oi96/KNSBW
         02Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707773977; x=1708378777;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9b+4SdACUtX02zckFp4W9j//70BE65Et6Qs8xfY7vk=;
        b=PCRdyORRXH/vXG2ozkKJEWiDR6ONTMkCl/6nf9RkKibJxsZgIqnYQqyBbsic1swhJt
         JasPY29vUJggi8S4A1ANOFo99ysxc03gu1LzzJwRN1ibO8BZMDbyfAVaGx9rcg0PFKTf
         C9eKTkMRYKg6XIQ9VYlryczLwr4yOAzku52ldgZE/scxLRBs0CGB5QrTsTOUKCo8S5Cu
         UeCV4W6IihlIj0AbkaUg3v6dovsYFL4MvJPMLzX1bSSBOExOEH/hpVsv11aYaAJyW+Ik
         MhptGwxjmgcWedDZboNLyE0QWpirFp5vx23/j1MIzq3AwKUeS0h2hFhQiry0O3oDg6sy
         QQTw==
X-Forwarded-Encrypted: i=1; AJvYcCVLCXe8S/HUfrU7WaXP3VAAkkdc90eCPeuztndDlYil5wNpGivyxex/NXSfsYhuoPzSxAh2noHba6YXOGb4jMRwYyfcE7AEesNV
X-Gm-Message-State: AOJu0YyIE/2nEpFmx7VrilpLP/0ZFKhysjOXMoc4+l2XjFX/V9BdIlw1
	k8HTwLJxX6PGxPPUn0J8FGVggQDuLfCOclas6ro+HekK58gPwZwKmFI3shKuAZdxTf24FDa9aJ7
	Wnw==
X-Google-Smtp-Source: AGHT+IEGxw+pumepe2rycJxKPCLRRtMyemZOKJSP2HsBcIOyAk76oq0qhFPUoU2Rl7QOiTv7xvjwgacHnLI=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:b848:2b3f:be49:9cbc])
 (user=surenb job=sendgmr) by 2002:a0d:d495:0:b0:607:7f86:dc24 with SMTP id
 w143-20020a0dd495000000b006077f86dc24mr109272ywd.3.1707773976926; Mon, 12 Feb
 2024 13:39:36 -0800 (PST)
Date: Mon, 12 Feb 2024 13:38:48 -0800
In-Reply-To: <20240212213922.783301-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240212213922.783301-3-surenb@google.com>
Subject: [PATCH v3 02/35] scripts/kallysms: Always include __start and __stop symbols
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, keescook@chromium.org, 
	ndesaulniers@google.com, vvvvvv@google.com, gregkh@linuxfoundation.org, 
	ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, surenb@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Kent Overstreet <kent.overstreet@linux.dev>

These symbols are used to denote section boundaries: by always including
them we can unify loading sections from modules with loading built-in
sections, which leads to some significant cleanup.

Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 scripts/kallsyms.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 653b92f6d4c8..47978efe4797 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -204,6 +204,11 @@ static int symbol_in_range(const struct sym_entry *s,
 	return 0;
 }
 
+static bool string_starts_with(const char *s, const char *prefix)
+{
+	return strncmp(s, prefix, strlen(prefix)) == 0;
+}
+
 static int symbol_valid(const struct sym_entry *s)
 {
 	const char *name = sym_name(s);
@@ -211,6 +216,14 @@ static int symbol_valid(const struct sym_entry *s)
 	/* if --all-symbols is not specified, then symbols outside the text
 	 * and inittext sections are discarded */
 	if (!all_symbols) {
+		/*
+		 * Symbols starting with __start and __stop are used to denote
+		 * section boundaries, and should always be included:
+		 */
+		if (string_starts_with(name, "__start_") ||
+		    string_starts_with(name, "__stop_"))
+			return 1;
+
 		if (symbol_in_range(s, text_ranges,
 				    ARRAY_SIZE(text_ranges)) == 0)
 			return 0;
-- 
2.43.0.687.g38aa6559b0-goog



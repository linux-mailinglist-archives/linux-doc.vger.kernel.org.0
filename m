Return-Path: <linux-doc+bounces-27628-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B626999F8EC
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 23:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E85031C20A93
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 21:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC271FBF67;
	Tue, 15 Oct 2024 21:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3soUHO3B"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB731FBF42
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 21:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027048; cv=none; b=tHIS8gNjU5oibbYm7y5uzs7NtXAPUshE4hYwoo6t6i1rbUGfJa+pOS/UkdkyfYUikYiUw2uev6kw/K5raTT/b0S3GfMshvzz/qESwmNeS1P8ogc/TYKn44bUdr6oOctjhNzlx9IQ/vVRSmyFmOBow3YXykz9sgCYV8RjbUm9/4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027048; c=relaxed/simple;
	bh=OSoPMP8TH1jfd3P9ZF+OhgEsxfXDixx91HnmKCjgVsI=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=EtzrvghWYHuCaAok69b4mNu4LIXhmDbrQ0tLhVg5f43oXtuTfW4Kqys8xCGLlWFQRLfTYI56WdBZdGi4wCTfkHmQSRME3IgZEpT0VjR2YyiBQyKZfZiFlgsCqsA8/3RfKlyks2T1mwmb3rOjEReTC/h5uUlQqTCPepz+g/gJe3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3soUHO3B; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e3d660a2faso6604107b3.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 14:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729027045; x=1729631845; darn=vger.kernel.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qp+83TpI3TezfCC8Dtvl97cBiL4JnurBtXXrj0jn8lw=;
        b=3soUHO3BRJ0A14oseU+SAK0WRchyp9wT10lzPSFCV2lC/6aMNam5Tx/zLTAhRTfdtR
         PZ5+O/LhbvK7RzyXwi0Eth+Rn1p970Eo9Rx+AWgtaOu3HSk3WaIGYpsn+zlCzue+xcTk
         Z7mAtjV6YP3ZPIR+tlOXp+ovypDfaSsTj/8M31WXqWqwW9n3grr9OwvdzktPfiERyO5V
         s/ixvB9ljmt2n72YnsVTA0PryzxJAp+WF3QLIISQD8zDk03A5PcYcZnAzxup96X3S2mb
         Z1UbDCWZMik215lSunHf41Te10Qo1EUikYKOgdPtGXBV9cLBJqrlgv1eoJ3JZA7UAJZP
         qiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729027045; x=1729631845;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qp+83TpI3TezfCC8Dtvl97cBiL4JnurBtXXrj0jn8lw=;
        b=rrpDl+Q5NMhzwnbH1uvMfEcxZJlyvzE4+GVoaFkm1qJ0DJeGeQTPvAdRA1sPoKcVb0
         iHcKd1zPbWLhco8fVww/8PLVHFE7tcTElf76y/mBYp3nq5055xNP3MlFYijpETLlpDQH
         7k7+IX2Vh1RAjuggxytB574RkKevFPshk2E5zEvArwGH2DhqkkB4CAdi1NJnCKx57ata
         q8xCPj785K2n2+5a49fJBrjz8XPNerovJJbBiHad1UTwx+4zeBEbm8zlVJKZyuw1enpK
         d+r3AWbzOapFz6s1EB4i2msSP9V19yocUMOBi5upI8kAWX5OLFJNF4vMGau+bz4I4gpu
         CwsA==
X-Forwarded-Encrypted: i=1; AJvYcCUOTOi4WdadFWI5jtRT3zKBlQfmEaGTPSiufrJZONI9qAaNdNkJ5EmXocP/56z0x8l1Gt/iFvn9Wi4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1l97AH5+4PY8rHATRkoXq5yYH1k+D5Ur2eKthRvRzRnEosDUz
	YDc8eCLaQ+PmbTU+w2akOVZrEpXJGv5ti32uutUMHqpJrQwxFdqhegHVTfLs8/TgsxkzUiawG72
	BhRVCHw==
X-Google-Smtp-Source: AGHT+IEl3NSU1WdQwze6KAXwiH4egozRYT4wu4exGFfYWyRpDzyjB1F5KOwgYO3ID9qtJyh31DrebhRjau2i
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:61a1:4d9d:aca1:ada])
 (user=irogers job=sendgmr) by 2002:a05:690c:7281:b0:6e3:1f46:77a6 with SMTP
 id 00721157ae682-6e3d40a2c01mr388767b3.2.1729027045640; Tue, 15 Oct 2024
 14:17:25 -0700 (PDT)
Date: Tue, 15 Oct 2024 14:17:18 -0700
In-Reply-To: <20241015211719.1152862-1-irogers@google.com>
Message-Id: <20241015211719.1152862-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241015211719.1152862-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Subject: [PATCH v2 2/3] proc_pid_fdinfo.5: Add subsection headers for
 different fd types
From: Ian Rogers <irogers@google.com>
To: Alejandro Colomar <alx@kernel.org>, "G . Branden Robinson" <g.branden.robinson@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-man@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Make the sections about eventfd, epoll, signalfd, inotify, fanotify,
timerfd better separated with a clearer subsection header.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 man/man5/proc_pid_fdinfo.5 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
index 8678caf4a..02eceac04 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -57,6 +57,7 @@ is the ID of the mount containing this file.
 See the description of
 .IR /proc/ pid /mountinfo .
 .RE
+.SS eventfd
 .P
 For eventfd file descriptors (see
 .BR eventfd (2)),
@@ -75,6 +76,7 @@ eventfd\-count:               40
 .P
 .I eventfd\-count
 is the current value of the eventfd counter, in hexadecimal.
+.SS epoll
 .P
 For epoll file descriptors (see
 .BR epoll (7)),
@@ -108,6 +110,7 @@ descriptor.
 The
 .I data
 field is the data value associated with this file descriptor.
+.SS signalfd
 .P
 For signalfd file descriptors (see
 .BR signalfd (2)),
@@ -133,6 +136,7 @@ and
 .BR SIGQUIT ;
 see
 .BR signal (7).)
+.SS inotify
 .P
 For inotify file descriptors (see
 .BR inotify (7)),
@@ -173,6 +177,7 @@ file is exposed as a file handle, via three hexadecimal fields:
 .IR fhandle\-type ,
 and
 .IR f_handle .
+.SS fanotify
 .P
 For fanotify file descriptors (see
 .BR fanotify (7)),
@@ -229,6 +234,7 @@ The mask of events that are ignored for this mark
 .P
 For details on these fields, see
 .BR fanotify_mark (2).
+.SS timerfd
 .P
 For timerfd file descriptors (see
 .BR timerfd (2)),
-- 
2.47.0.rc1.288.g06298d1525-goog



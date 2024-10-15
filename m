Return-Path: <linux-doc+bounces-27614-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 157D299F5C4
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 20:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDBA3281FD4
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 18:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF552203714;
	Tue, 15 Oct 2024 18:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AJQK2qgD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A05E20370A
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 18:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729017529; cv=none; b=rKnyYUfvq8yo0ajlKxwqmtFqQw6OCesFRhdI2rIwUyLjqt+YX+Pyxpw+ObGtVMiIIMJrojmSJXsJ06+855bYtkreof1ueneuOwRi9z/N0sG7lf7NV4FIOQqwzRo2wsrrnXJyADjg8703Ie4egRj44exSGqbSeg6Gz5/0Qtlpq2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729017529; c=relaxed/simple;
	bh=8MGuWEB5tbrhJCDk8NQsTzuWEekwR9zNyjYKIRreNbo=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=E1kX1O/GHfw5R7x2Ted0c7OvnjX+HC4Sk90VzHbs+vh9qF8sLs5W9nJz6xoLJitUuT3TFdA6eKVfQr/uYObgOrTn33QNqREmzYBGYxlolGyvTYW2PxL+ZxPEMwDR3BrSUWmzyBUyY5rwNQeTIVYGBfpS+CQ4iQVBwTCdREl4Af8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AJQK2qgD; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e29135d1d0cso7682094276.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 11:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729017527; x=1729622327; darn=vger.kernel.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Z3Rbrb2Z8GgUdGOPxQ4ICuPuYc4IdHw2IwxB2sqLH4=;
        b=AJQK2qgDpm1vADyRxsrmdRF5Fx+n1T4+gDasQ+sXdElZDilSXNj6NGL7TXCSEUFP35
         V7JoheHLsCPIxpfvEIAZhBSM+3ZGORM1g/++UMHZjUgyM1KzIj0VZlfH1vP7lFv5K7EO
         nBwiI1roxmpMUlca6LpcE+juxtFBF8Mz0yw4ppBiXovbyoDrRR+uAtohwuPqGaBraE9E
         qOv0PaoxohEbprF7BWfr671tL/TzaHdgaBjpMHbcK89vwaG/H17+iikyf9raugN+ZzM7
         z3wvlt+ioRq7tnZAmJyEe/BTd53GeEV+3F1Vr381yd0rM6QvC+2X5hvpfhap2X8FjzeR
         RZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729017527; x=1729622327;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Z3Rbrb2Z8GgUdGOPxQ4ICuPuYc4IdHw2IwxB2sqLH4=;
        b=IjLle9xjf6TDuXxWUNjG5RnPdZwOV6+b/WJhLI0usDg1AZeDmvA71kKNOjAY2GxY2u
         YLXkOner2f0/+lgisCnppILFzTGZwvfJw0qbSbe2qqAPHBqpIwpkhOytwP7Wsx12riXZ
         B6Mt1V+8NdYYvQ0W52GxEAA6gePfA2bpmRgTQrYNx6iJ1LNDCdFC+WFoy8fFRNZoXPT6
         jJrIaY00o2qOtD1LkZA/hTZmkMuDNWaGhvUAqQCFSyKHM73jWvLWps4Kk4Ob9Y7Q5OAl
         fNddH5g6Jgw65HfbXvfRmfgVkEZV4Jk+4d8RECNszKLulEjWs/N1NuvBTIfFCzfs0652
         81OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbkIB374XnZtUnOHea1box8VjBjKyPiBQqetuOZ7ScpgtPtaim1avikcJAqpFfJS3UBE9kGTbwit8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1UTmDWNndEKJ6eXbtQstW4qM0X14Jxbx/0r0EiD5V9VxKCzIL
	H33vhSYg4ai2RFmzzaQuYzRLJaec8tIQhdZ0TNH7XMV5IgUwqSd6SN5TxgoG6YzHlUklGDs6dD4
	3xqTTfQ==
X-Google-Smtp-Source: AGHT+IEUCrsutY0kTkkqMWPEqq/3T+BcT4jT1L0k20dzjwNVEGp74umIyv30/nr5D82bDtqQwPBBUTwEa5Ol
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:61a1:4d9d:aca1:ada])
 (user=irogers job=sendgmr) by 2002:a05:6902:1c3:b0:e28:ee84:e4d8 with SMTP id
 3f1490d57ef6-e29783006b4mr737276.3.1729017527264; Tue, 15 Oct 2024 11:38:47
 -0700 (PDT)
Date: Tue, 15 Oct 2024 11:38:23 -0700
In-Reply-To: <20241015183824.1014964-1-irogers@google.com>
Message-Id: <20241015183824.1014964-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241015183824.1014964-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Subject: [PATCH v1 2/3] proc_pid_fdinfo.5: Add subsection headers for
 different fd types
From: Ian Rogers <irogers@google.com>
To: Alejandro Colomar <alx@kernel.org>
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
index 0c4950d5d..3f90f6bb5 100644
--- a/man/man5/proc_pid_fdinfo.5
+++ b/man/man5/proc_pid_fdinfo.5
@@ -59,6 +59,7 @@ is the ID of the mount containing this file.
 See the description of
 .IR /proc/ pid /mountinfo .
 .RE
+.SS eventfd
 .P
 For eventfd file descriptors (see
 .BR eventfd (2)),
@@ -77,6 +78,7 @@ eventfd\-count:               40
 .P
 .I eventfd\-count
 is the current value of the eventfd counter, in hexadecimal.
+.SS epoll
 .P
 For epoll file descriptors (see
 .BR epoll (7)),
@@ -110,6 +112,7 @@ descriptor.
 The
 .I data
 field is the data value associated with this file descriptor.
+.SS signalfd
 .P
 For signalfd file descriptors (see
 .BR signalfd (2)),
@@ -135,6 +138,7 @@ and
 .BR SIGQUIT ;
 see
 .BR signal (7).)
+.SS inotify
 .P
 For inotify file descriptors (see
 .BR inotify (7)),
@@ -175,6 +179,7 @@ file is exposed as a file handle, via three hexadecimal fields:
 .IR fhandle\-type ,
 and
 .IR f_handle .
+.SS fanotify
 .P
 For fanotify file descriptors (see
 .BR fanotify (7)),
@@ -231,6 +236,7 @@ The mask of events that are ignored for this mark
 .P
 For details on these fields, see
 .BR fanotify_mark (2).
+.SS timerfd
 .P
 For timerfd file descriptors (see
 .BR timerfd (2)),
-- 
2.47.0.rc1.288.g06298d1525-goog



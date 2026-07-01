Return-Path: <linux-doc+bounces-94362-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WiwNFusSRWr/6QoAu9opvQ
	(envelope-from <linux-doc+bounces-94362-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 15:15:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C86B16EDF01
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 15:15:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=snu.ac.kr header.s=google header.b=BXLZ8E4e;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94362-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94362-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=snu.ac.kr;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D1A9C321C8F3
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 12:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1EC48A2A8;
	Wed,  1 Jul 2026 12:55:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B341148A2D4
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 12:55:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910543; cv=none; b=BAnoZOZCb3DhvDEg4Pe9qXWpvMZ9PePUFQS8TYW76dbd4moXRTeFr/yTxjtOh2tYcXC2hICiM+8Y7QcB7iv9W9S6IwhlUVsAuGO+Oc6h5eEPpNAHSEngXwz6Jybt4z133eNjJ5kGTGmk9QZ/XNjsnvNpxjzuxPmJdtu3J3hKhMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910543; c=relaxed/simple;
	bh=GP5ud3FYGexk3LvONhnjx3pFzaiMdPgiR2HQgsZSPaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cPVY8jSD0eWSAMaFUbJxZX35WbQSCFoG5PjzrKcLq2cCdlI7a4HedmOLEiUtE312Q27YVbca0qw7z+/gD+Ughk1HODMCRXx2WaMOekLZb3HgQN4II0TSGU/UoYzZp/AYR1eCKTwRiLzsWm65GAPIw1vphVVRlsXxOMmgzrcZbXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=BXLZ8E4e; arc=none smtp.client-ip=209.85.210.173
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-847a483e344so350602b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 05:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1782910538; x=1783515338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f0fho9hrFIAa3/QOZLqQKmFpEuEFFLQnmQZegyP/hak=;
        b=BXLZ8E4eGV+VIrVRoxIjhXPtRuVogKkP7OYNGimxMe9gv8I1StW3b/BRxG06RyCEbD
         lzG9MAOEmi+Z6KDBooihyTKXROkJnlPZhsyjkrxWEWq0RKyibB8GsON2JQTKVyv3wFUs
         XX9EKRD0z5ocnektC6XQ4Udh4kt/b84H7APgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910538; x=1783515338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0fho9hrFIAa3/QOZLqQKmFpEuEFFLQnmQZegyP/hak=;
        b=BnhMOCDlNnMgtBgjPWhGEEPqCt3gtWd5kP3OmB8jXgfthuFn3ytwGlIR3b20DuJfgg
         EOOSBXuWp9vbaTcLh/ga/nS/fs+pHBNblYQoNLXBAbYslgd9Sf2Pnpjb9G5qWsiZ2Vr0
         fGO68Iw4gPluON7XsQFpR0pDqaeeCYQlQuqUagLs+qe/bHLY5bKGEdyi6a44ch2xIYci
         xm2uhHyEJEGPi33uYA4hnFToZWorym22KyEtYiby5URg5CWbSL+yhRu5y93GQMOOv2C8
         GIKnPNEgfZDiI81PfwrX6EI8zvltBchKUm8YwNr/6YWISWpdYsWNurhjCtHImOVnbnf0
         0GIg==
X-Gm-Message-State: AOJu0YwlO0rtek+4vKB4cPlCx7Qj2P6bxBA7ZdTOR26Y0Npgjv3Jaqdk
	ZolBP3vQoIHqh8iBuIbOXxWfkSPbDe5cvgwgxJZhLlRCB8IM2M3rkrWs8cnH5C21Mv8=
X-Gm-Gg: AfdE7clNYpCVVM34+ia7GqH17uk5pLU7p8ZyNwOEhyCr5uHUydA97p7SAdF+GTQQsQB
	njNcW56JDsr9mYkOC35P/92pY7oFBqakUKXcRj0DtM+BxsUqWNrfxLM/xa+bqZaup+5LJbksftF
	dH6qLDL5IHibIH+dAwFsB0PTHN7t1HS354fD85tC6KwuNK4cNSPdHpYEUZLscgMqLSITpTHjqDh
	bvgUzj5E/GsgOSM5oKXbgL4CspLutdhqaKOLQ+nZ0v+x0Pht+fQxQOs+QP4DNSWnXmSS0+rMjHC
	ZAU5miY3jjMi6DOS4XUftFXx3PjXWBFzHzo78CYhdAD/BcTKZR/j+ymzOPgAq46rnd4sFR9ohh9
	4Ucn5057VRKZe6grJiy92jzeV/DAQ7+VHz97N5KkFKFncgJ1X3NHSY+AnAmzTfBksGbEFwuAIJe
	a1cZIDVN0JIcNp9GRkoIu27G2Ork9KhFt8WjY=
X-Received: by 2002:a05:6a00:2283:b0:842:63f5:d097 with SMTP id d2e1a72fcca58-847a81810bbmr4725967b3a.3.1782910538065;
        Wed, 01 Jul 2026 05:55:38 -0700 (PDT)
Received: from localhost.localdomain ([59.29.41.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a033a079sm3953432b3a.43.2026.07.01.05.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:55:37 -0700 (PDT)
From: Seongjun Hong <hsj0512@snu.ac.kr>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seongjun Hong <hsj0512@snu.ac.kr>
Subject: [PATCH] docs: ABI: README: fix grammatical error
Date: Wed,  1 Jul 2026 12:55:01 +0000
Message-ID: <20260701125501.93170-1-hsj0512@snu.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[snu.ac.kr,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[snu.ac.kr:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94362-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hsj0512@snu.ac.kr,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hsj0512@snu.ac.kr,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[snu.ac.kr:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hsj0512@snu.ac.kr,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C86B16EDF01

The Note describing how to write ABI documentation fields contained
a typo. "The fields should be use a simple notation" should be
"The fields should use a simple notation".

Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
---
 Documentation/ABI/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/README b/Documentation/ABI/README
index 315fffe1f831..27c962e6a872 100644
--- a/Documentation/ABI/README
+++ b/Documentation/ABI/README
@@ -62,7 +62,7 @@ Users:		All users of this interface who wish to be notified when
 
 
 Note:
-   The fields should be use a simple notation, compatible with ReST markup.
+   The fields should use a simple notation, compatible with ReST markup.
    Also, the file **should not** have a top-level index, like::
 
 	===
-- 
2.43.0



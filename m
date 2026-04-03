Return-Path: <linux-doc+bounces-82337-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EE6VLzdcz2kXvgYAu9opvQ
	(envelope-from <linux-doc+bounces-82337-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Apr 2026 08:20:39 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 123B4391622
	for <lists+linux-doc@lfdr.de>; Fri, 03 Apr 2026 08:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 997F0301465E
	for <lists+linux-doc@lfdr.de>; Fri,  3 Apr 2026 06:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404F5372B52;
	Fri,  3 Apr 2026 06:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="SLhQCJSo"
X-Original-To: linux-doc@vger.kernel.org
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F052F26980F;
	Fri,  3 Apr 2026 06:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775197232; cv=none; b=RN/rh7hby59RsJ52WwyDDZcQZw/917/htkCAPaxuqIY257TTecEzashjzEQeHgHxZj55lEaXKZLyQQyAOQyjoWJXWwTEkpjB515lcCvoCiy32EfntsgH/R5S0nzP0cwH6KzqxgZeWwNd0v5nfeaxEBpmBMLVwIQCOV4/vSHRRQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775197232; c=relaxed/simple;
	bh=lYbGhSOqqQUEwZE0acX2UVUvqowOH0oH6Xm9dt/EAm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tssSBgPti/W58Vya1y69sm8iRZ3YRSAtUxGw75Yn72TeES69/fQzo93+tIKOQ8Xv26GSd/Fre9bDt5nMsVOZForm4RtzUdnnX//jFAv0JBKM1xWq9VTkDcOXlcwnHMqbBwmI+W11YpJesa9vodqr7IX3deQb3YIqcv3OZ2dvUU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=SLhQCJSo; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1775197220; bh=FV+TU1qQ5cdhGH80pRimkZ1mbKexd6nCcdrKQzpzcW0=;
	h=From:Message-ID:From;
	b=SLhQCJSoX4BpEWe2oExGeo6SGZIA992pHUJw+I67U2nX8pdpdqa/nWuLx7rzijd76
	 bTRJ8z40PXO8O8B3MG+29DijDwpJOedeVzLUQbuXSeRXHWvrKGqAvgWofTPGc8XaGQ
	 /XnLxWAIr7y7vaOXPGY4/CSbsIlJsdVtcfHyilf8=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 229CFC0AAF;
	Fri, 03 Apr 2026 08:20:20 +0200 (CEST)
From: Willy Tarreau <w@1wt.eu>
To: greg@kroah.com
Cc: edumazet@google.com, rdunlap@infradead.org,
        Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: [PATCH v2 1/3] Documentation: minor updates to the security contacts
Date: Fri,  3 Apr 2026 08:20:16 +0200
Message-ID: <20260403062018.31080-2-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260403062018.31080-1-w@1wt.eu>
References: <20260403062018.31080-1-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[1wt.eu,none];
	R_DKIM_ALLOW(-0.20)[1wt.eu:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-82337-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[w@1wt.eu,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[1wt.eu:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 123B4391622
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This clarifies the fact that the bug reporters must use a valid
e-mail address to send their report, and that the security team
assists developers working on a fix but doesn't always produce
fixes on its own.

Cc: Eric Dumazet <edumazet@google.com>
Cc: Greg KH <greg@kroah.com>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index c0cf93e11565..da7937fd59df 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -8,6 +8,10 @@ like to know when a security bug is found so that it can be fixed and
 disclosed as quickly as possible.  Please report security bugs to the
 Linux kernel security team.
 
+Reports are to be sent over e-mail exclusively.  Please use a working e-mail
+address, preferably the same that you want to appear in ``Reported-by`` tags
+if any.  If unsure, send your report to yourself first.
+
 The security team and maintainers almost always require additional
 information beyond what was initially provided in a report and rely on
 active and efficient collaboration with the reporter to perform further
@@ -27,11 +31,9 @@ made public.
 
 The Linux kernel security team can be contacted by email at
 <security@kernel.org>.  This is a private list of security officers
-who will help verify the bug report and develop and release a fix.
-If you already have a fix, please include it with your report, as
-that can speed up the process considerably.  It is possible that the
-security team will bring in extra help from area maintainers to
-understand and fix the security vulnerability.
+who will help verify the bug report and assist developers working on a fix.
+It is possible that the security team will bring in extra help from area
+maintainers to understand and fix the security vulnerability.
 
 Please send **plain text** emails without attachments where possible.
 It is much harder to have a context-quoted discussion about a complex
-- 
2.52.0



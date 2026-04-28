Return-Path: <linux-doc+bounces-84903-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOv6Nvdj8GkRSwEAu9opvQ
	(envelope-from <linux-doc+bounces-84903-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 09:38:31 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F2747F033
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 09:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 87CEB3017277
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 07:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68DAE3E122B;
	Tue, 28 Apr 2026 07:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2rNhabJ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A703D5225
	for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 07:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777360979; cv=none; b=P5k8B7ENC+IRRIPdbTbO6ixMidpOA6c3KpD5ZLNyCtSGPi/693/2LzbHfrNLH9bB0KIsHhrUvyTtALa0+6UJv2GK4RdX6PanPJjlNiJGGaiGyaIO7r6Z7PRzyPL1jql11DpxttyKlgb+pjIq4OXO7EZTQal5SlDAjj9vHj65jQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777360979; c=relaxed/simple;
	bh=nQ0l0v8QwkAEUHIVGi1F3XLMUl9VbcGD5+44pIincio=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CcjNGSwXmkJrGoBWsRtNS5MI142WC7LfPZAYesOKtuYtYfAK6dc2uVgEG1en7IGzVJObUqwd1wk0AB64FIjmkV4oox+7kKezVi2o92WV015q8AWA+UbaRCb2+iabirMaaXL1wVS7/FTAQVC0bJh+voigAvCmuhDa8WEbS7EDhKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2rNhabJ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c70fb6aa323so3871356a12.3
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 00:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777360977; x=1777965777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61aubxBpXGNItnK0rmG7NJew4PyO0rQkGOgFEHhhdGI=;
        b=b2rNhabJz3/XP0re4pSsJXxl2zLgrpFWVpcs+3fSvQZixTocnCoITXRpjy3JgvSkmf
         TbVdZQjwXMlNGRAqoK9PBybWcgbkCknVMrjHfpl0s+ASlh/QGx8HQ8XdvjUjxWLX5qAc
         pFyac84VOK3c3bodgi5L2NFOCS6metrF8Ai2dy5AGaoFhPvKfxk1vYsxNwPcPNOiougU
         PKveAp7Pz2Wccbwccsdlf3NH2MaAJ1SRJwuQvqOUyU/7UDErkXn6se/xYn2vmsbjOmHI
         nSEeBlfdxNyamVaF9aFAi1W7PmmY0czpV4s4+1lF+SgRpJ7DSnZg0+fO0k0IXibku+9+
         XfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777360977; x=1777965777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=61aubxBpXGNItnK0rmG7NJew4PyO0rQkGOgFEHhhdGI=;
        b=s732vFMGUu6hJdtrqmQssEqtuk2bR+VCb1JpVuj45alXLWK4+18CF9rZLt11kYn1+W
         LtZmhXsQUYwVPOq77ft7UHywcSl2f35OOsXnmtuVYXOAVQ9hDBeuQ9pO7t5EvevM47Bm
         lbn2KTGeJ5F4mm64zPhldJ0/A7Pd8/hW4rylx+IshI2ET9UGH2QpDMF0tf77u0st8b6O
         L0+3qiusOcYpwgv5D4yyYg8sqWSbUvzfI/XGaP60GRe3JB8RIFJp+9yScTH+k0s4tXg3
         K9XuqYz2q/yrWat7kiv1SCiEhFNJx8zIb1CEJyozn8d0jMBXDSzyYPKU85JmWLfAmV9W
         0cbw==
X-Forwarded-Encrypted: i=1; AFNElJ8KATvBYoeO4++tULwF1cbbKsUDUsYXXDd+C4KoCXKncm4iGfExiqZMhsRVFuRYxGtjjHIBlk2QNKE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw12MpvQrOZFjbx2tvmdgTct4H4y/5M36kx3mAhHRlpA1BnWufP
	elDot+Sv2DZNYzmqTUWaKISAbGmaCtA6tED/j9b4MxLs1XwkGqZGCiAk
X-Gm-Gg: AeBDieuVJXb6D2h3fWPHQxNmTSpSoRXP2n64RXkwqk2xau4UVbQt0l6qL3lryhAcHWt
	20onMNCpalBhaukLdwjyzzXoHk9tROnE2ROzQKec/Y/uwyXhsQIxlJOdtu1aFTdimmV7i3tZrBj
	98m0nbn2dbY9lUEbwfLAp6XrFtOlVKiawWhccgaoio3Ok0cfY/c8TW0p/keYMZH8y7/YrO8PTFI
	JkMs3VYZD7SCa5x1gBK9Ui2BmyISnlSfckuWvOVCvucE6smnreG/BN8GGbcI2gOswk83j7rPHYK
	Xqmqcz2FYt4F3DuZaUxUcjzBvDTCYHlXjuwJzu2s1/RnNf6wqBC7pd40KBo85Msa1wLsqUyVCwC
	ahQ91zxeFbZK060ff4O+is8s4qJyypJFd/H3lmoM/v9CFTZlb3TWpBIelKTtmAD+Bbdi1szjOn/
	/zSBlwMWdi++6GEZczVMyrnxlKaa1lqOVVphq1p4dSAo+RQ3Qnfdzaaz1cS+g=
X-Received: by 2002:a05:6a20:728f:b0:39b:dea7:5624 with SMTP id adf61e73a8af0-3a39c2c0199mr2413857637.47.1777360977326;
        Tue, 28 Apr 2026 00:22:57 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fc299f3d1sm1386025a12.4.2026.04.28.00.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 00:22:56 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: corbet@lwn.net,
	tj@kernel.org,
	hannes@cmpxchg.org,
	mkoutny@suse.com
Cc: roman.gushchin@linux.dev,
	brauner@kernel.org,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: [PATCH] Documentation/cgroup-v2: warn about cgroup.kill / cgroup.freeze delegation
Date: Tue, 28 Apr 2026 15:22:51 +0800
Message-Id: <20260428072251.2464314-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ftvtv7lv6gh6tfzabant74ncmtqjuljr3xfjxn5evaehwzhy56@kuf4jiwchuie>
References: <ftvtv7lv6gh6tfzabant74ncmtqjuljr3xfjxn5evaehwzhy56@kuf4jiwchuie>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 75F2747F033
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-84903-lists,linux-doc=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maoyixietju@gmail.com,linux-doc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ntu.edu.sg:email]

From: Maoyi Xie <maoyi.xie@ntu.edu.sg>

cgroup.kill and cgroup.freeze act on every process in the cgroup
or its descendants without checking the writer's signal authority
over those processes. Delegating either file (by chown, or by
passing an open file descriptor) therefore grants the recipient
unconditional kill or freeze authority over whatever ends up in the
subtree.

This works as intended: the files are deliberate "delegated control"
knobs, and the standard signal-permission rules of kill(2) and
SIGSTOP do not apply. The current text in
Documentation/admin-guide/cgroup-v2.rst describes the behaviour of
cgroup.kill and cgroup.freeze in functional terms but does not flag
the delegation footgun, which makes it easy for runtime authors to
hand the files to a less-privileged user without realising the
implications.

Add a paragraph to each section explicitly calling out the
delegation contract and the open-FD equivalence, so runtime authors
have a single place to read the rule before deciding whether to
chown or pass FDs to these files.

No code change.

Suggested-by: Michal Koutný <mkoutny@suse.com>
Signed-off-by: Maoyi Xie <maoyi.xie@ntu.edu.sg>
---
 Documentation/admin-guide/cgroup-v2.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 91beaa679..6013e2d1d 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1048,6 +1048,15 @@ All cgroup core files are prefixed with "cgroup."
 	it's possible to delete a frozen (and empty) cgroup, as well as
 	create new sub-cgroups.
 
+	A write to cgroup.freeze affects every process currently in the
+	cgroup or its descendants regardless of the writer's signal
+	authority over those processes. The file therefore acts as a
+	delegated stop knob: chowning it, or passing an open file
+	descriptor to it, grants the recipient unconditional freeze
+	authority over whatever lands in the subtree. Runtime authors
+	should not delegate cgroup.freeze outside of the trust boundary
+	of the cgroup itself.
+
   cgroup.kill
 	A write-only single value file which exists in non-root cgroups.
 	The only allowed value is "1".
@@ -1063,6 +1072,15 @@ All cgroup core files are prefixed with "cgroup."
 	killing cgroups is a process directed operation, i.e. it affects
 	the whole thread-group.
 
+	A write to cgroup.kill sends SIGKILL to every process currently
+	in the cgroup or its descendants regardless of the writer's
+	signal authority over those processes. The file therefore acts
+	as a delegated kill knob: chowning it, or passing an open file
+	descriptor to it, grants the recipient unconditional kill
+	authority over whatever lands in the subtree. Runtime authors
+	should not delegate cgroup.kill outside of the trust boundary
+	of the cgroup itself.
+
   cgroup.pressure
 	A read-write single value file that allowed values are "0" and "1".
 	The default is "1".
-- 
2.34.1



Return-Path: <linux-doc+bounces-73881-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPx6LlZddGn44wAAu9opvQ
	(envelope-from <linux-doc+bounces-73881-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jan 2026 06:49:10 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D82CE7C953
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jan 2026 06:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E50F30087B2
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jan 2026 05:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F63D286A9;
	Sat, 24 Jan 2026 05:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXS4nOW6"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6603EBF20;
	Sat, 24 Jan 2026 05:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769233747; cv=none; b=szGIqZULAED0Qp+0lVlcL/e77LseTsACajdSEKo33BYf0+/lux2TElBhzY8AfcgKhKFnialKzr1Eso5cDaIieo3jQrswmSIIGK075fcCImI6BW9/dne607rZvwl5WSpzqY2nY9sx7LhpEOSE1cxiv0VC4qntkToD1PN90O1N2JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769233747; c=relaxed/simple;
	bh=uKaFqd9iaOY/kQ4XE1EMq4WRMG0e9Da/8HBH36KVzyA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nDewV2DqUSE2YqoPJ1UG+ayGFU//dTNNTNXQLKX98lL66Tx0O/ji+O9BOtG+9AycyvoF2ih/u6jZjBTvRpoSiAiAtxbYTO4WuN14K6WaRVb0GiY/W1b45AfbGsYZMDikvotTFhjwrKj8VtM3kWk93Ic9Zft94l1XcNpyCCVqhxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXS4nOW6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AD08C116D0;
	Sat, 24 Jan 2026 05:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769233747;
	bh=uKaFqd9iaOY/kQ4XE1EMq4WRMG0e9Da/8HBH36KVzyA=;
	h=From:To:Cc:Subject:Date:From;
	b=UXS4nOW6Q5Gn+EhC5Ocp+nWmdGb6MOBTY5aV+0cB3PG0Bszymt2TRdBVGA4PwU+Qt
	 wjPHGAkxqa4+O6DaOrn4xAtmIiI2NoZienmbas7R70msvvfpDVkW1ztsxXl6r1J4fr
	 XXG9nvDhEJDWm7le4RWmoKIaxRg1mnchixD9bBvProeBCG7sOtnTJxdFHPuGni+v7W
	 LkwjX26UFm6kguJhOKEf7zvPAa88FcgS5tMVZ6B39E6xFn1lQolKbBSVXxm/MIxi+3
	 BPXQ0+KkklVvinBKmWTFERQnRQMZcX9ePFRJoMQvnYssNyBAX0sFozr9/RDe4JQ152
	 B7tx9f94S0cxQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vjWW9-00000006m8H-04O8;
	Sat, 24 Jan 2026 06:49:05 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] docs: kdoc: Fix pdfdocs build for tools
Date: Sat, 24 Jan 2026 06:48:41 +0100
Message-ID: <1a60aea3155a2e7c5e7bb004952739652407fb8c.1769233717.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lwn.net,infradead.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-73881-lists,linux-doc=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D82CE7C953
X-Rspamd-Action: no action

the "\1" inside a docstring requires proper scaping to not be
considered a hex character and break the build.

Reported-by: Akira Yokosawa <akiyks@gmail.com>
Closes: https://lore.kernel.org/linux-doc/63e99049-cc72-4156-83af-414fdde34312@gmail.com/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_re.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_re.py b/tools/lib/python/kdoc/kdoc_re.py
index 2816bd9f90f8..dae5a9136fbf 100644
--- a/tools/lib/python/kdoc/kdoc_re.py
+++ b/tools/lib/python/kdoc/kdoc_re.py
@@ -228,7 +228,7 @@ class NestedMatch:
             yield line[t[0]:t[2]]
 
     def sub(self, regex, sub, line, count=0):
-        """
+        r"""
         This is similar to re.sub:
 
         It matches a regex that it is followed by a delimiter,
-- 
2.52.0



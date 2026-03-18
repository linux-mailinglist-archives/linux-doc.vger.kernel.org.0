Return-Path: <linux-doc+bounces-79922-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ElCLYtsumnRWQIAu9opvQ
	(envelope-from <linux-doc+bounces-79922-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 10:12:43 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFB52B8BA3
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 10:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 393E73012AB3
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 09:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160893A4F51;
	Wed, 18 Mar 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HL2UW/VL"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83353A0E97;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825080; cv=none; b=CLI6qUD7GXrkeQHcO6k2kajEphoEhRH03Wgu04RFlxUZIVQzQzQvqMmO9Gi3Reh4zc4EFiHL3rwCL8lpldZc/nNsMXYwmnEdRc1uNT30+7dDo1rB6ADuHOqMAQLUarLrAZL4OmWTy5mKcWCKOXLxIsVQnBUicGodbsthapRar+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825080; c=relaxed/simple;
	bh=AAPYRL9TsMZyc+GIhj1XbUNzHeUMbGSOeGZaFrRqYP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YcglbWadyhEnlrLDpt6ZM85k06kky6Uy6t0Sbu/nfVS3JuTcDlwV6dVMYANFAqSd+/2RT0RU+8gbwwWBURYBE7K52QeoM3TXnVDT2eTcLpdfE8+0AyS/k/Oc71HE+KHScBlg+uIQ9koL9Il2STapZHAFVWGoTCahcE29+3i0A0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HL2UW/VL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60FE5C2BC9E;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825080;
	bh=AAPYRL9TsMZyc+GIhj1XbUNzHeUMbGSOeGZaFrRqYP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HL2UW/VLyWqk+knswcCgB2EgmCsl8ohPLqkxv08I+DVuNW8WoyMqAK/ubknH2fjXU
	 qpnWmM/xXkZoWk19XTLPbTlUD2QZ54Q4F4rv0H9hCSiYVMXr6R4oZyt/hAm1aJeFd+
	 atOv00AonrmFLSgGzZQA15pb53wr7e81bJeHOR9KLRwDdB+q7qUe75kSfGQRQ0jsp5
	 HWi/AIPBhw9C+s1Zg7y9f1h++fuYuV4xlghIXosIHEj0Ntpm2D8FURloial8nLBnPk
	 3E4L3Ht2z8M9t3dJpQAw+yjiAempVytRiuxoOF1hReeHBeBZnIP8JRlXpgMZFylEel
	 bIdCLJzhSfueQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2mvu-00000002fpN-258r;
	Wed, 18 Mar 2026 10:11:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 02/14] docs: kdoc_re: better represent long regular expressions
Date: Wed, 18 Mar 2026 10:11:02 +0100
Message-ID: <60c264a9d277fed655b1a62df2195562c8596090.1773823995.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773823995.git.mchehab+huawei@kernel.org>
References: <cover.1773823995.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-79922-lists,linux-doc=lfdr.de,huawei];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BFFB52B8BA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Sphinx output from autodoc doesn't automatically break long
lines, except on spaces.

Change KernRe __repr__() to break the pattern on multiple strings,
each one with a maximum limit of 60 characters.

With that, documentation output for KernRe should now be displayable,
even on long strings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_re.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_re.py b/tools/lib/python/kdoc/kdoc_re.py
index 6f3ae28859ea..28292efe25a2 100644
--- a/tools/lib/python/kdoc/kdoc_re.py
+++ b/tools/lib/python/kdoc/kdoc_re.py
@@ -70,10 +70,15 @@ class KernRe:
 
         flags_name = " | ".join(flags)
 
+        max_len = 60
+        pattern = ""
+        for pos in range(0, len(self.regex.pattern), max_len):
+            pattern += '"' + self.regex.pattern[pos:max_len + pos] + '" '
+
         if flags_name:
-            return f'KernRe("{self.regex.pattern}", {flags_name})'
+            return f'KernRe({pattern}, {flags_name})'
         else:
-            return f'KernRe("{self.regex.pattern}")'
+            return f'KernRe({pattern})'
 
     def __add__(self, other):
         """
-- 
2.53.0



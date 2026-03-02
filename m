Return-Path: <linux-doc+bounces-77595-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oE7gDTy/pWknFgAAu9opvQ
	(envelope-from <linux-doc+bounces-77595-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 02 Mar 2026 17:47:56 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AD21DD32E
	for <lists+linux-doc@lfdr.de>; Mon, 02 Mar 2026 17:47:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 775C630CAD4D
	for <lists+linux-doc@lfdr.de>; Mon,  2 Mar 2026 16:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4638421A13;
	Mon,  2 Mar 2026 16:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMgepz2i"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A089635CBD7;
	Mon,  2 Mar 2026 16:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469669; cv=none; b=YJfV3w/bgGAG4JLOHlnYjQqbFSn5+7mfETNJyaeKhTJKvIhZSiSDuyOrXpwjy1HWBfZ6qRAsdhbhNm4cTriX4nCjwbsPhF8IZW53BR86hTSycqUmLRMKQ/am5gwN2kwOH2AqIZo58i2sV6DRBprVTWQTFuacFSbgV0PdTVHC4SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469669; c=relaxed/simple;
	bh=Mq94eCCs+RKATmleknUccsvrIqNogkHHQ1NGR1scPL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IjnmaZNyx9YzKDM+5pITQps71U7CuE1hiKumkvXRa9fqpKdwdbl+0hKhcI/6PWaAGDjW4ycOT7oydxSUMbCMiAReqGyf0oZVTIBWQiUEsxL+LWynD0hsiw9oTKBkV357I8RBazD/2G/5blJTifzlI5Q1tgvaP2YJm6Fka3akhx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMgepz2i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70318C19423;
	Mon,  2 Mar 2026 16:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772469669;
	bh=Mq94eCCs+RKATmleknUccsvrIqNogkHHQ1NGR1scPL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fMgepz2ijwJ2lQZdNDNyl/x7TVksfnAOjg5d/9XXaeFFNnJY4mPW+RTQDK9BFAp8J
	 RSzo7c1VNJGZsymdwr3Hotm7sbyvt7/++jmjR4bJNjXD9Uzfi4/EGOyVjfqbXRJly4
	 oVc7v0l2WTZOrg0YRc+ehvx2wu6rgiJdJ1nG6+WMPtU1kgVHRq4nzehLfF6fiZo5qs
	 4yTuxkcMKvsDcMP28k8oa6kopTamVnNjJwwP0/b4yJQ1/k5Afe6w4WE4K+UO1s4Uzp
	 ozSIStTLFXRk4PTKnqse1CZamCsCc0wvVVpAyWeiCmP7SF2Q1OBICmxWcuhzxsxQE5
	 PqDLAZon2rz3A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vx6KQ-000000002x1-3bCs;
	Mon, 02 Mar 2026 17:41:06 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 01/18] docs: kdoc_re: add support for groups()
Date: Mon,  2 Mar 2026 17:40:44 +0100
Message-ID: <20d1a9c77200e28cc2ff1d6122635c43f8ba6a71.1772469446.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772469446.git.mchehab+huawei@kernel.org>
References: <cover.1772469446.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Rspamd-Queue-Id: 87AD21DD32E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-77595-lists,linux-doc=lfdr.de,huawei];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Action: no action

Add an equivalent to re groups() method.
This is useful on debug messages.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
---
 tools/lib/python/kdoc/kdoc_re.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/lib/python/kdoc/kdoc_re.py b/tools/lib/python/kdoc/kdoc_re.py
index 0bf9e01cdc57..774dd747ecb0 100644
--- a/tools/lib/python/kdoc/kdoc_re.py
+++ b/tools/lib/python/kdoc/kdoc_re.py
@@ -106,6 +106,13 @@ class KernRe:
 
         return self.last_match.group(num)
 
+    def groups(self):
+        """
+        Returns the group results of the last match
+        """
+
+        return self.last_match.groups()
+
 
 class NestedMatch:
     """
-- 
2.52.0



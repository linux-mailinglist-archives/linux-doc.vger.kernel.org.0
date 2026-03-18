Return-Path: <linux-doc+bounces-79923-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCNbIWNsumnRWQIAu9opvQ
	(envelope-from <linux-doc+bounces-79923-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 10:12:03 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA522B8B6F
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 10:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA5393035F67
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 09:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BEE3A63E8;
	Wed, 18 Mar 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W27qKi6o"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D0D3A0B31;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825080; cv=none; b=rk5TNm7ol9ZctVihre1ctYkSK4t8kOsbDEfkvFxnUQR+9Sim/hbw+9dg3XB8j6c72ngSfdnH0ppEves/f9WVxGBa12WxdICMyowr4IoQzc/3Dhij270WSpZqm2AJcFBI4CV8Iwb/GSRZvRj7xk6spuMhlSN7n+5YO+gs/FoXHbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825080; c=relaxed/simple;
	bh=XRb9wdHvGdnLc5i1pCfLDXwMgE/fB9jkCFBFCvRmepQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gmhC330P0vHCjXsKLRxI3ocCxAaep9EIgcOXses+9Xy15rOmP1WKPJQQtclKhKrskhwkRhbiBATqleAzJfPDAZkyJmTPHpEiMbYm+QjMQp7ydlG4h5726kIeT/5qxArL3MEuizMR7RqJJO89qZKj5N2lGM/3r/kwG74vfd1z1Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W27qKi6o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63431C2BCAF;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825080;
	bh=XRb9wdHvGdnLc5i1pCfLDXwMgE/fB9jkCFBFCvRmepQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W27qKi6oYog/DKduY2jn35lbmNzVyIsQg9G+h2aEp1KRr4dEAhhrlpxM1TwZL8y/0
	 Jn1dW8AFsJrsg7UGhCRkmK0+DwBQAPZQMM/OmI1w3lXAkuPpCAKhGMPRQ4tbMRf5Es
	 o9iWo3+0yOHQIfwSvUn7FVdSrOy+2geLYSA815Re/Fh0XvFPdqq2mUly5cbA1V8Xri
	 EwLbjVaHg09e4I38AsXgwDc3qLDroZhvb2ksgOKVx7qmAPVHBNeKbzdXyLIXtnqnOZ
	 6vPCisvmIcwacSZkrThEZZmgThO16ZNb+U0ohg+eCMEi8KajjGso7YNc/zOWbox/X/
	 s3GJnc7SPZZtg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2mvu-00000002fpe-2XP9;
	Wed, 18 Mar 2026 10:11:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 06/14] docs: kdoc_item: fix initial value for parameterdesc_start_lines
Date: Wed, 18 Mar 2026 10:11:06 +0100
Message-ID: <1b4ea24dd4cd82e6711e9be80168684427d74c30.1773823995.git.mchehab+huawei@kernel.org>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-79923-lists,linux-doc=lfdr.de,huawei];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: 4BA522B8B6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ensure that parameterdesc_start_lines is a dict at init time,
as this is how it will be set later on at the parser.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_item.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/kdoc_item.py b/tools/lib/python/kdoc/kdoc_item.py
index 2b8a93f79716..c0585cdbcbd1 100644
--- a/tools/lib/python/kdoc/kdoc_item.py
+++ b/tools/lib/python/kdoc/kdoc_item.py
@@ -22,7 +22,7 @@ class KdocItem:
         self.sections = {}
         self.sections_start_lines = {}
         self.parameterlist = []
-        self.parameterdesc_start_lines = []
+        self.parameterdesc_start_lines = {}
         self.parameterdescs = {}
         self.parametertypes = {}
         #
-- 
2.53.0



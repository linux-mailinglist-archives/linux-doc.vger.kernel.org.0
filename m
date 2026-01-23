Return-Path: <linux-doc+bounces-73849-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHRGJJfFc2kpygAAu9opvQ
	(envelope-from <linux-doc+bounces-73849-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 23 Jan 2026 20:01:43 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8464379ED4
	for <lists+linux-doc@lfdr.de>; Fri, 23 Jan 2026 20:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8491930015BF
	for <lists+linux-doc@lfdr.de>; Fri, 23 Jan 2026 19:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FF983EBF3C;
	Fri, 23 Jan 2026 19:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XJqqBSth"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F433EBF37
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 19:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769194896; cv=none; b=EyOlH6kiXmbdm/ehwVK+EFVFHGqUFk3X3XoyeElAqA1/aC5AY74qjDNYE9Avw9ZvkeGhUq+BC6Mu5mWfVBfrrqhZxDScc/C6dEX10BXL3YzcqvPTbM5LaQ3F3Dw3/xsMCmv44mueB58NZPhgjtXjyt7MosaPEWrWCpml16Czwp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769194896; c=relaxed/simple;
	bh=Zm/vwgaminkUpxHUUuRqBnymJ2OG4uYcKQhb8n+aI60=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GhWvzodkDVzUlWv4pOUW85eAAczwnZuXaPPf6274NMm7fY0NC/uxaJi/k+/EFZplbAlyRl6Rf0iMAGNm7nks8VCK9CJY57mpcK6Q0MnWdcJ7ISB8IevlMSpuwprieyglcoGsIozFDWz4p072Gp87mkRhITY5JV7R/hGR8T8gSA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XJqqBSth; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8A04240C3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1769194894; bh=AhXq9HCyk7AdP0zFTgPJOI4+nQA/JGT36FlVD0OmzoY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XJqqBSthFSAyNgQtYo1aSwHiPuzIUGgq3M5LIH6P1YRQuheTihKFy8cdB0vFcVis+
	 zIPK9V0cizZxDWswRllzBxcD1TVehMnh+SNKjECXfjPxRC0Tyj8myz8M55eDXrVPeJ
	 HsTVoM3v+l0x+X/xdb8THopiEl52quPcAS3/0HX6aKcKG2klLpyKqHJ9J0r0fr5R7r
	 lzY+/fpZ1Gp3C79CtunTYis8IPgoIE2HbTsVQg3P+tvuNz2MqB4XGAMHSYB6xWuDym
	 KT2Sme1Y3q8YHjPNs6SXBwFarSwc/rsFgFxokFVgdp2qb9/mzf+qjY2vNditbcyOls
	 Nl2C0bHzOFHpg==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8A04240C3E;
	Fri, 23 Jan 2026 19:01:34 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jani Nikula <jani.nikula@intel.com>, linux-doc@vger.kernel.org
Cc: Jani Nikula <jani.nikula@intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] Documentation: use a source-read extension for the
 index link boilerplate
In-Reply-To: <20260123143149.2024303-1-jani.nikula@intel.com>
References: <20260123143149.2024303-1-jani.nikula@intel.com>
Date: Fri, 23 Jan 2026 12:01:33 -0700
Message-ID: <87cy3017ci.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-73849-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid,intel.com:email,conf.py:url]
X-Rspamd-Queue-Id: 8464379ED4
X-Rspamd-Action: no action

Jani Nikula <jani.nikula@intel.com> writes:

> The root document usually has a special :ref:`genindex` link to the
> generated index. This is also the case for Documentation/index.rst. The
> other index.rst files deeper in the directory hierarchy usually don't.
>
> For SPHINXDIRS builds, the root document isn't Documentation/index.rst,
> but some other index.rst in the hierarchy. Currently they have a
> ".. only::" block to add the index link when doing SPHINXDIRS html
> builds.
>
> This is obviously very tedious and repetitive. The link is also added to
> all index.rst files in the hierarchy for SPHINXDIRS builds, not just the
> root document.
>
> Put the boilerplate in a sphinx-includes/subproject-index.rst file, and
> include it at the end of the root document for subproject builds in an
> ad-hoc source-read extension defined in conf.py.
>
> For now, keep having the boilerplate in translations, because this
> approach currently doesn't cover translated index link headers.
[...]
>  101 files changed, 30 insertions(+), 685 deletions(-)

Whee ... I do like that!

This patch, when applied after Mauro's massive python-doc series, causes
the build to crash, since he renamed "doctree".  So I've taken the
liberty of applying it with this tweak.

Thanks,

jon

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 74ae78b6c510..7e246101630f 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -595,7 +595,7 @@ def add_subproject_index(app, docname, content):
 
     # Add the index link at the root of translations, but not at the root of
     # individual translations. They have their own language specific links.
-    rel = os.path.relpath(app.srcdir, start=doctree).split('/')
+    rel = os.path.relpath(app.srcdir, start=kern_doc_dir).split('/')
     if rel[0] == 'translations' and len(rel) > 1:
         return
 
@@ -604,7 +604,7 @@ def add_subproject_index(app, docname, content):
         return
 
     # The include directive needs a relative path from the srcdir
-    rel = os.path.relpath(os.path.join(doctree, 'sphinx-includes/subproject-index.rst'), start=app.srcdir)
+    rel = os.path.relpath(os.path.join(kern_doc_dir, 'sphinx-includes/subproject-index.rst'), start=app.srcdir)
 
     content[0] += f'\n.. include:: {rel}\n\n'
 


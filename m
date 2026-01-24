Return-Path: <linux-doc+bounces-73882-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id W1cjHYxedGkt5AAAu9opvQ
	(envelope-from <linux-doc+bounces-73882-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jan 2026 06:54:20 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 023D87C968
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jan 2026 06:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F055430041FB
	for <lists+linux-doc@lfdr.de>; Sat, 24 Jan 2026 05:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4626118DF9D;
	Sat, 24 Jan 2026 05:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBG/DWnI"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2222A286A9;
	Sat, 24 Jan 2026 05:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769234055; cv=none; b=ALkL2WfUceWvENf3uMV0AQ11Xmo3EagBFJ/kLEkd3b3VkeOOVX3lTcmtuE3UTyZH51apQgXGOy81sXJEraUglNSMdZd2p6gSdjDMw7Y1wbEiWt6fV5Od1MEtu03uyGb51RQNFWfeogpR2USZKGrBtgcNqsBA561D58JX6OW42B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769234055; c=relaxed/simple;
	bh=vPWghjdWb4UiUki8s1TyeQas1SYrpKKP6dMaap+6PYc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Es8seyETBVnxZKE6/WHjP9zDpbKwOpl4/KxcOeNAeDAIRvFZ8+vysVVGxHzP7WQMJjrC0qQ7kO6FvEcYjhkG8cPPmYZVLrTooqdeoesANudprepzrawyM2B0pZY2q4YXmyIeH01B6Kv/43ir6IC47oS+rk7A4HbS7RBrQqzjJRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBG/DWnI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB270C116D0;
	Sat, 24 Jan 2026 05:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769234054;
	bh=vPWghjdWb4UiUki8s1TyeQas1SYrpKKP6dMaap+6PYc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dBG/DWnIOfjOzGt8DzvvO+dDKdumHXu6SIWjibSih+ceiGIAyawJU3i5N0A9twldb
	 orvolfmt4JGVuOy6J2EWz5y3vT6IqT9X4aG8ndbbeVA2JMAW8Sv+SOiwESbNsh6p/Z
	 kR6ErS6U7vQCxeQ+N/JHZ91Cl51qybkVVfHoRR2iTJ8T/iwpwXdmiiGCluGnd0/Lui
	 jnTIjxV3hTpRHnbsOaZ+1fDXJwYEc+2QJaHVnyuEL2ftfEhrjKqxaaKzSCCVxUAl+Y
	 j1OCeVpRgS+o09VjS3KmsHzomJucIuBWG2+jYpi4NcBzk1ZvDJHjAINxQqUX963K4d
	 RqrAKjrk4YfOw==
Date: Sat, 24 Jan 2026 06:54:09 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: corbet@lwn.net, mchehab@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com, pvorel@suse.cz,
 rdunlap@infradead.org, skhan@linuxfoundation.org
Subject: Re: [PATCH 00/25] Add tools/lib/python modules to
 Documentation/tools
Message-ID: <20260124065409.10f25c8e@foz.lan>
In-Reply-To: <63e99049-cc72-4156-83af-414fdde34312@gmail.com>
References: <87h5sc17zx.fsf@trenco.lwn.net>
	<63e99049-cc72-4156-83af-414fdde34312@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-73882-lists,linux-doc=lfdr.de,huawei];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 023D87C968
X-Rspamd-Action: no action

On Sat, 24 Jan 2026 09:31:47 +0900
Akira Yokosawa <akiyks@gmail.com> wrote:

> On Fri, 23 Jan 2026 11:47:30 -0700, Jonathan Corbet wrote:
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> >   
> >> Hi Jon,
> >>
> >> This is an extended version of:
> >>     https://lore.kernel.org/linux-doc/cover.1768488832.git.mchehab+huawei@kernel.org/
> >>
> >> It basically adds everything we currently have inside libs/tool/python
> >> to "tools" book inside documentation.  
> > 
> > OK, I have applied the set, thanks.  
> 
> I've not have time to test this set, so just a quick report of a build error
> related to this set after the fact.
> 
> I'm getting this error from "make SPHINXDIRS=tools pdfdocs":

Thanks for reporting it!

I ended forgetting to test PDF build on it. Funny enough, even for
html, this can be problematic. Fixing it is really trivial though: 
just add a single character to the beginning of a docstring:

	--- a/tools/lib/python/kdoc/kdoc_re.py
	+++ b/tools/lib/python/kdoc/kdoc_re.py
	@@ -228,7 +228,7 @@ class NestedMatch:
        	     yield line[t[0]:t[2]]
 
	     def sub(self, regex, sub, line, count=0):
	-        """
	+        r"""
	         This is similar to re.sub:
	 
	         It matches a regex that it is followed by a delimiter,

For it to not consider "\1" as a special character.

Patch sent:

	1a60aea3155a2e7c5e7bb004952739652407fb8c


Thanks,
Mauro


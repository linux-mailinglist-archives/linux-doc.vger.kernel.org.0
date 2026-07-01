Return-Path: <linux-doc+bounces-94272-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cdDvCNqORGqawwoAu9opvQ
	(envelope-from <linux-doc+bounces-94272-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 05:51:54 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF056E98FA
	for <lists+linux-doc@lfdr.de>; Wed, 01 Jul 2026 05:51:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=pn7KZioB;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94272-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-94272-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C274F305673F
	for <lists+linux-doc@lfdr.de>; Wed,  1 Jul 2026 03:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B1778F2E;
	Wed,  1 Jul 2026 03:47:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CD5288AD;
	Wed,  1 Jul 2026 03:47:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782877676; cv=none; b=N2nYN2SkmgYQtjPX6XR2w1PGyCc0yUAtFIc1VZ80Cl8OwMqihfDBZXn5njgacx+Qfn8vEg0q9W0sgLMchqvDCWn1oOdKQ80XKe6npEqVbYGzc/uMLy+imTTptCmQCvVd0I0K4PXArEszAG/Mzb3AkxT48Bn/SChzOOxozpu+2rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782877676; c=relaxed/simple;
	bh=FUb0krVk+zdt6AgQLMqFZql8fNqlZBxjvdFQZAhptdo=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=qzR/A1xXuiPghughs7LdiiK3/QpCTmoRslXD+2tVuC5aTYA6GqBVhlTDJm1EmgF1BUEVKg6mSV8z8Vd9gq+Nkg4fQVedAK8EupIB3Wd4xIxRM9x0uaLJEK7/4rnC2Y+mN1IFmoUz23KnNnr38mOu39Gb7qB+i2ItQl1aYifcgGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pn7KZioB; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:To:From:Date:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=nApW0TbiTJY7J1m6P34EZWWiq5RdRdYwQqXDhkOn3wI=; b=pn7KZioBdcGJCWEiOF2drr9WrU
	Rsyjet+cONr5A88PON0hzE0H7TwZSG+Y88HyF05ArHZOE7RuERs2NzCxWfvSYVfX6i9e14cnIRAgc
	VDRXVtX10rKfVZesUl00lO3v6VdXQ+gKeCQwuy2nl3ChRZIePUU3hRNsKAXc+h89HQw4WqUlQtwZI
	b6RbHhw/IJ0+z/LAE+ApSYqKZJB6De/xeEH/8lfut0o10m2rBBJAkpGDtBbvHA7Ij2WAOsd0jxsiT
	H2gxcNKTA7dG1JYevQGS7xHyaZWih3Z+kfQlVLra6J46tpAFirLY7nCuM1SYkSsv8R70RD+nWKJ+G
	9FD+Lj2w==;
Received: from [129.95.232.135] (helo=ehlo.thunderbird.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1welvN-00000005x0N-1gwI;
	Wed, 01 Jul 2026 03:47:45 +0000
Date: Tue, 30 Jun 2026 20:47:41 -0700
From: Randy Dunlap <rdunlap@infradead.org>
To: Baran Tuna <barant@fastmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: Fix typos under GPU TODO
User-Agent: K-9 Mail for Android
In-Reply-To: <20260701025233.594162-1-barant@fastmail.com>
References: <20260701025233.594162-1-barant@fastmail.com>
Message-ID: <01433E06-1132-4580-93FD-D6E82341A041@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94272-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:barant@fastmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:dri-devel@lists.freedesktop.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[fastmail.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,linuxfoundation.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,infradead.org:dkim,infradead.org:email,infradead.org:mid,infradead.org:from_mime,fastmail.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8AF056E98FA

On June 30, 2026 7:52:33 PM PDT, Baran Tuna <barant@fastmail=2Ecom> wrote:
>Fix minor spelling mistakes in GPU TODO section of documentation=2E
>No functional changes=2E
>
>Signed-off-by: Baran Tuna <barant@fastmail=2Ecom>
>---
> Documentation/gpu/todo=2Erst | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/Documentation/gpu/todo=2Erst b/Documentation/gpu/todo=2Erst
>index cdddf8db35f5=2E=2E3b9999319829 100644
>--- a/Documentation/gpu/todo=2Erst
>+++ b/Documentation/gpu/todo=2Erst
>@@ -55,7 +55,7 @@ There are still drivers that use drm_simple_display_pip=
e=2E The task here is to
> convert them to use regular atomic helpers=2E Search for a driver that c=
alls
> drm_simple_display_pipe_init() and inline all helpers from drm_simple_km=
s_helper=2Ec
> into the driver, such that no simple-KMS interfaces are required=2E Plea=
se also
>-rename all inlined fucntions according to driver conventions=2E
>+rename all inlined functions according to driver conventions=2E
>=20
> Contact: Thomas Zimmermann, respective driver maintainer
>=20
>@@ -278,7 +278,7 @@ Various hold-ups:
>   valid formats for atomic drivers=2E
>=20
> - Many drivers subclass drm_framebuffer, we'd need a embedding compatibl=
e

   an embedding

Otherwise LGTM=2E

Acked-by: Randy Dunlap <rdunlap@infradead=2Eorg>
Thanks=2E

>-  version of the varios drm_gem_fb_create functions=2E Maybe called
>+  version of the various drm_gem_fb_create functions=2E Maybe called
>   drm_gem_fb_create/_with_dirty/_with_funcs as needed=2E
>=20
> Contact: Simona Vetter
>@@ -303,7 +303,7 @@ everything after it has done the write-protect/mkwrit=
e trickery:
>=20
>       vma->vm_page_prot =3D pgprot_wrprotect(vma->vm_page_prot);
>=20
>-- Set the mkwrite and fsync callbacks with similar implementions to the =
core
>+- Set the mkwrite and fsync callbacks with similar implementations to th=
e core
>   fbdev defio stuff=2E These should all work on plain ptes, they don't a=
ctually
>   require a struct page=2E  uff=2E These should all work on plain ptes, =
they don't
>   actually require a struct page=2E
>@@ -891,7 +891,7 @@ Querying errors from drm_syncobj
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The drm_syncobj container can be used by driver independent code to sign=
al
>-complection of submission=2E
>+completion of submission=2E
>=20
> One minor feature still missing is a generic DRM IOCTL to query the erro=
r
> status of binary and timeline drm_syncobj=2E


~Randy


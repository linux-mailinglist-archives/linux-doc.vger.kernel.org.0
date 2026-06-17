Return-Path: <linux-doc+bounces-92690-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8x9+MrYaM2pp9gUAu9opvQ
	(envelope-from <linux-doc+bounces-92690-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 00:07:50 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A5969CA0A
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 00:07:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=p47Xbk2q;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92690-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92690-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CA0D3015630
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jun 2026 22:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8F63C1413;
	Wed, 17 Jun 2026 22:07:43 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7EB3A383A
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 22:07:42 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781734063; cv=pass; b=qt1I6I9Iyg+camC6To7kqnpi0mg348cknBD0RJsMyF9ly2y/DownE1z9qvFPU2F067SKR4UbGYT6RVuls2VCG1Zkh9Pa41UyRl328pYEzmp/mjxo9XDmZEOroZHEb0u5onzOUBOrS+0MHquFyoQUDAvlyWno64tJQ4IUsv62DpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781734063; c=relaxed/simple;
	bh=dpAk0VAQdmltDmwyDqcpJc1YZ9ddSOslmAa2U6BjQvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j2I/3UIkOvIDbf4FRw8C5RDYyIHIJhmHgiFpg4jfzIh869XTUlzCGnETR9eCeUUm3xyrNWgCzChZ5twvHizZ469q7D3tU931AjWegMTwbSJOG5WxGWRI2hP0u2OY/brU6eC21QFWNO3ZuoAHultVMoE9Kgtsbhx3xKp4mLkFB5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p47Xbk2q; arc=pass smtp.client-ip=74.125.82.52
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1384ebe7a10so619772c88.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 15:07:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781734061; cv=none;
        d=google.com; s=arc-20240605;
        b=iXvas/gE2jsUZkFdte8p+QFQRRYbFTOk1fALsaeKJpe6yTrkY5ZFMcMw9RzDwkOAP0
         Qu3ZGmzmT25gdcgLt6NVF58TXVW4Gc3V0Lm58MhUd2SCVK9CSLbUt//zD03VMl6/x9a2
         v+v1PTUo0UjJUf+Qa8jkdN5B49A5gq69pcKcG6yhtVpI9n2/TrypbKWSU98hDHoJjrE3
         6JblZQX8JNwkmPRqoiXAfW69lvg0S9jQ/Bf+b1Jp9F+P5QA2NUW+NGz9b09bfvRyNQ5O
         O09KUsz3JOZy6u4uS0HTN/n1e1sLCbG85IlGvDmc+oZEQ6LyUolsquCl1MpYdViTHDVt
         tV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dxvS3kwOW4bWC0xsZqNZINpijY+mWNOP8Io4oLdd84w=;
        fh=xZXo69/UgIrS5hvRn3wugB4unk1t/wsDMXzZarokQFs=;
        b=N9qMNbtZHBsDOa5xFaggzy6TBfTN219wcrMyddu30nzJ6akKLqooti4iHWFFcQwc5d
         6G3gjWwIQdNfQVRe3t74dSrBY94VJd4rN1wdw/VJ+gqdH5+ht9TMtIeJPeXGaSGhEs7M
         VZt0o+RgbBQ+Ah7syaJ6XlLnQD3+781atStUp1qCg0H6nELVMl4W+v56NFWbrA4TvT/S
         A2eZkmAxVC7PHLxEfUTuPczCuIiHAelKRzXWc84IYSh/yXE4p6FojOx37Kl2EyIOKM40
         4/pG3D4OJLTK3bJ6hiJsPCkxPVJCs0f7+Nxaa4oXE26uTayzR6z1CbotVV/ewQbUY5J4
         dmpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781734061; x=1782338861; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxvS3kwOW4bWC0xsZqNZINpijY+mWNOP8Io4oLdd84w=;
        b=p47Xbk2qdEKP71XwL0AY+6LOQv9sWWMUSls9YNgeRkjHSjBa+v/g3QuF8NXjt2Lzc/
         VHNErdQLsBfOeznG7geRMkQma6OhvGGLF1pamPgBe+DsENdnZgDV95ycFiL/Ymm/CiUs
         Bqph4+Th0BZbydlVJ5laBjYkSDC5aCJxXPYtLYlUL4osq+RysnLVdV98Q0ZMRoJ9Ns5C
         js4V02JxSIXeItYEUABSJNtQTOQ2KXtU6wQhaEXxIeiUr+zyefSPfg7AZTRSjtH4ETCW
         XMxka1O87DCUSu+qJY9ZU5lgdhowAh8SJ15gDt01BhRa7k5h7yYyx4Ta8v1nNDND1Gyd
         BE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781734061; x=1782338861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dxvS3kwOW4bWC0xsZqNZINpijY+mWNOP8Io4oLdd84w=;
        b=Vj/DKujhslVUqGRuxfZfOm6d0iftvPUGqIPllYG8VEyn/XPHqCyu3Rjm9DtGYODF9y
         6+h8NynDrwM/Oe7slBwrJkxCgWNAhS3HX/J4r6V5Af/Fmyfp5oqDuR06Q6HvBubR+9yF
         jkSF+NFdWqU/T/uNFHSFml+9E+lKeHXnFRL4EjIZsk6TGNXgGoXi7ZQYdy/mzu8q02SR
         pzHM83c66jRIQdieJ4UJY1MFlN10c2fDsLXnRiGa0IdwlXwrLevyjLWdIoqgeY4yf55I
         lvCATBePpphulHlkDQm61D+K22uK4LcrGEB8vGaUZ3315Rq2xFmM3KOIgGq9OjG7v2re
         mwNA==
X-Forwarded-Encrypted: i=1; AFNElJ+lRYVz0d664x8RYj8Bx5zvUnb/rOo0U3BpS4aZWJ7mojqL/ciX+3s01bXVVg0V1CvjsQ8pPUKMblw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrEA6k/ykUKCiWpvHvlZkpg6974zgpPkJkDsXV1Lre/CNGjaGZ
	9vjKjE9SZrT+CsuwRYzfggEIxETEK5W0qji/5o1qbDK6VDUSlBlGyoapN6I1ggrbes94oHBers1
	OM/tLzn3hoDPqB/Lf3goJLUkJPX8D986zzQfb1uXM
X-Gm-Gg: Acq92OGXVxcctyGJE9UQATNXEMH1ftunOco0WSqOU4ygyhcUi1bZYCJ3JFQHQ+Rgm/q
	dWWEUnDpFWhG2v8zLrw63qYO9vVcetPOzYWftHhobhSxKbWRNdxSlXl+2So0TtIRO0HEO4drdmr
	Y1lic6zcwHxEa+4Bw8tkT5ZYG2BHmDaaCm9oraMt+y9iooW8VfZRsegOHymQP4TU4uCNEIjF6Hz
	W9mPlitbjaK/+1mSJ5EZ7nToQ/f9jVBIQTuDmESA32+m+Ps6FJsx/AHplBktpNvthrqJwiNiLGH
	PfMnKS0=
X-Received: by 2002:a05:7022:68a2:b0:130:6c8f:5a87 with SMTP id
 a92af1059eb24-1398f676be1mr2746710c88.13.1781734060068; Wed, 17 Jun 2026
 15:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522202410.3104264-1-dmatlack@google.com> <20260522202410.3104264-4-dmatlack@google.com>
 <178144432039.1257322.9644414453415904478.b4-review@b4> <ajBgj_aSuzMZG47e@google.com>
In-Reply-To: <ajBgj_aSuzMZG47e@google.com>
From: David Matlack <dmatlack@google.com>
Date: Wed, 17 Jun 2026 15:07:13 -0700
X-Gm-Features: AVVi8CfIvfIjd2Q6o3VPNKmTcz60wFd9tOmavE8DEafzVsI6S2ukw3P-Cv2hKdA
Message-ID: <CALzav=cGZs6sUcGFu854fTdH_rKTMBF0NK=+jKE-yE+N64XBPg@mail.gmail.com>
Subject: Re: [PATCH v6 03/12] PCI: liveupdate: Track incoming preserved PCI devices
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pasha.tatashin@soleen.com,m:kexec@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pci@vger.kernel.org,m:ajayachandra@nvidia.com,m:graf@amazon.com,m:alex@shazbot.org,m:bhelgaas@google.com,m:chrisl@kernel.org,m:rientjes@google.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:corbet@lwn.net,m:jrhilke@google.com,m:leonro@nvidia.com,m:lukas@wunner.de,m:rppt@kernel.org,m:parav@nvidia.com,m:praan@google.com,m:pratyush@kernel.org,m:saeedm@nvidia.com,m:skhawaja@google.com,m:skhan@linuxfoundation.org,m:vipinsh@google.com,m:witu@nvidia.com,m:yi.l.liu@intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dmatlack@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-92690-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmatlack@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17A5969CA0A

On Mon, Jun 15, 2026 at 1:29=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
> On 2026-06-14 01:38 PM, Pasha Tatashin wrote:
> > On Fri, 22 May 2026 20:24:01 +0000, David Matlack <dmatlack@google.com>=
 wrote:

> > > +static struct pci_flb_incoming *pci_liveupdate_flb_get_incoming(void=
)
> > > +{
> > > +   struct pci_flb_incoming *incoming =3D NULL;
> > > +   int ret;
> >
> > Maybe make the error return static, and avoid another search through co=
mpatible
> > FLBs if it failed before?
>
> Good idea, will do.

Actually I'm not so sure this should be handled her. I would have to
create a statically allocated variable to cache the result, like you
said, and I would also have to invalidate it during FLB finish to
avoid use-after-free. That defeats one of the main benefits of FLB
which is that we don't have to manage global variables.

Can this be handled by LUO instead?


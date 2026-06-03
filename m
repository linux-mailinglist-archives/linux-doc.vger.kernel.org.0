Return-Path: <linux-doc+bounces-90762-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qsHRNCY+IGqBzAAAu9opvQ
	(envelope-from <linux-doc+bounces-90762-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 16:45:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DA5638BF0
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 16:45:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RncmSrbY;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90762-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-90762-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05B0630AFD6F
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 14:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7305D396D2C;
	Wed,  3 Jun 2026 14:34:21 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5779C33970F;
	Wed,  3 Jun 2026 14:34:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497261; cv=none; b=X9AS3ZpY/xDT/l9Pm/lIvALXw1vKHJ6viJK5rjIdTPf/S6o22EyGk18Wolbu69LaaZNiJhShpQ+t+QWfb1xCpgybFD0sicihshc6hwlFsMSGZklIa2SY37rc65m2AGtwZFK6503zHpxH4t3LCZbKJSyID0l4uXGzEdI3yrjOGW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497261; c=relaxed/simple;
	bh=3WikHp9gRVkuVp8+7UzM84rcmvZ3obzhbv7GBYqSIbU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Y2YToHYWldf96SVu4/v/kuUWjya99SVAOVIP3V9TmvyKCdxv9Et5/L3Asfp+Gr00rjHAPZHTDAHPEAB85zVKY0f0YGyUEsBbfqCSGYr66vxqu4qTS25YgPkvlmR6gG1J4cPoSASGpGutCVwnkc4rYGmwGR9d8rb1Pp43Fcpbp2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RncmSrbY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2ED1F00893;
	Wed,  3 Jun 2026 14:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780497260;
	bh=yu2f5FIaIpPGb9LsISKA98pvWiCaazPbEtHtZWNusVY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=RncmSrbYsIH29DH7UOSflSaLWXVrOKpLLAkTNCb1nluOnMdGip2i37TURU6W4HJeJ
	 TZmp9pFP/lbNDNr3NmDkkjJQARDS1Em4yc4OBjvD/HMqo5Kld1S1vJuw7KOZcI/GDd
	 IjXr1uUeuaJ6ivMy9Kcf1kEZLJ30C1L9MYns8jf2EuhRyGX6snzePBcWJ0eCFfN0FT
	 focV5Pz8fwOO1Xg4xet9jBisJNLqZE3MMFs794fvDkya9D/WUwSrHHZT26Bl5MLnrR
	 fi6kk90xXakTHdzzz88I1gudGHOY/XZtbx+xIuSYhxAJQiCjkJycHRHBYMAZXRurbj
	 7KVS/pipaYesw==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 07/13] kho: add support for linked-block
 serialization
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kselftest@vger.kernel.org, 
 shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
 skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com, 
 kexec@lists.infradead.org, pratyush@kernel.org, skhawaja@google.com, 
 graf@amazon.com
In-Reply-To: <aiA1slnqPnC4_8XY@plex>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
 <20260603032905.344462-8-pasha.tatashin@soleen.com>
 <178046937151.468621.13398573538792303093.b4-review@b4>
 <aiANtYRRDr5iO5QR@plex> <aiAzT9TvGYjITiB8@kernel.org>
 <aiA1slnqPnC4_8XY@plex>
Date: Wed, 03 Jun 2026 17:34:14 +0300
Message-Id: <178049725439.475072.11560134126837430744.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:pasha.tatashin@soleen.com,m:rppt@kernel.org,m:linux-kselftest@vger.kernel.org,m:shuah@kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:corbet@lwn.net,m:dmatlack@google.com,m:kexec@lists.infradead.org,m:pratyush@kernel.org,m:skhawaja@google.com,m:graf@amazon.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-90762-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rppt@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,soleen.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1DA5638BF0

On 2026-06-03 14:11 +0000, Pasha Tatashin wrote:
> On 06-03 16:59, Mike Rapoport wrote:
> > On Wed, Jun 03, 2026 at 12:05:04PM +0000, Pasha Tatashin wrote:
> > > On 06-03 09:49, Mike Rapoport wrote:
> > > > On Wed, 03 Jun 2026 03:28:58 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > > > > diff --git a/include/linux/kho/abi/block.h b/include/linux/kho/abi/block.h
> > > > > new file mode 100644
> > > > > index 000000000000..8641c20b379b
> > > > > --- /dev/null
> > > > > +++ b/include/linux/kho/abi/block.h
> > > > > @@ -0,0 +1,56 @@
> > > > > [ ... skip 25 lines ... ]
> > > > > +#define _LINUX_KHO_ABI_BLOCK_H
> > > > > +
> > > > > +#include <asm/page.h>
> > > > > +#include <linux/types.h>
> > > > > +
> > > > > +#define KHO_BLOCK_ABI_COMPATIBLE	"kho-block-v1"
> > > > 
> > > > It's never used by block set and after looking at the following patches I
> > > > found that it's appended to LUO compatible string.
> > > > 
> > > > While this works for LUO, I think it should be kho_block_set_restore()
> > > > responsibility to verify the compatibility.
> > > 
> > > It should work for any component that relies on  kho_block. My proposal 
> > > is to use this method for other common KHO data structures (e.g.,  kho 
> > > vmalloc,  kho radix, future kho xarray). There is no need for them to 
> > > carry the compatibility string in their metadata, as whoever uses them 
> > > will include their compatibility string.
> > 
> > So if, say, memfd_luo uses kho vmalloc, xarray and blocks it'll have five
> > compatibility strings glued together?
> 
> That is correct, but it will be in only one place: the header of the 
> client's KHO subtree. Since it is dynamically sized and 8-byte aligned, 
> it should be safe to include in any struct.

This is safe, you are right.
But I have more usability concerns from one side and the duplication it
causes from the other.

I can see the downside of putting the version information in the data
structure itself as it either requires a different header for the first
element or needlessly increases all the headers.

But 

#define LUO_ABI_COMPATIBLE     LUO_COMPAT_BASE "-" KHO_BLOCK_ABI_COMPATIBLE "-" KHO_VMALLOC_ABI_COMPATIBLE "-" KHO_RADIX_COMPATIBLE

is not really digestible too. And it forces KHO users to potentially
track KHO internal changes.

We still don't promise any compatibility between different kernel
versions so to avoid blocking this series on the decision what is the
best way to convey KHO data structures compatibility I suggest to bump
kho ABI version in v6.2* of the patch that adds KHO blocks and postpone
this discussion to after rc1 when we'll have plenty of time.

* sending a new version of a single file does same email traffic, but it
confuses b4 and quite possibly other tools, so I think v7 is better.

> Pasha
> 
> >  
> > > For now, reviewers will have to make sure that if the ABI header content 
> > > is changed, the compatibility string is updated.
> > 
> -- 
> > Sincerely yours,
> > Mike.
> 




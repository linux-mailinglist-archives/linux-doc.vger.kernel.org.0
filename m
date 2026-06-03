Return-Path: <linux-doc+bounces-90760-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f+mVFOQ3IGrZygAAu9opvQ
	(envelope-from <linux-doc+bounces-90760-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 16:19:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6C66387B6
	for <lists+linux-doc@lfdr.de>; Wed, 03 Jun 2026 16:19:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=soleen.com header.s=google header.b="Jj/gXNQz";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-90760-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-90760-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=soleen.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61F5A30F44D4
	for <lists+linux-doc@lfdr.de>; Wed,  3 Jun 2026 14:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D013AA4EB;
	Wed,  3 Jun 2026 14:11:35 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417383D301F
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 14:11:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780495895; cv=none; b=YsZQxrgrwSb3rvEvp3IbCtqcvqpHezbDM+DPGFl9BvOcigV9eXitS5X9ywxAx5sgWPsVT7z8MESDcwX7o5de+1sT4yg3vkXGYk3KRTGced+3B6RczBm7nAKefzRSjCJ1cv1sfXv7JzAapEejzFIrzOSgu152aPI7ad0meKtkm7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780495895; c=relaxed/simple;
	bh=b/SIUriVsuGQ8+K9ks4Bx6z61f4Zp4N9nO9DkwNZvL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKRoXPphyN4r58R9SOAEMaoftZdxgk/4mWPKrn/e2E8fTwA3vaGEmKLDyVBmI34BIPAuKCaZK+tvPEcS9FLx4prG4jM2Kpi13dsrhvo9DZh8MEFyhbfWmeLn0zRxAxyQ0qVGz7G7Mow7Rw5E4TrbODpUATD8lZWp5jYUgDi4ut8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Jj/gXNQz; arc=none smtp.client-ip=209.85.222.170
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9157f7c1c0eso192688885a.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 07:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780495893; x=1781100693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3JBFLHHchSf6Ugt56GZlS5cZe18tTPuP1JId2xHEinc=;
        b=Jj/gXNQz9PzMyt/Qlt6Q2M3R245DJFs2mznVy5gaKaJpgI6Fzs3uffqHQTVciPDiON
         c+gXtmpnbP//2nGpOWRG1DMuK+KCG+q3QbHfdMsZZXdMbqT6KDziuumMr9bKwVcQLtYj
         nY5fZbjcBpBy4vQmg7riJpMdsd849LjZkUG+7LSsHGj50odIXBLfu3ZC2RQRsjK8NC21
         BtVbmz/mfj5A9eQvlDuUmtmfAuejT773Z40C6Sxy8s9e+jVFgBdYMiciPrJ0BWapP8c2
         1+n6edbMVArRWJMh1g1hFb824kkVkjvXDQfVU2j5TAucSqkOiDOgCkcYYZoSShEFAA9B
         OYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780495893; x=1781100693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3JBFLHHchSf6Ugt56GZlS5cZe18tTPuP1JId2xHEinc=;
        b=i7xS2zcfj0vB0ElBaeQ2x/F9ddbNjQiO6G8SgKWLiAUrQQt5S4S+o1ZQWo+bTAkgLl
         zxE8brs4z7GxgqTtoPFOCyuZ78+E/ReQwVO9cf1yhaGGaAJc+/75yLO63y5C4vEoPZ9m
         6So/HJ11IzEWUOJsAGQwxxuYnbktxMLgqEKXQ2Sn71zJO4UtDqA5fvt10k9eVIK44Veo
         zs807PnbVY754wvmvqrb/hU8x6JNYeClyHrzg9Nv3E3GNLY8nYKgDaY2FRPw/tdSB8/Z
         nAQkq5xaiAW5GJ/EhrCanvWvB4Ir+AcdnlCkwWNw6Pzja3iVefYMGcyv935N35aW+qeA
         UTNg==
X-Forwarded-Encrypted: i=1; AFNElJ+ppw8dScHC3R3IXe3r4sEN/YrkoPvOwIZRTvPgEel4ObYWjwfQQVNnvscnKf7PPyIPkAxVEDHYxYw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhpt7R9HxdspTQf2riMsi3bL2Vg0vQhJZal0UEYvzrPYoehf3I
	7UIgtkCRU3LaD5+gLM+pgiBBDq2R4aUFV8VvABGo+ljeg6k6hSvz759RgbM0pgZzhcs=
X-Gm-Gg: Acq92OGtENHIatFw+7CEuWsNlp421rnwD62HN+4QWth/JnWJSZJWGYcpZzoXVWHp5qD
	Y9IGHYVE6Z1oIdh1MCqEhB6R44Y2Q91vpd8JRhmq6ddCm72bt4DNpLH5cpSAKvjveIlqVtzMG4b
	AWjiCZeFf9YSr/KePj6cIAg4RpcvsFlMo11fj7GkzGSBmO7D0np/oCLZD/fn+7JLQ0yd3N66riK
	wgqkJjpM381y6k9MYpKkid4sSgna38biKJpRBuib2qoaEHMFDy+S4/sRb/VOoaVk5avDOXIX2j6
	+cSIXxl5v/gbOilrPxiDp5od8akI44zwSeQsmlCf9pufUZACzTBfHIKPPA1tCA+oYj+IctVTshm
	nK2G0OH/FOjS8cRAl0R5TKHc3kT3xf1PvxRKWI6vTU3R3v/8rPjyQxUoZeempdz/YokOdBk/W28
	3EJNWwTIqoQ2fSiqtTJvJgMxLvQx5aHGCUbYY4eZkcU817vuH1VREhTzMdtCT8dQ==
X-Received: by 2002:a05:620a:4613:b0:915:4ca3:61bd with SMTP id af79cd13be357-9158a83f992mr602997485a.59.1780495893289;
        Wed, 03 Jun 2026 07:11:33 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a402ff9sm248774285a.45.2026.06.03.07.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:11:32 -0700 (PDT)
Date: Wed, 3 Jun 2026 14:11:31 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	corbet@lwn.net, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v6 07/13] kho: add support for linked-block serialization
Message-ID: <aiA1slnqPnC4_8XY@plex>
References: <20260603032905.344462-1-pasha.tatashin@soleen.com>
 <20260603032905.344462-8-pasha.tatashin@soleen.com>
 <178046937151.468621.13398573538792303093.b4-review@b4>
 <aiANtYRRDr5iO5QR@plex>
 <aiAzT9TvGYjITiB8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiAzT9TvGYjITiB8@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[soleen.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[soleen.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90760-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[pasha.tatashin@soleen.com,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:pasha.tatashin@soleen.com,m:linux-kselftest@vger.kernel.org,m:shuah@kernel.org,m:akpm@linux-foundation.org,m:linux-mm@kvack.org,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:corbet@lwn.net,m:dmatlack@google.com,m:kexec@lists.infradead.org,m:pratyush@kernel.org,m:skhawaja@google.com,m:graf@amazon.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[soleen.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pasha.tatashin@soleen.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,plex:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9E6C66387B6

On 06-03 16:59, Mike Rapoport wrote:
> On Wed, Jun 03, 2026 at 12:05:04PM +0000, Pasha Tatashin wrote:
> > On 06-03 09:49, Mike Rapoport wrote:
> > > On Wed, 03 Jun 2026 03:28:58 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > > > diff --git a/include/linux/kho/abi/block.h b/include/linux/kho/abi/block.h
> > > > new file mode 100644
> > > > index 000000000000..8641c20b379b
> > > > --- /dev/null
> > > > +++ b/include/linux/kho/abi/block.h
> > > > @@ -0,0 +1,56 @@
> > > > [ ... skip 25 lines ... ]
> > > > +#define _LINUX_KHO_ABI_BLOCK_H
> > > > +
> > > > +#include <asm/page.h>
> > > > +#include <linux/types.h>
> > > > +
> > > > +#define KHO_BLOCK_ABI_COMPATIBLE	"kho-block-v1"
> > > 
> > > It's never used by block set and after looking at the following patches I
> > > found that it's appended to LUO compatible string.
> > > 
> > > While this works for LUO, I think it should be kho_block_set_restore()
> > > responsibility to verify the compatibility.
> > 
> > It should work for any component that relies on  kho_block. My proposal 
> > is to use this method for other common KHO data structures (e.g.,  kho 
> > vmalloc,  kho radix, future kho xarray). There is no need for them to 
> > carry the compatibility string in their metadata, as whoever uses them 
> > will include their compatibility string.
> 
> So if, say, memfd_luo uses kho vmalloc, xarray and blocks it'll have five
> compatibility strings glued together?

That is correct, but it will be in only one place: the header of the 
client's KHO subtree. Since it is dynamically sized and 8-byte aligned, 
it should be safe to include in any struct.

Pasha

>  
> > For now, reviewers will have to make sure that if the ABI header content 
> > is changed, the compatibility string is updated.
> 
> -- 
> Sincerely yours,
> Mike.


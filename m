Return-Path: <linux-doc+bounces-12920-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C3388F752
	for <lists+linux-doc@lfdr.de>; Thu, 28 Mar 2024 06:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E87FE298441
	for <lists+linux-doc@lfdr.de>; Thu, 28 Mar 2024 05:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186C740874;
	Thu, 28 Mar 2024 05:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C6nUZoTj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEA0D304
	for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 05:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711604172; cv=none; b=Oc7LT7AG3jf0zrMNW6E4yVs1eb/L8m8zu+8655YjpM466lzTLJL8VFNxplNWX0acg/YI9TJW9O7V2s9IrJcaXGFN79bAdGMKw027V9YvmjQwnja3CchnvhpKF7AF0DzlOIdCIhwfOI9fkoHBreevFQWq5/a7EerIxBEE7YzZKo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711604172; c=relaxed/simple;
	bh=3U6V+9JcBHoyWlFviROw3p+GodkWEvgG95H00we1DYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rgmrKV9e5TAxrlQDC29eUnJuWTsZnP+Zn5yn0O9zWjbWA2Hzr6pUkc4LvpTq2EzS+vqT/BbnuSm+3qqqHASyT7aHivXTVhboU9SqOKgI9PByS7qVQUduDNqWYYBS86WE1qG+icBsFpOI70NIWmIj41is7owb3sF0ymjgq8KbMDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C6nUZoTj; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dcbf82cdf05so460106276.2
        for <linux-doc@vger.kernel.org>; Wed, 27 Mar 2024 22:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711604169; x=1712208969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3U6V+9JcBHoyWlFviROw3p+GodkWEvgG95H00we1DYg=;
        b=C6nUZoTjLYyBZE2GaOu0G7/r/Je5GhhNkNXCEOPw7zrCpwDXT8nPfmbztgql/JBaKg
         khhZz2ZL+cNSW2+tdYx0KPllhfzNSPAN3ytxL3SpDTGCftmNn2ppoDDh4fZMIzXa25RQ
         gVAZDRzlVl74DOwc1ILiyrN70a2YLdT47Bv4XHVrM0wT62tK4GqgqrUhJtEb5MKJQgI0
         q8Wtw8zGBz4Z4023CmZSE7m9O0iUuHTcILfMxQ3iZDAxojomszy9p9m/aXul3F2gIxqF
         R+ZmQ0cZO+pBBLmbwnIjSFJXHXCFdU746JZx9tgfxmJj6ombSqtbkMWTil8VUB0o9EC/
         5wBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711604169; x=1712208969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3U6V+9JcBHoyWlFviROw3p+GodkWEvgG95H00we1DYg=;
        b=bc6yX8NYWNfeyX/5Ez1ErSkdqebHVn8xbMEdS7KCmwaIyoxuy8aC6YM3t0/m9cCM8g
         m5pt3/bZ8q5YSDGPYKJff2t24QdUPsbosNbovrANjIkfpdL8rjXafitaw/mGH8cTapiP
         PWwvl1Gw3GM4R895x5EK/uo8nmeve3H2vNi4VZwABfl1ANpEuI8akJir92Yf+39qaHdn
         OtEm5ENuEpdDNyDVmInNt5TyTGG18c3dLu2pOUjGSVaeDKViWU1QMfTnMrPanPS9ChAR
         PgPmEBnWJtCpQtvfigTGxbrR1xfzU/JhGX7OYGnWGQRKQ0C2b2JVzrinC0mXrbGOBYgu
         9mCg==
X-Forwarded-Encrypted: i=1; AJvYcCVPjPi38kD5upocQ0QGmjx8Qt+qujNuFHu8sCmAMG4tNbpnf/kU+Hm9pZJEP8582Z+uLBkpNzLNQVX1dX91wOg9Jq0ydG/bBWsN
X-Gm-Message-State: AOJu0YzFgSfpTytYAPsmTCpIZhelq1QiVn8Ha8Qs9kflP1o3i4fHCQeQ
	Kts1jWfqy+D3DX+QHl0v3klBplosmnNXpewQ5W7zGs+4WtsZjF732y226WdudrGcNAzTSkhMMdi
	/LnUP9PoUB89cxiqS3Ji7o89z6dxTDIL4vmU4
X-Google-Smtp-Source: AGHT+IF0R+uKEToWGsBY2vSnfIQ6DhGDVJippMQDcB6SunV/Q//MnqMAHSWcEjEQX9kRv3J12yg8SvnpUOUx5mVmNBo=
X-Received: by 2002:a25:a048:0:b0:dcd:4878:1f9 with SMTP id
 x66-20020a25a048000000b00dcd487801f9mr1868686ybh.8.1711604169102; Wed, 27 Mar
 2024 22:36:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325123603.1bdd6588@canb.auug.org.au> <CAJuCfpH4Ee00hM9+B7=mi5Dwjrhov8vUK-KwPuoO3wsD7iJSAQ@mail.gmail.com>
 <5e1321ca-0d46-4e9d-a6e5-0560d99f65ff@infradead.org> <CAJuCfpFTOz8cNiJFiCU5tMM1u5L=wXRsXqxUhN9g-R0u77CyZw@mail.gmail.com>
 <20240328153947.3871cfdf@canb.auug.org.au> <20240328154427.3e926d21@canb.auug.org.au>
In-Reply-To: <20240328154427.3e926d21@canb.auug.org.au>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 27 Mar 2024 22:35:56 -0700
Message-ID: <CAJuCfpHZGkL9urkZaVmO_o0ujpr-moDGYiBES1iRy2dh8g-t8w@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 9:44=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> On Thu, 28 Mar 2024 15:39:47 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Mon, 25 Mar 2024 23:16:55 -0700 Suren Baghdasaryan <surenb@google.co=
m> wrote:
> > >
> > > Thanks! I'll change back all the instances in the documentation where
> > > we replaced original names with _noprof versions.
> >
> > I now have the following:
>
> Sorry, some of those are not relevant here, just the _noprof stuff.

https://lore.kernel.org/all/20240327044649.9199-1-rdunlap@infradead.org/
which seems to not yet been pulled into mm-unstable should fix the
following warnings:

include/linux/slab.h:730: warning: Function parameter or struct member
'_n' not described in 'kcalloc'
include/linux/slab.h:730: warning: Function parameter or struct member
'_size' not described in 'kcalloc'
include/linux/slab.h:730: warning: Function parameter or struct member
'_flags' not described in 'kcalloc'
include/linux/slab.h:730: warning: Excess function parameter 'n'
description in 'kcalloc'
include/linux/slab.h:730: warning: Excess function parameter 'size'
description in 'kcalloc'
include/linux/slab.h:730: warning: Excess function parameter 'flags'
description in 'kcalloc'

And https://lore.kernel.org/all/20240326054149.2121-1-rdunlap@infradead.org=
/
should handle the _noprof warnings. I can see this patch in
mm-unstable and running "make htmldocs" in mm-unstable does not show
the _noprof warnings anymore. Please let me know if I should try some
other command to reproduce these.
Thanks,
Suren.


>
> --
> Cheers,
> Stephen Rothwell


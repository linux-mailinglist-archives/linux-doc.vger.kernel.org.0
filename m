Return-Path: <linux-doc+bounces-28416-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A959AD65C
	for <lists+linux-doc@lfdr.de>; Wed, 23 Oct 2024 23:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 785381C20CD8
	for <lists+linux-doc@lfdr.de>; Wed, 23 Oct 2024 21:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474DF1E7C16;
	Wed, 23 Oct 2024 21:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xsp8L6Yz"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223DB155757
	for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 21:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729717772; cv=none; b=UAcIFixPH4ozemmsZRqIei+hQiBpktRxHSUfeM55dV57OfVSWzvbME9OQ8A8FCa6IrPxmZ8r0ztbD0zKqi8M53MhfpJILvpCQx076Hh3/EzSnkdNGxaVWCgrS3ekjKWrglERZ3LSD35C6mCOnLCxe8N5sSIqlHn0xVgkX9Cmvso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729717772; c=relaxed/simple;
	bh=XonaIiFrBJ4wGnJLEIHPTYo5mO+JgjFRx+Tk2sZ7yvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nkl7dqRsXSITFnM7NAPmv386Al6/8hzeal/1OGwQcfZ1l5t+5WAZdUJYpj9mgXEb3Hg7JkmFOtcMjPhN7D2QU+0QoPZQM/m04hRy95vmNKV78m45/gaitIpgm5aNFdS7UhE/tWVL+dNqRYKBj1TPC3IDVGQ8A9sjWihqIKZHL2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xsp8L6Yz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43153c6f70aso16255e9.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 14:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729717768; x=1730322568; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1Hc6TqTcrhd8OnsnaGs3m8D6+LMkz7l3Gr9ozPNQss=;
        b=Xsp8L6Yz321nUWxg7ZCjxmGGXzkIIgVdqRqBKSGsvxqERJLvMhmAHzGRmSriXRgHBi
         kaC8brKh+4hWu9e65NIvSrSjBlQtxyrb3n94aKWyU4Pisizh8E6WlJ7QyXyfSgp4g667
         fQS6BoXn+ol9CqgkKIzg9d67h87Joh+5bhND6JRCo3KrbBf7I2ejAydN3i3+N1QNOCsG
         M0bYgZXAn5/2E1JLf+S4Av67EhRY69y5kpWB4sCH/rkPQh96bW5YGVpcVVbbYqVtjVJ0
         XalGjcgg2jrztH5YSaokIb6sOVEh+NAZtC3E/4XAtYHmeWV2ehrC81b3o4NHmbRJ+NCE
         MUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729717768; x=1730322568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1Hc6TqTcrhd8OnsnaGs3m8D6+LMkz7l3Gr9ozPNQss=;
        b=jeHArlV0a3auR7WV4Gw7wyrU92eg5eXXHxAviahg4yXY0ENBxTkWla2POgJQXnokf0
         F4RyllY6NmUqZCKa+F7ISZsVmpAGtdS572GLPGChtfhGwkITHvKgmazJljhI5Ix8WLle
         I1XC33VNh6nUpcRqAvzXNVyqYRPbwbMX9TQKTRQpZ6eNxEF3S24s1AA8XctQgoi0DOWf
         3VVn+aqPgmJb3JQYPLdHXzdDT8aMDFEHMyXGSY+Uz1dyU65Al2ohNwgO+EvnGMkNyFpo
         ER0j0p8m03zqneNgv+IUD4/mJITgMO4DDzYKt45sXoPQ9kDRjuzef4iR8gevqeajFZKs
         QY6w==
X-Forwarded-Encrypted: i=1; AJvYcCW9Ot2kunlC9kjDZEycVtK/cxb106pI5zYTk5jPipy5lcKmjtqUAww7/QFCFI/T/2RBJWxxvQUTRSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhOnOW9hYHbXfPMulO22Jcr+lQfyKpLY7aMb6vR/O1AIzQsA2K
	t3B4cf5aNGqi5l9ZMx/HAnM5QLdlGR8Ttqb1HvwuRjM9q1hX4OfpzwpkTw4jfx4lD+EkPeyN2Tm
	ODjFotYkxpKyzzqhvn6cmOIeaJkl4LBp7dCPz
X-Google-Smtp-Source: AGHT+IG7lHrCmkHrUK87/No/R3m5mQ51hRtR/sVg3+psInFw5wdf+0mCw9HD7V91WPK90Gie/P5wYbHJdFXnglBqC8A=
X-Received: by 2002:a05:600c:b8d:b0:42b:a961:e51 with SMTP id
 5b1f17b1804b1-4318a4ace7bmr1380915e9.0.1729717768323; Wed, 23 Oct 2024
 14:09:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241023170759.999909-1-surenb@google.com> <20241023170759.999909-6-surenb@google.com>
 <20241023140017.e165544bf20bcb0c79bfee57@linux-foundation.org>
In-Reply-To: <20241023140017.e165544bf20bcb0c79bfee57@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 23 Oct 2024 14:09:12 -0700
Message-ID: <CAJuCfpH9yc2kYGZqYjYPWbApy05yqiONqziBQ+qF+R3nZRL56w@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] alloc_tag: introduce pgtag_ref_handle to abstract
 page tag references
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kent.overstreet@linux.dev, corbet@lwn.net, arnd@arndb.de, 
	mcgrof@kernel.org, rppt@kernel.org, paulmck@kernel.org, thuth@redhat.com, 
	tglx@linutronix.de, bp@alien8.de, xiongwei.song@windriver.com, 
	ardb@kernel.org, david@redhat.com, vbabka@suse.cz, mhocko@suse.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, dave@stgolabs.net, 
	willy@infradead.org, liam.howlett@oracle.com, pasha.tatashin@soleen.com, 
	souravpanda@google.com, keescook@chromium.org, dennis@kernel.org, 
	jhubbard@nvidia.com, urezki@gmail.com, hch@infradead.org, petr.pavlu@suse.com, 
	samitolvanen@google.com, da.gomez@samsung.com, yuzhao@google.com, 
	vvvvvv@google.com, rostedt@goodmis.org, iamjoonsoo.kim@lge.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	maple-tree@lists.infradead.org, linux-modules@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 2:00=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 23 Oct 2024 10:07:58 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > To simplify later changes to page tag references, introduce new
> > pgtag_ref_handle type. This allows easy replacement of page_ext
> > as a storage of page allocation tags.
> >
> > ...
> >
> >  static inline void pgalloc_tag_copy(struct folio *new, struct folio *o=
ld)
> >  {
> > +     union pgtag_ref_handle handle;
> > +     union codetag_ref ref;
> >       struct alloc_tag *tag;
> > -     union codetag_ref *ref;
> >
> >       tag =3D pgalloc_tag_get(&old->page);
> >       if (!tag)
> >               return;
> >
> > -     ref =3D get_page_tag_ref(&new->page);
> > -     if (!ref)
> > +     if (!get_page_tag_ref(&new->page, &ref, &handle))
> >               return;
> >
> >       /* Clear the old ref to the original allocation tag. */
> >       clear_page_tag_ref(&old->page);
> >       /* Decrement the counters of the tag on get_new_folio. */
> > -     alloc_tag_sub(ref, folio_nr_pages(new));
> > -
> > -     __alloc_tag_ref_set(ref, tag);
> > -
> > -     put_page_tag_ref(ref);
> > +     alloc_tag_sub(&ref, folio_nr_pages(new));
>
> mm-stable has folio_size(new) here, fixed up.

Oh, right. You merged that patch tonight and I formatted my patchset
yesterday :)
Thanks for the fixup.

>
> I think we aleady discussed this, but there's a crazy amount of
> inlining here.  pgalloc_tag_split() is huge, and has four callsites.

I must have missed that discussion but I am happy to unline this
function. I think splitting is heavy enough operation that this
uninlining would not have be noticeable.
Thanks!


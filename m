Return-Path: <linux-doc+bounces-61352-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1AAB8AD6B
	for <lists+linux-doc@lfdr.de>; Fri, 19 Sep 2025 19:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 047DE7B139E
	for <lists+linux-doc@lfdr.de>; Fri, 19 Sep 2025 17:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A5D322A2F;
	Fri, 19 Sep 2025 17:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RAUgVkn6"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF2E25783F
	for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 17:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758304716; cv=none; b=nJT4yVT8PU90JU3pal6dbWvnHeYbFS8edlj0tBjl9J42tnfDSWBjDh2jYH2ndKXK7DQAdETj+K43NTkPJocJtJH3ny+w5DVCev928E2Auip8sWKou9GPo7/F+e+xdw/p62fhzvqv7GZVfWrBDWxaYi+NyEkvCeuAoCNHMxD8eD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758304716; c=relaxed/simple;
	bh=38Gs1Qar33XAo1Y7OS66uYvLqXMX9a7h0GZW0uT6IT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qzz+3UY8N3pY+JdEkaobwvSQh3JDCajbutjLN5+FGU1n2Cl9mGBCZPALLnFRyAA68H8dOVpq2Y4VLnGDrfxLvFIaDPQsixSxC00nLaQhZI94/b7gnJSSI5lGKyeIHinkwvRHM5W1sFevpVe1ygavnZ7sU7fBaXg9aB3uwWJUqr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RAUgVkn6; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4b5f7fe502dso13598421cf.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 10:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758304713; x=1758909513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKiAXDkgrX2LUhD4TKk8v5QGpSKY+EpT1ETvTouA6rM=;
        b=RAUgVkn6+ALoQ7bm9NktTxKD4MtFhDkRZbPkjbKVNgh6f1b/Ti6L+dxlX8HBLxF6MQ
         eg6b1wm6zmGouG7khVZxVAzLFtdHpovQaAFnkm7obdnX9X7EDaJ9SVyR3wDhbVTFLcrb
         RlyXZdxpSaK46afYxtAZNbSeyjLrrlT+BK8I6cap9Vd6CF6LcY17Gc11c9+13dfiJK/V
         09IWOojy221xl3LgdPIj4cFcBoZZduF072lkLTEGCKwyx3nJHLdNJA9XWJyq4q1Ig7ER
         cTIPGvboG8zpy70+QqHkvnWDliEbF6BoJBYlYtUspPHcSYHEYIG1z+uZeWxkdzH9xnji
         YLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758304713; x=1758909513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKiAXDkgrX2LUhD4TKk8v5QGpSKY+EpT1ETvTouA6rM=;
        b=jjUkATudBMQA+y5YW7kY40qIaDaxu3gprri01TXUqFMDFM3zmchcv0bTcFDRihv2mL
         0xOwGgG4pP7EpcrVwrJaqUp14OeYV4lW5i/AZkStmhRwiwTJKk9kZP7pav5Y71MRYx8x
         AB5fTaE4L+bcMjTrsV7SR8pXeEJ2tYc2jvKnfGzlyRu6OwP/yyb9qiLI4pcf89vtX4fq
         fTy+cdIjB2r+y8jZslw0gjS/7yPeagKhiiR/FJhZchWXAIUiJbSE+2zpsAzKh9vaH41h
         nu7OtZipDSmrobHQw2ZuydpsqDa5Eh6kEF73jPokkUaWdc71B86D0tZBByBLCSQCOs2C
         KhLg==
X-Forwarded-Encrypted: i=1; AJvYcCXRapAon8WBdKX023x7Z2+CQVzQPW0TkLuvg7UGu+uh6jffdXOPHoLuJiXr35Ee7PGEHSdWFHFRBIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJiB8wOXqqKBbDX0eualyw3Du7lb7Kedhdi0JDzlXj4n8xR7uZ
	7uF3BmSkvmCJjvD8W2XrvaaYS3PXgf3SRgG1OU6yJg7synq2tq9xHbhUoyxilf6oJPbwghS7aIM
	IK9DcP8XcEL8z6euxMEwj+jE3VWXw6sKZ+M4J/RE=
X-Gm-Gg: ASbGncvwxfhUI9zeYPdI9275AnT+WuFKaANRhRiToGGW89WTyM/55xbER99Ee27ZDa/
	UceoiZuAMJZcfOXf3HKzG7VtxAR/1hhNVWnbaPPvVrzgcfWg6M69qEjTkLq47sGVmM3dR+pjKQs
	DhRURLckME0WRdIGdqcIsI7bRO8jbJhOplQaD/P5v1CdtHot/P4r37ax/RQdKE7cxzVjk3xPe6X
	aH2Q6gN0FU1gwYwz1Jjc6bbJdrzX+y4frSVXoVo
X-Google-Smtp-Source: AGHT+IG5Mo3h/1ff88PwcUapAIlS2YVGSiLxAR3AL07FsknEHK18lG+gFQCk2zfPCcdMXf1hLVttPVUfviUqt89STrs=
X-Received: by 2002:ac8:7f4f:0:b0:4b5:fc2a:f37c with SMTP id
 d75a77b69052e-4c074b076d7mr48411081cf.74.1758304712602; Fri, 19 Sep 2025
 10:58:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250908185122.3199171-1-joannelkoong@gmail.com>
 <20250908185122.3199171-13-joannelkoong@gmail.com> <aMKzG3NUGsQijvEg@infradead.org>
 <CAJnrk1Z2JwUKKoaqExh2gPDxtjRbzSPxzHi3YdBWXKvygGuGFA@mail.gmail.com>
 <CAJnrk1YmxMbT-z9SLxrnrEwagLeyT=bDMzaONYAO6VgQyFHJOQ@mail.gmail.com> <aM1w77aJZrQPq8Hw@infradead.org>
In-Reply-To: <aM1w77aJZrQPq8Hw@infradead.org>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Fri, 19 Sep 2025 10:58:20 -0700
X-Gm-Features: AS18NWA4Ectn5ref1Zm-F0jRvHV38iLjidkioHaeJy9w2W9ibGS--sEYKpZ7E2Y
Message-ID: <CAJnrk1bKijv8cce+NdLV-bOvdU=HdZEb5M=pE5KhqCWX0dAOWA@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] iomap: add bias for async read requests
To: Christoph Hellwig <hch@infradead.org>
Cc: brauner@kernel.org, miklos@szeredi.hu, djwong@kernel.org, 
	hsiangkao@linux.alibaba.com, linux-block@vger.kernel.org, 
	gfs2@lists.linux.dev, linux-fsdevel@vger.kernel.org, kernel-team@meta.com, 
	linux-xfs@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 8:04=E2=80=AFAM Christoph Hellwig <hch@infradead.or=
g> wrote:
>
> On Tue, Sep 16, 2025 at 12:14:05PM -0700, Joanne Koong wrote:
> > > I think you're right, this is probably clearer without trying to shar=
e
> > > the function.
> > >
> > > I think maybe we can make this even simpler. Right now we mark the
> > > bitmap uptodate every time a range is read in but I think instead we
> > > can just do one bitmap uptodate operation for the entire folio when
> > > the read has completely finished.  If we do this, then we can make
> > > "ifs->read_bytes_pending" back to an atomic_t since we don't save one
> > > atomic operation from doing it through a spinlock anymore (eg what
> > > commit f45b494e2a "iomap: protect read_bytes_pending with the
> > > state_lock" optimized). And then this bias thing can just become:
> > >
> > > if (ifs) {
> > >     if (atomic_dec_and_test(&ifs->read_bytes_pending))
> > >         folio_end_read(folio, !ret);
> > >     *cur_folio_owned =3D true;
> > > }
> > >
> >
> > This idea doesn't work unfortunately because reading in a range might f=
ail.
>
> As in the asynchronous read generats an error, but finishes faster
> than the submitting context calling the atomic_dec_and_test here?
>
> Yes, that is possible, although rare.  But having a way to pass
> that information on somehow.  PG_uptodate/folio uptodate would make

We could use the upper bit of read_bytes_pending to track if any error
occurred, but that still means if there's an error we'd miss marking
the ranges that were successfully read in as uptodate. But that's a
great point, maybe that's fine since that should not happen often
anyways.

> sense for that, but right now we expect folio_end_read to set that.
> And I fail to understand the logic folio_end_read - it should clear
> the locked bit and add the updatodate one, but I have no idea how
> it makes that happen.
>
I think that happens in the folio_xor_flags_has_waiters() ->
xor_unlock_is_negative_byte() call, which does an xor using the
PG_locked/PG_uptodate mask, but the naming of the function kind of
obfuscates that.


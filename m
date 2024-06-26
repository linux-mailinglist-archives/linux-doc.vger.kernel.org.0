Return-Path: <linux-doc+bounces-19477-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF8D917532
	for <lists+linux-doc@lfdr.de>; Wed, 26 Jun 2024 02:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54E6B1C20DCC
	for <lists+linux-doc@lfdr.de>; Wed, 26 Jun 2024 00:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2131862;
	Wed, 26 Jun 2024 00:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y6w36X9g"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86598F47
	for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 00:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719361153; cv=none; b=IM4y3OtsM7UVK9Qe8yINluL48OYyzfvtzeLdZxdz2p16y7VIx3oq6NA34VAiJeoLjDfAed9pPfS0D7fgNaFuvof524KeeJBjgbHQpk1m1eGHSC/RLpt8yXfFv64L9WsMr+VAZ647lZyANpBQzUI0w0voApPr4Mf/dyJnJrBbe+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719361153; c=relaxed/simple;
	bh=BWJLCbYdMdNVbeKAe8ZOorvrhm9T3+UulzDlvMDjsqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vn7RFwE3Bt2dV982Nc53Vreq/c1WotTR+45sZ9YroRJ9sdRNJboqHd7cFxHkGRkvvGdgTIc4PmlfxQZVBSbnHHiO0ly8sD0BkBLdqdgRcqLS0zFlhWdZviDupBDuTgmtQkPiB7wdWRAnU89PcJeWjyfmJdyiMH6ubgL0+een8bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y6w36X9g; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-362bc731810so5502472f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Jun 2024 17:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719361150; x=1719965950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqtPWZeZzGFCdHGhLUrysJyjsETP6OeAipXfgavd1OE=;
        b=Y6w36X9gZIT9CImQj3I3iEPQyCxQAm8yDn0LjlnILjBx9CfNHN7u6qGGnCYAV8FsUC
         Yd6MiXfVqDhvfeAJ6+mtSxABJU9yjGvPbASQMZsFKhNQ/AMdDZUEJcY7x2MlzilPPkA9
         uZjVCmP1KDWNsMoeBhKVn8jiLafRCDA2Gx5FBZCQp0nCKPBEAJsrNrU4sKwpwoG84D0x
         beJTIaEgi/PNYGleFQW4cbAsxlHkf/vXq/hJSoBiFqstpEQztMcEhTBTpD4YYIbopfTk
         BGmiIRFQiLh4K7EkG/Wvc8NZwPLoZYLWXwEhafrTjddRaMXz5cH6a5S+TOiMPAjLsBbR
         6OcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719361150; x=1719965950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqtPWZeZzGFCdHGhLUrysJyjsETP6OeAipXfgavd1OE=;
        b=egN+T1T+5lCPtub0zaP2LjNaAS2wCAN8zlY1R0dBT1oQv2zLjfE2/2kdHM8Eg39fQ6
         golZ4qdY+pLb3wHxNaiFG7XzuvNOvZ4WmgB1WZuEnPic2MJAJJCBNj5XL8EK29hq2Brq
         dmh2WwzyHdvEXX92WmZrUL8P0rJNn4W/zneSxLzB0uHNTiRsBb7suRze1U8v3JrXSk0f
         stXSAfZdiZvEZ6evw9wyCoVKC5vw/3eLrfjRs0rF16BI3Zwt3aEO5sDgdpa2WMj5WEmf
         d8LDH35UmRvFf9o8Egs8Awh6ZS17lB5OQstMQbY/0RAilS/jW9y6GETiR+8NU8L8otn7
         VWww==
X-Forwarded-Encrypted: i=1; AJvYcCUp3uCkG5mvAz3SU4FXXa6lWTprkAoAM6NewyiUem7/8QUwibW4MPvyokwniAsyo+jFHuT8q2AQy9ATjHlko1qqvbA5cf/0H/t0
X-Gm-Message-State: AOJu0YzzCo0rc6Wg4OpMPX/PkhCWHA8SJdSoyNQjuKaVXrd41v7Ntw2P
	F+q9mfr4nKNh57uLvY++dNF/mknqT/w+dBILYCSy+MHjUnL6D2JJXBEoiHaGcX6LkEQ4X4LOMoi
	SkxtqshQUgdMM3OsuWtbUHlKWfORn9STkKZrQ
X-Google-Smtp-Source: AGHT+IFuN0O+kal72+FcB0c5JiyRdueE3ZMGP21IEEO1SX378ULBlZj/S+2MBo6xoRWpY8nLXB1udHE0ojkh+LOy+OI=
X-Received: by 2002:a05:6000:1a4e:b0:361:78c8:2eb6 with SMTP id
 ffacd0b85a97d-366e9499ca1mr7618385f8f.25.1719361149918; Tue, 25 Jun 2024
 17:19:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624163348.1751454-1-jiaqiyan@google.com> <20240624163348.1751454-5-jiaqiyan@google.com>
 <78857a6a-f9a2-4072-b2d4-82fcfda25d2d@infradead.org>
In-Reply-To: <78857a6a-f9a2-4072-b2d4-82fcfda25d2d@infradead.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Tue, 25 Jun 2024 17:18:56 -0700
Message-ID: <CACw3F53U93_Vb70SKHMTi6yKxLGTwt2Qw8dZ4__U4bhVi-PgJw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] docs: mm: add enable_soft_offline sysctl
To: Randy Dunlap <rdunlap@infradead.org>
Cc: nao.horiguchi@gmail.com, linmiaohe@huawei.com, jane.chu@oracle.com, 
	ioworker0@gmail.com, muchun.song@linux.dev, akpm@linux-foundation.org, 
	shuah@kernel.org, corbet@lwn.net, osalvador@suse.de, rientjes@google.com, 
	duenwen@google.com, fvdl@google.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 5:02=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi--
>
> On 6/24/24 9:33 AM, Jiaqi Yan wrote:
> > Add the documentation for soft offline behaviors / costs, and what
> > the new enable_soft_offline sysctl is for.
> >
> > Acked-by: Oscar Salvador <osalvador@suse.de>
> >
> > Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
> > ---
> >  Documentation/admin-guide/sysctl/vm.rst | 32 +++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/ad=
min-guide/sysctl/vm.rst
> > index e86c968a7a0e..71463a7b3e2a 100644
> > --- a/Documentation/admin-guide/sysctl/vm.rst
> > +++ b/Documentation/admin-guide/sysctl/vm.rst
> > @@ -267,6 +268,37 @@ used::
> >  These are informational only.  They do not mean that anything is wrong
> >  with your system.  To disable them, echo 4 (bit 2) into drop_caches.
> >
> > +enable_soft_offline
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Correctable memory errors are very common on servers. Soft-offline is =
kernel's
> > +solution for memory pages having (excessive) corrected memory errors.
> > +
> > +For different types of page, soft-offline has different behaviors / co=
sts.
> > +- For a raw error page, soft-offline migrates the in-use page's conten=
t to
> > +  a new raw page.
> > +- For a page that is part of a transparent hugepage,  soft-offline spl=
its the
>
> Use only one space after the comma ...................^
>
> > +  transparent hugepage into raw pages, then migrates only the raw erro=
r page.
> > +  As a result, user is transparently backed by 1 less hugepage, impact=
ing
> > +  memory access performance.
> > +- For a page that is part of a HugeTLB hugepage, soft-offline first mi=
grates
> > +  the entire HugeTLB hugepage, during which a free hugepage will be co=
nsumed
> > +  as migration target.  Then the original hugepage is dissolved into r=
aw
> > +  pages without compensation, reducing the capacity of the HugeTLB poo=
l by 1.
> > +
> > +It is user's call to choose between reliability (staying away from fra=
gile
> > +physical memory) vs performance / capacity implications in transparent=
 and
> > +HugeTLB cases.
> > +
> > +For all architectures, enable_soft_offline controls whether to soft of=
fline
> > +memory pages.  When setting to 1, kernel attempts to soft offline the =
pages
>
>                   When set to 1,
>
> > +whenever it thinks needed.  When setting to 0, kernel returns EOPNOTSU=
PP to
>
>                                When set to 0,

Thanks Randy! I will fix these 3 nits in v6.

>
> > +the request to soft offline the pages.  Its default value is 1.
> > +
> > +It is worth mentioning that after setting enable_soft_offline to 0, th=
e
> > +following requests to soft offline pages will not be performed:
> > +- Request to soft offline pages from RAS Correctable Errors Collector.
> > +- On ARM, the request to soft offline pages from GHES driver.
> > +- On PARISC, the request to soft offline pages from Page Deallocation =
Table.
> >
> >  extfrag_threshold
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> --
> ~Randy


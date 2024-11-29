Return-Path: <linux-doc+bounces-31046-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A4E9D19C2
	for <lists+linux-doc@lfdr.de>; Mon, 18 Nov 2024 21:41:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0811C1F21DFB
	for <lists+linux-doc@lfdr.de>; Mon, 18 Nov 2024 20:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4F91E766D;
	Mon, 18 Nov 2024 20:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="UO9T7WTU"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD681E5711
	for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 20:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731962497; cv=none; b=OmgReDO7ki8yLaR0/193vhsTWzLKHYZVAfxG+UZb53MrjdKC6TaLL8rA1oQ8Yx2oG9oOJDY3m45f2WOWGqzuwFmqdvzgNSYGM35k7oZu9JzSAypaC+DagP4XiV1i4aknBV4q6A7J63xFVLvhwlMWdcMzZuT/DbM0dg7zBsUvCo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731962497; c=relaxed/simple;
	bh=DuvqVex8v4I85GuvRnBvX/iPfLueakya1eGiH+YOOtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tc8qRrvCZ27XHFUc4rToU+lyDY0RzPlZfpbT6/ooYJgfckyPs9n06B/1PcpcJfbl8bzBIFbZW1c/2N5mNYnsPevCNZFyASBm4/RTOQQ1qP48YnCcRxHGLZS3mQ2YLDZ5liJx0xkvNQQXKAyTek1kgBXPBaTdGI9YMSdw+n/ZBY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=UO9T7WTU; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-460ad98b043so37304631cf.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 12:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1731962493; x=1732567293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7QbYKH9VPj+hOiY2fMyzgFnxLdVIg0zx+W2Cj3yPZY=;
        b=UO9T7WTUDkhbZzKSGNAgMPqSL2FJKrlluBn16jaI7Z7W02xelaVf3zSf4v0Vg3m2Zd
         jZ8UKlzpfw8sT76bv5k9nyPEjxvH5Mw5s43ndQAbMYjySAilDFSdGW5Eklg9QDzNOJSU
         1F/5BjJtJuRpj5lWIzRrqQFi+j5jx6Qsv9neF7yffyrnMiooTAj+F5BgueZDV49TjLzD
         T8mbKEfCbtic9fi+TQcUz5xadT0RlFn1dAnxaKDt9zxPl9n1P3eX/GeshCumXEdFdtJT
         +vbIrmdHtUtq8G4fxOiitmV+lOeCUgc4hRTxOzhNdNgByUDfOhe8jCnh5bixJYvObpXh
         1new==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731962493; x=1732567293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h7QbYKH9VPj+hOiY2fMyzgFnxLdVIg0zx+W2Cj3yPZY=;
        b=Qn+C9c6hpyhUanVjPsEoEqFr7ErKRCBcNTPk8mKTp7fCCZWdHVdxM0y/yYXFZwudMK
         zbwX+PvVrHtVauEMEkcp5UBhw5odHtsPHOm1GuvWkfzskhWU84WgBE9S/MdGNYC6OVzY
         MyYNu/ZFGM3NVS6k40NVC2/I3IEMoRRhMj5LZLJwxD8zCmUJorCxzB2l2t2MKyHpDt5B
         81u74OWLz9x4AoQBJsKlDyUCQR3OWSDvjyWQqD9SLg8G6Q+U1bAKar19QV73zvQ8lXCy
         mowJkbtaCJEzuyg4TNAVbPWze8rv/P2+RjNja4CrCRa23XdruW0xE9X3lIbMY+6Kfn0T
         YQDg==
X-Forwarded-Encrypted: i=1; AJvYcCWVnqV75Sb0YGJDw5Zz77IsSVmoZ7En3+K+C0k98+u125dCiB0CVYDKKY1uzRkoPKiZ4d5dZfNQcvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSNiALfGYyGaFWA2mFdl/cfAjtWVitFoBgwf+mAHDb/GkDAJrg
	qSUR4kTi007DX7kvv7aV0aZPKmflzrsj01itmtM7yj81Nr9S9VIvmYO/zBDamUW8l8lQOOcKYov
	Xg5SBPpdFMO1haenBC4/iz5X7gfmR8/ttFHXyKQ==
X-Google-Smtp-Source: AGHT+IHPkTMdVsfpp0/RKbPrlEoVV8KzVq6dWNp5U77zumURe2jy0UVz6GBnOpAbjSuf9hSbp1U2atu8BDg1WdqwOVQ=
X-Received: by 2002:a05:622a:1916:b0:460:854f:a1c with SMTP id
 d75a77b69052e-46392e19039mr13350021cf.27.1731962493580; Mon, 18 Nov 2024
 12:41:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241116175922.3265872-1-pasha.tatashin@soleen.com>
 <20241116175922.3265872-2-pasha.tatashin@soleen.com> <8871d4b3-0cd8-4499-afe6-38a9c3426527@lucifer.local>
In-Reply-To: <8871d4b3-0cd8-4499-afe6-38a9c3426527@lucifer.local>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 18 Nov 2024 15:40:57 -0500
Message-ID: <CA+CK2bBqi7+RExARBq5m91kaxC+w+nLYnLf4wyM_MJjaxr2rAw@mail.gmail.com>
Subject: Re: [RFCv1 1/6] mm: Make get_vma_name() function public
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	akpm@linux-foundation.org, corbet@lwn.net, derek.kiernan@amd.com, 
	dragan.cvetic@amd.com, arnd@arndb.de, gregkh@linuxfoundation.org, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, tj@kernel.org, 
	hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, muchun.song@linux.dev, Liam.Howlett@oracle.com, 
	vbabka@suse.cz, jannh@google.com, shuah@kernel.org, vegard.nossum@oracle.com, 
	vattunuru@marvell.com, schalla@marvell.com, david@redhat.com, 
	willy@infradead.org, osalvador@suse.de, usama.anjum@collabora.com, 
	andrii@kernel.org, ryan.roberts@arm.com, peterx@redhat.com, oleg@redhat.com, 
	tandersen@netflix.com, rientjes@google.com, gthelen@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2024 at 5:27=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Sat, Nov 16, 2024 at 05:59:17PM +0000, Pasha Tatashin wrote:
> > Page Detective will be using get_vma_name() that is currently used by
> > fs/proc to show names of VMAs in /proc/<pid>/smaps for example.
> >
> > Move this function to mm/vma.c, and make it accessible by modules.
>
> This is incorrect.
>
> mm/vma.c is for internal VMA implementation details, whose interface is
> explicitly mm/vma.h. This is so we can maintain the internal mechanism
> separate from interfaces and, importantly, are able to userland unit test
> VMA functionality.
>
> I think this _should_ be in mm/vma.c, but if it were to be exported it
> would need to be via a wrapper function in mm/mmap.c or somewhere like
> this.

Ok, I can do that in the next version.

>
> Also you broke the vma tests, go run make in tools/testing/vma/...

Hm interesting, I will take a look, this is surprising, as this patch
should not really change the behavior of anything. I guess it would be
because of the out of kernel vma.c build?

>
> Your patch also does not apply against Andrew's tree and the mm-unstable
> branch (i.e. against 6.13 in other words) which is what new mm patches
> should be based upon.
>
> Maybe I'll comment on the cover letter, but I don't agree you should be
> doing mm implementation details in a driver.
>
> The core of this should be in mm rather than exporting a bunch of stuff a=
nd
> have a driver do it. You're exposing internal implementation details
> unnecessarily.

This is not a problem, I will convert Page Detective to be in core mm.

> > @@ -3474,6 +3474,9 @@ void setattr_copy(struct mnt_idmap *, struct inod=
e *inode,
> >
> >  extern int file_update_time(struct file *file);
> >
> > +void get_vma_name(struct vm_area_struct *vma, const struct path **path=
,
> > +               const char **name, const char **name_fmt);
> > +
>
> You're putting something in an mm/ C-file and the header in fs.h? Eh?

This is done so we do not have to include struct path into vma.h. fs.h
already has some vma functions like: vma_is_dax() and vma_is_fsdax().


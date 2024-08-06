Return-Path: <linux-doc+bounces-22321-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C75A949A4D
	for <lists+linux-doc@lfdr.de>; Tue,  6 Aug 2024 23:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBF47286287
	for <lists+linux-doc@lfdr.de>; Tue,  6 Aug 2024 21:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845D5166F0C;
	Tue,  6 Aug 2024 21:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="E2f6Y387"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C5114F9D7
	for <linux-doc@vger.kernel.org>; Tue,  6 Aug 2024 21:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722980285; cv=none; b=uJ/xaoYmicIzGKORm5KM35CEnA9BotmmN8D1RBkj+Mpwm/eltUyFyG8iN6QKaOaSeWE0xLw3C7Hh5Wd/0C7HVyuWMtiC8TM6HJw6a0ju70O0gZ5rH3o2a1TYXeiJqyjY4Ma4OxTrcsAivbMfNWI8rePJeJF5kGOPfMlgUZhztSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722980285; c=relaxed/simple;
	bh=P+LlFXVAR3ni2Q9lpbZyAlQdpPzTbV2ToRmZ+4oEOIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=a2DCUxrKnxuGlOm/nHcxyL4Dbcddg/sfaWP+jUOIzOJZ6nmzVsghlxTAxUqfl0t3IGSy/Kig+sTTEVEJMpP+7OUt3/7HGwxrJsz8yyZD4fQuyo/GNUWCQWOigcGOySOYkZ2UTNaYOCOjPubRazCTkZuHMOPFceD4QMqvyLMusow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=E2f6Y387; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-44fe28eb1bfso5645381cf.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Aug 2024 14:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1722980283; x=1723585083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XmlWe99DKTvSLptoxepSTHSiK1+FbVsnMpcepxt5N8=;
        b=E2f6Y3875sCi+FUMC4NnDIWYjuAY1SAoH/x5FpJ24DePrabii4oI5FqT8pU7OZgMYF
         qh/rCJ2vIPK16JkeQNZO7vSs9qTrf5R6HaNzKefw/vdlZQtp/tkEvMO2iJxPFqcZSB8C
         txvjrUzTdKdHw1TpSGJBnuDAFxEPGmAd4WV8VUk2hG7O/+XAjACvYR62XJdUI+x3VxG8
         UMaRuBy/ESUFzgrVbGEh0qDkhQb72Y9gjuGhRVDD6cL3Zu3V/gKrLdxyGgo1rOPyI8gU
         Sm6yvVIxln4bsqIZzlf6+2En2jLGeikoP5Xf/2568/veowAkdTOSykr9dyN5QA/nJ43a
         Qzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722980283; x=1723585083;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XmlWe99DKTvSLptoxepSTHSiK1+FbVsnMpcepxt5N8=;
        b=gXFRaw87bDsMr66qtRRcHiqJAhR+eXZHDXxs+xJ1i/iJSF+SD1ewMAyCsosi0OyBUs
         MHosgAf/GUgVuLfHum1zgJBEjPziRGfih2B6XhcI/zdi/KBOXWooKelQnoVw93ezl62K
         KzsM6FiABlbdTwFV9b333TZUPfaUJXmVYyTp4CsUdH7uyhAStWLJ+6vtyO0MMQyr9Owv
         GJ+5wWiG3rdAsaOlrl9omz7/IVj2GuN9v+Brsn9JioP0xuWCzx3pjZ0k5suWcD5xmkUV
         ngFf3UzZeLL2wkFXYbWvbBld8bjdNZqCkrBEVM4Kz/yib4k3VqPBcYqzRZageMRGU73j
         u9Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVJl/iqPp38ja/I3+klfbfntYAOWsykj+yYGh2ZVRvKbVPjofM2QL4nSKv7OQscHC+CVTAee9mUjZIWQq7aws6GYEjZhZllacPt
X-Gm-Message-State: AOJu0YxNBhT0gKKmRA8ndRhB3VfkrBHQOvsC/PZTOYu8wMzFAO6WFxOv
	nXYnxM7PKl421fsrOktFr9px8Ey401O6N4fPKX47wJCxeLBu/jbQh3KgUCVoLV/Tt60hEgMlE9Y
	pPI3OhzJWqstXdeRo6feig8YDWL7xBgPp2VdoZA==
X-Received: by 2002:a05:622a:1825:b0:447:dc9a:1cea with SMTP id
 d75a77b69052e-451892561c8mt209894061cf.13.1722980282606; Tue, 06 Aug 2024
 14:38:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605222751.1406125-1-souravpanda@google.com>
 <Zq0tPd2h6alFz8XF@aschofie-mobl2> <CA+CK2bAfgamzFos1M-6AtozEDwRPJzARJOmccfZ=uzKyJ7w=kQ@mail.gmail.com>
 <66b15addf1a80_c144829473@dwillia2-xfh.jf.intel.com.notmuch>
 <CA+CK2bC1ZsT3cuAMDAAUonys3BUxbb2JdnZXs1Ps3NbYZt5W2Q@mail.gmail.com> <ZrKNKRfaH7GliS3C@iweiny-mobl>
In-Reply-To: <ZrKNKRfaH7GliS3C@iweiny-mobl>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 6 Aug 2024 17:37:24 -0400
Message-ID: <CA+CK2bDnJsgjK-7H-8qJjdeejKJk7E7m-SDnwXatH4FHr4R0_g@mail.gmail.com>
Subject: Re: [PATCH v13] mm: report per-page metadata information
Cc: Dan Williams <dan.j.williams@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Sourav Panda <souravpanda@google.com>, corbet@lwn.net, gregkh@linuxfoundation.org, 
	rafael@kernel.org, akpm@linux-foundation.org, mike.kravetz@oracle.com, 
	muchun.song@linux.dev, rppt@kernel.org, david@redhat.com, 
	rdunlap@infradead.org, chenlinxuan@uniontech.com, yang.yang29@zte.com.cn, 
	tomas.mudrunka@gmail.com, bhelgaas@google.com, ivan@cloudflare.com, 
	yosryahmed@google.com, hannes@cmpxchg.org, shakeelb@google.com, 
	kirill.shutemov@linux.intel.com, wangkefeng.wang@huawei.com, 
	adobriyan@gmail.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	surenb@google.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	willy@infradead.org, weixugc@google.com, David Rientjes <rientjes@google.com>, 
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org, yi.zhang@redhat.com, 
	ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 6, 2024 at 4:53=E2=80=AFPM Ira Weiny <iweiny@iweiny-mobl> wrote=
:
>
> On Tue, Aug 06, 2024 at 01:59:54PM -0400, Pasha Tatashin wrote:
> > On Mon, Aug 5, 2024 at 7:06=E2=80=AFPM Dan Williams <dan.j.williams@int=
el.com> wrote:
> > >
> > > Pasha Tatashin wrote:
> > > [..]
> > > > Thank you for the heads up. Can you please attach a full config fil=
e,
> > > > also was anyone able to reproduce this problem in qemu with emulate=
d
> > > > nvdimm?
> > >
> > > Yes, I can reproduce the crash just by trying to reconfigure the mode=
 of
> > > a pmem namespace:
> > >
> > > # ndctl create-namespace -m raw -f -e namespace0.0
> > >
> > > ...where namespace0.0 results from:
> > >
> > >     memmap=3D4G!4G
> > >
> > > ...passed on the kernel command line.
> > >
> > > Kernel config here:
> > >
> > > https://gist.github.com/djbw/143705077103d43a735c179395d4f69a
> >
> > Excellent, I was able to reproduce this problem.
> >
> > The problem appear to be caused by this code:
> >
> > Calling page_pgdat() in depopulate_section_memmap():
> >
> > static void depopulate_section_memmap(unsigned long pfn, unsigned long =
nr_pages,
> >                 struct vmem_altmap *altmap)
> > {
> >         unsigned long start =3D (unsigned long) pfn_to_page(pfn);
> >         unsigned long end =3D start + nr_pages * sizeof(struct page);
> >
> >         mod_node_page_state(page_pgdat(pfn_to_page(pfn)), NR_MEMMAP,
> > <<<< We cannot do it.
> >                             -1L * (DIV_ROUND_UP(end - start, PAGE_SIZE)=
));
> >         vmemmap_free(start, end, altmap);
> > }
> >
> > The page_pgdat() returns NULL starting from:
> > pageunmap_range()
> >     remove_pfn_range_from_zone() <- page is removed from the zone.
>
> Is there any idea on a fix?  I'm seeing the same error.
>
> [  561.867431]  ? mod_node_page_state+0x11/0xa0
> [  561.867963]  section_deactivate+0x2a0/0x2c0
> [  561.868496]  __remove_pages+0x59/0x90
> [  561.868975]  arch_remove_memory+0x1a/0x40
> [  561.869491]  memunmap_pages+0x206/0x3d0
> [  561.869972]  devres_release_all+0xa8/0xe0
> [  561.870466]  device_unbind_cleanup+0xe/0x70
> [  561.870960]  device_release_driver_internal+0x1ca/0x210
> [  561.871529]  driver_detach+0x47/0x90
> [  561.871981]  bus_remove_driver+0x6c/0xf0
>
> Shall we revert this patch until we figure out a fix?

I am working on a fix, and will send it out in a couple hours.

Pasha


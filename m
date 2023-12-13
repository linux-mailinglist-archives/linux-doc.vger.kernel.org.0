Return-Path: <linux-doc+bounces-4156-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19787805B02
	for <lists+linux-doc@lfdr.de>; Tue,  5 Dec 2023 18:17:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C123E1F219FA
	for <lists+linux-doc@lfdr.de>; Tue,  5 Dec 2023 17:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7419B692AA;
	Tue,  5 Dec 2023 17:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="voLsq+fF"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 036721A5
	for <linux-doc@vger.kernel.org>; Tue,  5 Dec 2023 09:17:04 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5d7b1a8ec90so23113847b3.2
        for <linux-doc@vger.kernel.org>; Tue, 05 Dec 2023 09:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1701796623; x=1702401423; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+j0Ow1vOCeL95TLnZYt84KH1KzVbnclXd3P1tOJjQK4=;
        b=voLsq+fFM0MB3HHIIgFRcVbvhzwgrJcXUWcDadr8FVseJxCtPQseEB2OBBTo1KPTfz
         w5y4Zp1+5XH88Lb2c5N4IiTTPVhuNBA5VeHFFIG9hGcgiUGutAM4CWSeDn7CmF967ke5
         2TPWGKmmUbD7Gj9lE3Uu/LfkV0tyzEOjuFfOj+xJTcuchfXe8wXaGmywRQxorxThHpGZ
         UGpUo/ZqloQYSsquH8hm5/Pm5YDBAozRQ9FChNTL18ZapEjtVK5MLcBOIoqMqu6QQBDx
         U35/F/7KqC3axVQHgAOxLiik9yHZr25lEWfcpJjn5pyVc6dmFN7CLD1Nxo3CdezMIXZk
         2bxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701796623; x=1702401423;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+j0Ow1vOCeL95TLnZYt84KH1KzVbnclXd3P1tOJjQK4=;
        b=Xt0f0juQyJBU07sn2poqxHOkW3Y6hDUQEItART9fp2+8TT19m13pi8PCDlvqGNRMJb
         tgg1pO6SSFLvhhDScujGuLheuQyP343MLGWuxiIEs3ODiWyJYlUSF/WGkrTC1+X3LNjJ
         Bp/zwGW+u+JCPLUeGYXuMftUWXiOl0jYmIyO4DLwhWv/C7ySfscKqlhW1rjV5bu1VvY3
         r8elkhIUVfO10ISZJJ9eW8R757+fjO+FbWkDsE7YxCxvonsK2dOu8/M3ZUjSySrlF6as
         VnYBB/W8hFO/0bctdp1E35d2/nIoXFTxR9tw88dHUPN96nZNKNPjrSLeNgmkGHu7YgdN
         yCSw==
X-Gm-Message-State: AOJu0YxNe0MkDz7oCn5bNRP6+9MpcS2lpg2SUL4bzbY23sbm4l7GHjj2
	4JkmlpQvd0MNtiGN+KEMJil+Fw==
X-Google-Smtp-Source: AGHT+IHCOFtbuh+2xx33YQUO2m6y7idmJ/+9D8OhxohxpRR24h/b3yAyf/3HI6xxnibo2qd6edmAOg==
X-Received: by 2002:a81:52d2:0:b0:5d9:987d:36e1 with SMTP id g201-20020a8152d2000000b005d9987d36e1mr1208999ywb.76.1701796623181;
        Tue, 05 Dec 2023 09:17:03 -0800 (PST)
Received: from localhost (2603-7000-0c01-2716-da5e-d3ff-fee7-26e7.res6.spectrum.com. [2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with ESMTPSA id o4-20020a0ccb04000000b0067a24c354bdsm2691901qvk.20.2023.12.05.09.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 09:17:02 -0800 (PST)
Date: Tue, 5 Dec 2023 12:17:02 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Chris Li <chrisl@kernel.org>
Cc: Nhat Pham <nphamcs@gmail.com>, Matthew Wilcox <willy@infradead.org>,
	akpm@linux-foundation.org, cerasuolodomenico@gmail.com,
	yosryahmed@google.com, sjenning@redhat.com, ddstreet@ieee.org,
	vitaly.wool@konsulko.com, mhocko@kernel.org,
	roman.gushchin@linux.dev, shakeelb@google.com,
	muchun.song@linux.dev, linux-mm@kvack.org, kernel-team@meta.com,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	shuah@kernel.org
Subject: Re: [PATCH v8 1/6] list_lru: allows explicit memcg and NUMA node
 selection
Message-ID: <20231205171702.GB99931@cmpxchg.org>
References: <20231130194023.4102148-1-nphamcs@gmail.com>
 <20231130194023.4102148-2-nphamcs@gmail.com>
 <ZWjpNr3ZzvU4TDC8@casper.infradead.org>
 <CAKEwX=MV-F50i_=sZ0unfbgjrdxSTio00c4xTM19113BAN3-wA@mail.gmail.com>
 <20231130203522.GC543908@cmpxchg.org>
 <CAF8kJuOvi6jrSPPKNeS1LFzEAPZwO77vEi5KQwW0c3eU13rcqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF8kJuOvi6jrSPPKNeS1LFzEAPZwO77vEi5KQwW0c3eU13rcqQ@mail.gmail.com>

On Mon, Dec 04, 2023 at 04:30:44PM -0800, Chris Li wrote:
> On Thu, Nov 30, 2023 at 12:35 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > On Thu, Nov 30, 2023 at 12:07:41PM -0800, Nhat Pham wrote:
> > > On Thu, Nov 30, 2023 at 11:57 AM Matthew Wilcox <willy@infradead.org> wrote:
> > > >
> > > > On Thu, Nov 30, 2023 at 11:40:18AM -0800, Nhat Pham wrote:
> > > > > This patch changes list_lru interface so that the caller must explicitly
> > > > > specify numa node and memcg when adding and removing objects. The old
> > > > > list_lru_add() and list_lru_del() are renamed to list_lru_add_obj() and
> > > > > list_lru_del_obj(), respectively.
> > > >
> > > > Wouldn't it be better to add list_lru_add_memcg() and
> > > > list_lru_del_memcg() and have:
> 
> That is my first thought as well. If we are having two different
> flavors of LRU add, one has memcg and one without. The list_lru_add()
> vs list_lru_add_memcg() is the common way to do it.
> > > >
> > > > +bool list_lru_del(struct list_lru *lru, struct list_head *item)
> > > > +{
> > > > +       int nid = page_to_nid(virt_to_page(item));
> > > > +       struct mem_cgroup *memcg = list_lru_memcg_aware(lru) ?
> > > > +               mem_cgroup_from_slab_obj(item) : NULL;
> > > > +
> > > > +       return list_lru_del_memcg(lru, item, nid, memcg);
> > > > +}
> > > >
> > > > Seems like _most_ callers will want the original versions and only
> > > > a few will want the explicit memcg/nid versions.  No?
> > > >
> > >
> > > I actually did something along that line in earlier iterations of this
> > > patch series (albeit with poorer naming - __list_lru_add() instead of
> > > list_lru_add_memcg()). The consensus after some back and forth was
> > > that the original list_lru_add() was not a very good design (the
> > > better one was this new version that allows for explicit numa/memcg
> > > selection). So I agreed to fix it everywhere as a prep patch.
> > >
> > > I don't have strong opinions here to be completely honest, but I do
> > > think this new API makes more sense (at the cost of quite a bit of
> > > elbow grease to fix every callsites and extra reviewing).
> >
> > Maybe I can shed some light since I was pushing for doing it this way.
> >
> > The quiet assumption that 'struct list_head *item' is (embedded in) a
> > slab object that is also charged to a cgroup is a bit much, given that
> > nothing in the name or documentation of the function points to that.
> 
> We can add it to the document if that is desirable.

It would help, but it still violates the "easy to use, hard to misuse"
principle. And I think it does the API layering backwards.

list_lru_add() is the "default" API function. It makes sense to keep
that simple and robust, then add add convenience wrappers for
additional, specialized functionality like memcg lookups for charged
slab objects - even if that's a common usecase.

It's better for a new user to be paused by the require memcg argument
in the default function and then go and find list_lru_add_obj(), than
it is for somebody to quietly pass an invalid object to list_lru_add()
and have subtle runtime problems and crashes (which has happened twice
now already).


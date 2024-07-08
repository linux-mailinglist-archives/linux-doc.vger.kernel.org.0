Return-Path: <linux-doc+bounces-20202-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D7F92A329
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jul 2024 14:48:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2E381F230DC
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jul 2024 12:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE2984FA5;
	Mon,  8 Jul 2024 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NNBueFj9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E4A824A1
	for <linux-doc@vger.kernel.org>; Mon,  8 Jul 2024 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720442898; cv=none; b=DTr3N7riXH9GocUAtnA+GYsCxD0nyP+idq03Kq8ifaGA/qPhmIjadGRJRhuxPCLQxrktoucVYp+hC4WSCFY4AwnPJATtRolEAib9WSmNkZUY20l8KiQgCXRSIH9xSiZW3kr7i0pQ8nnn1OzL6171HJutJ0KSWXjBcazsc53qbNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720442898; c=relaxed/simple;
	bh=e+JPE6RV4+WhCTkyb2r7IHgJpza1D8x2iyR3fUThmdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0N3bt8+yBXbiPX2hQcM6eJKiouAsSW0Psh4vIT9hoqy09ql5MU44OR4PbedTimhYyQkSclVSSyHsv0xlOX/EWQuZhoYiwWAZGVuK01Dmjw1Pdc09ArINvONJI/dmOCqh+pP9mqfhlBmDEJqZSdbQuJPsCvB+qrBAY5g3MsACuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NNBueFj9; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a77c2d89af8so416316366b.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Jul 2024 05:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720442894; x=1721047694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fK5HtVriGenm5ML1JpdFXOU3g+iCUeiv2gozAo0WN/s=;
        b=NNBueFj9ljTPVEF95jG9I4Cy3YdmtcyRfGBtBKiE5SZlkM+cRgk8HgBLgPnrgWa8Np
         LsSpkdK6OGW7UbJMlXwcaPJMGBuyFzz/xtCId09GoXMY3L636OGwUkpppwT25jfBr/0d
         0GqWy0mGZbcoitTbMeADG2K0kL8w9Dy9QQHM+I4Yik0nnXuaA1aD8aOTwofZzaPVH2Iz
         CgQ1zTVX9fq7Nfhezd4JnznJJxRN5JuYsPTl0soB52nBqTvIyL/eaGNZthdV7lSnreNq
         AGcyS9j+6Dc97dmjWaF22NrUC7+3JTt4Jt+vgwDwsGXpQo/f9uRC9sTyY7ZzXZkp4U6G
         wSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720442894; x=1721047694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fK5HtVriGenm5ML1JpdFXOU3g+iCUeiv2gozAo0WN/s=;
        b=SxwpK/fp6uCdqP5iJasGyxrBt564ZaLZEKl3tT930jHpv7REy4h6FXTIc+w+5fN1/X
         ES5dFZjfidjioW7uM8nhE96UNUrP0jVmWxLSZ21SuANxdYlVGBvTbbf8Cc0sTcIziwQ9
         Prdt7TxEixg/7RS1/lXvG1N4e8L746fdlELItyx0uixa+jNbSrlGVtBKWWc+g7/yuw0D
         JkCEkJ0nE07TurKdEEz/FdRaOHkVsiT4QL3p8NsiyeXSbsID0B9lqqzRtuj9unb4MPDc
         Dku0GWmwMWEzr37nJp4tVLIdXnSjtSeHhuXL0rv8WAzfc31Hdy4GDwTea5zJThvGut2P
         JcOg==
X-Forwarded-Encrypted: i=1; AJvYcCUbFIGmmWtz6fp/JMRdARnGXkeWI09S4kyzZhEQAKt7wGEAgQ0aiuEwd1hjZbC+FXAG9JNVRSW4C+HGoRiakiXNDDNa6mEPrkh8
X-Gm-Message-State: AOJu0YzwdqisOo1Y3gt/K5trP5GLNT8JZmZfyEckESLJX7Pzof2mSDCI
	uXFpxKyJsQNJMiYt6CdpVwO54p9GaR93FxTEvEAnqvQl7+eQrFwb7dt7xtk9Wf8=
X-Google-Smtp-Source: AGHT+IGwaHfNVUOdVeIQh5PDgHlFtNS0KriPJG08xmwkOUQ8J2Y8vvp7jybJ1dinpCMovCYMRlZEhQ==
X-Received: by 2002:a17:907:969e:b0:a75:110d:fa53 with SMTP id a640c23a62f3a-a77ba70baf4mr939217266b.49.1720442893911;
        Mon, 08 Jul 2024 05:48:13 -0700 (PDT)
Received: from localhost ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77d808b81esm278822266b.151.2024.07.08.05.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 05:48:13 -0700 (PDT)
Date: Mon, 8 Jul 2024 14:48:13 +0200
From: Michal Hocko <mhocko@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: xiujianfeng <xiujianfeng@huawei.com>, tj@kernel.org,
	lizefan.x@bytedance.com, hannes@cmpxchg.org, corbet@lwn.net,
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Sidhartha Kumar <sidhartha.kumar@oracle.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH -next] mm/hugetlb_cgroup: introduce peak and rsvd.peak to
 v2
Message-ID: <ZovgDfGFJdc6lVN3@tiehlicka>
References: <20240702125728.2743143-1-xiujianfeng@huawei.com>
 <20240702185851.e85a742f3391857781368f6c@linux-foundation.org>
 <6843023e-3e80-0c1c-6aab-b386ffebd668@huawei.com>
 <20240703133804.1d8ddf90f738a7d546399b3b@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703133804.1d8ddf90f738a7d546399b3b@linux-foundation.org>

On Wed 03-07-24 13:38:04, Andrew Morton wrote:
> On Wed, 3 Jul 2024 10:45:56 +0800 xiujianfeng <xiujianfeng@huawei.com> wrote:
> 
> > 
> > 
> > On 2024/7/3 9:58, Andrew Morton wrote:
> > > On Tue, 2 Jul 2024 12:57:28 +0000 Xiu Jianfeng <xiujianfeng@huawei.com> wrote:
> > > 
> > >> Introduce peak and rsvd.peak to v2 to show the historical maximum
> > >> usage of resources, as in some scenarios it is necessary to configure
> > >> the value of max/rsvd.max based on the peak usage of resources.
> > > 
> > > "in some scenarios it is necessary" is not a strong statement.  It
> > > would be helpful to fully describe these scenarios so that others can
> > > better understand the value of this change.
> > > 
> > 
> > Hi Andrew,
> > 
> > Is the following description acceptable for you?
> > 
> > 
> > Since HugeTLB doesn't support page reclaim, enforcing the limit at
> > page fault time implies that, the application will get SIGBUS signal
> > if it tries to fault in HugeTLB pages beyond its limit. Therefore the
> > application needs to know exactly how many HugeTLB pages it uses before
> > hand, and the sysadmin needs to make sure that there are enough
> > available on the machine for all the users to avoid processes getting
> > SIGBUS.

yes, this is pretty much a definition of hugetlb.

> > When running some open-source software, it may not be possible to know
> > the exact amount of hugetlb it consumes, so cannot correctly configure
> > the max value. If there is a peak metric, we can run the open-source
> > software first and then configure the max based on the peak value.

I would push back on this. Hugetlb workloads pretty much require to know
the number of hugetlb pages ahead of time. Because you need to
preallocate them for the global hugetlb pool. What I am really missing
in the above justification is an explanation of how come you know how to
configure the global pool but you do not know that for a particular
cgroup. How exactly do you configure the global pool then?
-- 
Michal Hocko
SUSE Labs


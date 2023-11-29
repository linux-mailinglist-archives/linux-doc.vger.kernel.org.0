Return-Path: <linux-doc+bounces-3442-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E221C7FCB55
	for <lists+linux-doc@lfdr.de>; Wed, 29 Nov 2023 01:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE20F1C20F7B
	for <lists+linux-doc@lfdr.de>; Wed, 29 Nov 2023 00:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79F91860;
	Wed, 29 Nov 2023 00:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gDwjyiF7"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 088C21998
	for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 16:31:05 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54b545ec229so3960185a12.0
        for <linux-doc@vger.kernel.org>; Tue, 28 Nov 2023 16:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701217863; x=1701822663; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDVw23sOg2UrJKrxIvmA3Ztov9BQ3aaP2pKc9NVQp+Q=;
        b=gDwjyiF7xNTtWpq7+MYFD/sxdzxaRyGsMPmmguE6RLn9kMovj79BXTluE+6i4TQyWC
         /sVq1cKGb+r9h7ZU21fez0kbz3B6t2VAohfsCM3+3AaLjFTOhrwuGJ6lkhxbobIG/sIl
         N3U5AwUGZXsTAJ2WcKn1qO0yCbQdipNorV4GlHJKl0EyMJKmM2yMY8TTl1x/GBNiLRnj
         eEg/gnWreW4Ql8i3VMqQyOt7wAjrmbgNfd4pH1QdTnxKlV2FUXP7ZpTUWX4ydvmDAI4x
         jMUcsziXQf71dqjWrWOHnMAqxfmly1bHEKlaZp1DIOrJVbVAtd+Ul9CbM8qtQzUQvY1I
         GqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701217863; x=1701822663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDVw23sOg2UrJKrxIvmA3Ztov9BQ3aaP2pKc9NVQp+Q=;
        b=QFr/xl5/AQpM2RtYt6yDUN97ih9cdFlcN74FRgxSQ0EACA/QWg+TwQQ/1m0yQvYe0f
         f6vCmG+JpCgKVXCwNbh1+fWM8qdOzkdGgnxdW0T4eDeBNOfj5vpfK0+0GvosMEZbzRjk
         DiKFbQKDpZgj8fC8hbiYO4jyi9JRjRHxDklGqDPiebLFDPjbYW+i1TZZi2+wQTppGhWk
         tDCtFa0Qw7xZMxcXSQCb2SGCtNFTcYvzOHyGqoO7DV88ATn1UfNiEN0dQbDkiNiEmtK8
         c35z+LIP1UQOHmqN4XNBrAMK3s2CTZKPttYLujsvOoJmSG6XtDTIicoNh4jpIPtMKul8
         b3tA==
X-Gm-Message-State: AOJu0YzEt4H3Zdq1Ia3pP4RZct1dtSMhgr/byZkzWcFuVToL+xlB7HVO
	Kh3OlqFeY4F2bCWvlQAxpVJICHNufQSoxhfHRq2vdg==
X-Google-Smtp-Source: AGHT+IHC8UEOvU50jtsS7Vr0gcms1iLEnVOENRdNMxAoPBJBLye7+u3ipcvLY8pzJUFqT19PG/Ngi5chQxCjwtOqCvY=
X-Received: by 2002:a17:906:48d5:b0:a11:7ba8:6891 with SMTP id
 d21-20020a17090648d500b00a117ba86891mr5048211ejt.67.1701217863358; Tue, 28
 Nov 2023 16:31:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
 <CAJD7tkb1FqTqwONrp2nphBDkEamQtPCOFm0208H3tp0Gq2OLMQ@mail.gmail.com>
 <CA+CK2bB3nHfu1Z6_6fqN3YTAzKXMiJ12MOWpbs8JY7rQo4Fq0g@mail.gmail.com>
 <CAJD7tkZZNhf4KGV+7N+z8NFpJrvyeNudXU-WdVeE8Rm9pobfgQ@mail.gmail.com>
 <20231128235214.GD1312390@ziepe.ca> <CAJD7tkbbq6bHtPn7yE3wSS693OSthh1eBDvF-_MWZfDMXDYPKw@mail.gmail.com>
 <20231129002826.GG1312390@ziepe.ca>
In-Reply-To: <20231129002826.GG1312390@ziepe.ca>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 28 Nov 2023 16:30:27 -0800
Message-ID: <CAJD7tkbxhK7XFcf7h+XE2poNuOsFBQFrxZyeFr=9DoEG_acssA@mail.gmail.com>
Subject: Re: [PATCH 00/16] IOMMU memory observability
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, akpm@linux-foundation.org, 
	alex.williamson@redhat.com, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, baolu.lu@linux.intel.com, bhelgaas@google.com, 
	cgroups@vger.kernel.org, corbet@lwn.net, david@redhat.com, 
	dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
	iommu@lists.linux.dev, jasowang@redhat.com, jernej.skrabec@gmail.com, 
	jonathanh@nvidia.com, joro@8bytes.org, kevin.tian@intel.com, 
	krzysztof.kozlowski@linaro.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
	mhiramat@kernel.org, mst@redhat.com, m.szyprowski@samsung.com, 
	netdev@vger.kernel.org, paulmck@kernel.org, rdunlap@infradead.org, 
	robin.murphy@arm.com, samuel@sholland.org, suravee.suthikulpanit@amd.com, 
	sven@svenpeter.dev, thierry.reding@gmail.com, tj@kernel.org, 
	tomas.mudrunka@gmail.com, vdumpa@nvidia.com, virtualization@lists.linux.dev, 
	wens@csie.org, will@kernel.org, yu-cheng.yu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 4:28=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Tue, Nov 28, 2023 at 04:25:03PM -0800, Yosry Ahmed wrote:
>
> > > > Right, but as I mention above, if userspace starts depending on thi=
s
> > > > equation, we won't be able to add any more classes of "secondary" p=
age
> > > > tables to SecPageTables. I'd like to avoid that if possible. We can=
 do
> > > > the subtraction in the kernel.
> > >
> > > What Sean had suggested was that SecPageTables was always intended to
> > > account all the non-primary mmu memory used by page tables. If this i=
s
> > > the case we shouldn't be trying to break it apart into finer
> > > counters. These are big picture counters, not detailed allocation by
> > > owner counters.
> >
> > Right, I agree with that, but if SecPageTables includes page tables
> > from multiple sources, and it is observed to be suspiciously high, the
> > logical next step is to try to find the culprit, right?
>
> You can make that case already, if it is high wouldn't you want to
> find the exact VMM process that was making it high?
>
> It is a sign of fire, not a detailed debug tool.

Fair enough. We can always add separate counters later if needed,
potentially under KVM stats to get more fine-grained details as you
mentioned.

I am only worried about users subtracting the iommu-only counter to
get a KVM counter. We should at least document that  SecPageTables may
be expanded to include other sources later to avoid that.

>
> Jason


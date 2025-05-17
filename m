Return-Path: <linux-doc+bounces-46574-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1942ABA88A
	for <lists+linux-doc@lfdr.de>; Sat, 17 May 2025 08:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88AE44A564E
	for <lists+linux-doc@lfdr.de>; Sat, 17 May 2025 06:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867BE14EC5B;
	Sat, 17 May 2025 06:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dl+WyXLt"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21B1156F5E
	for <linux-doc@vger.kernel.org>; Sat, 17 May 2025 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747464487; cv=none; b=SBFj291PsUQ1NjArYKBALGS8r6pJ1dQNTIlMiYHmP68aoQ5/lV9j/gZe5fKnTyZr7no4bCuFgA34P5WmvFG+uG2k4FUkfcY6KPa8an/8OFULENwRePKupVWhcWUjEv9zAhEVTELOLEOt9BBDPPtzKNReNO7YddOHKG20sFa/bFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747464487; c=relaxed/simple;
	bh=xoefSDHoQ2MJkgHc9vHEmIq4AuLZsAA319tBfQ3WAL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e4AdRC40Z5nVIy+pHTGfIaFauj5+P+nrOyMuqIi4zbkABgDgOzNVkdQxAI+9iMRGIgi7gLOFURtTD/e3E+9rYif1zPG3UtYZQ8N1ZleXJpGhZtiGB6riQ3jXgPl+DCSInoO6FmxCfyKobur4QKqJzysEzQ2fanha/7b4+vX2kmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dl+WyXLt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747464484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xoefSDHoQ2MJkgHc9vHEmIq4AuLZsAA319tBfQ3WAL0=;
	b=Dl+WyXLtxx32GZORrm5EDLTlkAXRq8u0OFl5v8sZOh1Ak6+sihX9ehrk6sZAsJ+5evMcX1
	+WGHxHPSwhOmT3tRkO0bzkn6RsxS28DSw8tSja8TjLxRVokX7JzbhLIDfRbTINagvnoJRx
	yST0Ar98MW41yLhuuWL5D2+UF0jPmlA=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-xhlTewH4OvuTCqoC2hth0g-1; Sat, 17 May 2025 02:48:02 -0400
X-MC-Unique: xhlTewH4OvuTCqoC2hth0g-1
X-Mimecast-MFC-AGG-ID: xhlTewH4OvuTCqoC2hth0g_1747464482
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-70ad3a91ab2so40850387b3.1
        for <linux-doc@vger.kernel.org>; Fri, 16 May 2025 23:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747464482; x=1748069282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoefSDHoQ2MJkgHc9vHEmIq4AuLZsAA319tBfQ3WAL0=;
        b=FSkxIQPYB9WQ+sBJ3CodW+dBfjkWwhe9xnyuzxg9ZlgS8rPO5USu6UpI9O7eQXNZGJ
         yCmivSPZ/NNMtDwSxtQNA+y5M08kUz0H4+J7hh3nIdNgMLIqZ7Vam2gQ8fudWzSQZW6t
         qRAawIF5E8FB27okSIhHPUPSfgz8g0jSjl9HwRC78cc+pfqNuSd/2u8C5cQA64LRTo1P
         acUhQGteORV7nURzAtKfT4+YdbhbNDHIbqnypfCM5wZIxDOycQlWp4cYFhEdGFTGR1px
         SCfNXKoCbGELne7DCUtPaa5TEY4O2zda5AhUlXJmiMDzzHCIrFpS/iMtgLRxpk35L2WO
         LWwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl076RXgO4uUH36YWQteoArt5EVH7d4wnCNNJ4vaQ5Ay4ifwwklJF6+t8xhm8j8/0J9UbDZ802zZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvvb5lVEgBAwJuoZ2/KcfhQISfT032xCjf2mABrBxw4cXAF+Sa
	Hi6HfYA7pAHBhcKKKG7Reu2sUYPm6+nF00hRtxHrU6WFOOllcd3cqNueKKAKe5zkp6719bmrtR5
	6b2rFeBDhZwWRTrqwgTDGVeGiF51jelezIVu4CPYI/3QPfDYi5ocHO9nPgIIeiWx/6knuFKpYVo
	c3S3D8nPsUfRit6P0Fy6H/hg7PCugel3bNH3mf
X-Gm-Gg: ASbGncvQiKHtTQffLkuSbVXUD/ff6fsSgd3YwVbGDyv/5roKGW3GKxNvVpFvRTeLpi9
	tSBaMIK+9skuogFmjJU5ujf0JKnVYR1ZIqxLh1ThjWkw5Vt9qGj026nAYQ07pCMtK9uG2RWQ=
X-Received: by 2002:a05:690c:3:b0:707:dba5:2e44 with SMTP id 00721157ae682-70ca7ba0d8emr93966777b3.30.1747464482218;
        Fri, 16 May 2025 23:48:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNMmgN96ppS4R9A56rSKNlS+EhkQE/xJYfY1RrmT+t29R40GTIUMkgVA9ErgvZMyurnYk8q2A+N4SmrSywNXI=
X-Received: by 2002:a05:690c:3:b0:707:dba5:2e44 with SMTP id
 00721157ae682-70ca7ba0d8emr93966347b3.30.1747464481896; Fri, 16 May 2025
 23:48:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515032226.128900-1-npache@redhat.com> <20250515032226.128900-7-npache@redhat.com>
 <9c54397f-3cbf-4fa2-bf69-ba89613d355f@linux.alibaba.com>
In-Reply-To: <9c54397f-3cbf-4fa2-bf69-ba89613d355f@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Sat, 17 May 2025 00:47:35 -0600
X-Gm-Features: AX0GCFs8Yc5oWY97Oxpxk79pJ4fpAxS1pc4Oj0m-wPhCk0WUp_t3490TgtutRYc
Message-ID: <CAA1CXcC9MB2Nw4MmGajESfH8DhAsh4QvTj4ABG3+Rg2iPi087w@mail.gmail.com>
Subject: Re: [PATCH v7 06/12] khugepaged: introduce khugepaged_scan_bitmap for
 mTHP support
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 9:20=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/5/15 11:22, Nico Pache wrote:
> > khugepaged scans anons PMD ranges for potential collapse to a hugepage.
> > To add mTHP support we use this scan to instead record chunks of utiliz=
ed
> > sections of the PMD.
> >
> > khugepaged_scan_bitmap uses a stack struct to recursively scan a bitmap
> > that represents chunks of utilized regions. We can then determine what
> > mTHP size fits best and in the following patch, we set this bitmap whil=
e
> > scanning the anon PMD. A minimum collapse order of 2 is used as this is
> > the lowest order supported by anon memory.
> >
> > max_ptes_none is used as a scale to determine how "full" an order must
> > be before being considered for collapse.
> >
> > When attempting to collapse an order that has its order set to "always"
> > lets always collapse to that order in a greedy manner without
> > considering the number of bits set.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
>
> Sigh. You still haven't addressed or explained the issues I previously
> raised [1], so I don't know how to review this patch again...
Can you still reproduce this issue?
I can no longer reproduce this issue, that's why I posted... although
I should have followed up, and looked into what the original issue
was. Nothing really sticks out so perhaps something in mm-new was
broken and pulled out... not sure.

It should now follow the expected behavior, which is that no mTHP
collapse occurs because if the PMD size is disabled so is khugepaged
collapse.

Lmk if you are still experiencing this issue please.

Cheers,
-- Nico
>
> [1]
> https://lore.kernel.org/all/83a66442-b7c7-42e7-af4e-fd211d8ed6f8@linux.al=
ibaba.com/
>



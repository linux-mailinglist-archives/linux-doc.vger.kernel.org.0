Return-Path: <linux-doc+bounces-50991-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 198A4AEB92A
	for <lists+linux-doc@lfdr.de>; Fri, 27 Jun 2025 15:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41EE93BE943
	for <lists+linux-doc@lfdr.de>; Fri, 27 Jun 2025 13:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D9D2DCC15;
	Fri, 27 Jun 2025 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WhvmDKIT"
X-Original-To: linux-doc@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3132DCBEE
	for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 13:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751031862; cv=none; b=sKZLpn07YR23FI1kv4jvN/h6oUMCIahjA3D1CwpRFEZSGMvtxfBYPLWa5OFncem4m356JNEFfbFTYIFVV0ilS4S8jOdekUW4D7tS9PkF7EKn+TsS2KFqRNxYb5+iqwCuNfbS/NgVkAlEUa7M++7QYHv4ec+jiJ2aes6vDOT52Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751031862; c=relaxed/simple;
	bh=5rws0OIbeHe2CRb1G1qFVEHOO3Qznulp1JmZYPqVS5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=l85OdHVO1N5dAsCt4COXMXOL4U+wlM+FeiC+5GzPYKmHZHNOdw+CLFLc/esi0UMSEKEjeWJI9659kFse2MzQMcz0YHS4vsd7gIt/V646J/4BQQ1/ncMata3/cOKG6QAMHEAd52OxmR66h5cPruOsKBW2SK2Db54BCJqZLgWXbJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WhvmDKIT; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250627134412euoutp02f7d21139e68893e38512c530d9be2f39~M6jFcKLKA2275722757euoutp024
	for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 13:44:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250627134412euoutp02f7d21139e68893e38512c530d9be2f39~M6jFcKLKA2275722757euoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751031852;
	bh=XkLT3H6zpZxdqKr2mL/WBFZuhTWHNBcRcJJv1Mo/N0Y=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=WhvmDKITyLEkhw3MRTwTgoaWKOjFTMjKnV8wJOos+T/cXs8qV0a45KyYKjjHHphNR
	 ejlC6A7c/3G9ZGM0g5x9rtRdfSUOXwvaNPvqe2cEjseVkiFdxFjJMEeYZdJBH545i+
	 hY7QPcy7sQUOkaipwLKySn5wWBeenoGfWxQTqISc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250627134412eucas1p153bc3e4a1c0897bca604e6864667b66d~M6jEutC8v1155611556eucas1p1O;
	Fri, 27 Jun 2025 13:44:12 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250627134410eusmtip109d5d74275daabf2f21b42eb7440b88b~M6jDFXzcn2675526755eusmtip1I;
	Fri, 27 Jun 2025 13:44:10 +0000 (GMT)
Message-ID: <35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
Date: Fri, 27 Jun 2025 15:44:10 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] dma-mapping: migrate to physical address-based API
To: Leon Romanovsky <leon@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Robin Murphy <robin.murphy@arm.com>, Joerg
	Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Michael S.
	Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Potapenko <glider@google.com>, Marco Elver
 <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 iommu@lists.linux.dev, virtualization@lists.linux.dev,
 kasan-dev@googlegroups.com, linux-trace-kernel@vger.kernel.org,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@ziepe.ca>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <cover.1750854543.git.leon@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250627134412eucas1p153bc3e4a1c0897bca604e6864667b66d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf
X-EPHeader: CA
X-CMS-RootMailID: 20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com>
	<cover.1750854543.git.leon@kernel.org>

On 25.06.2025 15:18, Leon Romanovsky wrote:
> This series refactors the DMA mapping to use physical addresses
> as the primary interface instead of page+offset parameters. This
> change aligns the DMA API with the underlying hardware reality where
> DMA operations work with physical addresses, not page structures.
>
> The series consists of 8 patches that progressively convert the DMA
> mapping infrastructure from page-based to physical address-based APIs:
>
> The series maintains backward compatibility by keeping the old
> page-based API as wrapper functions around the new physical
> address-based implementations.

Thanks for this rework! I assume that the next step is to add map_phys 
callback also to the dma_map_ops and teach various dma-mapping providers 
to use it to avoid more phys-to-page-to-phys conversions.

I only wonder if this newly introduced dma_map_phys()/dma_unmap_phys() 
API is also suitable for the recently discussed PCI P2P DMA? While 
adding a new API maybe we should take this into account? My main concern 
is the lack of the source phys addr passed to the dma_unmap_phys() 
function and I'm aware that this might complicate a bit code conversion 
from old dma_map/unmap_page() API.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland



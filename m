Return-Path: <linux-doc+bounces-15620-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4280D8B9465
	for <lists+linux-doc@lfdr.de>; Thu,  2 May 2024 07:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0819B283C78
	for <lists+linux-doc@lfdr.de>; Thu,  2 May 2024 05:52:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E535220B20;
	Thu,  2 May 2024 05:52:11 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF1A1E494;
	Thu,  2 May 2024 05:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714629131; cv=none; b=bvJXthWz3pYRZxgK9exd4WRgORR5TbHPS4uS7tzCg1s9luzRhoTuUqBjbBKItK7s/JgAPU8/+1f1/I6mW7ZRZrYKevNv9jWMp65tGP40vEHKarVswOWQ/aP9UyOSP57iB1FnWbOOEl5rchuYgMpwZumVfXaQT1DrpDhAbphO2bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714629131; c=relaxed/simple;
	bh=OTN8OKUwUtgeS/b4hDd67/FdTa7TqUbmfFwTxWPmJ5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GYpQ0PiJJlDjBVwIE/Ii2w/PaFU+d16UuI/qjg5R5NfmIoeQvEhubmcIVtCzI+UZsCjQecxLVcQXAI4bfQuELyt6u+NOt3hrwpBkLpwo3iVCjkg1jsQOxXzVsml96z6HlCNJCMK5jHOh/R2QtN8mBQFcEwvmBgB1q81suljaJGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id B9EC0227A87; Thu,  2 May 2024 07:52:05 +0200 (CEST)
Date: Thu, 2 May 2024 07:52:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: mhklinux@outlook.com
Cc: robin.murphy@arm.com, joro@8bytes.org, will@kernel.org, hch@lst.de,
	m.szyprowski@samsung.com, corbet@lwn.net, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	petr@tesarici.cz, roberto.sassu@huaweicloud.com
Subject: Re: [PATCH v4 1/1] Documentation/core-api: Add swiotlb
 documentation
Message-ID: <20240502055205.GA28436@lst.de>
References: <20240501151651.2912-1-mhklinux@outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501151651.2912-1-mhklinux@outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks,

applied to the dma-mapping tree for 6.10.



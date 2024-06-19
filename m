Return-Path: <linux-doc+bounces-18973-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C924090F88B
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jun 2024 23:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8032F2825E5
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jun 2024 21:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D374215099B;
	Wed, 19 Jun 2024 21:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3u38TBi5"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016CE7E58C;
	Wed, 19 Jun 2024 21:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718832837; cv=none; b=gGLV1uAz5DcOZp0pLB/quD1Oseq1e8PvAqIedORWFyaWT25Au8dNSkUzi0aIlCqQnhHE3IEwWzCDyNQiWqZ/fiIhCjNwY392eC6UW98akMIluTnkc+vk703P+tDdLmipfj30kkrK74hl24jt5UG4nka/WkIWePT+VOYAVYAqGNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718832837; c=relaxed/simple;
	bh=ZFETDwDmv6LvvLfjCkKzNorKWaz/5zHLwn3nwmYMaGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GR7JOGIga0y+4fQ9LVlBAkxvwv0pdjoEaqYHH7afCtuaZ/imkKg4wddOGVFqNNn3d6JM9Ex3+/5J35k/YIBJwa2Z4Bj1HGoM0QDgTdLE/dJNTWkzDfikFW7AIW4ZxjoNsn1UjlT4zH3yzl+R78F+p7/LAxNzXeyMbmNbcao8o/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=3u38TBi5; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=yKwLG1tKrqHjcwlau90E4nwOFiF9kAg1uiumFhC1VnM=; b=3u38TBi5+aHvgvG4RRhluQAFXl
	ZUGNoAxgIvVFISze1OFQf3HPtG8ga9tiCZfBwoQ+vrd5FD9lFq+QL+hwGKFCM7Tq5F+eH4vNpNRJV
	N10EKvdRqeFKmHoDp6U8o0yCuIQeRMlkH9r61Hjtco26xfTu/aD0l4FbSDlzjB6WORh6sz/BNZTeO
	Xdt6RJidibpnU+2DvPmFuErK3BWh47NqAXCnJ0BjK8zhEVGJJwshjlw24I74RBuhONub2rszdW5nK
	oM8QVovIH3xpptnwS6644JsEVIf4e1j3huI25liizyTkMzEuMgAZfyNY6FAMtzWMzAFAvFq7wVOjJ
	VEs1t5aQ==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK2wF-00000002mnp-29IT;
	Wed, 19 Jun 2024 21:33:55 +0000
Message-ID: <b6dd319f-4de7-42e8-a06e-a54633590b29@infradead.org>
Date: Wed, 19 Jun 2024 14:33:53 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] English fixes in vmalloced kernel stacks documentation
To: Nir Lichtman <nir@lichtman.org>, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240619210707.GA3570474@lichtman.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240619210707.GA3570474@lichtman.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/19/24 2:07 PM, Nir Lichtman wrote:
> @@ -104,7 +104,7 @@ with PAGE_KERNEL protections.
>  
>  Thread stack allocation is initiated from clone(), fork(), vfork(),
>  kernel_thread() via kernel_clone(). Leaving a few hints for searching
> -the code base to understand when and how thread stack is allocated.
> +the code base to understand when and how a thread stack is allocated.

That last part is still not a sentence AFAICT. How about something like:

>  Thread stack allocation is initiated from clone(), fork(), vfork(),
>  kernel_thread() via kernel_clone(). These are a few hints for searching
>  the code base to understand when and how a thread stack is allocated.

-- 
~Randy


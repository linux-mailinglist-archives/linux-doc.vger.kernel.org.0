Return-Path: <linux-doc+bounces-17914-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2807B8FFC6F
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jun 2024 08:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEBED28D603
	for <lists+linux-doc@lfdr.de>; Fri,  7 Jun 2024 06:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627A9152504;
	Fri,  7 Jun 2024 06:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="WHBNVDxL"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBC05336A
	for <linux-doc@vger.kernel.org>; Fri,  7 Jun 2024 06:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717742937; cv=none; b=DD2VabeVrAzKiF3I1lPAk4DA87DOnbgVM5CfQf1oUKQ9QAjOG0QIJ+nDh1WNxLxWHgSHyd+tIV6rfq5rghdmwVrNA7oqW/53dwbIygjtukCSlT8QaQLkWjRH5nRppd+t71/2f59Er2B2beli4Ai8aR2iHBAz0ccGHDRgqirmmvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717742937; c=relaxed/simple;
	bh=pgHe5e3ALK+cypFku6S3ieR5sW7SNUe2jaqsfcPIj20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLhRLlxqoZIsNLiWnaxKOtXzc19ml9rYMsu/IdeAUrDbNUzeUtU/P7N8zrq41vMJvVl0lFUFJZvTt8Q8DNqDiO1J56qZvI5v8DdfMkCUF7UzUlD42I2Z5lZmGDmgQeD91esolEVGfj5YQs4JQfQnpm4ccZjDgocjLrfbE/6rx08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=WHBNVDxL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4215ac379fdso16927905e9.3
        for <linux-doc@vger.kernel.org>; Thu, 06 Jun 2024 23:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1717742934; x=1718347734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=43B/d4gP0SHROpUeDJVVbV3eXPrnkyyO5sotvbejxE8=;
        b=WHBNVDxLb89t4vpBlCcek1GBq9Kmstv+1AVdjO59eaYkrCWcEI9nEDP9Q4cO+AAyPJ
         HmDSto7YIA7d11bU+l+0wUTDUOEEdshw8yc2rWamSrSdTiVK4BXiXIcdpkdxnxtTj70G
         yX0WWgxXHpb5WW+BdqOlQ11DlXUFJFHCmFnlWKRcVzgjm9iMJj9tpjeJAeu4DCl1vcBN
         XtTf2Zl7Scs+Y97N64LNIuPgi+uJEvDBtHjLY43u1zXwglMusYxD/y1XP7Hy31V2r0D5
         oP16PMPj9CdMEaFS65ZlsMHa+2q4HTc/9X2dkmtzSwRMDdXvAVeoVgHPcgujfUgEHlYe
         ImIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717742934; x=1718347734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43B/d4gP0SHROpUeDJVVbV3eXPrnkyyO5sotvbejxE8=;
        b=vs4nAVCLWU3OnmEa0knWJRjG3jkpChUJnpXTIJ9d+c/PUU7iVCc3tY9bXP09dcZQzK
         hg9JrQeFU8Zv5H6KtZ1PN2/PJsLeJ8iMAMUeoYOKDAXzTZCXbTag2xjYgW+RW3hBuNbP
         AscyNzudQHEqKKsrdPDl//ouLnOjkNEm40W9GCJOlyTRQVfSflZ44wuGZFwItDooA8qm
         w5DMx1kv3B84GoPTz0wYzbRNUgyTuQCrP+xAgAb4AC3EHtc6waEnzndBj1U4b5IU4ySn
         6dYQEj5xOe/Q919rWZmdWcp5lbMxNjsb5gAz2q7dVFIM5/na/bAX0yEMQtNSX8c0OWgm
         lWFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPgZCNGCL7+0pE95oQg2a8nDbuibtKCSEtOpf/kXX5p/LW7XGyYsOSRSZYf0NtFh/cuRqh602VHRZ2NHjzafK27EHESst1pS9t
X-Gm-Message-State: AOJu0Yy5Y6/4ZO2WDRD9pCG+9fS0KSAO6GAP8YOepNqWnjnGaR9nHl8w
	MEXX/WZOtlp8cycseAIzsJOwoUxDldRr6cR/cVs4XvDH+ZYUTilAmFbPaMjoObk=
X-Google-Smtp-Source: AGHT+IExgKcCS2E1XRnUmlAj3a3DUBu1u3NAJFz7KJXg88qiQxXnJkpQj85jyxqJhtNeIB0VGBuEdw==
X-Received: by 2002:a05:600c:46cf:b0:418:969a:b316 with SMTP id 5b1f17b1804b1-421649ecb5amr16247315e9.1.1717742933988;
        Thu, 06 Jun 2024 23:48:53 -0700 (PDT)
Received: from localhost ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c1aa954sm43832665e9.17.2024.06.06.23.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 23:48:53 -0700 (PDT)
Date: Fri, 7 Jun 2024 08:48:50 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: David Ahern <dsahern@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Corbet <corbet@lwn.net>, Itay Avraham <itayavr@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, linux-doc@vger.kernel.org,
	linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Aron Silverton <aron.silverton@oracle.com>,
	Christoph Hellwig <hch@infradead.org>, Jiri Pirko <jiri@nvidia.com>,
	Leonid Bloch <lbloch@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>, linux-cxl@vger.kernel.org,
	patches@lists.linux.dev
Subject: Re: [PATCH 0/8] Introduce fwctl subystem
Message-ID: <ZmKtUkeKiQMUvWhi@nanopsycho.orion>
References: <20240603114250.5325279c@kernel.org>
 <214d7d82-0916-4c29-9012-04590e77df73@kernel.org>
 <20240604070451.79cfb280@kernel.org>
 <665fa9c9e69de_4a4e62941e@dwillia2-xfh.jf.intel.com.notmuch>
 <20240605135911.GT19897@nvidia.com>
 <d97144db-424f-4efd-bf10-513a0b895eca@kernel.org>
 <20240606071811.34767cce@kernel.org>
 <20240606144818.GC19897@nvidia.com>
 <20240606080557.00f3163e@kernel.org>
 <4724e6a1-2da1-4275-8807-b7fe6cd9b6c1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4724e6a1-2da1-4275-8807-b7fe6cd9b6c1@kernel.org>

Thu, Jun 06, 2024 at 07:47:20PM CEST, dsahern@kernel.org wrote:
>On 6/6/24 9:05 AM, Jakub Kicinski wrote:
>> On Thu, 6 Jun 2024 11:48:18 -0300 Jason Gunthorpe wrote:
>>>> An argument can be made that given somewhat mixed switchdev experience
>>>> we should just stay out of the way and let that happen. But just make
>>>> that argument then, instead of pretending the use of this API will be
>>>> limited to custom very vendor specific things.  
>>>
>>> Huh?
>> 
>> I'm sorry, David as been working in netdev for a long time.
>
>And I will continue working on Linux networking stack (netdev) while I
>also work with the IB S/W stack, fwctl, and any other part of Linux
>relevant to my job. I am not going to pick a silo (and should not be
>required to).
>
>> I have a tendency to address the person I'm replying to,
>> assuming their level of understanding of the problem space.
>> Which makes it harder to understand for bystanders.
>> 
>>> At least mlx5 already has a very robust userspace competition to
>>> switchdev using RDMA APIs, available in DPDK. This is long since been
>>> done and is widely deployed.
>> 
>> Yeah, we had this discussion multiple times
>
>The switchdev / sonic comparison came to mind as well during this
>thread. The existence of a kernel way (switchdev) has not stopped sonic
>(userspace SDK) from gaining traction. In some cases the SDK is required

Is this discussion technical or policital? I'm asking because it makes
huge difference. There is no technical reason why sonic does not use
proper in-kernel solution from what I see
Yes, they chose technically the wrong way, a shortcut, requiring kernel
bypass. Honestly for reasons that are beyond my understanding :/


>for device features that do not have a kernel uapi or vendors refuse to
>offer a kernel way, so it is the only option.

Policical reasons.


>
>The bottom line to me is that these hardline, dogmatic approaches -
>resisting the recognition of reality - is only harming users. There is a
>middle ground, open source drivers and tools that offer more flexibility.
>


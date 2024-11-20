Return-Path: <linux-doc+bounces-31198-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0583F9D371D
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2024 10:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEC38282D59
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2024 09:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7F117BB2E;
	Wed, 20 Nov 2024 09:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cgCNxMBx"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A4D22318
	for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 09:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732095392; cv=none; b=IlzQ7R5/D2MmyuTjQ0BEMOIXvxDzjm6QDhd/oHzMxj9emQKv3AgIITqxuutl5ycoD1sVN40yizDUWMc+ayUco0Ql28p5xIMby3OZ7KcKBGMPGh5/+/qX0FWibJ2FTWDGzfbxDVkhuuqr7mIQXOb0vXZKcmjXbm44vuH6Dv20DzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732095392; c=relaxed/simple;
	bh=r4+aatSADkM9nGhlj5Plv/f/si7EE4uLXzNLvn3RBXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6cZm5sNQ4fHzjF/J3IgDhKokIfKabpAcEo4bSmshQgVKzVSV2mt2vCYHWppRtSZZvlEmeewTDfEk3YHeAD0m50ptUDvHQuGdfm6OeRLFoVOK/Ig7AtzdsTrgaWFyiQespO3F5KrKiLeQtFbgNCx8nIp5xlBxqy12o8+W439wes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cgCNxMBx; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 20 Nov 2024 10:36:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732095388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p2djadbpldvB9Arw/zXo3QE+nIQtsSd4RZW0aSVK7Nc=;
	b=cgCNxMBx732+XUvJB33Ln+eGWfV2ECXtvDAOXXZzi/oK4oH8bENh3xb/Bimt2k56xUClPF
	iFFVYfbJV2c9bh7QDKPLOJn+H3eQctVLKEp+8wprR2q0t3fGtbZWIQXhS6JnAVtjnf3nPo
	7hh3oCHolZXAtXZXRSqpw+RdTEmHlI8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrea Righi <andrea.righi@linux.dev>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched_ext: Documentation: Fix typo in sched-ext.rst
Message-ID: <Zz2tmE2d9k5CqbS1@gpd3>
References: <20241118024818.11590-1-zhujun2@cmss.chinamobile.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118024818.11590-1-zhujun2@cmss.chinamobile.com>
X-Migadu-Flow: FLOW_OUT

Hi Zhu,

On Sun, Nov 17, 2024 at 06:48:18PM -0800, Zhu Jun wrote:
> The word 'tranfers' is wrong, so fix it.
> 
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>  Documentation/scheduler/sched-ext.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/scheduler/sched-ext.rst b/Documentation/scheduler/sched-ext.rst
> index 7b59bbd2e564..aff1304d2637 100644
> --- a/Documentation/scheduler/sched-ext.rst
> +++ b/Documentation/scheduler/sched-ext.rst
> @@ -265,7 +265,7 @@ The following briefly shows how a waking task is scheduled and executed.
>       rather than performing them immediately. There can be up to
>       ``ops.dispatch_max_batch`` pending tasks.
>  
> -   * ``scx_bpf_consume()`` tranfers a task from the specified non-local DSQ
> +   * ``scx_bpf_consume()`` transfer a task from the specified non-local DSQ

Actually it should be "transfers".

However, this will be fixed by 5209c03c8ed2 ("sched_ext: Rename
scx_bpf_consume() to scx_bpf_dsq_move_to_local()") that just renames
"transfers" into "moves".

>       to the dispatching DSQ. This function cannot be called with any BPF
>       locks held. ``scx_bpf_consume()`` flushes the pending dispatched tasks
>       before trying to consume the specified DSQ.
> -- 
> 2.17.1
> 
> 
> 

Thanks,
-Andrea


Return-Path: <linux-doc+bounces-9818-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0312D858307
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 17:53:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B14BF284B45
	for <lists+linux-doc@lfdr.de>; Fri, 16 Feb 2024 16:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA266130AF6;
	Fri, 16 Feb 2024 16:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AorK5vFC"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DD0130AF2;
	Fri, 16 Feb 2024 16:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708102404; cv=none; b=DUlKoAACX8Dir7hwrQhmZsur/kRQhKNcf4B+sxr+KUxmJMTfpkbtJEP86WdzZwpitybIVtrJhLeThll7uYKifZXRai913xjuRGwzMiVY/O5fYZq8cG/yFLnhTk+5XAFoJFw7dW6ofAOAl3AWeJBVY0q9efStcjuRKiGdRa9M/SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708102404; c=relaxed/simple;
	bh=nYC9tAhN8sWaj6ctJMdhChNdc+F/U6vyfrCBNb2RCBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P88UHdIIWh9mRVGfWIhQdSYL9FSrPAUt1QhMcTpghoPtAnsIvpk42dLtAUQ+Fn2jbghorAmgL0x0jwd7yl2HTcvEL2990waELj39TmFihqsBwQo0wwPn91xZqdZkzjftqfyYwSZjeAMpWmGPzfis4L0j+pcV5XqCHg6Ca3eFqRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AorK5vFC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E344C43390;
	Fri, 16 Feb 2024 16:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708102404;
	bh=nYC9tAhN8sWaj6ctJMdhChNdc+F/U6vyfrCBNb2RCBg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=AorK5vFCL5iGgCGbZxGq7IDfc7uEq2MD1fyegzaAFQnaAIsN9BwFmx3qnzfpcYtlq
	 GJ7KBypk165BVliabLYHpR+tDs7A7Pp1C7IS35Wo3z2czb+BbzxjOB7HzuzrRW4Jg1
	 YPVOc6ZvCU2kCw1GKGGGKLnzDf5Ac1t5G9iUjq/lJq02awIQeSEYgNs4oOccOD2nB2
	 B0qJHtpwCla91J7fbqfJia54hPqoZaf9wJAPExLMZEiT4kMBNR3P3XVXNEwU3Y3JFF
	 tcep1FRr+F5OVXu77IQotLh5gY/WXTvjzxoY6YrVMv2Hz05mfrsUF9vpNfG+pNumxV
	 gqagKIvrD+v4w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9F286CE0B70; Fri, 16 Feb 2024 08:53:23 -0800 (PST)
Date: Fri, 16 Feb 2024 08:53:23 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: rcu@vger.kernel.org, linux-doc@vger.kernel.org, frederic@kernel.org,
	quic_neeraju@quicinc.com, joel@joelfernandes.org,
	josh@joshtriplett.org, boqun.feng@gmail.com, rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
	qiang.zhang1211@gmail.com, corbet@lwn.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: Remove references to arrayRCU.rst
Message-ID: <6d77e811-30ec-44c7-87b3-177a3f5fe716@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20240216154455.22327-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216154455.22327-1-zenghui.yu@linux.dev>

On Fri, Feb 16, 2024 at 11:44:55PM +0800, Zenghui Yu wrote:
> arrayRCU.rst has been removed since commit ef2555cf68c3 ("doc: Remove
> arrayRCU.rst") but is still referenced by whatisRCU.rst. Update it to
> reflect the current state of the documentation.
> 
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>

Good catch!  Queued for the v6.10 merge window, thank you!

							Thanx, Paul

> ---
>  Documentation/RCU/whatisRCU.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
> index 60ce02475142..dce1678ec1f8 100644
> --- a/Documentation/RCU/whatisRCU.rst
> +++ b/Documentation/RCU/whatisRCU.rst
> @@ -416,7 +416,7 @@ their assorted primitives.
>  
>  This section shows a simple use of the core RCU API to protect a
>  global pointer to a dynamically allocated structure.  More-typical
> -uses of RCU may be found in listRCU.rst, arrayRCU.rst, and NMI-RCU.rst.
> +uses of RCU may be found in listRCU.rst and NMI-RCU.rst.
>  ::
>  
>  	struct foo {
> @@ -499,8 +499,8 @@ So, to sum up:
>  	data item.
>  
>  See checklist.rst for additional rules to follow when using RCU.
> -And again, more-typical uses of RCU may be found in listRCU.rst,
> -arrayRCU.rst, and NMI-RCU.rst.
> +And again, more-typical uses of RCU may be found in listRCU.rst
> +and NMI-RCU.rst.
>  
>  .. _4_whatisRCU:
>  
> -- 
> 2.34.1
> 


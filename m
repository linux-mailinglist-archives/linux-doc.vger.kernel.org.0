Return-Path: <linux-doc+bounces-93848-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Lm5HChVIQWpwnAkAu9opvQ
	(envelope-from <linux-doc+bounces-93848-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 28 Jun 2026 18:13:09 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 728176D4582
	for <lists+linux-doc@lfdr.de>; Sun, 28 Jun 2026 18:13:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Hm03+Ay/";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93848-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-93848-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 327AA300D697
	for <lists+linux-doc@lfdr.de>; Sun, 28 Jun 2026 16:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567F93ACF0B;
	Sun, 28 Jun 2026 16:13:06 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA3C2E7366;
	Sun, 28 Jun 2026 16:13:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782663186; cv=none; b=XPKMqN+ICiAVvBBi7FVLfOypAApq881RWi+5W/F9ybaGeZPjsxZvkm5LVKne4H5E21DQBLkEeLuz7+Jgm3GOqGnSsHJ09XOjAa3LGLKcb7b4PPWzyABsuPCU6MhM3SkGC4caHxglwRmhhHBryctyONGQokYpiH+mNYA9T789gRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782663186; c=relaxed/simple;
	bh=ZekyRbEhOspvXTo0J7Up1txAdnbzTkqYe626csitizU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcGOzwDZjnnNXP3D7x/QlNGq/cx0rmwPvOZsd0ZmiXXzLKRpWbaEJ6ldLQjMf+zHu0ttpSQi0JOSGHgRmdUypp/iR1LyttHidwkl9moYZ8tPIuQJeZpmldYdDMKDozrCdokXp4k8/3NRFyyli3Ev4oaVigO23ZaVxtzVhrYDCtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hm03+Ay/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74EB1F000E9;
	Sun, 28 Jun 2026 16:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782663184;
	bh=Y9nswxsmOhOv49plCt5Egb3K6H8R2tOSFwNfPKAqtGU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=Hm03+Ay/dFx1r5qIlZiqVslyPjKPok+WaUvYF23xEATUGq3t5eyYh6dtYsQT8rfM/
	 6BWNX8ZzsyaPSFS2Ck68/ROleDRRYB9rq7cmsi3VeDI6fKHDQRX+PB6axBmOaxGXya
	 deNgQ5zUaSgls2wZpTkk3kOLHNli+DjetjAVh6IfFFaSZFH7Yrklo7og7spgdRPjWw
	 VvUDjmjvyEax4DTyTbFa8YdJpOfFF+m6YSy5uIGoxRwRKex3+Fw6TwRfKnozvqzRZs
	 lTuBhHET9HKMXcXxclDXs+eWeSb7vbalc+fACQEqgvuDUJuwbv+TnlaOZ1NDY13Ngg
	 BRACMToPuArZw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8BD1ACE08B8; Sun, 28 Jun 2026 09:13:04 -0700 (PDT)
Date: Sun, 28 Jun 2026 09:13:04 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] Documentation: RCU: adopt new coding style of type-aware
 kmalloc-family - part 2/2
Message-ID: <d44059db-5313-410e-b9e9-7bf1abbd94ec@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260627090605.28955-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260627090605.28955-2-manuelebner@mailbox.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-93848-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[paulmck@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:manuelebner@mailbox.org,m:frederic@kernel.org,m:neeraj.upadhyay@kernel.org,m:joelagnelf@nvidia.com,m:josh@joshtriplett.org,m:boqun@kernel.org,m:urezki@gmail.com,m:rostedt@goodmis.org,m:mathieu.desnoyers@efficios.com,m:jiangshanlai@gmail.com,m:qiang.zhang@linux.dev,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kees@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,joshtriplett.org,gmail.com,goodmis.org,efficios.com,linux.dev,lwn.net,linuxfoundation.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulmck@kernel.org,linux-doc@vger.kernel.org];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	HAS_REPLYTO(0.00)[paulmck@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,mailbox.org:email,paulmck-laptop:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 728176D4582

On Sat, Jun 27, 2026 at 11:06:06AM +0200, Manuel Ebner wrote:
> Update Documentation/RCU/* to reflect new type-aware kmalloc-family
> as suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj()
> and family")
> 
> p = kmalloc(...);
>  -> p = kmalloc_obj(...);
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Queued for further review, thank you!!!

							Thanx, Paul

> ---
> A similar patch sent by me has been applied. Back then I wasn't familiar
> enough to convert all *alloc(*. That's why this is " - part 2/2".
> Part 1: f61bf5fdf77d ("Documentation: RCU: adopt new coding style of
>                        type-aware kmalloc-family")
> ---
>  Documentation/RCU/rcu_dereference.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/RCU/rcu_dereference.rst b/Documentation/RCU/rcu_dereference.rst
> index 2524dcdadde2..5bc3785ebfc2 100644
> --- a/Documentation/RCU/rcu_dereference.rst
> +++ b/Documentation/RCU/rcu_dereference.rst
> @@ -236,7 +236,7 @@ precautions.  To see this, consider the following code fragment::
>  	{
>  		struct foo *p;
>  
> -		p = kmalloc(...);
> +		p = kmalloc_obj(*p);
>  		if (p == NULL)
>  			deal_with_it();
>  		p->a = 42;  /* Each field in its own cache line. */
> @@ -293,7 +293,7 @@ Then one approach is to use locking, for example, as follows::
>  	{
>  		struct foo *p;
>  
> -		p = kmalloc(...);
> +		p = kmalloc_obj(*p);
>  		if (p == NULL)
>  			deal_with_it();
>  		spin_lock(&p->lock);
> -- 
> 2.54.0
> 


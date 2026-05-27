Return-Path: <linux-doc+bounces-89783-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPlLABRLF2r0/wcAu9opvQ
	(envelope-from <linux-doc+bounces-89783-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 21:50:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA675E9B10
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 21:50:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 685D13024283
	for <lists+linux-doc@lfdr.de>; Wed, 27 May 2026 19:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51DB93B19A3;
	Wed, 27 May 2026 19:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Y5G2G7M8"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C513B19A0;
	Wed, 27 May 2026 19:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779911436; cv=none; b=mrAi1MAoqu5Um7ST5/rRxhyZtZragqT9R6NqAxA0SSffB7RLOnTkss54En/qhuqcGfBv+hNRJGmMqYg0gsIxdfxanalT8huSEtXOD1LxWG14mcfbtlcePmSjjBzTg0ro9B2F06Xda5A7BufVxCjyLnwUlC8A3T4Sb5CK18wLvVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779911436; c=relaxed/simple;
	bh=Hlcw5NmDdhXZKNv+/z2jeagFAksri84BWr7P8wwGYNM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bqg6HooM4MTRw9NuDeIfUwsnMl7OFv+lPMxGS8aoQaasuAQ9wkJlo/SxGd259wgo62YPicXNnQgmzMFLBDGn56pwcif7mJsjkjHcOAZChtoXYiz1Ifxi+3tdWsO0W1lzaLvTmRPKIlTH1ZG/KEOmuuG6JVCnvpv6JoFwVHGmDtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Y5G2G7M8; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3C71F000E9;
	Wed, 27 May 2026 19:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779911434;
	bh=72Gz2NsTX3fg94N46zv80p0uplq9u+H7HG+tAgnNYCA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Y5G2G7M8GI8nodHw68ElsQlY3SOz5wwHEMUtA70B+QukbaRS53+iCic26tCx0xhEX
	 INr16cLT2gH80YbU40eN256vRUgMZQ81yDmeiYVvPsQcMgs5ev2/8h2TwVEHjHphhU
	 t7rBVz4iXKmqts1GfofhRkfUhIYR153Mj+0sKSmM=
Date: Wed, 27 May 2026 12:50:34 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: <wang.yaxin@zte.com.cn>
Cc: <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <xu.xin16@zte.com.cn>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>
Subject: Re: [PATCH linux next] tools headers UAPI: sync linux/taskstats.h
 for procacct.c
Message-Id: <20260527125034.ba695164344d2645dd055af0@linux-foundation.org>
In-Reply-To: <20260527213558929EhiHHy9EDTMjmg3uuDOMi@zte.com.cn>
References: <20260527213558929EhiHHy9EDTMjmg3uuDOMi@zte.com.cn>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89783-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akpm@linux-foundation.org,linux-doc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-foundation.org:mid,linux-foundation.org:dkim,zte.com.cn:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: ECA675E9B10
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 27 May 2026 21:35:58 +0800 (CST) <wang.yaxin@zte.com.cn> wrote:

> From: Wang Yaxin <wang.yaxin@zte.com.cn>
> 
> Background
> ==========
> After commit 9b93f7e32774 ("tools/getdelays: use the static UAPI
> headers from tools/include/uapi"), the Makefile was changed to use
> -I../include/uapi/ instead of -I../../usr/include to ensure tools
> always use the up-to-date UAPI headers.
> 
> However, only linux/taskstats.h was added to tools/include/uapi/ in
> commit e5bbb35a07b3 ("tools headers UAPI: sync linux/taskstats.h"),
> but linux/acct.h was missing.

Please let's Cc the author of both of these commits!

> Problem
> =======
> This causes procacct.c to fail to compile with:
> 
> procacct.c:234:37: error: 'AGROUP' undeclared (first use in this function)
> 
> gcc -I../include/uapi/    getdelays.c   -o getdelays
> gcc -I../include/uapi/    procacct.c   -o procacct
> procacct.c: In function ‘print_procacct’:
> procacct.c:234:37: error: ‘AGROUP’ undeclared (first use in this function)
> did you mean ‘NOGROUP’?
>   234 |  , t->version >= 12 ? (t->ac_flag & AGROUP ? 'P' : 'T') : '?'
>       |                                     ^~~~~~
>       |                                     NOGROUP
> procacct.c:234:37: note: each undeclared ident
> 
> because procacct.c uses the AGROUP macro defined in linux/acct.h.
> 
> Solution
> ========
> Add the missing linux/acct.h to complete the static UAPI header set.

It has always annoyed me that we do this by copying the file.  I'm
surprised that there isn't a way of using the original file directly.

> Fixes: 9b93f7e32774 ("tools/getdelays: use the static UAPI headers from tools/include/uapi")
>
> ...
>
> --- /dev/null
> +++ b/tools/include/uapi/linux/acct.h
>
> ...
>


Return-Path: <linux-doc+bounces-96261-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L7DdOpr1UGpN9AIAu9opvQ
	(envelope-from <linux-doc+bounces-96261-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 15:37:30 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA3073B50E
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 15:37:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=wyuan.org header.s=key1 header.b=Pig8F497;
	dmarc=pass (policy=quarantine) header.from=wyuan.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96261-lists+linux-doc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-doc+bounces-96261-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E1A723006991
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 13:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321B338E113;
	Fri, 10 Jul 2026 13:37:19 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1239E38E5DF
	for <linux-doc@vger.kernel.org>; Fri, 10 Jul 2026 13:37:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783690639; cv=none; b=GMJEP0Lc0Hwl5LYZuZ8VZJtO8M/33CVE/RH5ASxTYSQTYvGfyNGsLtk3NEggJE56Jaz9YGJmOdbN3m6oMJOX9+mU1gguhUWO+5SU7yRvmnfz2jBtjRQJaznSu16ma5abwOd7uk0+Tyj1KyOaMl9NiTOEDNPDJjWxOq958geLXEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783690639; c=relaxed/simple;
	bh=hhpIx+vn1tS+JbOs3eduXUGbMVrRbCgueaBDa4h/vSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDWRXZP7L5aZmz+dAJFp+PurLI0/fzLLfSl+HEhgXflJDpjYMWCEhpyM+xAdaZ7KXgy03ebdODa4OmStfT2aXnbt/L7q89O4bBovIHEE83+daNk2roD2yfPPjs7Nj83lK7S8gwQ+OSfD5jMsowJKIaI+Jj4QudApVmg+uoP/4EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=Pig8F497; arc=none smtp.client-ip=91.218.175.182
Date: Fri, 10 Jul 2026 21:36:47 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wyuan.org; s=key1;
	t=1783690625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OSkxz6hWZlekybWNXSqS04gHS+z10g6OG2C9qvTUmgs=;
	b=Pig8F497zy6he3IX0SB7CrgFigfvXn6y6bSSwJI7vQeO4hxBv+7wWkUPfE4Rpi2IJ78PIX
	EJ0cxsv7GZLPQIYc56rekp3qpNpLa3V7B33P4f7ciJkzwU+IlU8P/6+iBP4uiIvitXnqKg
	kjoYtvNXoI4x/odk5SwkSsWMXr+NXLJ0ojzkNqOZ4MIWcWQbVbtWUltB56reU2sp9kAFpS
	dv+qmcKkd3Hd3Vpl+EtPMwidqLJ0Um1WRyK03jlfwWRTgW68c8ViBVrPJAVDwL4ehZ91RX
	QTeNn+BVzp6dZDStfSOh1C/7fOJJTnLgrkGSYqLD7AIuqx4UiWrRtwjOq8pbCg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: add docs-next checkout workaround
Message-ID: <alD1b7O6KaIMqWpa@wyuan.org>
References: <4e5e728877c77a89f6c59e89c88ba8ffa8842643.1783609005.git.wy@wyuan.org>
 <ce715802-1b46-4ba6-b388-39260f217ba3@hust.edu.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce715802-1b46-4ba6-b388-39260f217ba3@hust.edu.cn>
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[wyuan.org,quarantine];
	R_DKIM_ALLOW(-0.20)[wyuan.org:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96261-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dzm91@hust.edu.cn,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[wyuan.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wy@wyuan.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,tsinghua.edu.cn:url,git-scm.com:url,hust.edu.cn:url,wyuan.org:from_mime,wyuan.org:email,wyuan.org:mid,wyuan.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DBA3073B50E

On Fri, Jul 10, 2026 at 09:21:16PM +0800, Dongliang Mu wrote:
> 
> On 7/9/26 11:25 PM, Weijie Yuan wrote:
> > Hi all,
> > 
> > Since cloning Alex Shi's tree from the HUST mirror may be unstable, as
> > reported in [1]. I think adding one more option for beginners to get
> > started might be a good idea.
> > 
> > Thanks,
> > Weijie
> > 
> > [1] https://lore.kernel.org/linux-doc/4292BADB2022F3A5+5117009.JcJflTAXpt@anka-vmware20-1/
> > 
> > --- >8 ---
> Is this a special mark for LKML? If I understand correctly, the following
> should be the patch content.

Yes, the following is the commit message body.

You can apply this patch by "git am -c" or "git am --scissors", which
means: Remove everything in body before a scissors line (see git-mailinfo[1]).

https://git-scm.com/docs/git-am#Documentation/git-am.txt---scissors

Git community sometimes use it, for the cases if you want to swap the
actual commit message and the supplementary information.

> > 
> > The Chinese documentation guide asks contributors to base their work on
> > the docs-next branch of Alex Shi's tree. However, cloning that tree from
> > git.kernel.org or mirrors.hust.edu.cn may fail in some network
> > environments.
> > 
> > Document an alternative workflow: clone Linus Torvalds' tree from a
> > local mirror, add Alex Shi's tree as another remote, fetch docs-next
> > from it, and then create a local branch that tracks alexs/docs-next.
> > 
> > Signed-off-by: Weijie Yuan <wy@wyuan.org>
> > ---
> >   Documentation/translations/zh_CN/how-to.rst | 10 ++++++++++
> >   1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/translations/zh_CN/how-to.rst
> > index 9ec2384e1e76..fcfe0a4a8be2 100644
> > --- a/Documentation/translations/zh_CN/how-to.rst
> > +++ b/Documentation/translations/zh_CN/how-to.rst
> > @@ -53,6 +53,16 @@ Linux 发行版和简单地使用 Linux 命令行，那么可以迅速开始了
> >   这是 Alex 开发树的镜像库，每两个小时同步一次上游。如果您了解到更快的 mirror，
> >   请随时 **添加** 。
> > +或者::
> > +
> > +	git clone https://mirrors.tuna.tsinghua.edu.cn/git/linux.git
> > +	cd linux
> > +	git remote add alexs https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git/
> > +	git fetch alexs docs-next:refs/remotes/alexs/docs-next
> > +	git switch -c docs-next --track alexs/docs-next
> > +
> > +这将先用清华源拉取 Linus Torvalds 的开发树，再增量下载中文开发分支中的内容。
> 
> This would make the envionment preparation more difficult. My suggestion is
> to ask maintainers of some mirror sites to sync this repo like us.
> 
> Dongliang Mu

Makes sense. Could I kindly ask, for example, Tsinghua tuna team to
mirror our repo, on behalf of our Chinese document team? I'm afraid they
are unlikely to consider my request in my individual capacity. ;-)

Thanks,
Weijie


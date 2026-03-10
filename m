Return-Path: <linux-doc+bounces-78605-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KV1G/vKr2nWcAIAu9opvQ
	(envelope-from <linux-doc+bounces-78605-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 08:40:43 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DE35F246810
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 08:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EFC8A30451F7
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 07:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5513E9582;
	Tue, 10 Mar 2026 07:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="VkBuHLt5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B833E8C7C;
	Tue, 10 Mar 2026 07:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773128359; cv=none; b=S6MSxu+YtzvUhHuXaEf9SxIyKOSj5KxyxydaGP0wEPsRqGyogYeVFhF4S9R8dRp74tQDN+uj8X+RAmZGM+MwR5X3Dn45M3fWt694fA1TQpUzZulm/hK1rLqWWrziwx0nujsut3ViPWtK1+OF91EN+Tblr7W8r+ZWZcjr94nL+ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773128359; c=relaxed/simple;
	bh=EG1SahnCbxi3XzK3bLDGK2sA5TJc1m500q7G0hL3bFA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fc97sLIqdnvZOOKmt0wZ7UJbQkomSiKEA7L6cxHOB9xPKcFXT+SSDp7t2gWnAqzu8stxRpOtZ3kL2rRNaucFr2wjN24WC3+huIkPoglwoPgH6bFcC9GVob9bwAOZh/zrzzNRzM3Din8C0Mo34jC7QTVInIy9dnQ40ZqcwcHvgTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=VkBuHLt5; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4mfDL0FzHrPi+ovP2EoBEIFIrlJiuL7mmRGIUBNqTUE=;
  b=VkBuHLt5XWdWfc+4wiCOcJHVkC+zON+2D7w0ns+DrDlpUxwtkXtLurad
   QDVfpbPRh9TOPmlvPUuZl7FlkCQBGrEjIRYSeYhzkMdSZ25q3hiGX5akJ
   RpXCueLnvIFgxJjwpo5VZEgL7oHYZ/ABfvQaUcSBre9JS554879X5dIbz
   g=;
X-CSE-ConnectionGUID: B5Dhr2BaRGmtitjvQW+Vsw==
X-CSE-MsgGUID: qw+9Q1VzToKCiY4/rmZcBg==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.23,111,1770591600"; 
   d="scan'208";a="267009203"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 08:39:12 +0100
Date: Tue, 10 Mar 2026 08:39:12 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Nicolas Palix <nicolas.palix@imag.fr>
cc: Haoyang Liu <tttturtleruss@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
    Shuah Khan <skhan@linuxfoundation.org>, cocci@inria.fr, 
    workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/dev-tools: fix a broken URL in
 dev-tools/coccinelle.rst
In-Reply-To: <1c546ad7-14f8-4695-9754-32a020f8a082@imag.fr>
Message-ID: <4c157be7-7673-c513-65f0-f0222cf8d117@inria.fr>
References: <20260308100851.341-1-tttturtleruss@gmail.com> <87v7f5vv9x.fsf@trenco.lwn.net> <ae8dda71-9e25-4f3b-ab95-1b00809ade37@gmail.com> <1c546ad7-14f8-4695-9754-32a020f8a082@imag.fr>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-918604625-1773128352=:23815"
X-Rspamd-Queue-Id: DE35F246810
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[inria.fr,none];
	R_DKIM_ALLOW(-0.20)[inria.fr:s=dc];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,lwn.net,linuxfoundation.org,inria.fr,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-78605-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[inria.fr:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julia.lawall@inria.fr,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,inria.fr:dkim,inria.fr:mid]
X-Rspamd-Action: no action

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-918604625-1773128352=:23815
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Tue, 10 Mar 2026, Nicolas Palix wrote:

> Hi,
>
> Maybe we can just throw away that section of "Supplemental documentation" and
> its link ?
>
> Nowadays, there is much more SmPL provided, and the rst file
> describes better and up-to-date information.
>
> Would a link to
> https://www.kernel.org/doc/html/latest/dev-tools/coccinelle.html
> be useful to point to latest version ?

OK, thanks.

There is also an out of date URL in that page.  I will send a patch.

julia

>
> Sincerely,
>
> Le 09/03/2026 à 17:28, Haoyang Liu a écrit :
> >
> > On 3/10/2026 12:10 AM, Jonathan Corbet wrote:
> > > LIU Haoyang <tttturtleruss@gmail.com> writes:
> > >
> > > > The original supplemental documentation for coccicheck is
> > > > https://bottest.wiki.kernel.org/coccicheck, which redirects to a not
> > > > found page,
> > > > thus change it to https://bottest.wiki.kernel.org/coccicheck.html,
> > > > which adds a suffix to original URL to make it direct to the right page.
> > > >
> > > > Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>
> > > > ---
> > > >   Documentation/dev-tools/coccinelle.rst | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/
> > > > dev-tools/coccinelle.rst
> > > > index 2b942e3c8049..f73ccf5397f3 100644
> > > > --- a/Documentation/dev-tools/coccinelle.rst
> > > > +++ b/Documentation/dev-tools/coccinelle.rst
> > > > @@ -61,7 +61,7 @@ Supplemental documentation
> > > >   For supplemental documentation refer to the wiki:
> > > > -https://bottest.wiki.kernel.org/coccicheck
> > > > +https://bottest.wiki.kernel.org/coccicheck.html
> > > >   The wiki documentation always refers to the linux-next version of the
> > > > script.
> > > I'll apply this - a working URL is better than a broken one.  But is
> > > there really nothing better to link to than a page that warns "OBSOLETE
> > > CONTENT" at the top?
> >
> > Dear Jon,
> >
> > Unfortunately, I do not find any other documents about this script, so I
> > have to use it even though it's obsolete.
> >
> > Sincerely,
> > Haoyang
> >
> > >
> > > Thanks,
> > >
> > > jon
> >
> >
> >
> >
>
>
--8323329-918604625-1773128352=:23815--


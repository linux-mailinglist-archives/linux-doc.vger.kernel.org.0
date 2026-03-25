Return-Path: <linux-doc+bounces-81257-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHAzEuZWxGljyAQAu9opvQ
	(envelope-from <linux-doc+bounces-81257-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 22:43:02 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA3132C97B
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 22:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26F5C3024C8E
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 21:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D71C39768A;
	Wed, 25 Mar 2026 21:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnjMplhK"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B1D7397686
	for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2026 21:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774474820; cv=none; b=uiuT8FtGZTYIBqZyi9P4YzeCuS/7pAIy6dwkLxTmonMcLHe+ObwqcsOVT7frQEXDLOn7q4lC7+j3D9o5y4O5hP9USBdSAlDlIgTkd0b8ByahTJPMIsFezgrVHcq/qWaRhTbokmPsR5ST1zvJ6nEfUFKn1U9ez7sXOlhfVN1cI7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774474820; c=relaxed/simple;
	bh=csmrTT340zkIbZ9NzcqImALDbah84oawXYdMA8Ya2x0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y35aYQR9fSwgKCqlKyZCjmfOZwV5Tlo+v1OrrjjzNu0ozSu9WVOl7WwZojZ1srxhn34Tb5b+IF88qNEUAb+LbUQFRMWolRSSS45E0OYAYj6JqCS9LrhHW7GWZCmF7RvJt0/DDmrFcm/Jf8R9rNe/YRSlxCSKGP+Du6L0UPOAxJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnjMplhK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42653C4CEF7;
	Wed, 25 Mar 2026 21:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774474819;
	bh=csmrTT340zkIbZ9NzcqImALDbah84oawXYdMA8Ya2x0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KnjMplhKz5tLnyoyHdpaJpt/jdPTtVw6/g9bMIqNouJdOQ+lqt2WaY9PP7ceuNK93
	 ZlQo2Q5pzm3ZitnNFA9ermjC8mkYbUM7p0l/uJsqdNQqS5TfEgzbwLD4aiqC9XiT7l
	 IbDvxvlPrVDtmPWfRueg1E5n/P3MvfGS598s6T/12igC4mJ8tjzapCkdyphHHStg2x
	 q3sgQFgEpfj2awroyWy6Qtl40Fz8KqYjYZTiczLRYSN5z6HQ7wDF6A0ajMQy/x4f2y
	 QBp9cZr6LO0T205d2PbQt3wAXD4DZyKawg9a1g4gw3XONDjmxX/MssdpLwcBvd7fed
	 a6HRnXOnDaVdA==
Date: Wed, 25 Mar 2026 22:40:15 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Kevin Brodsky
 <kevin.brodsky@arm.com>, linux-doc@vger.kernel.org, Konstantin Ryabitsev
 <mricon@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Akira
 Yokosawa <akiyks@gmail.com>
Subject: Re: Invalid link generation for equations
Message-ID: <20260325224015.1ba54eda@foz.lan>
In-Reply-To: <87o6kbehr6.fsf@trenco.lwn.net>
References: <9b320e77-9acf-4f0d-8c52-6e1fc3a8cf53@arm.com>
	<87se9nejza.fsf@trenco.lwn.net>
	<501de93f-65f2-4a45-a84b-d38560cd9e22@linuxfoundation.org>
	<87o6kbehr6.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-81257-lists,linux-doc=lfdr.de,huawei];
	FREEMAIL_CC(0.00)[linuxfoundation.org,arm.com,vger.kernel.org,kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-doc];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[10.30.226.201:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:email,lwn.net:email]
X-Rspamd-Queue-Id: BDA3132C97B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 25 Mar 2026 15:11:57 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Shuah Khan <skhan@linuxfoundation.org> writes:
> 
> >> OK, so this is more than passing strange...I can't reproduce that
> >> problem locally.  The HTML I get is:
> >> 
> >>    <img src="../_images/math/d9936822[...]
> >> 
> >> On docs.kernel.org, instead:
> >> 
> >>    <img src="_images/math/d9936822[...]
> >> 
> >> Note the missing "../".
> >> 
> >> I will confess that I don't have a great understanding of how imgmath
> >> works and how that link gets set.  We could "fix" the problem generally
> >> by setting imgmath_embed=True, but it would be good to understand what's
> >> actually happening here.  
> >
> > Respect SPHINX_IMGMATH (for html docs only) in Documentation/conf.py
> > might explain why imgmath_embed=True works?
> >
> > # Load math renderer:
> > # For html builder, load imgmath only when its dependencies are met.
> > # mathjax is the default math renderer since Sphinx 1.8.
> > have_latex = have_command("latex")
> > have_dvipng = have_command("dvipng")
> > load_imgmath = have_latex and have_dvipng
> >
> > Without setting imgmath_embed=true, math_renderer is mathjax which is
> > default since Sphinx 1.8  
> 
> We default to imgmath if the requisite utilities (latex, dvipng) are
> installed on the system; perhaps that's not ideal, but it's what we have
> done for a while.  It all seems to be working as expected, except that
> the <img> element has the wrong URI in it.  Strange.

Looking at this changelog from Akira:

	6b0d3e7c5888 ("docs/conf.py: Treat mathjax as fallback math renderer")

It mentions that this is kept due to epub output. On a quick search:

	https://github.com/sphinx-doc/sphinx/issues/1570

I'm not sure how this is handled in PDF, but mathjax seems to be
specific for html output only.
	
Thanks,
Mauro


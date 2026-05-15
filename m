Return-Path: <linux-doc+bounces-87585-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF7cF465BmpAnQIAu9opvQ
	(envelope-from <linux-doc+bounces-87585-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 08:13:34 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCF1549E40
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 08:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3BC853022B47
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 06:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4148E37BE8E;
	Fri, 15 May 2026 06:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JQg+Nz5C"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B8C3793B5;
	Fri, 15 May 2026 06:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778825612; cv=none; b=nZL3twL7bV3X3/DVj/rQvuQscWaOz+FBreDjO4y3b+/SxVNpklT5HdxEhD55v6Ivwg9H3Ntqsma+mNz4AyYgWJrAdqbYoMCNzC/8PISrvl5cd4eqF5cN7/KCvvfQagcwCWJ/JzsEA9imJwJYPDPLQOBeh8V+zNPHMtbs/DDBPio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778825612; c=relaxed/simple;
	bh=bxFauuEhZecKkG3eAvSIZ8iTW+w0AxyuKsgl03YOim4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QdczuYiF2BptgDGzdeJ8E3oT5YmFah2T89F6Yk3IBHfm3mG1pLqIj7QI+jgq4u5T910MCscJP9gihavFGr9SqWXcstI4Q3Zwas4HL8BkD2QWBuCqTDynZVSxHebqBsGaydfpIJhLqPF2VRAB8xWk1w5KbIR9yPS3upwVdO2LbX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JQg+Nz5C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4484DC2BCB0;
	Fri, 15 May 2026 06:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778825611;
	bh=bxFauuEhZecKkG3eAvSIZ8iTW+w0AxyuKsgl03YOim4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQg+Nz5CbLKxaBKCU4pdHIC+38UlFr0QsyjY6Y83S+mHAoznL5Chm5CkJa6LUHKPG
	 tXFE3OcCWKG8FQJfQUWJxsxHL3CgYJNm1SrjNWgG5jsddSFqJBXPZoiprrVmx6Ivx5
	 zEHwwuT29YEN0V5CcOFmBBdXotcOekLATvjWeoVM=
Date: Fri, 15 May 2026 08:13:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jianlin Lv <iecedge@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rafael@kernel.org,
	dakr@kernel.org, jianlv@ebay.com, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH] driver core: Add cmdline option to force probe type
Message-ID: <2026051532-pettiness-gave-1127@gregkh>
References: <20260514094955.76305-1-jianlv@ebay.com>
 <2026051443-exuberant-important-534f@gregkh>
 <CAFA-uR93Wf2ALpYnnU79kruv7XO=uFePqioaEXNNEfrUtRw2xQ@mail.gmail.com>
 <2026051406-corridor-equation-c50e@gregkh>
 <CAFA-uR9=rHPbiVFYgDBAdRHCoujKjqtTxsMVupEwGhGmXoLw8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFA-uR9=rHPbiVFYgDBAdRHCoujKjqtTxsMVupEwGhGmXoLw8w@mail.gmail.com>
X-Rspamd-Queue-Id: DFCF1549E40
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87585-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,linuxfoundation.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 11:09:03PM +0800, Jianlin Lv wrote:
> On Thu, May 14, 2026 at 9:49 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, May 14, 2026 at 09:35:08PM +0800, Jianlin Lv wrote:
> > > On Thu, May 14, 2026 at 6:16 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Thu, May 14, 2026 at 05:49:55PM +0800, Jianlin Lv wrote:
> > > > > From: Jianlin Lv <iecedge@gmail.com>
> > > > >
> > > > > Device drivers that use asynchronous probing can cause non-deterministic
> > > > > device ordering and naming across reboots. A typical example is storage
> > > > > drivers (like sd/nvme): asynchronous probing can lead to inconsistent disk
> > > > > logical names after reboot. In scenarios where disk naming consistency is
> > > > > critical, the probe type should be set to synchronous.
> > > > >
> > > > > This patch introduces a driver_probe kernel parameter that overrides any
> > > > > driver's hard-coded probe type settings and allows runtime control without
> > > > > requiring kernel recompilation:
> > > > >
> > > > >   driver_probe=PROBE_TYPE_SYNC,nvme,sd      # Force specific drivers sync
> > > > >   driver_probe=PROBE_TYPE_ASYNC,*,usb       # Force all async except usb
> > > > >   driver_probe=PROBE_TYPE_SYNC,*            # Force all drivers synchronous
> > > > >
> > > > > The implementation replaces the limited driver_async_probe parameter with
> > > > > a more flexible interface that can force either synchronous or asynchronous
> > > > > probing as needed.
> > > > >
> > > > > Signed-off-by: Jianlin Lv <iecedge@gmail.com>
> > > > > ---
> > > > >  .../admin-guide/kernel-parameters.txt         | 27 +++++--
> > > > >  drivers/base/dd.c                             | 71 ++++++++++++++-----
> > > > >  2 files changed, 74 insertions(+), 24 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > > > > index 4d0f545fb3ec..b43a8bd20356 100644
> > > > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > > > @@ -1377,12 +1377,27 @@ Kernel parameters
> > > > >                       it becomes active and is searched during signature
> > > > >                       verification.
> > > > >
> > > > > -     driver_async_probe=  [KNL]
> > > > > -                     List of driver names to be probed asynchronously. *
> > > > > -                     matches with all driver names. If * is specified, the
> > > > > -                     rest of the listed driver names are those that will NOT
> > > > > -                     match the *.
> > > > > -                     Format: <driver_name1>,<driver_name2>...
> > > >
> > > > You can not remove an existing user/kernel api, sorry, that is not
> > > > allowed as you just broke all systems that were relying on this :(
> > > >
> > > Could you provide more suggestions on how to improve this patch?
> >
> > Not really, sorry, I don't think this is a change that should be done at
> > all.  disk naming is a long-solved issue, to think that you can fix that
> > by doing sync/async device probing is not understanding both the issues
> > involved, and how we solved it already :)
> 
> Do you mean referencing disks via by-path/by-id?

No, use something that does not change, like filesystem labels or
serial numbers, or something else that is guaranteed unique.

> In our production env
> they can also be unstable; this is an example I encountered before:
> https://lore.kernel.org/all/CAFA-uR_jk6jCmf9DTebSVBRwtoLuXuyvf1Biq+OObqRVAOZbBw@mail.gmail.com/

Yes, paths can, and will, change.  Don't use them.

Why not use a UUID, that is explicitly what those are designed for.

> I understand that device naming in the kernel can change at any time. However,
> Is it necessary to provide an interface that allows users to choose
> the probe mode themselves?

It's not going to solve your problem, so I wouldn't worry about it.  And
you can't remove it, although I really would like to :)

thanks,

greg k-h


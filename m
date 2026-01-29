Return-Path: <linux-doc+bounces-74533-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ExsNbtye2mMEgIAu9opvQ
	(envelope-from <linux-doc+bounces-74533-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 15:46:19 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1019B1222
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 15:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7CDB03001FBA
	for <lists+linux-doc@lfdr.de>; Thu, 29 Jan 2026 14:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E05033122E;
	Thu, 29 Jan 2026 14:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L7KnIypt"
X-Original-To: linux-doc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522B232E6A2;
	Thu, 29 Jan 2026 14:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769697974; cv=none; b=gmpln3WU9I/sGYggncNcA93j1AF2xsPhXXC2D5vJGvo18ObSjQd0dqG11nGTTOf22Rwuz0ypS0TkrGEBL2VF8fLThHPvNXb6Zny4hPrpJC4fklTNZy2lzJhKFWPGvyQ7KD5+avWyg1Djvs8Pk98y+nCZcEjwq9+I6LgWyPnhN/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769697974; c=relaxed/simple;
	bh=d/QXeUuY540RkVY1yxCPPN5ccneb3FXmZjSp+D7vLTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHWAU4l4JdRvWlC44Usm4eevftPSsVe0fRcETbsO+bwF9sMIp0GWA8hNou25BbxskrJtAzZgvZo/mE6cPxxK+irQLkqHB+dfmu1dW9Y6tqxX1A9HpX+tzHeT77NhorcrPlNAMGtD+oUKrHNDwQLrxNJ6TM4bYtnS+QhukJZqHc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L7KnIypt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CF6821661;
	Thu, 29 Jan 2026 15:45:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769697923;
	bh=d/QXeUuY540RkVY1yxCPPN5ccneb3FXmZjSp+D7vLTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7KnIyptupms2szMN1PZCSN6ECNg6Qt53LH9vflq0Bz7KWqoH22wvxk5Z5GIIG6QK
	 k0z+sqm+tY5Wo+iyhx1HAkhaAgG1o4z0uKFifKQZqI6Bdg0IHSNnJ2Y9GMPM2U5vOy
	 2nnmaPFnxnE0XZ5t04VSz3tx/UqVfoX62J8vWFhs=
Date: Thu, 29 Jan 2026 16:45:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Johan Hovold <johan@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <20260129144559.GD3327197@killaraus>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <aXovtrAM1r1UyWxA@hovoldconsulting.com>
 <CAMRc=MeMW4g5em_b9qGBR9OmQZNzyQp-S=zKDCPFu506ixy-cQ@mail.gmail.com>
 <20260129105634.GC3317328@killaraus>
 <CAMRc=MfzByLPJ0FKySmG7b79Ah63Mtk1hs1N=6kv8pTDydrcGg@mail.gmail.com>
 <20260129142836.GF2223369@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129142836.GF2223369@nvidia.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-74533-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F1019B1222
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 10:28:36AM -0400, Jason Gunthorpe wrote:
> On Thu, Jan 29, 2026 at 08:50:30AM -0500, Bartosz Golaszewski wrote:
> 
> > and the ownership of that data belongs to the driver. There's no way we could
> > address it now so the next best thing is to work towards moving the ownership
> 
> Think positive!
> 
> If this is common:
> 
>  struct my_i2c_drv_data *data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> 
> Then change it into
> 
>  struct my_i2c_drv_data *data = devm_i2c_adaptor_alloc(struct my_i2c_drv_data, adap);
> 
> With Coccinelle or sed.
> 
> Audit all the drivers to catch the stragglers.
> 
> Now you have a refcount. Look at how fwctl_alloc_device() works to
> understand the pattern.
> 
> Kernel community has done far harder transformations than this :)
> 
> Sure it is 200 drivers, I would ask Coccinelle team for help.

We rewrote the device model between v2.4 and v2.6 (and by "we" I mostly
mean kudos to Greg for that work, as well as to all the people who
worked with him who I don't know about). That impacted *all* the
drivers. We can do this if we want to.

> Here is how I would approach it.
> 
> First, grep to find all the candidates:
> 
> $ git grep -E '^\s+struct i2c_adapter[^*]*;'
> 
> Get a kernel built with all those compiling and get a clangd database
> going. Make a list of all possible candidate files with grep.
> 
> AI tells me (and AI is never right about Coccinelle sadly) that you
> could use this:
> 
> // C1: Find any struct that has a member of type "struct i2c_adapter"
> @ has_i2c_adapter_struct @
> type S;
> @@
> struct S {
>   ...
>   struct i2c_adapter;
>   ...
> };
> 
> // C2: Replace sizeof(...) with fixme_sizeof(...)
> @ sizeof_i2c_adapter_struct depends on has_i2c_adapter_struct @
> type has_i2c_adapter_struct.S;
> @@
> - sizeof(struct S)
> + fixme_sizeof(struct S)
> 
> The idea being the only reason to do sizeof(S) is for an allocation
> and we want to find every allocation of a wrapper struct to fix it.
> 
> Now you have an index of all lines that need touching.
> 
> Look for common patterns, use Coccinelle or sed to make bulk
> replacements. Group patches of all similar transformations. Sweep
> through with grep to clean anything not caught. Probably there will be
> a couple drivers doing something utterly insane, meditate on them and
> clean them up by hand (this is what clangd is helpful for)
> 
> Betcha you can get through it in a few hours!
> 
> Jason

-- 
Regards,

Laurent Pinchart


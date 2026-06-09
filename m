Return-Path: <linux-doc+bounces-91580-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IlgHBtD1J2pz6QIAu9opvQ
	(envelope-from <linux-doc+bounces-91580-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 13:15:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B00E765F64E
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 13:15:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=agmX4x1N;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91580-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-91580-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 827233073C50
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 11:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836A23FD14D;
	Tue,  9 Jun 2026 11:10:27 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6743FD137
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 11:10:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003427; cv=none; b=V7jgEkmThfYhc7ICKBT/4ZRvRKKJjFrLDGnMYDuW30WxwBCPXDgc9Ycj4EErI/QfsYKmtivSY5/K4vuSGUq5n71L5dw9l9YzjSkYXuhZCcSqpdAv9fSmivY+GTEfcERwe4DguCSuXHlTZa3ckCdJIlbr2KPdM6mVvRM3k3ujXH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003427; c=relaxed/simple;
	bh=vaqzFSKtMNYyiL9eHPBoufR6zaTVLXadmcHXE4DMosI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvpNfmoJfYiciXuPoi7VaH5Ug2mDlp9XwA9/pZQHjPBrY78RIKujNPHQ185YYvYikemO1xYBCwQXg4ZhzDG78iRlTp4kIWaze/5gGXgmsBjEBxobG0Atx89UFVChVQITmrEWXEy/6xQAXkdhfA0hGqOxiTuBYwoL7GdDK71Y/iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agmX4x1N; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56C6F1F0089D
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 11:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781003426;
	bh=Y4Pv6TLW2isbsa4H9fukqLFlLFVlyMxhNkOO5LP0Eko=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=agmX4x1NG9aMkPOFQD6odqtm+85EWBTisGuJt3xa5hpN5EwpkTEpCH34QlpUW/jii
	 oBahdGXD5XhqqgeXnsGYb+crzH6nWhYZHasf9nVdUiz86M6XcLCX10EI91J1mALo5X
	 +rj6ojbJaxPCMBHJh4u17udkPO6S6mm3mNRfIh1kt70VjwaO3PRNoKTBeIFQ9GC+8r
	 WlaCyxWIg1n8whozx1b7KJgBJZZ035Tk0u2f2AZ0nN5tEezl/wupLlgb10izkv6Zyq
	 hag17pVnp1XU/uZbpXjcSjZhm8Ede4C6hO6vtU0GtDY+mrYZBpgADkDfRnX4tXhIXp
	 i7qWZ8AhR+08g==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39677c80386so56945271fa.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 04:10:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8nB2NGZZP5wiy+CD6IqDe6RWB8AAryvfOzqp65UPC3wtFfekzb6ou5ZI4Au2PZVR8X6mDi/CHs/L4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVuw819SWUdl9FdMAF01H690AUbTTQLKSvd5txhFmnZBrd1+cL
	sSmIMu24BhX6uhMFTIOdSolxdcTdKlADL1g5vQh8YYumqwzmwuuDIeb1Yx2HnrM+N4NTYdiUC/K
	eo1SzPpBh5mPiS0ATEehXBOEEJMP9bSc=
X-Received: by 2002:a05:6512:3503:b0:5aa:684d:3c75 with SMTP id
 2adb3069b0e04-5aa87b765b9mr5502998e87.10.1781003424573; Tue, 09 Jun 2026
 04:10:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608021526.1023248-1-tzungbi@kernel.org> <20260608021526.1023248-2-tzungbi@kernel.org>
 <CAJZ5v0jy75R24NztKJ0w4NMyRB7G+DcsC+gaQ0xZOQMfTfA5Ww@mail.gmail.com> <aifWwEyHuFejW4ac@google.com>
In-Reply-To: <aifWwEyHuFejW4ac@google.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 9 Jun 2026 13:10:12 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ja1ocM+W4hbVsHoZ=fFdmQ-=z4xzviNwo0eEyWT8ssBA@mail.gmail.com>
X-Gm-Features: AVVi8CfcQOqJ5DtGHKRFBjmAeK0pnfm0wH6Z-2uCTUdXvYpA6FSHKiPnStQMwPg
Message-ID: <CAJZ5v0ja1ocM+W4hbVsHoZ=fFdmQ-=z4xzviNwo0eEyWT8ssBA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] PM: core: Rename module parameters prefix to "power"
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Pavel Machek <pavel@kernel.org>, 
	Len Brown <lenb@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, tfiga@chromium.org, 
	senozhatsky@chromium.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91580-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:tzungbi@kernel.org,m:rafael@kernel.org,m:corbet@lwn.net,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:skhan@linuxfoundation.org,m:pavel@kernel.org,m:lenb@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:tfiga@chromium.org,m:senozhatsky@chromium.org,m:rdunlap@infradead.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[rafael@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B00E765F64E

On Tue, Jun 9, 2026 at 11:03=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Mon, Jun 08, 2026 at 04:11:30PM +0200, Rafael J. Wysocki wrote:
> > On Mon, Jun 8, 2026 at 4:16=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.or=
g> wrote:
> > >
> > > Currently, the module parameters defined in drivers/base/power/main.c
> > > use the default prefix "main" (derived from the filename).  The prefi=
x
> > > "main" is too generic and non-descriptive for power management
> > > parameters.
> > >
> > > Redefine MODULE_PARAM_PREFIX to "power." at the beginning of the file
> > > to group the module parameters under the "power" namespace instead.
> > > This makes the parameters more descriptive.
> > >
> > > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > > ---
> > > v3:
> > > - No changes.
> > >
> > > v2: https://lore.kernel.org/all/20260604090756.2884671-2-tzungbi@kern=
el.org
> > > - New to the series.
> > >
> > > v1: Doesn't exist.
> > >
> > >  drivers/base/power/main.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> > > index ed48c292f575..cd864f3a2799 100644
> > > --- a/drivers/base/power/main.c
> > > +++ b/drivers/base/power/main.c
> > > @@ -40,6 +40,9 @@
> > >  #include "../base.h"
> > >  #include "power.h"
> > >
> > > +#undef MODULE_PARAM_PREFIX
> > > +#define MODULE_PARAM_PREFIX "power."
> >
> > "power" may be confused with the power supply support, so I'd rather
> > use "pm" or even "pm_sleep" (in which case the "dpm_" prefix could be
> > dropped from the new module param name in the next patch).
>
> Ack, will use "pm_sleep" in the next version.
>
> Regarding dropping the "dpm_" prefix, should this also apply to the exist=
ing
> dpm_watchdog_all_cpu_backtrace parameter?  Or should we leave it as-is to
> avoid breaking existing configurations?

Breaking things for someone would be unfortunate.

For consistency, let's retain the "dpm_watchdog" part in this name and
use it in the new one.


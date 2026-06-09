Return-Path: <linux-doc+bounces-91582-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id D6dKHGT5J2oh6gIAu9opvQ
	(envelope-from <linux-doc+bounces-91582-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 13:30:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4F165F816
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 13:30:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=dUP2V0uo;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91582-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91582-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68EC930BF728
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 11:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81F53FE650;
	Tue,  9 Jun 2026 11:17:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466A53FD147
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 11:17:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003848; cv=none; b=IJwi+CFnB2h/rLl3WbYgZUc1g5f3G7jr8lE/lXcsorDHZCLgA/2W+1tps7a+RfVTjeC1Ut61Y9bWewGoOL1JNQ3afJ4PuK8NFpw1NBx9lumvVreSv7xC+ASF6knutcajQiQHe76BPebFx4BYlGNIOkvRsZ2W1jqo6jIOgGZqLjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003848; c=relaxed/simple;
	bh=7tp2OWYrm+Ia70rR/TEdzpzDPNkEbn8XJlTwHfsYhiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o3JPPijkrpxdXnKFN7UuLXy4Qnlhs1aLJ4AH83+1HbJbTZapUtfA3yaTdcH2Zavt2MVty5pBYaO8gJfYeVlWQ75XoMs0E9/tu3a2XIKIKJdPf5ySrBl07Nf6yOHwIdSlPNN1WFeAy6wFROkdWVeJ/+n5ZAZ3UBfjntueMzH+PIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dUP2V0uo; arc=none smtp.client-ip=209.85.160.177
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51758478240so26553291cf.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 04:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781003846; x=1781608646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDbvCu4VoxfZEmkz8hj4Arxjmojgi1kh7vhYD4neuKE=;
        b=dUP2V0uo6K0j3OIWdV1547VuJwCs49dgok4pEqkc8Ds8p+BtezSnHbSqh41jqEIPwV
         bZ4rZqjyLNqZdgP0QMCC8cOsGD/POEsUQdCMC57ROR+mGMOSazom61cH5TJDEUwKtdAi
         DBWCLb51iH1SMpLP1zrf9aq5w4c0kR7NQpDF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781003846; x=1781608646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zDbvCu4VoxfZEmkz8hj4Arxjmojgi1kh7vhYD4neuKE=;
        b=K2LHZoDo5lCxXQ6srMJzJXX85avxw+P/ciQjjMtq+y7Wn5z88IJkOSnHT9GoCvmn1s
         +VFtrUo62FV4elW8dYcZepp5Bx3a5tTJLTRSUvTks8SHNU1p1znskLEFqkyoWBqgAdRj
         KVMVqMuJIn/GD0MKzK8JC60GIiauIdK3P17QpbFiYwmIwDL9xAKb1FKQXFCVli/JxZQs
         g1NL1wKAvn4YkdkQxLfiORPBI/dGT8FKKW2c3Z/3wNMt7nJk61wOqoQgqXl0CZyC6cFj
         +vJSmsa8+/h406FFhiXn/q73Xno0/MhQj/+Ab5DPDsLPwirGXQpMyKm0HhhL7omSCrSu
         ZeDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+U5dSeWWY5PZuDnblilFyjdWnVJhMelk58RfbODZ8IhX3DzNtE0RiVbJbqXAzX02lCsioOqlrUH/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqnhjeVpfAh0JtM2eshw89PZcSCPpL4JZSdOIeAGRLWcnO6vBz
	PLnQLkQGIgmASZHWVBxr5xQ8QJDE0LufNlifU0znjF74vzr7xljZXYf0FJeDRAZ4BXzK7QwOu47
	lEugc0Q==
X-Gm-Gg: Acq92OEcLbng1rsBq+/IrALSfQnfXDP3t8hvgm6Y7NRUtZ2FHaISPWfy3BL7b3ZfqXN
	EiJ7tjXX8OGKEqtjbFaYnMYNNsPbZOi4/xX9EOhRrtKrcs43shSzs04aFo4qStKl0y3WhcduIrI
	WFjxcga2cs+0pCIx55BVf9bK870vDrJXl0v75kH/LN8eOkId3oW7jVunBq7uWwgaFC1++8wLk4U
	x3lSp1+jSEMfG0f4HnD76gdCxghzxYCJbEGXlExAHy1e3TxaIXTr/lAMoqh97x4Q1N5LsH4Fzww
	Q6Ykjc9LXnC4pBemUkYh9FqPB3Ks57xOdfnKUXCihp1zWAaX56Kw5xNKqTgtKY8gaNNV1+WPy/T
	bJiuTIo64HSFucqvl+XYe9g5lMeHhtsngHpZOKrO8O3t8l51eq7vGq56LsyP77Htvlvwe/ZfK5H
	GaPx0WbgO/OTKe+Yo1Av6ta2bDScCmNxIjaiEvjR0od3eAeOGBDzs/3PPjTmNXnCdFKT/lCbEm
X-Received: by 2002:a05:622a:1388:b0:516:e031:9343 with SMTP id d75a77b69052e-51795a829e6mr273775121cf.11.1781003846081;
        Tue, 09 Jun 2026 04:17:26 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c60dedsm180434411cf.13.2026.06.09.04.17.22
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 04:17:24 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5175d339e8bso2390701cf.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 04:17:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8JLVgWSEn2YFHqt8fgTBjxIJApcpYSCPM4IfAHmIsDgS2pSKjzTPhHoSBne6uF362jA+8q8PsPBiM=@vger.kernel.org
X-Received: by 2002:ac8:51d3:0:b0:517:99ea:ab82 with SMTP id
 d75a77b69052e-517abc8cea8mr19118391cf.28.1781003841615; Tue, 09 Jun 2026
 04:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608021526.1023248-1-tzungbi@kernel.org> <20260608021526.1023248-2-tzungbi@kernel.org>
 <CAJZ5v0jy75R24NztKJ0w4NMyRB7G+DcsC+gaQ0xZOQMfTfA5Ww@mail.gmail.com>
 <aifWwEyHuFejW4ac@google.com> <CAJZ5v0ja1ocM+W4hbVsHoZ=fFdmQ-=z4xzviNwo0eEyWT8ssBA@mail.gmail.com>
In-Reply-To: <CAJZ5v0ja1ocM+W4hbVsHoZ=fFdmQ-=z4xzviNwo0eEyWT8ssBA@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 9 Jun 2026 20:17:03 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bmm4VeJ2ygOJeQYmdTq1DLBsQdvDkhstA-tUPZr0rB1A@mail.gmail.com>
X-Gm-Features: AVVi8CfwcVOwQBh6bKtrJBXA0oWlGWFm1bcG07aWA20mHmTZKYZMKn7BpYcKJWo
Message-ID: <CAAFQd5Bmm4VeJ2ygOJeQYmdTq1DLBsQdvDkhstA-tUPZr0rB1A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] PM: core: Rename module parameters prefix to "power"
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Pavel Machek <pavel@kernel.org>, 
	Len Brown <lenb@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	senozhatsky@chromium.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91582-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:tzungbi@kernel.org,m:corbet@lwn.net,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:skhan@linuxfoundation.org,m:pavel@kernel.org,m:lenb@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,m:senozhatsky@chromium.org,m:rdunlap@infradead.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[tfiga@chromium.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tfiga@chromium.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,chromium.org:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB4F165F816

On Tue, Jun 9, 2026 at 8:10=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.org=
> wrote:
>
> On Tue, Jun 9, 2026 at 11:03=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org=
> wrote:
> >
> > On Mon, Jun 08, 2026 at 04:11:30PM +0200, Rafael J. Wysocki wrote:
> > > On Mon, Jun 8, 2026 at 4:16=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.=
org> wrote:
> > > >
> > > > Currently, the module parameters defined in drivers/base/power/main=
.c
> > > > use the default prefix "main" (derived from the filename).  The pre=
fix
> > > > "main" is too generic and non-descriptive for power management
> > > > parameters.
> > > >
> > > > Redefine MODULE_PARAM_PREFIX to "power." at the beginning of the fi=
le
> > > > to group the module parameters under the "power" namespace instead.
> > > > This makes the parameters more descriptive.
> > > >
> > > > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > > > ---
> > > > v3:
> > > > - No changes.
> > > >
> > > > v2: https://lore.kernel.org/all/20260604090756.2884671-2-tzungbi@ke=
rnel.org
> > > > - New to the series.
> > > >
> > > > v1: Doesn't exist.
> > > >
> > > >  drivers/base/power/main.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> > > > index ed48c292f575..cd864f3a2799 100644
> > > > --- a/drivers/base/power/main.c
> > > > +++ b/drivers/base/power/main.c
> > > > @@ -40,6 +40,9 @@
> > > >  #include "../base.h"
> > > >  #include "power.h"
> > > >
> > > > +#undef MODULE_PARAM_PREFIX
> > > > +#define MODULE_PARAM_PREFIX "power."
> > >
> > > "power" may be confused with the power supply support, so I'd rather
> > > use "pm" or even "pm_sleep" (in which case the "dpm_" prefix could be
> > > dropped from the new module param name in the next patch).
> >
> > Ack, will use "pm_sleep" in the next version.
> >
> > Regarding dropping the "dpm_" prefix, should this also apply to the exi=
sting
> > dpm_watchdog_all_cpu_backtrace parameter?  Or should we leave it as-is =
to
> > avoid breaking existing configurations?
>
> Breaking things for someone would be unfortunate.
>
> For consistency, let's retain the "dpm_watchdog" part in this name and
> use it in the new one.

Hmm, doesn't the prefix change already break things?

Best,
Tomasz


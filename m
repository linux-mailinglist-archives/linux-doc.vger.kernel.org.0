Return-Path: <linux-doc+bounces-7024-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2D4831510
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jan 2024 09:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53F341F22166
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jan 2024 08:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA88511CBA;
	Thu, 18 Jan 2024 08:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QgkTSAyU"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC68EEA5
	for <linux-doc@vger.kernel.org>; Thu, 18 Jan 2024 08:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705567699; cv=none; b=jFhN8SB5Ot0b7TIwZyPU155Wnmg8DffH1LpGb5JmjZ4RXShZpFm7dabau5HzOk6VPMmL01RsAUT9we+qSAGI9jeAsqOdd3dwuIviOincnC6WSmdMAsYaUopBpMV7GCCX3fFaoEoJkDV5duGqr9R0B4GF8fzbaKJ1JbsPb1IVhj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705567699; c=relaxed/simple;
	bh=ltIaIxUBro6oL2eI0AXfMlFTo1Ldlp+RYBlQ9XGXzE0=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Received:
	 X-Google-Smtp-Source:X-Received:Received:Message-ID:Subject:From:
	 To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version; b=C4tCM8tDOAOgxi1eUXwvKm309bV4p5uGnlRKHdsuK2bwXW9vE8hi+KxEPb7HaOclTQceDB8IYRnKyDwfqEAFxVpjx1qBLJSQuUP9Xtu+VxTTgenj743Ob78mvFUHU7FB9k8H2WikNNKDGhM+FabqfW4tKihnzpDvpvdb1B6bLPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QgkTSAyU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705567696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ltIaIxUBro6oL2eI0AXfMlFTo1Ldlp+RYBlQ9XGXzE0=;
	b=QgkTSAyUtZEuUpP6OR7y5khYLViR+gREc3CT3/+25W3bPRiXfz3avM1LypqnCHF3Vr38rh
	l8SptYLHsVrboN5Ug31/6hP8MGb3hQ1RKveM3el19m/wTh3xYKloj/cvE7uzot9cVFGIyp
	EnvsGV7jxWKjRO7h6OZV91+zVO7epYQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-oNaJTmHzMmSVrOsFNE6vTg-1; Thu, 18 Jan 2024 03:48:15 -0500
X-MC-Unique: oNaJTmHzMmSVrOsFNE6vTg-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-429b32b01c7so19313401cf.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Jan 2024 00:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705567695; x=1706172495;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltIaIxUBro6oL2eI0AXfMlFTo1Ldlp+RYBlQ9XGXzE0=;
        b=VPNlUtxpntzrSceFrZhDVgm4D7GFINzRD1T2uAuA6ZuIheR3S/i93lULaecxTQjl31
         BCee1gH1ZS+HEbN8D5nfRq7JCguqjk6J5w1h8rRe2FQkEo+sUy7iPSy/LtRXaQPznDY/
         hvP85iaQ0GqGJ91lR/OkkWR/sJKC71BPvVDX6QtJs54FDLtZMdHExUbR+LUM0lvMqIeW
         fwpD6+fOVD6bMFbth2dsmrki5awSmhOS12LAIH+PEngDn57ZA0pbVO1CbWuRjM37+ls3
         d17k2EUoejYgKxjvue9sf8t+ia1+OyuJN+3YNHNyNiyd4945Blrs9M/qwt5sur/WrgHq
         al3w==
X-Gm-Message-State: AOJu0YwHlfo2SFS1cUi66kR4ldDZtjLww/JnXyrXgrfuPHfo2tZ3lUUB
	70agw22CKUGPFma3LQiDrWUb5K2h4T7bsQz751WkVWvuj/nLwYkKzHYGbyNENc1QDCEXDJB/kA6
	aWC0QOqIz9Lea3AwBIhVn2aPUDnx+JJqShp30P07hphNdyz11rh44P+E0AA==
X-Received: by 2002:a05:6214:1d06:b0:681:770f:c4af with SMTP id e6-20020a0562141d0600b00681770fc4afmr817246qvd.4.1705567695161;
        Thu, 18 Jan 2024 00:48:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwYyFKI5f9OpMo2g4V3YbVYvUl96cU/lr7eBalkvPGWVo3fCzvHHWQMyUh2sMkj4110Mx35g==
X-Received: by 2002:a05:6214:1d06:b0:681:770f:c4af with SMTP id e6-20020a0562141d0600b00681770fc4afmr817230qvd.4.1705567694827;
        Thu, 18 Jan 2024 00:48:14 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id nc2-20020a0562142dc200b0068187c4b5d2sm739366qvb.111.2024.01.18.00.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 00:48:14 -0800 (PST)
Message-ID: <96f355a41bf42c6a604aec37449d35246395d929.camel@redhat.com>
Subject: Re: [PATCH 00/10] Make PCI's devres API more consistent
From: Philipp Stanner <pstanner@redhat.com>
To: andy.shevchenko@gmail.com
Cc: Jonathan Corbet <corbet@lwn.net>, Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas
 <bhelgaas@google.com>, Sam Ravnborg <sam@ravnborg.org>, dakr@redhat.com,
 linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  linux-pci@vger.kernel.org
Date: Thu, 18 Jan 2024 09:48:11 +0100
In-Reply-To: <5e760f104c75efe37100cee5a26b7ee3581f03b4.camel@redhat.com>
References: <20240115144655.32046-2-pstanner@redhat.com>
	 <ZabyY3csP0y-p7lb@surfacebook.localdomain>
	 <5e760f104c75efe37100cee5a26b7ee3581f03b4.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-01-17 at 10:59 +0100, Philipp Stanner wrote:
> On Tue, 2024-01-16 at 23:17 +0200, andy.shevchenko@gmail.com=C2=A0wrote:
> > Mon, Jan 15, 2024 at 03:46:11PM +0100, Philipp Stanner kirjoitti:

[...]

> >=20
> >=20
> > > PCI's devres API suffers several weaknesses:
> > >=20
> > > 1. There are functions prefixed with pcim_. Those are always
> > > managed
> > > =C2=A0=C2=A0 counterparts to never-managed functions prefixed with pc=
i_ =E2=80=93
> > > or
> > > so one
> > > =C2=A0=C2=A0 would like to think. There are some apparently unmanaged
> > > functions
> > > =C2=A0=C2=A0 (all region-request / release functions, and pci_intx())=
 which
> > > =C2=A0=C2=A0 suddenly become managed once the user has initialized th=
e
> > > device
> > > with
> > > =C2=A0=C2=A0 pcim_enable_device() instead of pci_enable_device(). Thi=
s
> > > "sometimes
> > > =C2=A0=C2=A0 yes, sometimes no" nature of those functions is confusin=
g and
> > > =C2=A0=C2=A0 therefore bug-provoking. In fact, it has already caused =
a bug
> > > in
> > > DRM.
> > > =C2=A0=C2=A0 The last patch in this series fixes that bug.
> > > 2. iomappings: Instead of giving each mapping its own callback,
> > > the
> > > =C2=A0=C2=A0 existing API uses a statically allocated struct tracking=
 one
> > > mapping
> > > =C2=A0=C2=A0 per bar. This is not extensible. Especially, you can't c=
reate
> > > =C2=A0=C2=A0 _ranged_ managed mappings that way, which many drivers w=
ant.
> > > 3. Managed request functions only exist as "plural versions" with
> > > a
> > > =C2=A0=C2=A0 bit-mask as a parameter. That's quite over-engineered
> > > considering
> > > =C2=A0=C2=A0 that each user only ever mapps one, maybe two bars.
> > >=20
> > > This series:
> > > - add a set of new "singular" devres functions that use devres
> > > the
> > > way
> > > =C2=A0 its intended, with one callback per resource.
> > > - deprecates the existing iomap-table mechanism.
> > > - deprecates the hybrid nature of pci_ functions.
> > > - preserves backwards compatibility so that drivers using the
> > > existing
> > > =C2=A0 API won't notice any changes.
> > > - adds documentation, especially some warning users about the
> > > =C2=A0 complicated nature of PCI's devres.
> >=20
> > Instead of adding pcim_intx(), please provide proper one for
> > pci_alloc_irq_vectors(). Ideally it would be nice to deprecate
> > old IRQ management functions in PCI core and delete them in the
> > future.
> >=20
>=20
> In order to deprecate the intermingling with half-managed hyprid
> devres
> in pci.c, you need to have pci_intx() be backwards compatible. Unless
> you can remove it at once.
> And the least broken way to do that I thought would be pcim_intx(),
> because that's consistent with how I make pci_request_region() & Co.
> call into their managed counterparts.
>=20
> There are 25 users of pci_intx().
> We'd have to look how many of them call pcim_enable_device() and how
> easy they would be to port to... pci_alloc_irq_vectors() you say? I
> haven't used that before. Would have to look into it and see how we
> could do that.

Alright, so I thought about that a bit.

So pci_intx() is the old way to do it and you would like to deprecate
it for good. Understood, makes sense

This series, however, is about deprecating PCI's broken devres
implementation =E2=80=93 not about deprecating outdated PCI features in
general.

So I wouldn't like to touch anything here unless cleaning up devres
demands it.
Now the question would be: how can we solve this?

My suggestion would be:
Let's implement pcim_intx(), but only make it visible through
drivers/pci/pci.h. So we won't make it usable for other drivers, don't
EXPORT_SYMBOL() it and basically only have it as a tool to move the
devres-part clearly and cleanly from pci.c to devres.c

Further deprecating old PCI stuff could then be done in a separate
series.

ACK?

P.



>=20
>=20
> P.



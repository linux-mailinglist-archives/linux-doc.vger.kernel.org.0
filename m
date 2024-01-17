Return-Path: <linux-doc+bounces-6949-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B94830321
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jan 2024 11:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F15831F21622
	for <lists+linux-doc@lfdr.de>; Wed, 17 Jan 2024 10:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81E8E1DDF5;
	Wed, 17 Jan 2024 09:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BbnyZAoH"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F4E14274
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 09:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705485577; cv=none; b=mr047oiPX+6jwbGMBXx0Lr4zuN7p+TBVDBjL8nb4xeWhC/71JTQQe4wO3i+q5dg29Yj0oXq4fxHxjPzGQbkfyXO/8oE0ROGzouCujuWKi6fBUxiGdC7vIdLss8pPI5CUvlXmxelXlkcMRp2yprVJZzcf9mDGi+gODoIoA2fS/Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705485577; c=relaxed/simple;
	bh=BXWuaM6cUVSlh8BuiMCFX+aJ/lumUdUFLhol1mX3ptg=;
	h=DKIM-Signature:Received:X-MC-Unique:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Received:
	 X-Google-Smtp-Source:X-Received:Received:Message-ID:Subject:From:
	 To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version; b=WRM6Vr+MNc51GXqngUuSSoA9F7czIdlz7+e7Wj39HJhmTGiDXSXT2R7REEkdU9t5Xot4AvDzhMAmUWgitvc9LNVJeZOO5Ke88HrcaNYhe4n0D8cv/sHvnhBWQO208ELhXxnwYJz2Gzjq+t8ra+tocUPZFRbQmhNPHytl3vbDxTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BbnyZAoH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705485574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BXWuaM6cUVSlh8BuiMCFX+aJ/lumUdUFLhol1mX3ptg=;
	b=BbnyZAoH62b58IPXKoIkpMV9SVK+sTZkVFeiWSWOkSFH9Fy+e9rLwUKGRux3drUYy+kWUi
	f3TENXbuMn6f2vTaAvgIIpGA65RISF6/Uh6Ez5SZBKweALQwXFQLc8/9uczT/j7JTZlBwo
	jHFfgJi9dcjnOVYbtLoJrolOxfMD+Q4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-h9ETq1NqODyVxeAJj8lOow-1; Wed, 17 Jan 2024 04:59:33 -0500
X-MC-Unique: h9ETq1NqODyVxeAJj8lOow-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7830635331bso204330585a.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 01:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705485572; x=1706090372;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BXWuaM6cUVSlh8BuiMCFX+aJ/lumUdUFLhol1mX3ptg=;
        b=deoRZVJqzSTzEYL3kx7rj9OFKri8rl8R03kd+EOlTAsAlgNAkOI7R1/uTiR6oAuWyD
         k/TJCBpUZPipqqe9lekZiWz412gZ62xBE2m5sk7WhMi744Zg8pPJ0N1QTWSyT5abz/rk
         Hwy9BSp5+9/Fg7nOi36xiJzEYmsWikbvdtW55T+dxvo03mjHyFS9/G6LcB7OiU/eQOtK
         LEwGdnAvyN7sUUKJY1I6KhjFr9GKAMerCIpgaDuag5noqRr/GhWPNaDK4UV3tBwZMSvl
         4T+0q73N/Xa32VkmIE1u9izz3+nyIjQdum4wllk+gTEPULkZ30P4rAf5Z9MO1MxcZUf/
         B9dQ==
X-Gm-Message-State: AOJu0YwLrSt9NmWi4IW2oLJTDBqLDM/dxaHsfbbNKZ7RpRnJZoouU5ky
	Rcw3s0izxd2J9HUVTWDq9jhnZokwWjYU0C2FV7LSRFqiSBKvr+ITAiQUpcxlJGUKkFH5obv8jTt
	+7KRQRunlY400MrN4ZCAFBMlqBHjx
X-Received: by 2002:a05:620a:2712:b0:783:54f7:87e3 with SMTP id b18-20020a05620a271200b0078354f787e3mr1912710qkp.3.1705485572524;
        Wed, 17 Jan 2024 01:59:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSqiqfszMpvjq99qT6Qsh4E31ne0xTg2kSjDD+8OcYXlRuSFlLMN+j9bbV0ag4d0WislsuJQ==
X-Received: by 2002:a05:620a:2712:b0:783:54f7:87e3 with SMTP id b18-20020a05620a271200b0078354f787e3mr1912700qkp.3.1705485572147;
        Wed, 17 Jan 2024 01:59:32 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id w9-20020a05620a148900b0078322355fb7sm4380924qkj.20.2024.01.17.01.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 01:59:31 -0800 (PST)
Message-ID: <5e760f104c75efe37100cee5a26b7ee3581f03b4.camel@redhat.com>
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
Date: Wed, 17 Jan 2024 10:59:29 +0100
In-Reply-To: <ZabyY3csP0y-p7lb@surfacebook.localdomain>
References: <20240115144655.32046-2-pstanner@redhat.com>
	 <ZabyY3csP0y-p7lb@surfacebook.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-01-16 at 23:17 +0200, andy.shevchenko@gmail.com wrote:
> Mon, Jan 15, 2024 at 03:46:11PM +0100, Philipp Stanner kirjoitti:
> > =C2=A1Hola!
>=20
> i? Vim user? :-)

The Dark Side of the Force is the path to many abilities, that some
consider to be... unnatural
https://www.neo-layout.org/

>=20
> > PCI's devres API suffers several weaknesses:
> >=20
> > 1. There are functions prefixed with pcim_. Those are always
> > managed
> > =C2=A0=C2=A0 counterparts to never-managed functions prefixed with pci_=
 =E2=80=93 or
> > so one
> > =C2=A0=C2=A0 would like to think. There are some apparently unmanaged
> > functions
> > =C2=A0=C2=A0 (all region-request / release functions, and pci_intx()) w=
hich
> > =C2=A0=C2=A0 suddenly become managed once the user has initialized the =
device
> > with
> > =C2=A0=C2=A0 pcim_enable_device() instead of pci_enable_device(). This
> > "sometimes
> > =C2=A0=C2=A0 yes, sometimes no" nature of those functions is confusing =
and
> > =C2=A0=C2=A0 therefore bug-provoking. In fact, it has already caused a =
bug in
> > DRM.
> > =C2=A0=C2=A0 The last patch in this series fixes that bug.
> > 2. iomappings: Instead of giving each mapping its own callback, the
> > =C2=A0=C2=A0 existing API uses a statically allocated struct tracking o=
ne
> > mapping
> > =C2=A0=C2=A0 per bar. This is not extensible. Especially, you can't cre=
ate
> > =C2=A0=C2=A0 _ranged_ managed mappings that way, which many drivers wan=
t.
> > 3. Managed request functions only exist as "plural versions" with a
> > =C2=A0=C2=A0 bit-mask as a parameter. That's quite over-engineered
> > considering
> > =C2=A0=C2=A0 that each user only ever mapps one, maybe two bars.
> >=20
> > This series:
> > - add a set of new "singular" devres functions that use devres the
> > way
> > =C2=A0 its intended, with one callback per resource.
> > - deprecates the existing iomap-table mechanism.
> > - deprecates the hybrid nature of pci_ functions.
> > - preserves backwards compatibility so that drivers using the
> > existing
> > =C2=A0 API won't notice any changes.
> > - adds documentation, especially some warning users about the
> > =C2=A0 complicated nature of PCI's devres.
>=20
> Instead of adding pcim_intx(), please provide proper one for
> pci_alloc_irq_vectors(). Ideally it would be nice to deprecate
> old IRQ management functions in PCI core and delete them in the
> future.
>=20

In order to deprecate the intermingling with half-managed hyprid devres
in pci.c, you need to have pci_intx() be backwards compatible. Unless
you can remove it at once.
And the least broken way to do that I thought would be pcim_intx(),
because that's consistent with how I make pci_request_region() & Co.
call into their managed counterparts.

There are 25 users of pci_intx().
We'd have to look how many of them call pcim_enable_device() and how
easy they would be to port to... pci_alloc_irq_vectors() you say? I
haven't used that before. Would have to look into it and see how we
could do that.


P.



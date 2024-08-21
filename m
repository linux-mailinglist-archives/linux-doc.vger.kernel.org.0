Return-Path: <linux-doc+bounces-23433-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDBF9598EC
	for <lists+linux-doc@lfdr.de>; Wed, 21 Aug 2024 13:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 080BA281B2E
	for <lists+linux-doc@lfdr.de>; Wed, 21 Aug 2024 11:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4924F1F2FCA;
	Wed, 21 Aug 2024 09:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bHkDx0dd"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EA91F2FC4
	for <linux-doc@vger.kernel.org>; Wed, 21 Aug 2024 09:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724233005; cv=none; b=DON1Q733pgvO1FYpORObG/uAEifSPphIiDrrm3dqDSGvoqeHvN+yyi2z6NaxkgZtzBvfTdo/R+dSyCuSYBwbg9GAN+CFFejE8+3Xf1OcViZdVChQ1hCsxICRd07YiJ1Tgs+mtOGOJRQK1ITrOmbvAO+7dXqkKa4juWtj5339PS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724233005; c=relaxed/simple;
	bh=Jj5eIkUkWg3KtRXn0z2L0PWnJAu5W4Pyl+E7wKNe/xw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tXxJ4Gz64gKKOq8VYnGVbzSS73lcE9yDdm++6OKIUUBuSbcXlW8/ITeXiGdyvtWKxNdtMOne/sUL6aKoHDQYwfOySxOYbLD9FU+xE+GxEG7+1ojDdVSrKUTxbtQrWwS8eW6pFTCVnzXhRn/dRaKl2q004nBId49Xa5LyEl/LLJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bHkDx0dd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724233002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jj5eIkUkWg3KtRXn0z2L0PWnJAu5W4Pyl+E7wKNe/xw=;
	b=bHkDx0ddCEFI8t/8uRHPFqkUgQvuBIZzwvG2rVs6WIlji9mQ6zSL/DxNP5+Jos3cuk8weZ
	P3zOPib9b57sylumo40uE2Z40PI9DW7uOozFE6s6J8W1SC/smgvzFVKQ3CDEuPbYTXxK+S
	Hg1AxXm+2OVxukak7lkeM+lam5XJYHA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-304-9Oz2b7jwOqiDvED27FwILg-1; Wed, 21 Aug 2024 05:36:40 -0400
X-MC-Unique: 9Oz2b7jwOqiDvED27FwILg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-429c224d9edso56195395e9.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Aug 2024 02:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724232999; x=1724837799;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jj5eIkUkWg3KtRXn0z2L0PWnJAu5W4Pyl+E7wKNe/xw=;
        b=nf1jbbpp7jdW9IKTjR67qnujcLpABoR3Ek9WtARcCghjye3qZSXsVe1auk1drIQcTj
         xaumd/kqd/3238Ty5d+zUxVqk5cvT20K+i3udGmmuEZShO90gvnxKh0DAyxLmRpehqXd
         hd6Y49l0e1nIQaqWVeKTOhKSmvhkIPxp5YVMUk3Or1wiYongFVLjb7BEgbP+LQhAf1k8
         0hrNOJHpWhOIZIUoqDCNLymZqDMRL9dbBxkSkgoILoTlJO+6dvXDK2hcYekhZ4DWm5Ay
         D5YFBjL+5eUzUiDZlEn4Z7rNqai98qgzAEyTOz9CRIHjCID6IHYDMACPvYavCDOvusxZ
         ubQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4faUPKhp4f7K6fRm4gX6BMxlBXSe+0GDqDE+AIxFyTJ20GZ7DM2XNuMv043ZcWNvs1xTbXHYWXDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt233wDraYz2xutrObFGw+SkpR88a/oNvPcFtxdJuhYSB3CZHh
	BBIdkCFNpsFYSRwsXAR4wYr2hrCj9/1RWDZyBDnK0fNvn5IexbShAbBwXRcGhJSVRvtLhiariac
	Gb+MyRt7/JFaoTFgaOOvVv/AfykSjR8VHx2cOw+GdgmwhsDqYsB+xwr6dSQ==
X-Received: by 2002:a05:600c:3ba2:b0:426:6ed5:fd5 with SMTP id 5b1f17b1804b1-42abd112115mr13371895e9.6.1724232999150;
        Wed, 21 Aug 2024 02:36:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5uFdtqh3Nnxq7uvkwhVWuYvEqJNhXSjOOFCdMvyLVN5q9k/xJob4MdVvdN0iwQqkOmix49g==
X-Received: by 2002:a05:600c:3ba2:b0:426:6ed5:fd5 with SMTP id 5b1f17b1804b1-42abd112115mr13371545e9.6.1724232998634;
        Wed, 21 Aug 2024 02:36:38 -0700 (PDT)
Received: from dhcp-64-164.muc.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42abee8bcecsm19203885e9.17.2024.08.21.02.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 02:36:38 -0700 (PDT)
Message-ID: <be1c2f6fb63542ccdcb599956145575293625c37.camel@redhat.com>
Subject: Re: [PATCH v2 6/9] ethernet: stmicro: Simplify PCI devres usage
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, Wu Hao
 <hao.wu@intel.com>, Tom Rix <trix@redhat.com>, Moritz Fischer
 <mdf@kernel.org>,  Xu Yilun <yilun.xu@intel.com>, Andy Shevchenko
 <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Alvaro
 Karsz <alvaro.karsz@solid-run.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Eugenio =?ISO-8859-1?Q?P=E9rez?= <eperezma@redhat.com>, Richard Cochran
 <richardcochran@gmail.com>, Mark Brown <broonie@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Damien Le Moal <dlemoal@kernel.org>, 
 Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>,
 linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org,  linux-fpga@vger.kernel.org,
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  linux-pci@vger.kernel.org,
 virtualization@lists.linux.dev
Date: Wed, 21 Aug 2024 11:36:36 +0200
In-Reply-To: <CAHp75VduuT=VLtXS+zha4ZNe3ZvBV-jgZpn2oP4WkzDdt6Pnog@mail.gmail.com>
References: <20240821071842.8591-2-pstanner@redhat.com>
	 <20240821071842.8591-8-pstanner@redhat.com>
	 <CAHp75VduuT=VLtXS+zha4ZNe3ZvBV-jgZpn2oP4WkzDdt6Pnog@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-08-21 at 11:14 +0300, Andy Shevchenko wrote:
> On Wed, Aug 21, 2024 at 10:19=E2=80=AFAM Philipp Stanner
> <pstanner@redhat.com> wrote:
> >=20
> > stmicro uses PCI devres in the wrong way. Resources requested
> > through pcim_* functions don't need to be cleaned up manually in
> > the
> > remove() callback or in the error unwind path of a probe()
> > function.
>=20
> > Moreover, there is an unnecessary loop which only requests and
> > ioremaps
> > BAR 0, but iterates over all BARs nevertheless.
>=20
> Seems like loongson was cargo-culted a lot without a clear
> understanding of this code in the main driver...
>=20
> > Furthermore, pcim_iomap_regions() and pcim_iomap_table() have been
> > deprecated by the PCI subsystem in commit e354bb84a4c1 ("PCI:
> > Deprecate
> > pcim_iomap_table(), pcim_iomap_regions_request_all()").
> >=20
> > Replace these functions with pcim_iomap_region().
> >=20
> > Remove the unnecessary manual pcim_* cleanup calls.
> >=20
> > Remove the unnecessary loop over all BARs.
>=20
> ...
>=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < PCI_STD_NUM_BAR=
S; i++) {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (pci_resource_len(pdev, i) =3D=3D 0)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 pcim_iounmap_regions(pdev, BIT(i));
>=20
> Here is the BARx, which contradicts the probe :-)

I'm not sure what should be done about it. The only interesting
question is whether the other code with pcim_iomap_regions(... BIT(i)
does also only grap BAR 0.
In that case the driver wouldn't even be knowing what its own hardware
is / does, though.


P.

>=20
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 break;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20



Return-Path: <linux-doc+bounces-42032-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C53FA78950
	for <lists+linux-doc@lfdr.de>; Wed,  2 Apr 2025 09:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CA7716F825
	for <lists+linux-doc@lfdr.de>; Wed,  2 Apr 2025 07:58:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED81233728;
	Wed,  2 Apr 2025 07:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TF6tKAZg"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A362F5A
	for <linux-doc@vger.kernel.org>; Wed,  2 Apr 2025 07:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743580711; cv=none; b=tiXoOevf0TlXCmefJun38payKslfz5xfbyiajmz+z44W9mlXkVCHzVXt4TU0eJWvM79VyVvUfwcYrAsNZuqR0ZltJLJZAajXFiaB0G+I/+CDHAOCVUjGZBP4gLwQWscv9tsyH97l5prw8o/6NLq5ghE6UwNYKhxOro7elI4i7fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743580711; c=relaxed/simple;
	bh=xNZG4kFoGbGB7pheqiYG3iEXKZBGzv6hERVCUWp27mQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GNQUxGi+9UiaTAoVm4VRd/iDFVGhX9DY0p2u7ZANv3cQ4eni7tLRndV6LH4O73qwp5oUVMhAoE1B9BahgZ+uDPfHkM1nalsSP9ZIP6AftoU+Lem/QE+X1cuI5j3idiJWXtqRHya8XrX3rB8zv2Sv/Pn0tP1K/zSkajyTqpXiIGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TF6tKAZg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743580709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xNZG4kFoGbGB7pheqiYG3iEXKZBGzv6hERVCUWp27mQ=;
	b=TF6tKAZgY3OnyDfVa38C/GBuaJwBAtv8OGEu+47r0k7UsPZowXnAgG9t4Sg9wDQ8oR9nEb
	nh/MnTn1OO81qxvQXPpYhow0buDoW80VVEgtBocgT93LOj5aNbEoJPipAtmM6LBFJEOQVf
	WSL7ZJ6wcKIivb0RlVimC9kz9tMu9ag=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-R9G6JsihO0iuE32ZUWmqzg-1; Wed, 02 Apr 2025 03:58:27 -0400
X-MC-Unique: R9G6JsihO0iuE32ZUWmqzg-1
X-Mimecast-MFC-AGG-ID: R9G6JsihO0iuE32ZUWmqzg_1743580707
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac2aa3513ccso481230766b.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Apr 2025 00:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743580706; x=1744185506;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xNZG4kFoGbGB7pheqiYG3iEXKZBGzv6hERVCUWp27mQ=;
        b=R1OfwruRfMmPkIuGpAqXAwKaLKsKHPRiIk4eysPoeOi4GT/XEISHBfHk6FkAUGykVg
         MvbnRR3JwhrlW4+/5HqyzkGVNaK1ymkga4YZ2PVCHSbz3j2JtDR+73avSFfEc5Pt3iGD
         YsgQIbw7YvwIVOoFiKQUhe84rcWULDqQ1P8USmN9YvR2UUupxEIw6r2H0k5DHDREdv5l
         jURdB18Ywz8YgcO8agb5NDH8nri+3nt5RmHxrd3ZUG8MWOsF1HCNhIAu/I40UFPLkJpG
         qutW5PPlzir0aemJi+mLzjQGbfm4NRCjHOqOwDOIiHnSOUly60CFeEcNH8JfgSX1iY2Y
         5s9w==
X-Forwarded-Encrypted: i=1; AJvYcCUiYQS2fZH7tF+JKiP0WKK8mHtzrzLYVPNA/+DTmmeqwZPvF1QIG/V5l244fh4iKhp/zBhgc8e/tSM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5vxxDR8x7b9en81a4tRKik24n77JncXmuUOt7X9QCvplHJnBM
	QqUkaBohKuXtUBU9YQrvSDmA/fz0DgY0qZ1+Y35Ecc17fIBH0p06yn6ushzMYSecJMPG0dueD6x
	/mZ8hxphQGVQcgL99YonUwgDxceP0zsqBwfkLW9t4pAw/BE54KEiZlAlFIQ==
X-Gm-Gg: ASbGnctAjLdyKxJEi/rQ6UUwBNiUWwJHoNVlp+7CvDWI7P4hucG0LXvVyHpKvS+jxei
	jofn4t1cA0zBf+vHgO4hAVuyQhwb9rG9O6X7Ivf3EbfxMnweAP99GXpwEf7Fypq18dYLeCjA1Kx
	CKu82hf3gQYcFt9TbgSixqWaUPSkeKLNmVFeunAYhvQmugLHeIKB+NNITBF+euNTpyjt7CYwXWR
	Iipyx+QR1W4ggY2xe7Sy4n3jJKv3eDCE/BPH5JmqKQ8p1lxGfL7T+6tNg+rVcIY3K5hDeLCkZ+r
	8yikmM5H8wKyIVcNXTtA10rwcI3lK6ZiBHcH6V1WVLRkd4fNFIWOPP5kAJPBjWhJsp2E2W49jee
	OLHyiBUIQe+tdHgskXraPyxwwgcE2KLa2TbgAWSO/bZu5XMiJMig=
X-Received: by 2002:a17:907:7215:b0:ac2:c06:ad9d with SMTP id a640c23a62f3a-ac7a16c1267mr109993766b.14.1743580706557;
        Wed, 02 Apr 2025 00:58:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYj6cd0a2ZmOIrY2+9xoa0kFQ790CUzhth/mn7wiW3bHJ2mcwrNEVMrfPgd8xSJJfNJC6BBQ==
X-Received: by 2002:a17:907:7215:b0:ac2:c06:ad9d with SMTP id a640c23a62f3a-ac7a16c1267mr109991066b.14.1743580706042;
        Wed, 02 Apr 2025 00:58:26 -0700 (PDT)
Received: from ?IPv6:2001:16b8:2d97:6a00:6929:a9f6:5863:aac5? (200116b82d976a006929a9f65863aac5.dip.versatel-1u1.de. [2001:16b8:2d97:6a00:6929:a9f6:5863:aac5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac719223e1esm877349966b.7.2025.04.02.00.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:58:25 -0700 (PDT)
Message-ID: <323da53fe2ec06c9cc5d1939a9e003c5bd2a0716.camel@redhat.com>
Subject: Re: [PATCH 0/2] PCI: Remove pcim_iounmap_regions()
From: Philipp Stanner <pstanner@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Philipp Stanner
	 <phasta@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Jens Axboe <axboe@kernel.dk>, Bjorn
 Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Damien Le Moal <dlemoal@kernel.org>, Yang
 Yingliang <yangyingliang@huawei.com>, Zijun Hu <quic_zijuhu@quicinc.com>,
 Hannes Reinecke <hare@suse.de>, Al Viro <viro@zeniv.linux.org.uk>, Li Zetao
 <lizetao1@huawei.com>,  Anuj Gupta <anuj20.g@samsung.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org
Date: Wed, 02 Apr 2025 09:58:24 +0200
In-Reply-To: <Z-U5vIbVDZLe9QnM@smile.fi.intel.com>
References: <20250327110707.20025-2-phasta@kernel.org>
	 <Z-U5vIbVDZLe9QnM@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-03-27 at 13:42 +0200, Andy Shevchenko wrote:
> On Thu, Mar 27, 2025 at 12:07:06PM +0100, Philipp Stanner wrote:
> > The last remaining user of pcim_iounmap_regions() is mtip32 (in
> > Linus's
> > current master)
> >=20
> > So we could finally remove this deprecated API. I suggest that this
> > gets
> > merged through the PCI tree.
>=20
> Good god! One API less, +1 to support this move.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>=20
> > (I also suggest we watch with an eagle's
> > eyes for folks who want to re-add calls to that function before the
> > next
> > merge window opens).
>=20
> Instead of this I suggest that PCI can take this before merge window
> finishes
> and cooks the (second) PR with it. In such a case we wouldn't need to
> care,
> the developers will got broken builds.
>=20

Normally Bjorn / PCI lets changes settle on a branch for >1 week before
throwing them at mainline =E2=80=93 but if we ask him very very nicely, may=
be
he would make an exception for this special case? :)

P.



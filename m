Return-Path: <linux-doc+bounces-34525-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30829A06F45
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 08:43:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2231D3A1FCD
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jan 2025 07:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6AF21481D;
	Thu,  9 Jan 2025 07:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dqwrd5kW"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D3821480C
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 07:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736408616; cv=none; b=kErkGWDTjPtX+rUHQoHZaP/yRp5x2B5DcLuvXrABQ/D5xOD/i0CwNwbQ0Niilg7a8LO8eEK9xWEjP0r5hCjSUDg6azCZt/B9yzehcIDox9QfQ92/LlQ5VJlP/AXm9molMeAxiHlIVNwIefgDH2SMNVDeFyL6L92L0qDmAP72nzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736408616; c=relaxed/simple;
	bh=jsaMuSUGwo+RJxj4wQLWlpqmbzwxs+PjsUjLgqIv9aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t1o++SkTTvJwRLg7g8qt3M37iY5+Pp0OroTcTM+j8mnCzUfQPe1/JnIUuUf7CQfm62ps2ljsGol3L6vUZAXqXTQRWcCLU30W5ztveyOLnjRKX1U/GryJ3DnnIVRv5UEAiO6a1/g7/VWFZRWpUvXUpShhnoqZX04/9fsijHPgdW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dqwrd5kW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736408612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x3MkaKicJuTxKB4Uwx+L5vUrVj7eiLsn1FE86R/YDhg=;
	b=dqwrd5kWzHf+pWTOpScn/Jt0o+KoeUicgs3oas3PovDJhh18bW9Cn3FrOa9SXJUd5QlfHv
	P5kpscUuL3lldqShAQNhfCs85wRhUpzdKmyCgCYRtP5yJBXzBiWaG7/HefAUv/fC/voaU7
	jLd7kKkiAvkcdYnzNyk5xleOE/8/CVo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-utKXOFT5PTSo4YcFpX-yrA-1; Thu, 09 Jan 2025 02:43:31 -0500
X-MC-Unique: utKXOFT5PTSo4YcFpX-yrA-1
X-Mimecast-MFC-AGG-ID: utKXOFT5PTSo4YcFpX-yrA
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa69c41994dso46801066b.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 23:43:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736408610; x=1737013410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3MkaKicJuTxKB4Uwx+L5vUrVj7eiLsn1FE86R/YDhg=;
        b=l4MxjTyztFYCMuEWppYLEvK9oGmv+8qPrcjp1aVVBUMivrBGQE4XEU5ohNR9Citpwl
         heX4arVD25s1hJMcN2IDYkhvwOSw8dXZQFmA9jLIzZNStFXJvlr6lCzd1rq4xQwmLokn
         LHij+aZECJXA5X2ObiYJevw/VJ6s9RnMM14GcBgAP60R959xiBEkvCsHpgvWicu9csVk
         FpdAABbvuc0Nx0db2sln5r9LtoAV4YB/JLb32SbuO0mLvMQSNPsfn675Eb1wLdWqI8oo
         Eieo6kKEHMzRxX7w3Ia6TCRvY72v4QUGOjNpyWLD5kftRtzUr5tuYDTNPZ6xto4958E7
         c/1A==
X-Forwarded-Encrypted: i=1; AJvYcCVfg6aY7Jof4XSVfmhVjQZX+8Q6FOHjyGgTX649c1WMfFQAYo3li5UoMGyJKwBAyog/nGD3ajb6fCY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/naLjo3KtBXAeC6w1LutFCJD5nulsYC5758pRzOVv8770Tls2
	Zmcma80ARkh5yy+znSmGTw0l868cuMxegVI1HFxvVCJc4wxRXblxD09Um61CC19egdw7xF0PWj6
	RyXrSK6abYStPcV/xalt/U1rcI6QTKXuHfuEc+1XfwGNCY0AdSFnkoPzGPA==
X-Gm-Gg: ASbGncunqAiRB1dUQdsDfcUNjRHfC005SK2pYOnCos3frHeH73Td2+mTy7+8Bg2yYn3
	X58z1Rvb/AD02WSZAnRpEfkEFRayPucUT0/1Ofk230JZ3GB5WmOyQIf2A41IfBNOEKUiiIFXwMm
	KBfCi2BejMWg5xncc+CVTsmY6K3XJ91Cjh9AtWp8TizCpEco+GhG/OYYgDkSIfTdDyKm9xs32mR
	FmaDZSPeveZZLWePXnnsSN4VxzWE2Fg3+B5LSQo5nAVcG+umuM=
X-Received: by 2002:a05:6402:4415:b0:5d0:abb8:7a3 with SMTP id 4fb4d7f45d1cf-5d972e000c5mr13006274a12.6.1736408609766;
        Wed, 08 Jan 2025 23:43:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYt/wbH0uxT4gdtapB81xUXkFqeKr4f1zw0epCAPN6UFsJyXpBp3gKNbdqX6u30o9JHhMZqQ==
X-Received: by 2002:a05:6402:4415:b0:5d0:abb8:7a3 with SMTP id 4fb4d7f45d1cf-5d972e000c5mr13006223a12.6.1736408609409;
        Wed, 08 Jan 2025 23:43:29 -0800 (PST)
Received: from redhat.com ([2a02:14f:175:d62d:93ef:d7e2:e7da:ed72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9563b06sm42928566b.100.2025.01.08.23.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 23:43:28 -0800 (PST)
Date: Thu, 9 Jan 2025 02:43:24 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-kselftest@vger.kernel.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Andrew Melnychenko <andrew@daynix.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	gur.stavi@huawei.com, devel@daynix.com
Subject: Re: [PATCH v2 2/3] tun: Pad virtio header with zero
Message-ID: <20250109024247-mutt-send-email-mst@kernel.org>
References: <20250109-tun-v2-0-388d7d5a287a@daynix.com>
 <20250109-tun-v2-2-388d7d5a287a@daynix.com>
 <20250109023056-mutt-send-email-mst@kernel.org>
 <571a2d61-5fbe-4e49-b4d1-6bf0c7604a57@daynix.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571a2d61-5fbe-4e49-b4d1-6bf0c7604a57@daynix.com>

On Thu, Jan 09, 2025 at 04:41:50PM +0900, Akihiko Odaki wrote:
> On 2025/01/09 16:31, Michael S. Tsirkin wrote:
> > On Thu, Jan 09, 2025 at 03:58:44PM +0900, Akihiko Odaki wrote:
> > > tun used to simply advance iov_iter when it needs to pad virtio header,
> > > which leaves the garbage in the buffer as is. This is especially
> > > problematic when tun starts to allow enabling the hash reporting
> > > feature; even if the feature is enabled, the packet may lack a hash
> > > value and may contain a hole in the virtio header because the packet
> > > arrived before the feature gets enabled or does not contain the
> > > header fields to be hashed. If the hole is not filled with zero, it is
> > > impossible to tell if the packet lacks a hash value.
> > > 
> > > In theory, a user of tun can fill the buffer with zero before calling
> > > read() to avoid such a problem, but leaving the garbage in the buffer is
> > > awkward anyway so fill the buffer in tun.
> > > 
> > > Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> > 
> > But if the user did it, you have just overwritten his value,
> > did you not?
> 
> Yes. but that means the user expects some part of buffer is not filled after
> read() or recvmsg(). I'm a bit worried that not filling the buffer may break
> assumptions others (especially the filesystem and socket infrastructures in
> the kernel) may have.
> 
> If we are really confident that it will not cause problems, this behavior
> can be opt-in based on a flag or we can just write some documentation
> warning userspace programmers to initialize the buffer.

It's been like this for years, I'd say we wait until we know there's a problem?

> > 
> > > ---
> > >   drivers/net/tun_vnet.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/net/tun_vnet.c b/drivers/net/tun_vnet.c
> > > index fe842df9e9ef..ffb2186facd3 100644
> > > --- a/drivers/net/tun_vnet.c
> > > +++ b/drivers/net/tun_vnet.c
> > > @@ -138,7 +138,8 @@ int tun_vnet_hdr_put(int sz, struct iov_iter *iter,
> > >   	if (copy_to_iter(hdr, sizeof(*hdr), iter) != sizeof(*hdr))
> > >   		return -EFAULT;
> > > -	iov_iter_advance(iter, sz - sizeof(*hdr));
> > > +	if (iov_iter_zero(sz - sizeof(*hdr), iter) != sz - sizeof(*hdr))
> > > +		return -EFAULT;
> > >   	return 0;
> > >   }
> > > 
> > > -- 
> > > 2.47.1
> > 



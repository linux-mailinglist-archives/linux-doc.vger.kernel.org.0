Return-Path: <linux-doc+bounces-27556-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA14499EA37
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 14:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 794882884B6
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 12:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2741AF0B9;
	Tue, 15 Oct 2024 12:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="o45USyq5"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4977E1AF0B0
	for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 12:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728996298; cv=none; b=Eg6HV2TU1hugfOp3rTcFPaFctzoHn/Hv9NEga9yeT28PjbxHXxujypzlxzPKPwyDmhYv1Zzl6hGspWPTzzNTuWyc95yMsTQp+ZSAwuNW0ejPnebBuXkYuHszvpXmHUqdDwz1e2VO2byzkq/C2EYV8PMPjLgRAR2Fiw7mHs9izbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728996298; c=relaxed/simple;
	bh=wVh/PfXghRTayRgATzYAANgZDc6hAGSW3hAg0noljF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tu1q34hiKBzhUDdYwGQivbpqYpaDsX8qV4uvYo6mB0pXyJMcnwrobmHGg1G7t3unKRcFfnvZuVWayODAFDgcnMGjgvCf6lYLn8pjGnVLazAxe10Pr55m2CB7vqwGM6GMwP8F/eBlj6q3b2BTtunvshzJLueKXHWsUW9xtqSWwEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=o45USyq5; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b13fe8f4d0so9629285a.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2024 05:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1728996296; x=1729601096; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k5CheOpmFVuHDTdLA/ct9VgQX0jeKNrF+bQMzA1sDyM=;
        b=o45USyq5sF//zp83TiKNJGSVkCfje368LJJR2zW4sZ47UFkDQqqMGqwjozeLDn7HF8
         kCXqmZ5gYNdqpPJ93rkoi9C4FaCZafQ604q8ZvYBbfnvReKYfkFL35ieMkfzosgDb7ML
         E6cCV+fsZJosknmoIvULFPy/5UklA2S1BlvOQkVeD7s74Yj0Cxe8IIoRs/OSZylSJtEN
         rNgt2nrPF5Xd/FBkD7LTHVfC4wKrkFU2g8z/L6P1kqKELv9SFCMwhalK/Fvj3Q5ia5BU
         5k7TMXdoKlm4u0rM8dgMJ+q43ziypJrxlGa8Ef/tDPDdFEXGgp7FwusHjm2JzavwniSA
         KCOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728996296; x=1729601096;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k5CheOpmFVuHDTdLA/ct9VgQX0jeKNrF+bQMzA1sDyM=;
        b=E5e0FMZtMIngvI/w9aTLusmhMKrio6KCwIMSKF4KrttldlCQ9NZicPCRqv8PSVhUbq
         3spSg/vZDT2tGgnPEi+5Lszl3lEnmbIc6nx65Aq011xozf3QBhaXj+D6LrfjcFk3Rkf9
         u0nUUn0BA5Z+awNGcdHNTmFQKBQw8agMUNUILWDCf8v6Oriq5Q3jKhaAHZ9+X59CCfeF
         awMRmteWkPCRNHkkDMcaODIJTw3TawC7JZDcYJuzEt7NZ8NikqXhEEypNpiS2UpCUhKi
         wxsNi+E/8unhUKu6X8WKGOays38eZDNZr1x4MxUh93Gm7LDlKa+39iaD0yuJN1iC1Ta0
         aLHA==
X-Forwarded-Encrypted: i=1; AJvYcCUASGD/za/9XLeOYh6kLd9+XzmgkeWNzMhG+seDnvi/lXxMpSWZS1VLbaRCUMZIuvIPcGFzh/Aocig=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0SZRJ135covynZEkwpeqC0ribv5Kv/H6LwARotpVi6C1j8INe
	vtYX7d3gUKzLqPNjtP0HzBjwwUC25m/K/QAqU8+1jpYOdf3Ud9pQ1Fi79b95uMA=
X-Google-Smtp-Source: AGHT+IFkU72pW7TaPk0fI+367yJvc7Z2aTPyKHQ+I/sJcmZxH4pRTQOG3TQdSLZKAXFmdiUkR7Zl9A==
X-Received: by 2002:a05:620a:44d6:b0:79f:1873:5463 with SMTP id af79cd13be357-7b11a352dd7mr2383262985a.6.1728996296149;
        Tue, 15 Oct 2024 05:44:56 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1361661fesm67032885a.11.2024.10.15.05.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 05:44:55 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1t0gv1-00D1jL-65;
	Tue, 15 Oct 2024 09:44:55 -0300
Date: Tue, 15 Oct 2024 09:44:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mina Almasry <almasrymina@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Taehee Yoo <ap420073@gmail.com>, davem@davemloft.net,
	pabeni@redhat.com, edumazet@google.com, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, donald.hunter@gmail.com, corbet@lwn.net,
	michael.chan@broadcom.com, kory.maincent@bootlin.com,
	andrew@lunn.ch, maxime.chevallier@bootlin.com, danieller@nvidia.com,
	hengqi@linux.alibaba.com, ecree.xilinx@gmail.com,
	przemyslaw.kitszel@intel.com, hkallweit1@gmail.com,
	ahmed.zaki@intel.com, paul.greenwalt@intel.com,
	rrameshbabu@nvidia.com, idosch@nvidia.com, asml.silence@gmail.com,
	kaiyuanz@google.com, willemb@google.com,
	aleksander.lobakin@intel.com, dw@davidwei.uk,
	sridhar.samudrala@intel.com, bcreeley@amd.com
Subject: Re: [PATCH net-next v3 7/7] bnxt_en: add support for device memory
 tcp
Message-ID: <20241015124455.GH1825128@ziepe.ca>
References: <20241008125023.7fbc1f64@kernel.org>
 <CAMArcTWVrQ7KWPt+c0u7X=jvBd2VZGVLwjWYCjMYhWZTymMRTg@mail.gmail.com>
 <20241009170102.1980ed1d@kernel.org>
 <CAHS8izMwd__+RkW-Nj3r3uG4gmocJa6QEqeHChzNXux1cbSS=w@mail.gmail.com>
 <20241010183440.29751370@kernel.org>
 <CAHS8izPuWkSmp4VCTYm93JB9fEJyUTztcT5u3UMX4b8ADWZGrA@mail.gmail.com>
 <20241011234227.GB1825128@ziepe.ca>
 <CAHS8izNzK4=6AMdACfn9LWqH9GifCL1vVxH1y2DmF9mFZbB72g@mail.gmail.com>
 <20241014171636.3b5b7383@kernel.org>
 <CAHS8izOVzOetQH5Dr6sJzRpO6Bihv=66Z2OttGS7vU7xjC=POw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHS8izOVzOetQH5Dr6sJzRpO6Bihv=66Z2OttGS7vU7xjC=POw@mail.gmail.com>

On Tue, Oct 15, 2024 at 04:10:44AM +0300, Mina Almasry wrote:
> On Tue, Oct 15, 2024 at 3:16 AM Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > On Tue, 15 Oct 2024 01:38:20 +0300 Mina Almasry wrote:
> > > Thanks Jason. In that case I agree with Jakub we should take in his change here:
> > >
> > > https://lore.kernel.org/netdev/20241009170102.1980ed1d@kernel.org/
> > >
> > > With this change the driver would delegate dma_sync_for_device to the
> > > page_pool, and the page_pool will skip it altogether for the dma-buf
> > > memory provider.
> >
> > And we need a wrapper for a sync for CPU which will skip if the page
> > comes from an unreadable pool?
> 
> This is where it gets a bit tricky, no?
> 
> Our production code does a dma_sync_for_cpu but no
> dma_sync_for_device. That has been working reliably for us with GPU

Those functions are all NOP on systems you are testing on.

The question is what is correct to do on systems where it is not a
NOP, and none of this is really right, as I explained..

> But if you or Jason think that enforcing the 'no dma_buf_sync_for_cpu'
> now is critical, no problem. We can also provide this patch, and seek
> to revert it or fix it up properly later in the event it turns out it
> causes issues.

What is important is you organize things going forward to be able to
do this properly, which means the required sync type is dependent on
the actual page being synced and you will eventually somehow learn
which is required from the dmabuf.

Most likely nobody will ever run this code on system where dma_sync is
not a NOP, but we should still use the DMA API properly and things
should make architectural sense.

Jason


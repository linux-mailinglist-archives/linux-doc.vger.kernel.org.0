Return-Path: <linux-doc+bounces-29529-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E61C99B8A44
	for <lists+linux-doc@lfdr.de>; Fri,  1 Nov 2024 05:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76E031F22A51
	for <lists+linux-doc@lfdr.de>; Fri,  1 Nov 2024 04:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA09914A098;
	Fri,  1 Nov 2024 04:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="QoaI2uOx"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4D81494A5
	for <linux-doc@vger.kernel.org>; Fri,  1 Nov 2024 04:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730435950; cv=none; b=qIePXmH3nq8xx+zLwJQSPMO9DPTLomFth+YRIhpX2Ez3LnfSjsEcLq7jicvBjgxZFPyzHTe1XAcxQMKlZZW5t5qGEDoLvUEnUsJToZwsu6rW17UBFbLzJrAtd5gqo4PXO+vikgKvMNrJaPDMNwWP7eJxZSxj9JeFRnD2hD18B2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730435950; c=relaxed/simple;
	bh=ZekkZF+UkdHn0Q91alOKmAiQsy9GAM3MuhejYi4hJYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Au7LtjhaA4kXUCnfE1soUqgRn56Vr9TZhYGMG5pMh1IOR9ejFxPIO0HIiRGsb1U1eJoN60G0KiBI6WTjfVKjDE36Za2+ORwhA+HUJ0oEE/A3dzDkBUbZ7D50OmJY/smtEkl2WpPjighxWvP9kGum2K8wTBaDGYwHIsyKRYdrsPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=QoaI2uOx; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20c714cd9c8so17428685ad.0
        for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 21:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1730435946; x=1731040746; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IjTMm7UeOMlkBJOsYxfUqt1WhI+YrUl78uiV5XzaxbI=;
        b=QoaI2uOxgBIC9UnQxUy+RgUg5F/39CGqMiEu018qxqfBHVNOeoXazCJ+BNQr0XVb8K
         RAmh1MGUOdCjLDRLZ5j38uJo7Zq4IZD9rDyEv3upVFy+wom+oeZvBH1GykQm34qHCd3g
         S30Nn0YynwzgYHue8L4c2Q8IyxONot2DcUn6A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730435946; x=1731040746;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjTMm7UeOMlkBJOsYxfUqt1WhI+YrUl78uiV5XzaxbI=;
        b=wJkD9+GM2aJsekgArMytG+mbIAVLIQ+BgxwaCt2aqLnkuqIgaEZZO2lH767GM9S8NR
         B3LArVjeSgot5LKGK3qY1rUfOOb1f6/1WcOl4iZ/IGBbiXIW6A3clPsTEILvppmmcxwB
         //c8G8YC71hTJdrkjNA52jQLKG+Rcge7pe21lKivGFMTqH2WBocdqZgEqpYgsp3uda5I
         Rm/BA487MJsZDzAcg6fK/n/y7FrRJFWIx4kIAiAqEmtw9OYoobSvg5qQcWWQaeKUV7zM
         aHYh6u3G0utYIt2GBH358TZdUtdnQzJT4bZffSpvcOvqWSj3YBf41rGaKp/6UNB1/Do4
         sTaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4/zIFoB97vELCADdqGx2+hCiB1A582amiy6c/pVKYx9zv88pPcnviJk4+ZELiDgrFxjglj7gPHP0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7IuRAFXKYdo4C3Le93+57YscmYDdVEVqNXTkEZ6bEbUpj4Wof
	RLQngAnUzHjgzdWHlddcTqci7poiVkQ8+hPCQ3Q3CojRmF62GU1PrBoL4IVkcbw=
X-Google-Smtp-Source: AGHT+IHFzA8goxLg/i7aPIPHLWpnxlZs+6kU062+Winb+Bwot9ysYkafB2xRqmetM9tiBbmc4yIqqA==
X-Received: by 2002:a17:903:1c7:b0:206:a87c:2864 with SMTP id d9443c01a7336-2111afd6ca6mr22884905ad.42.1730435946221;
        Thu, 31 Oct 2024 21:39:06 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056edc7csm15778075ad.36.2024.10.31.21.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 21:39:05 -0700 (PDT)
Date: Thu, 31 Oct 2024 21:39:02 -0700
From: Joe Damato <jdamato@fastly.com>
To: "Samudrala, Sridhar" <sridhar.samudrala@intel.com>
Cc: netdev@vger.kernel.org, pabeni@redhat.com, namangulati@google.com,
	edumazet@google.com, amritha.nambiar@intel.com, sdf@fomichev.me,
	peter@typeblog.net, m2shafiei@uwaterloo.ca, bjorn@rivosinc.com,
	hch@infradead.org, willy@infradead.org,
	willemdebruijn.kernel@gmail.com, skhawaja@google.com,
	kuba@kernel.org, Martin Karsten <mkarsten@uwaterloo.ca>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:BPF [MISC] :Keyword:(?:b|_)bpf(?:b|_)" <bpf@vger.kernel.org>
Subject: Re: [PATCH net-next v3 7/7] docs: networking: Describe irq suspension
Message-ID: <ZyRbZpCiANaxNNlv@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	"Samudrala, Sridhar" <sridhar.samudrala@intel.com>,
	netdev@vger.kernel.org, pabeni@redhat.com, namangulati@google.com,
	edumazet@google.com, amritha.nambiar@intel.com, sdf@fomichev.me,
	peter@typeblog.net, m2shafiei@uwaterloo.ca, bjorn@rivosinc.com,
	hch@infradead.org, willy@infradead.org,
	willemdebruijn.kernel@gmail.com, skhawaja@google.com,
	kuba@kernel.org, Martin Karsten <mkarsten@uwaterloo.ca>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:BPF [MISC] :Keyword:(?:b|_)bpf(?:b|_)" <bpf@vger.kernel.org>
References: <20241101004846.32532-1-jdamato@fastly.com>
 <20241101004846.32532-8-jdamato@fastly.com>
 <cd033a99-014c-4b41-bfca-7b893604fe5a@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd033a99-014c-4b41-bfca-7b893604fe5a@intel.com>

On Thu, Oct 31, 2024 at 10:47:05PM -0500, Samudrala, Sridhar wrote:
> 
> 
> On 10/31/2024 7:48 PM, Joe Damato wrote:
> > Describe irq suspension, the epoll ioctls, and the tradeoffs of using
> > different gro_flush_timeout values.
> > 
> > Signed-off-by: Joe Damato <jdamato@fastly.com>
> > Co-developed-by: Martin Karsten <mkarsten@uwaterloo.ca>
> > Signed-off-by: Martin Karsten <mkarsten@uwaterloo.ca>
> > Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > ---
> <snip>
> 
> 
> > +
> > +IRQ suspension
> > +--------------
> > +
> > +IRQ suspension is a mechanism wherein device IRQs are masked while epoll
> > +triggers NAPI packet processing.
> > +
> > +While application calls to epoll_wait successfully retrieve events, the kernel will
> > +defer the IRQ suspension timer. If the kernel does not retrieve any events
> > +while busy polling (for example, because network traffic levels subsided), IRQ
> > +suspension is disabled and the IRQ mitigation strategies described above are
> > +engaged.
> > +
> > +This allows users to balance CPU consumption with network processing
> > +efficiency.
> > +
> > +To use this mechanism:
> > +
> > +  1. The per-NAPI config parameter ``irq_suspend_timeout`` should be set to the
> > +     maximum time (in nanoseconds) the application can have its IRQs
> > +     suspended. This is done using netlink, as described above. This timeout
> > +     serves as a safety mechanism to restart IRQ driver interrupt processing if
> > +     the application has stalled. This value should be chosen so that it covers
> > +     the amount of time the user application needs to process data from its
> > +     call to epoll_wait, noting that applications can control how much data
> > +     they retrieve by setting ``max_events`` when calling epoll_wait.
> > +
> > +  2. The sysfs parameter or per-NAPI config parameters ``gro_flush_timeout``
> > +     and ``napi_defer_hard_irqs`` can be set to low values. They will be used
> > +     to defer IRQs after busy poll has found no data.
> 
> Is it required to set gro_flush_timeout and napi_defer_hard_irqs when
> irq_suspend_timeout is set? Doesn't it override any smaller
> gro_flush_timeout value?

It is not required to use gro_flush_timeout or napi_defer_hard_irqs,
but if they are set they will take over when epoll finds no events.
Their usage is recommended. See the Usage section of the cover
letter for details.

While gro_flush_timeout and napi_defer_hard_irqs are not strictly
required, it is difficult for the polling-based packet delivery loop
to gain control over packet delivery.

Please see a previous email about this from the RFC for more
details:

https://lore.kernel.org/netdev/2bb121dd-3dcd-4142-ab87-02ccf4afd469@uwaterloo.ca/

In the cover letter, you can note the difference in performance when
gro_flush_timeout is set to different values. Note the explanation
of suspendX; each suspend case is testing a different
gro_flush_timeout.

Let us know if you have any other questions; both Martin and I are
happy to help or further explain anything that is not clear.


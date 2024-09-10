Return-Path: <linux-doc+bounces-24874-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB90397295E
	for <lists+linux-doc@lfdr.de>; Tue, 10 Sep 2024 08:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B010285EF3
	for <lists+linux-doc@lfdr.de>; Tue, 10 Sep 2024 06:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ECFA1779B1;
	Tue, 10 Sep 2024 06:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="tz28vgUA"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352DD136643
	for <linux-doc@vger.kernel.org>; Tue, 10 Sep 2024 06:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725948973; cv=none; b=d0jC91xIITb9Tflw4VYolLnLdJChyboO1C1NYFx51sXrkmx7pV0WBdQu06sNQgSBQXZ7aeNP3knJUmjwLrdNoURX4++TPjZ9JwKgq9hl0J6zKVCdel+Ivz6+UTyMMKZm5G8qTTfXRcTS3fP29pu7FXZicHGhVRR0O4eO07b7sms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725948973; c=relaxed/simple;
	bh=fS+d5wsY061jH8ZI60Sc5NNKF+kYjSYtjRqsQAYPBew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPQqUed4GxmjPmCVFExTSQ95b23JbB1BycM0hwmy/qy6mnJluzOElKjn4H9r5rF8S3dLwhK80+5RPwcMiL2DVX/mbk53IrE0DvOj3RGIl+vtjmOeAFmyvri8EWK/2SlKyB4M0ZqwJGYZirRrkAIFgvghf3M7ZJ6HTmf8jdrlVSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=tz28vgUA; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d6ac24a3bso203823766b.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Sep 2024 23:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1725948968; x=1726553768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmAJsURwK+DW3m7B8gIUcePAXx8kg8IYRNC4SJLU320=;
        b=tz28vgUAVE/F1gJXar1CAMOjMC8NoOconw2qquROTB2JL+QeAPNW2qMlAgWoimWz9o
         dhxGOK21LSusWNs9XuPi0krfaG4OVjLHmmiEXq0MUjCvKiplMTcAHe+OSXCDroQaiyok
         kE8LNvh16SELKJaw52PQXzrrWyy7tQUtG/CwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725948968; x=1726553768;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmAJsURwK+DW3m7B8gIUcePAXx8kg8IYRNC4SJLU320=;
        b=rUcc25aN6+diL2ln3lyOPBPGMB1NMGnsJL8YyGZuqOh1MqeUyE9qw7euaft3L7KTIP
         R9KgwOwVZD4QrS+ahdWtGCxtpO0nZo9/uEKm+L1uOwdh2KKgbvTk4+H0LyMPo4NzonEn
         Xz4K2DpsIIOJO+94r/CYRK61uOkuHVDuwMWfaKoZPyooe+QJerCGTkZU+rMdz37bgHjv
         5i8wkuvB5v1nDit3N4PeB5ds4SqRUuzunaSplWDv2fUxsTxofVg0Y1hPka1Ll4M+62x7
         WyT7zhcwErQsoMxGdwcj8xsuRcBMo3bMtimA/8ZR2+9rqlGcxVw5WbJNP81vyjizQPPd
         Mi5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2MnQvz7D2lu1f/CG2Lp93OoaoFZEF4Y5H+KYuXc8VxtDwhYYkYawGLZcrXv+ttJmZI8ZEhzB7ViM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQFOcADqcVcM905FfV6KUmYFClcpYEPCTdj1D/R0xa4szOcJPB
	t63iON6tYbZOQ3QOatdDMY4hwaCcgODplK1T9KHeDReBjSi2UXma7/2sK9R5Grs=
X-Google-Smtp-Source: AGHT+IGCdY6kRLZrhsdxNiLuOef48H30NNJ7sic/8YXeJN8qXza4dE7+l4JboW3AjfrZC7fMmWNQkw==
X-Received: by 2002:a17:907:7216:b0:a8d:4e69:4030 with SMTP id a640c23a62f3a-a8d72e670bbmr212380666b.19.1725948967720;
        Mon, 09 Sep 2024 23:16:07 -0700 (PDT)
Received: from LQ3V64L9R2.homenet.telecomitalia.it (host-79-23-194-51.retail.telecomitalia.it. [79.23.194.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ced201sm430117266b.168.2024.09.09.23.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 23:16:07 -0700 (PDT)
Date: Tue, 10 Sep 2024 08:16:05 +0200
From: Joe Damato <jdamato@fastly.com>
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, mkarsten@uwaterloo.ca, kuba@kernel.org,
	skhawaja@google.com, sdf@fomichev.me, bjorn@rivosinc.com,
	amritha.nambiar@intel.com, sridhar.samudrala@intel.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC net-next v2 1/9] net: napi: Add napi_storage
Message-ID: <Zt_kJT9jCy1rLLCr@LQ3V64L9R2.homenet.telecomitalia.it>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Stanislav Fomichev <stfomichev@gmail.com>, netdev@vger.kernel.org,
	mkarsten@uwaterloo.ca, kuba@kernel.org, skhawaja@google.com,
	sdf@fomichev.me, bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20240908160702.56618-1-jdamato@fastly.com>
 <20240908160702.56618-2-jdamato@fastly.com>
 <Zt4N1RoplScF2Dbw@LQ3V64L9R2.homenet.telecomitalia.it>
 <Zt94tXG_lzGLWo1w@mini-arch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zt94tXG_lzGLWo1w@mini-arch>

On Mon, Sep 09, 2024 at 03:37:41PM -0700, Stanislav Fomichev wrote:
> On 09/08, Joe Damato wrote:
> > On Sun, Sep 08, 2024 at 04:06:35PM +0000, Joe Damato wrote:
> > > Add a persistent NAPI storage area for NAPI configuration to the core.
> > > Drivers opt-in to setting the storage for a NAPI by passing an index
> > > when calling netif_napi_add_storage.
> > > 
> > > napi_storage is allocated in alloc_netdev_mqs, freed in free_netdev
> > > (after the NAPIs are deleted), and set to 0 when napi_enable is called.
> > > 
> > > Signed-off-by: Joe Damato <jdamato@fastly.com>
> > > ---
> > >  .../networking/net_cachelines/net_device.rst  |  1 +
> > >  include/linux/netdevice.h                     | 34 +++++++++++++++++++
> > >  net/core/dev.c                                | 18 +++++++++-
> > >  3 files changed, 52 insertions(+), 1 deletion(-)
> > > 
> > 
> > [...]
> > 
> > > --- a/net/core/dev.c
> > > +++ b/net/core/dev.c
> > > @@ -6719,6 +6719,9 @@ void napi_enable(struct napi_struct *n)
> > >  		if (n->dev->threaded && n->thread)
> > >  			new |= NAPIF_STATE_THREADED;
> > >  	} while (!try_cmpxchg(&n->state, &val, new));
> > > +
> > > +	if (n->napi_storage)
> > > +		memset(n->napi_storage, 0, sizeof(*n->napi_storage));
> > 
> > This part is very obviously wrong ;)
> > 
> > I think when I was reading the other thread about resetting on
> > channel change [1] I got a bit confused.
> > 
> > Maybe what was intended was on napi_enable, do nothing / remove the
> > above code (which I suppose would give the persistence desired?).
> > 
> > But modify net/ethtool/channels.c to reset NAPIs to the global
> > (sysfs) settings? Not sure how to balance both persistence with
> > queue count changes in a way that makes sense for users of the API.
> > 
> > And, I didn't quite follow the bits about:
> >   1. The proposed ring to NAPI mapping
> 
> [..]
> 
> >   2. The two step "takeover" which seemed to imply that we might
> >      pull napi_id into napi_storage? Or maybe I just read that part
> >      wrong?
> 
> Yes, the suggestion here is to drop patch #2 from your series and
> keep napi_id as a user facing 'id' for the persistent storage. But,
> obviously, this requires persistent napi_id(s) that survive device
> resets.
> 
> The function that allocates new napi_id is napi_hash_add
> from netif_napi_add_weight. So we can do either of the following:
> 1. Keep everything as is, but add the napi_rehash somewhere
>    around napi_enable to 'takeover' previously allocated napi_id.
> 2. (preferred) Separate napi_hash_add out of netif_napi_add_weight.
>    And have some new napi_hash_with_id(previous_napi_id) to expose it to the
>    userspace. Then convert mlx5 to this new interface.

Jakub is this what you were thinking too?

If this is the case, then the netlink code needs to be tweaked to
operate on NAPI IDs again (since they are persistent) instead of
ifindex + napi_storage index?

LMK.


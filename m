Return-Path: <linux-doc+bounces-26476-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B4B98FC59
	for <lists+linux-doc@lfdr.de>; Fri,  4 Oct 2024 04:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07F7D1C212BC
	for <lists+linux-doc@lfdr.de>; Fri,  4 Oct 2024 02:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AD502209F;
	Fri,  4 Oct 2024 02:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="ZgPUkvRf"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59DC11C92
	for <linux-doc@vger.kernel.org>; Fri,  4 Oct 2024 02:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728009226; cv=none; b=T/4C1AAFy+7ZK7w2C8dNRColxE3w9hAWSg/0wSvRF+XqEPLtJtSCsp3BkRUtnOxFH12wnPAHcNEpv4IiIZjWtI21RkI9e0PXNJasDPkbTo0L7fjSK7Bwqe/sNBsLlTfrPUCEs0+D34u3ew583NHO2JqNVNKpLRw14XvaDL74w4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728009226; c=relaxed/simple;
	bh=1iJnEbdsiNl3GTWvx5w9tGzoQRxZUIi7Ftyexx/+bg0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7Qqupe2FaGBXXNutxHFK730TkB3jVyFRCyrFYwbyyFv+EzO8hthwUSA6EsHK0OZ5PaBR53Z87jnI+4EXOSDcJx1yT7v4/qdpRA+E1e8FGHDI/xC59KnMNCsTVDnlx3dBGhlUFwLxn8ykMPCLWw346VnahCFT/qKkuVG0Qexyzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=ZgPUkvRf; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20ba8d92af9so12332285ad.3
        for <linux-doc@vger.kernel.org>; Thu, 03 Oct 2024 19:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1728009224; x=1728614024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9H4D+WZl8jML+ibwIYSpYRCghKODZjSTjCYZIURMulA=;
        b=ZgPUkvRf8SZFa7XHwC32up2IYzkcAB8nrf/JjF5oX6Gk2jRzxagvtgl0NSPnUJp/wV
         1s/AFsGAUsja6BBzDZc12fzGSGW1buPEQhOLu3ajpmtzvF4dOr08AjpC2uakXz4zEwEY
         YbxmM4qImziu+ynaSzSePJHjPlC1SfKEZG03c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728009224; x=1728614024;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9H4D+WZl8jML+ibwIYSpYRCghKODZjSTjCYZIURMulA=;
        b=H2XyhU8uSnIz8JaMACm/yhKXHXmsrqoVT6Axz8f3AUSryJ9+Ntd1akiRmnpMmlfmu8
         itjvvvhsXhWvBgZsfKRuySqrfZ1OSqhgRFb3D6Kc6tM+KSV2nXdkagomokaM/MB7U+mR
         rr8LfyoLu3UQRx3lIaTl7cnvzapWI477zvMy64O5sCUSS3vOlkzzIcBkIINjbhV//sqK
         B/qq2Q3NatqvdymtaP8y8U+He1ntRDk0HLsNhkpvv7/2LE48nwAciOBQ7S8w5Up4H1Mz
         BHQJpXDuDDX5GhPMVxB6pQ6Vv4eEELlN7DUvkfCJs/64H7ek6xNoOLdR9ApJuiT4zdwD
         wymQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ4SOr625bxo/5i7mtgIiS6vaopwQJkdRNUPzkj9xSnw4FQKgNCztC3qPSFVqmAlnAo5wAT9FUx4k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx0HRtVjm3I+e8p2wUN3Lm5GWmN3odNuaeBjrEk624WjwppO5/
	ifUObtoA9fcnwJLYyN5bMIPIXvq1b05ZZCADvcKzxcYZwFquRifcys8j2dPOxjw=
X-Google-Smtp-Source: AGHT+IEda9b9DeMXqjPne8SvGPfaIWpvZM2WaGMC+2rBD3ZG/loQ372RspkJp/s9zdDN5H7i2x/5ng==
X-Received: by 2002:a17:902:e849:b0:20b:a10c:9be3 with SMTP id d9443c01a7336-20bfdfe4834mr17933695ad.21.1728009224150;
        Thu, 03 Oct 2024 19:33:44 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beef8eb0csm15268325ad.165.2024.10.03.19.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 19:33:43 -0700 (PDT)
Date: Thu, 3 Oct 2024 19:33:39 -0700
From: Joe Damato <jdamato@fastly.com>
To: Stanislav Fomichev <stfomichev@gmail.com>, netdev@vger.kernel.org,
	mkarsten@uwaterloo.ca, skhawaja@google.com, sdf@fomichev.me,
	bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com, willemdebruijn.kernel@gmail.com,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Daniel Jurgens <danielj@nvidia.com>,
	David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	"moderated list:INTEL ETHERNET DRIVERS" <intel-wired-lan@lists.osuosl.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Johannes Berg <johannes.berg@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Leon Romanovsky <leon@kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MELLANOX MLX4 core VPI driver" <linux-rdma@vger.kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Michael Chan <michael.chan@broadcom.com>,
	Mina Almasry <almasrymina@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [RFC net-next v4 0/9] Add support for per-NAPI config via netlink
Message-ID: <Zv9UA1DkmJQkW_sG@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Stanislav Fomichev <stfomichev@gmail.com>, netdev@vger.kernel.org,
	mkarsten@uwaterloo.ca, skhawaja@google.com, sdf@fomichev.me,
	bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com, willemdebruijn.kernel@gmail.com,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Breno Leitao <leitao@debian.org>,
	Daniel Jurgens <danielj@nvidia.com>,
	David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Donald Hunter <donald.hunter@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	"moderated list:INTEL ETHERNET DRIVERS" <intel-wired-lan@lists.osuosl.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Johannes Berg <johannes.berg@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Leon Romanovsky <leon@kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MELLANOX MLX4 core VPI driver" <linux-rdma@vger.kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Michael Chan <michael.chan@broadcom.com>,
	Mina Almasry <almasrymina@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <20241001235302.57609-1-jdamato@fastly.com>
 <Zv8o4eliTO60odQe@mini-arch>
 <Zv8uaQ4WIprQCBzv@LQ3V64L9R2>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zv8uaQ4WIprQCBzv@LQ3V64L9R2>

On Thu, Oct 03, 2024 at 04:53:13PM -0700, Joe Damato wrote:
> On Thu, Oct 03, 2024 at 04:29:37PM -0700, Stanislav Fomichev wrote:
> > On 10/01, Joe Damato wrote:
> 
> [...]
>  
> > >   2. This revision seems to work (see below for a full walk through). Is
> > >      this the behavior we want? Am I missing some use case or some
> > >      behavioral thing other folks need?
> > 
> > The walk through looks good!
> 
> Thanks for taking a look.
> 
> > >   3. Re a previous point made by Stanislav regarding "taking over a NAPI
> > >      ID" when the channel count changes: mlx5 seems to call napi_disable
> > >      followed by netif_napi_del for the old queues and then calls
> > >      napi_enable for the new ones. In this RFC, the NAPI ID generation
> > >      is deferred to napi_enable. This means we won't end up with two of
> > >      the same NAPI IDs added to the hash at the same time (I am pretty
> > >      sure).
> > 
> > 
> > [..]
> > 
> > >      Can we assume all drivers will napi_disable the old queues before
> > >      napi_enable the new ones? If yes, we might not need to worry about
> > >      a NAPI ID takeover function.
> > 
> > With the explicit driver opt-in via netif_napi_add_config, this
> > shouldn't matter? When somebody gets to converting the drivers that
> > don't follow this common pattern they'll have to solve the takeover
> > part :-)
> 
> That is true; that's a good point.

Actually, sorry, that isn't strictly true. NAPI ID generation is
moved for everything to napi_enable; they just are (or are not)
persisted depending on whether the driver opted in to add_config or
not.

So, the change does affect all drivers. NAPI IDs won't be generated
and added to the hash until napi_enable and they will be removed
from the hash in napi_disable... even if you didn't opt-in to having
storage.

Opt-ing in to storage via netif_napi_add_config just means that your
NAPI IDs (and other settings) will be persistent.

Sorry about my confusion when replying earlier.


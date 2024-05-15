Return-Path: <linux-doc+bounces-16406-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DC28C6DEA
	for <lists+linux-doc@lfdr.de>; Wed, 15 May 2024 23:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81F6AB2258A
	for <lists+linux-doc@lfdr.de>; Wed, 15 May 2024 21:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADF215B553;
	Wed, 15 May 2024 21:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b="kMnOfE9x"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EF015B159
	for <linux-doc@vger.kernel.org>; Wed, 15 May 2024 21:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715809523; cv=none; b=M5sF+B3aYMY+EIzjCOqOi9/lJzpixKp3NsKwiFOuR8fgCzzN6GR9VU4Zxvx2KEI5IXIfmBJxnN/ikyl6/Nt2ddrZWPfMYZWfX5Z8jb6s1yysfX6BGCiUeNoQlexNy2Wii9zl+dKIftTTuMvWXR8OQyljLwVDHP2VIS6FjB2BJ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715809523; c=relaxed/simple;
	bh=rWVXe8EK8zuor5fASSIBJOrz7ixoDWOPIz67x1T8VEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQF8VoNPEz26yR5ulfJYKXZwseTBSFwBAWDjejrEhafF1DbfC4BxLJs8Xr2B41hDbo674r1IVnsS5ZlYSyz3rKEi6Yf4nn+zfelBUoZjfkI/HhyJiaJFSct85WdoFxw7y7U7+Ev62NNM7QTxNRbKZ9rAEMij5RtoFPnK9UM8j7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se; spf=pass smtp.mailfrom=ferroamp.se; dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b=kMnOfE9x; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferroamp.se
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51f2ebbd8a7so63804e87.2
        for <linux-doc@vger.kernel.org>; Wed, 15 May 2024 14:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferroamp-se.20230601.gappssmtp.com; s=20230601; t=1715809520; x=1716414320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XjmRDxQfwrSVo7FgVNJ9NzsqQ8BDBTlwFbjqeW7nvHk=;
        b=kMnOfE9xoPQaoYOQRSstkYToyB6e0gEVuvN5aRaSYcOXe8yiwaP2euFBnZIcx8FUug
         wl0y8q0EkPMTDEf/7uS1ofaRlOhMLfgCs+qqNWMqtRA99W/MklfJStSOQyIb4s3jFz0r
         DBhFoXe2tNBQwgNVd75Z15U7zbI4D68dUddk6s7juyUUstmF9PM7GLaO4SYppihA6SJp
         +9lk7OPv0uovqmMXD5VvcJWPEPnaqC0K9iPgFkFpj/24XVyX/7JN0B3pl/XxPudsfaxO
         S9tvHVvoHspNa8HIYPD7xnhDZ/2QzPiRLs/g5crWZI8wppbLRkLjVY+P9bCEhNhTeVuB
         UbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715809520; x=1716414320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjmRDxQfwrSVo7FgVNJ9NzsqQ8BDBTlwFbjqeW7nvHk=;
        b=L0rIG8RN8B/8KU13S2UFnKNLF0RzisqoXJ5Vj+VXlk1b9ER99IFBWiveFdRF9ypekr
         oA7ictWPPRYLszFaC7CRKuDMu9cXBYjTkvZENYmxvTp7RL2YAQBPG4tB2xAct+Zzr+ED
         TpbAi7AQgLVrCI2ZRbMXB8OrXPxc8HtcaCPy6zC+lP6F9edObUsBybK/GSEz6oT5Lh3W
         0K/WgK0dCKhojH8KC/N41HQQpKUlyJmJ8PIZxqXypf34cZJQvkJY1f85gqMS6B4U1utG
         De52EbooE2Z8yM4/YiibwJDCtHU9pcUzMSfUDCZKOBKRJzmStTP31kJ57C7AAMwtM0QA
         g32Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7ehpiNnIx/OAOZn3d/eCDeZK2gMYa1YN+VcA3VgkmbM/nNFypSPKT5x0tQhJRNXH5Se4Ow3sJBVjdGGuMVtPdEGV4+TVJeKUf
X-Gm-Message-State: AOJu0YxoxRbVx2Lls7CmN7JPK5YdaJV1J85DmREN3QlL+KSvmni1jddk
	hTGedcpqjEoAymaZt5jCr15FVyXN6V0skatuaWVZ0KczEPR+KUioPyy6vokSncM=
X-Google-Smtp-Source: AGHT+IEnYE9TDIr0bsxv8FHQ2ZX4z1MlzqN0fUSdhL1PVlWbtVNLfhI90eUHt9V5HsojMo9Ofq9YGQ==
X-Received: by 2002:a05:6512:3ee:b0:51b:518e:5679 with SMTP id 2adb3069b0e04-5220fb74281mr10650877e87.18.1715809517579;
        Wed, 15 May 2024 14:45:17 -0700 (PDT)
Received: from minibuilder (c188-149-135-220.bredband.tele2.se. [188.149.135.220])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ba41fsm2636895e87.114.2024.05.15.14.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 14:45:16 -0700 (PDT)
Date: Wed, 15 May 2024 23:45:15 +0200
From: =?iso-8859-1?Q?Ram=F3n?= Nordin Rodriguez <ramon.nordin.rodriguez@ferroamp.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Piergiorgio Beruto <Pier.Beruto@onsemi.com>,
	"Parthiban.Veerasooran@microchip.com" <Parthiban.Veerasooran@microchip.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"saeedm@nvidia.com" <saeedm@nvidia.com>,
	"anthony.l.nguyen@intel.com" <anthony.l.nguyen@intel.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Horatiu.Vultur@microchip.com" <Horatiu.Vultur@microchip.com>,
	"ruanjinjie@huawei.com" <ruanjinjie@huawei.com>,
	"Steen.Hegelund@microchip.com" <Steen.Hegelund@microchip.com>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	"UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
	"Thorsten.Kummermehr@microchip.com" <Thorsten.Kummermehr@microchip.com>,
	Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>,
	"Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>,
	"benjamin.bigler@bernformulastudent.ch" <benjamin.bigler@bernformulastudent.ch>
Subject: Re: [PATCH net-next v4 05/12] net: ethernet: oa_tc6: implement error
 interrupts unmasking
Message-ID: <ZkUs6-QC8RypslF0@minibuilder>
References: <ZjKJ93uPjSgoMOM7@builder>
 <b7c7aad7-3e93-4c57-82e9-cb3f9e7adf64@microchip.com>
 <ZjNorUP-sEyMCTG0@builder>
 <ae801fb9-09e0-49a3-a928-8975fe25a893@microchip.com>
 <fd5d0d2a-7562-4fb1-b552-6a11d024da2f@lunn.ch>
 <BY5PR02MB678683EADBC47A29A4F545A59D1C2@BY5PR02MB6786.namprd02.prod.outlook.com>
 <ZkG2Kb_1YsD8T1BF@minibuilder>
 <708d29de-b54a-40a4-8879-67f6e246f851@lunn.ch>
 <ZkIakC6ixYpRMiUV@minibuilder>
 <81170ef6-2b16-4d7f-85b1-4c3fecdc8853@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81170ef6-2b16-4d7f-85b1-4c3fecdc8853@lunn.ch>

> > Good input. I'll add some instrumentation/stats for how many jiffies
> > have elapsed between releases of the worker thread and for the irq
> > handler. I can probably find a gpio to toggle as well if it's really
> > tight timings.
> 
> What might be more interesting is the interrupt status registers. Is
> there a bit always set which the driver is not clearly correctly?
> 

Ah great point, I'll dump the irq status registers when things go awry.

> You can try printing the values. But that might upset the timing so
> you cannot reproduce the issue.
> 
> If the printk() does upset the timing, what i have done before is
> allocate an array of u32 values. Write the interrupt status into it,
> looping around when you get to the end of the array. And then use
> debugfs_create_u32_array() to export the array in /sys/kernel/debugfs.
> Trigger the problem and then look at the values.

Good tip, sounds like the exact strategy I need. Appreciate the hands on
suggestions!

> 
> > > Is this your dual device board? Do you have both devices on the same
> > > SPI bus? Do they share interrupt lines?
> > > 
> > 
> > It's on the dual device board, the macphys are using separate spi buses,
> > one chip shares the bus with another spi device, but the other is the
> > only tenant on the bus.
> > 
> > No device shares an irq line.
> 
> I was just wondering how your setup differs so you can trigger the
> issue, but others have not been able to reproduce it. It might be
> another clue as to what is going on. I don't think you need to do
> anything with respect to this, its just information to keep in mind.
> 

My typical setup is weird for sure, I skip the initramfs and load a
kernel and dtb into ram (which means I don't have DMA, due to missing fw),
but I'm in the habit of occasionally flashing and running a 'normal system'
every once in a while for verifcation.

I can't think of anything on top of my head that would set my system in
a unique position. But since I don't get the failure when I have a UDP
multicast running I'm guessing different networking daemons might affect
things, in this case we're running systemd-networkd and I manually set
an ipv4 address on the interfaces.

R


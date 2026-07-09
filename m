Return-Path: <linux-doc+bounces-96006-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oNaeIAnCT2rBnwIAu9opvQ
	(envelope-from <linux-doc+bounces-96006-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 17:45:13 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0745F733102
	for <lists+linux-doc@lfdr.de>; Thu, 09 Jul 2026 17:45:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YdUrnyrH;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96006-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-96006-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 460DC3170A64
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 15:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D32941DEE4;
	Thu,  9 Jul 2026 15:35:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC45741CB36
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 15:35:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783611342; cv=none; b=too4Eiu67bOtbbZ4vRnwLVmVEZIkFGwWQejLBY6JTFRyr3ODeZ+og5KgF8SxbJFuYh4cHB8oJJOkhIBbnRjCEBqEqY7uD029PM2EIDY1YKQ2tl3/bA+W5gL3ayTRy2WJF9dXJfByfjKCBfVtShGeo1yZjzVHSq7Q6hBEEWiLZHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783611342; c=relaxed/simple;
	bh=1/4PW6x4FDuSiAKRM2GIt3qqfrjfK1WNCmaLbjGSdZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KC9/JAJ50X0zPBDLAGvPojY0i57YOGyGeQLMUgQeDgkFdXIVNE+j8lMkCvaNkAGwoXFf3VB8ZK4miTw/ke1OuyyDXaoom60n1ruSoQT2rsTlBv+f1jezBHtn/2MfBJJIMpPLTdL/id5vmIlkhJc8iAX4URW46OXKOJBJt6HBKGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdUrnyrH; arc=none smtp.client-ip=209.85.216.42
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso33043a91.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 08:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783611340; x=1784216140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K/uvklV1w/Xz/LNQ35vn8qa1x6r5k+6z8Shkoe94KN0=;
        b=YdUrnyrHTE3rrDDaR8ilpXdhNmsZyK4iUduagsZAAa7uZ/Wk54+BdRQBb5pnwxUWxm
         nGwMbEhxSWVr2m3eD4f2RQooINJDcwwTJptyEp2d0dp4+viO8f4UIme/AJwTTTVecD8i
         QK5L3KPlnYX+ECakONA+hNsGFzdxB4OOFFfU3pdrZgfw/TNXa0AQ07AYnBIN2/YAr/vK
         Fcu5FcWvxis/Iv6OrfxqNNrjiupyCkje1qS/8LBaNMypldIgQLC8/sgyopDjFEqgmEUY
         P8HPLAbV0E0HDxummXW28ky4CC1UDeirqzc2ehKm/rBos/rg7UlWLwvooGpbo+iL28/F
         x3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783611340; x=1784216140;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/uvklV1w/Xz/LNQ35vn8qa1x6r5k+6z8Shkoe94KN0=;
        b=h1pjROB1tE8uHmWsIOcufUhJgxtd8k1oQaJqm3L+EVWWLsZW2JbbvINsPTGAMM11cI
         hGtp0y3MDjKijB4wwYHUG/og6WlXQTfb+HvW2bd5cHuxkFEEVsxNj80AWllY4wS5Vm/7
         9H1aJdOTTntJ2mcxgOP9umf021sAIuANN6zEHmJueNdvfAQ6ZNZWdxRaQsnybCt9a9oP
         jsDyc8rv69U98tf3TwvaJaYkRoVU6Tu2dQzk4bTyvGx0j3WhX7e8zRN+oulG4d1W3Aj0
         jwME2iSMGI7tBlh/Cx8bGHF4zG693knPBF13tKaE31mhoJyNBvDwSADNBJpev6E0eSrA
         Nouw==
X-Forwarded-Encrypted: i=1; AHgh+RqB1TqIG0wSgmrScVjaex3WHbfHGmjuaQpCiibPVivyFd8YWRDW8Z0Il2tNne0K8IRtn+Cd83u3NQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4L5nUgmWRWl/ID2I3L1nAoDQ9cjqsO/xcdhyKO22jwLtAGiQj
	5FXI5qg12DYzwk4C95iOYwSQeWSu6QrxdfgTx5j95qyzxV4fEJ7Y4u+5
X-Gm-Gg: AfdE7cntI94AsEfMCZI5iFJ1XwlaN1IWX7HjKyu6Xl3iaiqG+xyyrJKzkyLhHR+1SN8
	FYD8vm1uBimGsUMDhFD24qFi923EFSOYm7hgBH/dCKXHIrG6xIg1z+6tQo9RN6JKSn4RE4gwSrz
	rL+9hNz05xNhqm/5EgT26WntoWY7QI16WRY3sv9aNMVgAGAS8jLiiWVd2G9FAYPeNBips/HSkE4
	RlV6bK4z/kKNgKvp4blri8HxZIjCOdXlLyRgNzYziHrGM43hNvhqbjYMkfu8pEkrxKmHXNi5ien
	8ZcfC5AziEoIHo9Z/QcyFjzbBbqEVsvB+MrHZtIVIC3RpHqtVTHblOTz8hSzeShV1LtPgp5+Fls
	OcrKqWzBqjSHPwybzp05GPcJo0EDlP0TvmmLHH7Ya4V4ERDMBOJG6c4y1SRi+mNvpxj4nWp1T+1
	u3tSYSPv9pZZXMAsbFmZIShdwFrA==
X-Received: by 2002:a17:90b:3fc8:b0:384:a641:3fe with SMTP id 98e67ed59e1d1-38941cc4cffmr7418024a91.21.1783611340144;
        Thu, 09 Jul 2026 08:35:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5888e974sm1466015a91.17.2026.07.09.08.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:35:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Jul 2026 08:35:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Fred Chen <fredchen.openbmc@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>,
	Brian Chiang <chiang.brian@inventec.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	"Paller, Kim Seer" <KimSeer.Paller@analog.com>,
	Colin Huang <u8813345@gmail.com>,
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Message-ID: <c3485773-a782-4115-8bd5-8db31dfa88d9@roeck-us.net>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
 <ak4QO9uhKOt68dl1@nsa>
 <20260708-true-carp-of-champagne-a0dcca@quoll>
 <ak41BRQBNdsQrYww@nsa>
 <b2a5e99c-6d4d-454e-8ecd-8638e4dc0ddb@roeck-us.net>
 <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR03MB63512A19C32B7722D17D0FD4F1FE2@PH0PR03MB6351.namprd03.prod.outlook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96006-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:AlexisCzezar.Torreno@analog.com,m:noname.nuno@gmail.com,m:krzk@kernel.org,m:fredchen.openbmc@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:Jonathan.Cameron@huawei.com,m:wenswang@yeah.net,m:Frank.Li@nxp.com,m:chiang.brian@inventec.com,m:chou.cosmo@gmail.com,m:dixitparmar19@gmail.com,m:eajames@linux.ibm.com,m:apokusinski01@gmail.com,m:thorsten.blum@linux.dev,m:ashish.yadav@infineon.com,m:arif.syed@hpe.com,m:tomtsai764@gmail.com,m:abdurrahman@nexthop.ai,m:KimSeer.Paller@analog.com,m:u8813345@gmail.com,m:Yuxi.Wang@monolithicpower.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-doc@vger.kernel.org,m:nonamenuno@gmail.com,m:fredchenopenbmc@gmail.com,m:conor@kernel.org,m:choucosmo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lwn.net,linuxfoundation.org,huawei.com,yeah.net,nxp.com,inventec.com,linux.ibm.com,linux.dev,infineon.com,hpe.com,nexthop.ai,analog.com,monolithicpower.com,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,roeck-us.net:mid,roeck-us.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0745F733102

On Thu, Jul 09, 2026 at 12:58:58AM +0000, Torreno, Alexis Czezar wrote:
> > >
> > > Yes, in my series bindings are not in trivial as we support the enable
> > > gpios.
> > >
> > 
> > Same question I asked before: What is your use case ?
> > 
> 
> Hi Guenter,
> 
> Unlike my MAX20830 patches, for some reason these chips (not only Nuno's max20826)
> hardwired the bit 2 in ON_OFF_CONFIG to '1'. This makes the use of gpio to enable the
> device a requirement.  (as of the latest info given to us)
> 

Outch, that hurts. Ok. I excpect that to be explained in the driver.

Thanks,
Guenter


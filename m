Return-Path: <linux-doc+bounces-77898-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PRSMJarqGmfwQAAu9opvQ
	(envelope-from <linux-doc+bounces-77898-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 04 Mar 2026 23:00:54 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B9D208427
	for <lists+linux-doc@lfdr.de>; Wed, 04 Mar 2026 23:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2D6E301ECD6
	for <lists+linux-doc@lfdr.de>; Wed,  4 Mar 2026 22:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAE7382F27;
	Wed,  4 Mar 2026 22:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X03I6aZO"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4B836CE0D
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 22:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772661634; cv=none; b=Y1EsaDN9Lomw+OmmhRv6HHaD5v4b1lGOQsWrH8Y0UdLXfjy02j5KGdKy0/QzQu9/YasqjGFThkhTTF1pwpKy5zyavgXGSw0FcoG4jefO+zGpQyIUjylvjGYeJcuJfiW/3YdsB4mjdUOFPoxao/uKHmWowGkClZMY5iKPIIPUMuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772661634; c=relaxed/simple;
	bh=m6XH5T3x1DjJ3lCA8btPdZYedKHfxu/LzJ8v+gmN6Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8VR0upqd84lu8TmRvUzR1ugmwT+eXv12HEuQZAdPcbC5T7rHLStun+MfvkoHUsWfzVCD23XjqC7l4jOSdwDNBYsfriR9PCLjTtiR1Pzk0KZOVpLmCGcHaq7dMfIUk8RyGwpPXR+ezJRBvJvH/54Uc70YRPKyZpj6kjAosNEA8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X03I6aZO; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82980945556so152615b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 14:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772661630; x=1773266430; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KsY5FVD1PWFdUv5+4v4CMZrnguS4M3jz8cAVJu9gOXc=;
        b=X03I6aZOcc9G4viDZSiyb0FrTHE6oz2NaFqCgDZo5guZPr4fHi/rkLH6rVDfy4fD+0
         m537w7Pjjf7AVoXPptTJqCEVR9dlN0xyuXajqt21GTObCFPSh2C3FUzPm6NDZuRHLsZl
         eKVs3lCnZFaqLaem6O2DzTL5aPvaEu0B+xoLh5Mn0arSrUmgwrj47Fawqc17VG3cOpZN
         AS8iONaJYnjCy9tVzhxIUEV5XFLuHZMBBw5QszSH1si5GfAochkksHYNxlffEdMAUrA+
         dZCfpB3vwJf6ZrtLL18KNkHksaTokIgL8YEph5k9YHjADYJMTxIEELD9xieJvg4LEe7O
         REfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772661630; x=1773266430;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsY5FVD1PWFdUv5+4v4CMZrnguS4M3jz8cAVJu9gOXc=;
        b=pPGqJO4JifgMCt39niuFucErKhZTRUKQAp9wEO353Fsqi6Dz//gQWFoR1tXxtsrio7
         GytY7M77qIN1IZoI2BkKZz+tU5VgqyH0W3v5SPmKYEcOzuaxIY4Kwg1UZUfoq2cGkZum
         QNo5J5MbHyjhlNDUqCwWUj/VAxAW1rUBCpVNTBj+CKtoL73Jv88mO955JVl9HwUz37bI
         ZWldZetb937AGRTXlr8+Ix9por82tErX+H09RdYpE+F25y8wRmcRbv++4y49koOiqRQC
         xuzd8O/Hut1sVgHxd46zQLu9FVESKtqaodTcTbGAd9vXTVFcUbvDCaNI2tNfLR77qoJn
         UUeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlphJeNec4NR1VMKMc4MqZtmrJor67yI+BWabwFvWVaTM1WelhYZ3qygU34DdeJbYvbUERV9onPVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrtwD8LO3tADjIX7/ihitm3SzWD51YXT3/rMXKMkOe9nhFrZ7E
	4eD6DflkHN9XZUmRzUEpJuB4FuCNGib/L34+IRBAlBWTOcc8s+KsD3Gw
X-Gm-Gg: ATEYQzzP+COcCMYdHLBXBA6bEoqjmDyGfb/j9Z5ei3Jw2vUGt4iWj7QE74jwyH36BVi
	S5HvpLBNTv9I/bTVMN+MfMVjRFDHydwW7LdHpIPf5RzgjSDhYFJn184LueWAhN/5B4Fp4O/z6MH
	WLmT14ILN8+uuQrn+s95x7HDswgHDp/LORv7Ins6qe2ftonGFqBn2R6X7v3/bgtANKTbO7I1kiw
	sPbhmrvGBGczl4cPLLTFvWs6ZxeSVSGmQ23ykMABI3SWjgZVC7Z8Yo5IKN2VUikQLaKMQwDV/eu
	Xe4Ql823pCoYa+zLg32OpCpCmLZ/5mJEnTmJDOTRtprgPNab8WdlV5eGNGgycQVX+/Iu9k7Kl/M
	eUFYakR3LXHAqdk8qIumDgeFNdTfCFAmzkxKe+ssx2HXvGwJ06g0zeLdo3uaUdfxrnnOaRya6Pm
	jM35HNBm5CLYXZOek7bifZT0bk6TBV4CueDxuE
X-Received: by 2002:a05:6a00:4404:b0:821:8250:8ded with SMTP id d2e1a72fcca58-82972d9ca6bmr2840322b3a.65.1772661630369;
        Wed, 04 Mar 2026 14:00:30 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4dc6dsm19617764b3a.6.2026.03.04.14.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 14:00:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 4 Mar 2026 14:00:29 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 2/2] hwmon: (ltc4282) Add default rsense value
Message-ID: <fe84f756-71e8-4d3f-b52e-cad257fb6f37@roeck-us.net>
References: <20260304-hwmon-ltc4282-minor-improvs-v1-0-344622924d3a@analog.com>
 <20260304-hwmon-ltc4282-minor-improvs-v1-2-344622924d3a@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304-hwmon-ltc4282-minor-improvs-v1-2-344622924d3a@analog.com>
X-Rspamd-Queue-Id: 21B9D208427
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-77898-lists,linux-doc=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,analog.com:email,roeck-us.net:mid]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 10:17:48AM +0000, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> Instead of failing probe when the "adi,rsense-nano-ohms" firmware
> property is not provided, default rsense to 1 * MICRO. This allows
> the device to probe without requiring firmware properties, which
> might be useful for some high level testing.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter


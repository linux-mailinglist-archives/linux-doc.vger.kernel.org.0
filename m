Return-Path: <linux-doc+bounces-86633-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FpGNLS1/2nl9gAAu9opvQ
	(envelope-from <linux-doc+bounces-86633-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 00:31:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DBADD501AB2
	for <lists+linux-doc@lfdr.de>; Sun, 10 May 2026 00:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CA7893002F76
	for <lists+linux-doc@lfdr.de>; Sat,  9 May 2026 22:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB06D3D332A;
	Sat,  9 May 2026 22:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="x4EOIbg0"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F97382F0E
	for <linux-doc@vger.kernel.org>; Sat,  9 May 2026 22:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778365870; cv=none; b=H1a9oP5mxLd51mZOZ9J7eGxhCD8P5sf6Bi+dSktY5JRpSp8MqHKaMDx7sF6rZeiYEWpcl0zrLVbHeccHOymogQB4Vc0JgHUYEJEMQ2FULKuxUEUg67VHxZG8Yc1RqU7LAmr+3DM/6RfVQFVeZvml9rGAikB00ZoW1U1CcQLl0Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778365870; c=relaxed/simple;
	bh=R8MHtyw3iUgVFaiy87HeuWdQOOUu7CPfgsXOVX8YVH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nv7nIv68+/3eEtCPyQ1CVidiURcgq/RGM0S1AA/UuG+ef/wN6X7p1a5prqa6bO7bebaw7U777kZ7WeO7jwmVFq0odCRI9dGSKNTMo94Ouy5LhmzJFrwr6eMXvJ8lLWDTFdpTrFxqldQ+Yrf2dSc9Swaj2DmPMQexfqhnEV/FqAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=x4EOIbg0; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7dcd17e19b6so1845580a34.1
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2026 15:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778365868; x=1778970668; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OOHQiWAMyC4vDuld0j5M/eJDZswBebyHXatCRNu2gCc=;
        b=x4EOIbg0hMWcmd5dZM7MB96+L2rJ+gmreyufR2L+xnijpfI0JZS9i97HqzmtYC9XzP
         dx/kYOPitMFrvKRH4948PeVhD/Ws7dhgYtMfwVZCWFN0KEuBFpE7U5NqvKU0Itdy0nnG
         lnlkykjOu5WBDFXdatiY42qCYr/cHcvcSkJrCbKrvrCeimGp5ymLQmoZ93IUg3bMWAe2
         R+fJDJWF8sWAPkgovsQk4IGBue5y2O8YJwDJsi4zY36q3E24t1sxTTk0elHfGm746ofx
         ljxlKpwAUAPWxzqZGqc8CVadKc3v/YDuXYLFR4/x3LSbrqKpwzZFEivSGjHfJWhY/HPL
         /Arg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778365868; x=1778970668;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOHQiWAMyC4vDuld0j5M/eJDZswBebyHXatCRNu2gCc=;
        b=XarmNOYrxxb7Z2cbN9CxUsKyrgUtuV0tGaU+DMYV8MDMD63QhBkxQFBosc/Faz0igx
         GLUoKVeVMmPc8zzR2d636HuPqocW8oJ5NGi8SRWjVkvO23M+o8GJDtTb6GRPUmNQ2n95
         Wc0csMXCCjeRTNQW1q0hGqfAFQlAX2ujH+/OKaZGOH18GrL7B/LfpTxeDi5c82LttniZ
         Zy2LJZ47623qJ3Zub/tTYa+P4XsWNjwNwdr093XstOF7UteQNh3K4ueP7h4EWHDnegdj
         x0BeLTSX0PAa9UzR/SnA5jp6KJsWcjSA89k8zTSiUg8st2zgINn8SzN//TrZhiEEG3l0
         WgmA==
X-Forwarded-Encrypted: i=1; AFNElJ/RQLJ1JN+i8WrBYG2QUKI1LNaR1pWIl750eqBlRdTuP9sah8WRAsn4NpobpOuTk7CDyrwZYiYxyJw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5aHaQg/Bxp84xVRtXBN40zoN3k5VsRGGvcbtIybDxG85D/EUZ
	AdD+Y8g0sd9kSCnj3B+y6t6aJaXuPdpobXoPgO/b1+OVnyp/voGRmgMr0hdE+af5k+A=
X-Gm-Gg: Acq92OEIp5oYivlkCtXwKtVKRVJaPI1Mx9GhQeOkYlZcVDazLiH+DnHILLsx2RC9F2r
	zV5q+bXqJl/KajpxxMRhT1tke9INHVO8qT3mx6K4QoabkpFVY6nYEqh0tlFn8DlGdcU2Wto1EYs
	e0ApWhbYQZKNWdPgRtWoY+3jfhm6dONdXL+H6iTpbQlmcFjZnDHNrWVIErdTZFFTJHFf0gQ01Su
	YFGtHBwNKFhhUDo+hEA5TKc55+vC+6ChJN7VbIFr/gbfp+JYeuuqZykagk06yMZQss8zFfE8Rsh
	zJBEZ797WLjfFWoh1tniSc7eFMl6sUPqbWXf+60TLwIP1CfxxcSFSrXp+c3HrSespztnLMPSLw6
	6amgNzwnI/7t5DO5TvnMozUTJnyjUGIjjbp8nUsHR+mqMMraEQYG8g0KZxF9mMhzta893WGhSN0
	Jht9TKTcs/Wy0xKsJyzSRf9LZV4ZccCFMWXzqKg6Duvuj4qkL0vsQx/mUA4wKQ3l/D7ytIDqA=
X-Received: by 2002:a05:6820:2206:b0:699:b131:d589 with SMTP id 006d021491bc7-69b36ad3840mr2252792eaf.3.1778365867934;
        Sat, 09 May 2026 15:31:07 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:12a0:9178:ab4:39cc? ([2600:8803:e7e4:500:12a0:9178:ab4:39cc])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69b25dc00acsm3226661eaf.10.2026.05.09.15.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 15:31:06 -0700 (PDT)
Message-ID: <f3bb9f64-a0ef-4862-afdd-74ee39d7bfc1@baylibre.com>
Date: Sat, 9 May 2026 17:31:03 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 00/10] AD9910 Direct Digital Synthesizer
To: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
References: <20260508-ad9910-iio-driver-v4-0-d26bfd20ee3d@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260508-ad9910-iio-driver-v4-0-d26bfd20ee3d@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: DBADD501AB2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86633-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[baylibre-com.20251104.gappssmtp.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dlechner@baylibre.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20251104.gappssmtp.com:dkim,baylibre.com:mid]
X-Rspamd-Action: no action

On 5/8/26 12:00 PM, Rodrigo Alencar via B4 Relay wrote:
> This patch series adds support for the Analog Devices AD9910 DDS.
> This is a RFC so that we can agree/discuss on the design that follows:
> 
> This is a follow-up of the V3 discussion. For V1, we reached into
> this channel composition agreement where physical channels may have
> sub-channels. That adds the flexibility necessary for this design.
> During V2, some feedback indicated that the ABI is too device-specific,
> so DRG/RAM destination and operating modes are configured through
> alternate paths and profile channels are created. In V3, there was
> further discussion on the ABI and on mode priority debug.
> 
What happened with the idea of adding a new attribute to show the
relationship of the sub-channels to the actual physical output
channels?



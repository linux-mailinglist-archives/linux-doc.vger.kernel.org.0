Return-Path: <linux-doc+bounces-94768-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 77ArLruIR2ozaQAAu9opvQ
	(envelope-from <linux-doc+bounces-94768-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 12:02:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7D2700ED8
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 12:02:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="A7V9YHX/";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94768-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-doc+bounces-94768-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 57146301CD12
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 10:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D71C3B8944;
	Fri,  3 Jul 2026 10:01:46 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06633B7B96
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 10:01:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072905; cv=none; b=A02BvHVISVzTYyEogtkcjXPz5QHo58NNB5TQ+By0vqJuSh/xp+d6uzY8iFSXbwnGS4LBj2s7salMzFphxejS+VmzM6qjcT8LWGX6l4Z6EsShRnEF/zQSG64QmwaFZXK5zxl6J/W3fGrCon2TklTPBHRO7ySizcmZVyniYVDzHfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072905; c=relaxed/simple;
	bh=RYeeLX2JG8dp87oYPPrNDLM4wRbMmmAVowH6Gs/X6vw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dd+WZULQ0etCyG8i3Dii3fzM4IdsCNQvwQtylEHUWnmTEtz/57Y6RB2C28AktTP62pM8AJz7bS3P+5IXkJcUq9nOFICOk/JxYsyaerWAfwVXxlstsauHeO2IwaZc3wotepG161eW5i1v76YiwtnOS6+ddeYhWNUKs+Cvd4gO950=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7V9YHX/; arc=none smtp.client-ip=209.85.208.46
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-698e5859a3cso766419a12.0
        for <linux-doc@vger.kernel.org>; Fri, 03 Jul 2026 03:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783072899; x=1783677699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iphKavMyEGyoKkZ7flBVPKctJFRcurdGeTwbxLH/hOs=;
        b=A7V9YHX/6P5OlAht23tj0RMGPFoSinD9l1uXNrDG4TPTQp7WTHxT8tXxV+iZlehnoa
         lPLc48BQEtflxSDW3TSmiC2M3IoGKKqoI8Wr1qollpaU81PrGqSz+Qr7AMC06BMOK+BL
         R1rYxp0yzuGoHOnWQjQrMqJ+0MBwn/aMKS8iGmuVDhdxtDTVLz5JrH+QXfJmvwnudQAo
         yLcriQBv8FQy7WbBR8+K7UH/35OSk3PAqDSdcBZ8qKgg1wumB/gX20RXu6xb9thFeZzM
         d0RIaLgusB8tjNciytWwZmzyX8va4aT4orP2S7LqxVeTpWHBURkm4S5y6WrCopp1c308
         GhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783072899; x=1783677699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iphKavMyEGyoKkZ7flBVPKctJFRcurdGeTwbxLH/hOs=;
        b=ltydKiIeYYrmyqA2go62dLhuEIasHAbs73n2nU+7GT6ABzdH3t3xXYJV5UZGrOAdtH
         MjM0GZ2PVZYdfBEWoaGWXQIiV8jj1yLgNx1hS1o8Fg6PaVlMNa1YZEnL4mdgHLqaLFIK
         8tPzhkCGmTLF9PLuK/aJXZKmCkOGJIutkZ372TmbNBAvHS36ACpiSHZkyQKEQTAi1lIl
         YLug1T7i7XreW1WLJzYdoR8h95PNpKSEm/q6gY5crMPMtQkEAOaBSK8LoijlJzT7qH/a
         z6+aTq0nsY3wjO7eTOgVzj8srWtPS2snkdiSkKjagAAtnXHPGhYUTWLHY6HgsyTO1bPF
         Oo0A==
X-Forwarded-Encrypted: i=1; AHgh+Ro7YtZzbyuOoQW3U0rVZQ/A2nP5MLveFsHAHBD2xsBws3ScH1L87uObcYB8uMEU74QUuyzUowd0T1E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2k0N0a1oRrM57HUtkSaVB6Y2LrCkG0UPIvXajhmpta9WFztbQ
	MYHudkkfWlA/yFQT1NCvf2SjYq2nkZ4NZRHG8vHIpfDJepBFiINcvkol
X-Gm-Gg: AfdE7cme23eduTa1O/MvrguQseZ8DMkP2O+eGAHUnZ0a7XxNd23zoFzKdQkjCNs9LKw
	A8I3ts5QToRIDFYdbxIHc8iimNTQ40chX0e1kaFpv/9nkcnq9PxOWuvBqCjeAo40yRvrNq6w7Zs
	YBIDz2mpwnrOzYGIFWvpzfRM6lbPnhkW0Zqn3XFewBH/e4Z+ydnwBwcSlqPsaaqvwFe4KmQHCeg
	MEN60KPqzdupYBFnIDJXoO09Qz/5rq5/Hh6/70mqQYXrw5qBUlD/GZCQLA4UUhiO3jBpAh1AVUq
	zhnw4Nn11DsKiON2NHIGmBhHdpoRR07pMK1FPnFr2Itn7ma6cIEwHVlkZAkjOlZcPPIZROnXSCC
	N7+tC3VxhAYCpQBg9eZrFqbLrfBNuY5fsyaWCe0aJ2erd1y0EMYVI9ds7egKFMKOgnQZbkq0FT/
	MOLvcb5KOJykkpSpLnERvUBzAD0Cy+AsLTlZN7XFrhlcJXvo73wG/fbw==
X-Received: by 2002:aa7:c68e:0:b0:698:ff3:85ea with SMTP id 4fb4d7f45d1cf-698c104c5f8mr1030271a12.5.1783072898947;
        Fri, 03 Jul 2026 03:01:38 -0700 (PDT)
Received: from ?IPV6:2a00:1e:db84:b301:ed61:1b51:c39f:49c? ([2a00:1e:db84:b301:ed61:1b51:c39f:49c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ad118f43sm2162762a12.25.2026.07.03.03.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:01:37 -0700 (PDT)
Message-ID: <3e094744-8603-443e-8027-8fc2f2817879@gmail.com>
Date: Fri, 3 Jul 2026 12:01:35 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] dt-bindings: iio: dac: Add AD5529R
To: Jonathan Cameron <jic23@kernel.org>,
 Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-spi@vger.kernel.org
References: <20260701-ad5529r-driver-v5-0-ed087900e642@analog.com>
 <20260701-ad5529r-driver-v5-2-ed087900e642@analog.com>
 <20260701194103.45541cbe@jic23-huawei>
Content-Language: en-US
From: Janani Sunil <jan.sun97@gmail.com>
In-Reply-To: <20260701194103.45541cbe@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-94768-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jansun97@gmail.com,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:janani.sunil@analog.com,m:lars@metafoo.de,m:Michael.Hennerich@analog.com,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:broonie@kernel.org,m:linux-iio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-spi@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jansun97@gmail.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F7D2700ED8


On 7/1/26 20:41, Jonathan Cameron wrote:
> On Wed, 1 Jul 2026 08:40:40 +0200
> Janani Sunil <janani.sunil@analog.com> wrote:
>
>
>> +      adi,output-range-microvolt:
>> +        description: |
>> +          Output voltage range for this channel as [min, max] in microvolts.
>> +          If not specified, defaults to 0V to 5V range.
> No way to specify the default as part of the binding rather than a comment?
> I haven't checked but does
>         default: [0 5000000]
> not work?

Tried that approach. But the dt binding check does not accept default for this DT cell-array property.



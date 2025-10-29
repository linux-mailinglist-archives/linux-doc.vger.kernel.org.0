Return-Path: <linux-doc+bounces-65031-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7574C1D352
	for <lists+linux-doc@lfdr.de>; Wed, 29 Oct 2025 21:32:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7CED18867B0
	for <lists+linux-doc@lfdr.de>; Wed, 29 Oct 2025 20:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A502E88A7;
	Wed, 29 Oct 2025 20:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/AdxRXv"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD04825784A
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 20:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761769924; cv=none; b=Wn4w9PoDsZ1Bj7DXhH2z2YG0F52K2uQq8QeyX1L1PZUeUzAOUAsxO9f3j33hznbAjzzOasNgezY1zmiF59L4QK6Ek3NcINpun7wiYJ4ydG4jHE+OUg0tt/q1qBqNy2AdkCqOQcpV05phoVu7DiWEr73PE5Op92/lZDOR+tG5N+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761769924; c=relaxed/simple;
	bh=YaHtD09W7I9VYtLMrk7MCUuLeIYkfwLpiWs2SkdvK4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r7fGq1p7FPljtclh/oCY8zTo3Cgq3DuIq5zFN4Ops+l27hf0yyVpX1gk76GpgbQhSUE8OfBp9izBZ1C+4dlYopgNf0jyR2RqfGOPXGuD0m7wT9nLA5/NGXVngAl7Un68geTQiDnvgnGOUNngFGy0/OwI/Fl/mq4ZZ8Fok9sUlvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/AdxRXv; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7a28226dd13so319435b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 13:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761769922; x=1762374722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wOfwJ8bWKZa4YFr/NutNmAuLp8W/TU0LOxvVKX01rbE=;
        b=B/AdxRXv4tvXaGrZCx2HDA7LoS/HfSQtXSp5WH7mpZk+Qp3ad5gvG05Etwat/kMHdX
         /JmVBoRU1awUG8YotIQAKXj3bgM5C0jsr+00uQrVuH79cvPxFyj8NG7BzqjPgp1x085n
         8zCu/zAD4MZxA2T8Qxy5c09uYLtCvkZhY2P10ppl077sd3M5jXUiOxxjC8+DHPHyqX4i
         Zll3fXqT45GuUT82JFbZbBCBjVYp6vaLFc+HBrB/9nQB3yxpmOXXBimyNKN89Syfp3ht
         zg3qcURgmHlbUPagoxGPLxCW4+c7OqUDeXW2WK4Lz6pjiH0hM1MfI54ivee/Xuwa136r
         oXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761769922; x=1762374722;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOfwJ8bWKZa4YFr/NutNmAuLp8W/TU0LOxvVKX01rbE=;
        b=bI2Wz+xhJqJyaFnoh4352Ch6GCqGZfllluPAvtO29TITHwKYAi/f+hJFrzcjYDTK2o
         zEkjFUn4PYEE4XRMNR2QpqJDdP8JZvRYNSxkiYQb5Xa42LVLTsMEIrtesJuO1Z5rclE1
         p+GaVSmCC0tbzVVbZASVLJT1hq3aMJ7iUqKVjTbyBVrtS9JiBAcG3PDkr6y5GBPnp7hw
         iBBHNysjB+lkyREif+EZ08q2ZR2ChO4kgxyqpKMb4X6VQiklMG+r2lLsg43gTmzg2X5W
         vAxkrZA1YonkNM578dgJvtlyxzglcy9rHL7XpT+887CxO6Mpz/2/1rnbXNdtFeISf03u
         KkSA==
X-Forwarded-Encrypted: i=1; AJvYcCVo/vOvt1nJcmPaVZHD/kSWhR/+W0LdP5WHtiQ3uYKC36crBtcht1MmJbHo+yL7oQDQF0m2kr3GsfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHMZLsPZ6hmZxA2kXPoKE11lrnVUM4VCaoFQfvE4mvrLZKWy6T
	or76E1EVAuRooiE25KfUL/g7Rqgc7PoIbp4g/spL0wZXTmh+8mfIDpzr
X-Gm-Gg: ASbGnctcdob7PWKO/ulMaoAXs+oQlFz+RHXtgphYDkqtMHNQz348+6Aw0ZgekyohS/8
	kUabTi6FQ/422fvvhWHMNCkn8by8st9pa2E7zF30V5FHp2fInwn0z4nbWOkdQ7uIz22/wGW3Be9
	l7eJpjTNL6rH1Q3ebjr4DwL97tJkT2oR47Q8uAw+7OMfhWvSElw7jt28IcRbNK4RNR+Yk1saPyM
	+0bzSOxyS/PrpePS8C+py7W4phHZ+mKrZ0Cry2qsYxIZVIc+oyzjH4mJMKVR19XaojmJK3YNjgw
	UDFOPb7O/pZRne03QAbpTEdCHIBHe8qB/KttlF7biLQNTlm2A6ZpUbVpRumm3sYNPI2PTv9EF8y
	xKitlM0+vJbbHbkmjH22+IdyOfjzaOQTQ/T2BylLI5jfJcpIV8J+/HXtZtUshaesqImaOrm+Tko
	bPGV2NtTVi9TAVolWWZ5lryr653yd/ZvfKvSfqe3wU3SIcAVj7
X-Google-Smtp-Source: AGHT+IFpShubPNxGrw+11hp3PVUyV7xz2+3u2+DGXZIeSF8hccmhTEB6eMksfzjbjPtC3NenMVVflg==
X-Received: by 2002:a05:6a21:3288:b0:341:e79b:9495 with SMTP id adf61e73a8af0-3478768fb4cmr1044825637.54.1761769922069;
        Wed, 29 Oct 2025 13:32:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414069164sm16398977b3a.45.2025.10.29.13.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 13:32:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <049ec6bc-d869-4f93-891a-13a0640f882e@roeck-us.net>
Date: Wed, 29 Oct 2025 13:32:00 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: temperature: add support for EMC1812
To: Marius Cristea <marius.cristea@microchip.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251029-hw_mon-emc1812-v1-0-be4fd8af016a@microchip.com>
 <20251029-hw_mon-emc1812-v1-2-be4fd8af016a@microchip.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251029-hw_mon-emc1812-v1-2-be4fd8af016a@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/25 08:50, Marius Cristea wrote:
> This is the hwmon driver for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
> ---
...
> +			convrate = find_closest_descending(interval, emc1812_conv_time,
> +							   ARRAY_SIZE(emc1812_conv_time));

This needs to include linux/util_macros.h.

Guenter



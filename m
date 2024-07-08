Return-Path: <linux-doc+bounces-20246-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACC392AB4F
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jul 2024 23:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C0291C21C7B
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jul 2024 21:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF89213D2BB;
	Mon,  8 Jul 2024 21:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="V5+rGPEu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B2314F11C
	for <linux-doc@vger.kernel.org>; Mon,  8 Jul 2024 21:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720474501; cv=none; b=cciRuA0R9ZR2RaenBvnd3/xLOBanihYLXMlZYRJzUAdXqltCaaM8ZZJhKL1kINWNVtzVJMbza2cq0lNiPIaNCZbT35at2owonCM7Cg6aHDsLlaMS3nPhPQeTevyWH3gmNuoNaQN4zTSVGUQzreNv4qKs7D4D2eaf4boKas/woQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720474501; c=relaxed/simple;
	bh=yRUrQR+1Nsr2JD+dZGf0p3cOOWzfNqKn9ARobDst6Aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dDMwpiu5+Xoy/cHhC/KDw8HCUpF8o4lxuPItXD731hBjvlRaD3FgXq1Dx0kYOW0FVNMleCE4m35AiaB/+pEBNZ9M828lxmcbF5oO9Qjgyy+NckX2N37E6RHZnZ3xc+pZYoIQBviaUmCyKKa+l2xOP9T45moJX36fxg3daQcC6Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=V5+rGPEu; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3d928fa9586so1275328b6e.3
        for <linux-doc@vger.kernel.org>; Mon, 08 Jul 2024 14:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720474499; x=1721079299; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XFFLMgw7xCOi9E6/vh56UdwztLmZaGp5hEau4vAGlB8=;
        b=V5+rGPEuVXoj5uP4iJHzv6RJqZYYuqsZRFZ0OiELujeROrkPq3LhT7hcEaai3+nUiD
         Th++FivDE0B23nt0qX9puPcgdzbXRUO3I6N2MJHABxdQemW92oS+w9Fxryr1RvbB0gbl
         NP6yUzFWVQHp+oKZORdjCVnQwVuGFcjpcsWtU44yL9kkiVIQNeFO0BTXiUFirkmXsPUV
         Okfc1QumPa5dtzM+3tq9/ntAfwMJ1iBpeniztfbyjhtqRzY/7P+yB9LWOAnS3gaGWxnT
         M6NH7/GDtQysJvc6pKG+T35ooyIoVUeKjEW5ltwhHr8W4UiTkLdfG3QTCZOxBoc5izFt
         9ogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720474499; x=1721079299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XFFLMgw7xCOi9E6/vh56UdwztLmZaGp5hEau4vAGlB8=;
        b=ArFxQdGFpoUyNyRoDYADPZ2Fy2FPMxHSxeaCgmFxEWx23Nnqw1I/VA1/+X7fO+YZb8
         VQvtWCG4m79B4XL0I65iBqkSfGyiJbDqN6xKfbaYWHJIQiaQyR4LyN3mmIoGHHdU8Fh6
         S4YpfSIKJXQXyVhBDxYh06CKmdOd/znxnbBw/JujyF03EQ/qOk/MzgqNx55jTvj7+3TW
         1+pdW5Z4+Iwnsj3bqKzyfy8ZkOdxObmSD8X9O/CHK37Rd4VYLjlSbcsTGjG9/y/u7ns4
         l+TVJTzhsDvRz9+aH6VT5RUGL76kFQzwPlHMpJjkJaMcK4QKYAjLNl4YJcW6SGe76sv6
         /iDg==
X-Forwarded-Encrypted: i=1; AJvYcCWnjbBBgu692jUxtmSvkU2irMlp+BGhv4f8xArxgQqAV0+fhOYOukZ+JjQYs4TaNPyX89OEUWvEwr/SO5nF1CRHU+EH+r+HozV0
X-Gm-Message-State: AOJu0YyaCcXgeCOcur7DS2MfiIfXXEjGAODCXvUCBBN41aaLfAT5qBnd
	06jlpr2dbzQcJ0gwYd0vBLNPF5VHe069Jt7b5rOl/hGVycbs0nYeawMpWLmOrWc=
X-Google-Smtp-Source: AGHT+IFCl+0M17UntfWNmX5nucThGyLJRxrRcQewTde4Qrm/V+wj1rQqk7r8TsHthUX35KmQHzS7+A==
X-Received: by 2002:a05:6808:218a:b0:3d9:38c4:e9b0 with SMTP id 5614622812f47-3d93c0dc225mr788466b6e.58.1720474498606;
        Mon, 08 Jul 2024 14:34:58 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d93ada763fsm142564b6e.54.2024.07.08.14.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 14:34:58 -0700 (PDT)
Message-ID: <a75b87a9-76c0-4bf9-b8a5-283d290e2fab@baylibre.com>
Date: Mon, 8 Jul 2024 16:34:57 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/7] iio: adc: Add support for AD4000
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, broonie@kernel.org,
 lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nuno.sa@analog.com, corbet@lwn.net, marcelo.schmitt1@gmail.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1719686465.git.marcelo.schmitt@analog.com>
 <628a85cb8cbee32ea7d2930c63e73f2ef449a800.1719686465.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <628a85cb8cbee32ea7d2930c63e73f2ef449a800.1719686465.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/29/24 2:06 PM, Marcelo Schmitt wrote:
> Add support for AD4000 series of low noise, low power, high speed,
> successive approximation register (SAR) ADCs.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---



Reviewed-by: David Lechner <dlechner@baylibre.com>




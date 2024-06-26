Return-Path: <linux-doc+bounces-19567-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14651918586
	for <lists+linux-doc@lfdr.de>; Wed, 26 Jun 2024 17:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4E02B2C3ED
	for <lists+linux-doc@lfdr.de>; Wed, 26 Jun 2024 15:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D381891A3;
	Wed, 26 Jun 2024 15:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Bzp/c9Or"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89F9181D12
	for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 15:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719414110; cv=none; b=aWvz/2t5/RYCY0QDHlQyBaEU3Bi4Ynq6uJwBIRFUky01KRL7bIAzX+aBMaQPETxSsMZWBuCe4J56F3hWs3NakKrsNLcrjczJ3aGQfLDOUdjAcag2BQ0+nZVTLaHSSC1c680SQZOAqYZEIexia5SchiyxvovO18y6rnVaOVnHrvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719414110; c=relaxed/simple;
	bh=PK/s4HBULviBheKUttSYV2eJRz8+Cb+6AYgus4Dxk6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yejq89m2u0aPC4sPsSqgg4dXD6nPwGVFe8wtSzuixdDuXbaa1u8SDADjmLCjocDdAdBfAA5yosX86PrMFDf3oc2TC8DvvDDUVKgyso2eOw/0WwF67/0EMNClqevsdJtMKsODxjBhSHnB0I6z5j+UsveR4EZjU2uaZ2ZJnrL8D6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Bzp/c9Or; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3d5288e6513so3567934b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 08:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719414107; x=1720018907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ttyQ/o7Vgxk0yGUj/ek3iXp7cLp/I4AxUIUIqxODvtI=;
        b=Bzp/c9OraxG8HfyqAV8ZhhMo6aSbPanIdzSrE5QOcq/aV5w/+ylooedc94cxJPrjfY
         qs2wIVstd/iC84kTJZUT5yTJmCFBBqmbwJwuQZpzbpD4gAsAfq/VlvVT5UXY5MFF3GdM
         7Wv9FqWSzq8t239Qd3PTmL0PqAHdK7ZoJp+4SsA9x2OJIkmV4f5vPMdaYvwpqnbXaqaz
         2gatSFtSyh8baz4Eb2nxf3fR+pOmmEv5RaFE3SiDEI6oksdT6K10uA3saxkQQP3xNHKD
         OIGttXjVIGFuaUf8qhyhJudtPGV6Tftk9rHgQbn6UCR3/N5UjUVQoXoGmEQ47cU2bcyQ
         YfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719414107; x=1720018907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttyQ/o7Vgxk0yGUj/ek3iXp7cLp/I4AxUIUIqxODvtI=;
        b=oLE0L0AfYOm2kBcJlpf0bmR3TD7ytxbZlD+T/sI+k6r8lPcJS+AUbbAqPNFu0gX2KR
         NUg0t88Qh2eo1i+bgQ8n/K8tyIImsVBc5Z7zTAJQyj4VMxnK1PSaAl2cTH3dPg4v2K99
         /YS9OS8BoKPuOiw9AtD637yoAKff8IyZJpz5Wz5Agn13MV2Q8csSXtyLKrofmshFJseh
         PnzUR1TIi2k6KCFuptHYih+lHk+QSKfGwp7CxcZDKFEG1R+qV9XlgNXAvKxWw0ZQnSG/
         1bd4/94kGmDBlF6LHWoBw/jsLaYZZBDYMDh19rrNaoR4HQgloqpu3t5noXO2S+yAKv+q
         EXwg==
X-Forwarded-Encrypted: i=1; AJvYcCWDCCtB0BAvs4nV+OPIHU43X31NViQqTJ29IjrRTT4VbBOTzql8LZOgMqVlOqADZC9b2+Awj+ZNCXDtnswiKMMN+Zr2YLbuOyY7
X-Gm-Message-State: AOJu0YzS+6uBxZmUnm83z57SsejVeVAXUhgS8Xil3C2P4Su60vYLnzvp
	gjAKjnxr0KYKNoahvdeCOYgXixF9+LaWBhXtv54W4vY+98k7tU1XLC1oWk0MZN4=
X-Google-Smtp-Source: AGHT+IGpub5V1HnsVQQgPXpSo9KWHdiL1Hawoz3c1OyBqSL6oM9wSfME+uNBi7tvbERbi6DLKhPbXA==
X-Received: by 2002:a05:6808:1708:b0:3d2:2d1d:3796 with SMTP id 5614622812f47-3d545964be8mr11659338b6e.18.1719414106811;
        Wed, 26 Jun 2024 08:01:46 -0700 (PDT)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d561e56766sm229248b6e.30.2024.06.26.08.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 08:01:46 -0700 (PDT)
Message-ID: <f63da6b3-cfc3-4452-a638-126c53955c9c@baylibre.com>
Date: Wed, 26 Jun 2024 10:01:45 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] spi: bitbang: Implement support for MOSI idle
 state configuration
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, broonie@kernel.org,
 lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nuno.sa@analog.com, corbet@lwn.net, marcelo.schmitt1@gmail.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1719351923.git.marcelo.schmitt@analog.com>
 <7e2231edf30e1769f12273032c04b8a951e28837.1719351923.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <7e2231edf30e1769f12273032c04b8a951e28837.1719351923.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/25/24 4:53 PM, Marcelo Schmitt wrote:
> Some SPI peripherals may require strict MOSI line state when the controller
> is not clocking out data.
> Implement support for MOSI idle state configuration (low or high) by
> setting the data output line level on controller setup and after transfers.
> Bitbang operations now call controller specific set_mosi_idle() call back
> to set MOSI to its idle state.
> The MOSI line is kept at its idle state if no tx buffer is provided.
> 
> Acked-by: Nuno Sa <nuno.sa@analog.com>
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>



Return-Path: <linux-doc+bounces-27752-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 179059A0B62
	for <lists+linux-doc@lfdr.de>; Wed, 16 Oct 2024 15:24:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B769D1F26BBE
	for <lists+linux-doc@lfdr.de>; Wed, 16 Oct 2024 13:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126DC20B201;
	Wed, 16 Oct 2024 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sg76Cfyi"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED2A207A35
	for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 13:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729085031; cv=none; b=PytehVZfNFdIFEvNATZviwKiMC1SWGjr7PVfCW+2W3bwTlECAd9NG7RcP7R0i0GQmOFr0J7lGKj44+mfv034uwZolDqrxgDhUmLi0L/YZDQ026B7S3YMb6vTlz/hv9vpKDOnv6wSFHLFvL4fJLeY8cEwt8teEq3jFSuL8vLWEKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729085031; c=relaxed/simple;
	bh=dbDkIDa3GX4Zg3hAEieWmi+3rL+bB6774AhqEXmpu0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U13RTAKZ0Hvm0tj5+cqtOIpZ1TkHxrjA+qv8mH/2qXVPBx84FSsDNKmWYZwFeYNarC8OcQ8i9rKCvlmLdCZ6EWXRv+MZIscC34N0u8Aoz0ipsfYBa8D8Y+Vz6UnVQ/BZTrgomFIlxVFr0zsReqF8rdXqyk8X5FFP5im6v8+2nRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sg76Cfyi; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-46090640f0cso6278511cf.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 06:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729085027; x=1729689827; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dbDkIDa3GX4Zg3hAEieWmi+3rL+bB6774AhqEXmpu0o=;
        b=sg76CfyiwdlKvO9rKLtwgAOjtlTBwRBk1P5J5s0KAsACjD13PUooCdFHdJVW0hXglu
         LpnaSzpj2pF9NkfaLWvnbrCZr48YIBCkUxu8Cj1o6OyvJWHPA6PW+aX54pFPrdT0fEWh
         4P1/dBy/4YAw7lNwO/jxV+GcqkiAKg9bq9WaDgLqrB5JmzB8CS/l+u+1tSPOBW5f7P/D
         80SRrEsDtNf+PNv1POoNfFP/pTrjc7SY4GGSPxU7KmP9Y2rhrvZc1syk3d/ADoFaRn1n
         rQ2KGz9d83Vc/0P/iPYNISPoGznawLKVxoRbDsEd89rAXxvowEh4nDp0LReeNtDRQIXP
         Dixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729085027; x=1729689827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dbDkIDa3GX4Zg3hAEieWmi+3rL+bB6774AhqEXmpu0o=;
        b=opOk0w2r06o6ehFKouuIVAvWOgFC3LfpZH3ufXegCyZreMotHiSWKXhHGJTucCcxFI
         /p6X9xAc7GEn3tAiRJ4WlzHzLv34tqreoPEf/hRiGViiplF2C4V410NNkuLeaX8yQioM
         Un+27D4qOYm+UNEg8ybN+TAIX1WkhtM9EDfPtxh/lKKmgHfp3mcjuUJWnCwQ0nlmU96n
         pjjC9yFpLvFhmNN8Qp+nfE4bEhiO7+p0z+Y4CuKgg7oto5ciIQ9sabab4nEjeWfdtK7V
         x6YUwnfuLx7IWIMFwQ97vB2j36PkDKfPIA2UNSdb5g2V8NzzKj3AzEYhyjE8yxitQri0
         ig2g==
X-Forwarded-Encrypted: i=1; AJvYcCX2ylCHZiTC8xg1d/sq6KlefuA5J6vwh3qbkbk3sBt2RuvOxU29O/luG8yuI1umJEvl/0Hgxjr2gwU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9J/DC5I1ZbWlDvdUV715za66G9gZnXaCRCsuoIvVGkvIsHawo
	OUNciA/OkR7/KG40qnu9u8XyIKUuD4UzJqBnvXVhOBKdKAnEbK01BXef5ydpHyA=
X-Google-Smtp-Source: AGHT+IEZJCs7JeC3qYycuknITXAGTgPkMxv/8NcrZC6M9sKoTxw2qcOZrgR0vjx/et/Nl5XilfsUGw==
X-Received: by 2002:a05:622a:5912:b0:460:874f:f8bf with SMTP id d75a77b69052e-460874ffa63mr73466761cf.34.1729085026837;
        Wed, 16 Oct 2024 06:23:46 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4607b232976sm17776181cf.58.2024.10.16.06.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 06:23:46 -0700 (PDT)
Message-ID: <ccd95fb3-1756-4d52-bb7b-881502f7ac81@baylibre.com>
Date: Wed, 16 Oct 2024 09:23:44 -0400
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] docs: iio: new docs for ad7625 driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Lechner <dlechner@baylibre.com>,
 Uwe Kleine-Konig <u.kleine-koenig@baylibre.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20240909-ad7625_r1-v5-0-60a397768b25@baylibre.com>
 <20240909-ad7625_r1-v5-3-60a397768b25@baylibre.com>
 <20241015190034.3a6f6761@jic23-huawei>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20241015190034.3a6f6761@jic23-huawei>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2024-10-15 14:00, Jonathan Cameron wrote:
> On Mon, 09 Sep 2024 10:30:49 -0400
> Trevor Gamblin <tgamblin@baylibre.com> wrote:
>
>> Add documentation for the AD7625/AD7626/AD7960/AD7961 ADCs.
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> Bot picked up that this wasn't added to index.rst. I fixed up.
Thank you!
>
> Thanks,
>
> Jonathan


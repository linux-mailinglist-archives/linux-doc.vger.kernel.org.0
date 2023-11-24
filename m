Return-Path: <linux-doc+bounces-3081-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 974157F79FE
	for <lists+linux-doc@lfdr.de>; Fri, 24 Nov 2023 18:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C729B1C20A09
	for <lists+linux-doc@lfdr.de>; Fri, 24 Nov 2023 17:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAAE331740;
	Fri, 24 Nov 2023 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="HAUFzsZI"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E7731725
	for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 09:03:39 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-280b06206f7so454962a91.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Nov 2023 09:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1700845418; x=1701450218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EttzaI0nhO53eCepTQDlN4y1aR++7e9+n9jNRJSBAnI=;
        b=HAUFzsZI2Mbe//QMJ9qZ0qOduLtiU/G5Cayf5GCyLZzSHg+4BLErpmMjIIEI5taAZo
         MGKdFuGcfeBo7Z5iWgp53OgvLpXbMrUMnvMDwANX8U2CrMdOHn1D9RVYLygzOhAHridc
         Wtk7iQVdMP1a6pPikuye1fi97oFJ28nCaroqmrT0IiU3Jbb2g5FbzSmFbWOXPFvUx6On
         d98ejXcJqvtec5E/st5pg7SM36ftePSwvQc4U3DVU+2ErlFq5HqKKFXT5kSirD6r+Vn7
         FFPUnYkc6PXc8rnMjlie3AeTVV1iMCrs6nZ7mSeD8iKwsVxFxql8Gd8pclFTchp6lHXG
         rGzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700845418; x=1701450218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EttzaI0nhO53eCepTQDlN4y1aR++7e9+n9jNRJSBAnI=;
        b=VGUt9P8v2B6uGTf3SfQbDcOatRtbQvsfxa0/vCnyC5/qaWrg7OWKVHGf4UyxgLV+iY
         WG7gADthkbKdE6x68/2tqZQSMaQHBJ5hzX4v0fQB8n5RJck7aUOIR1N11Xa+FAKxlBWB
         erJHQmaWy3ixo2oHPqr5NbNFehCdwLWKheA07T4dWIKQxFayGH00X4pklHwE8jZNWIvW
         c/5B6nMKRF1lV9ZvqrMnSeQZSHkCSnV9RijQvk7Q4wqALDCRaXYZ7/ZQmhWAAHFjCSAU
         0n2YDPFq6K0Ghm1BcZXYRKjsOGr9b0/mCqaM0dflc+eJwjF3e1lhM7LNhY0zGPTDUzYZ
         Ubyg==
X-Gm-Message-State: AOJu0YwQfoi8bhRdrMy0qKE40tZDJlpsAG0XmOaFloRvyh2AJvuZ3SaI
	Y6aWEIKPJcR03DUmA0S7LakuUw==
X-Google-Smtp-Source: AGHT+IGjjL47Qg76W6NQQX8rc0L7riURgvwZXOQh1P8ZYDi+tPV1SXHJVTouJXnyPT02+qTwWoeFJA==
X-Received: by 2002:a17:90a:7408:b0:285:6f2b:4e82 with SMTP id a8-20020a17090a740800b002856f2b4e82mr3395923pjg.1.1700845418428;
        Fri, 24 Nov 2023 09:03:38 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.194])
        by smtp.gmail.com with ESMTPSA id k2-20020a17090a590200b0028571e2a759sm2616351pji.48.2023.11.24.09.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 09:03:37 -0800 (PST)
Message-ID: <7a54a166-56fd-4d6c-a5bf-792aa58a8fe5@kernel.dk>
Date: Fri, 24 Nov 2023 10:03:36 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/11] blksnap - block devices snapshots module
Content-Language: en-US
To: Sergei Shtepa <sergei.shtepa@linux.dev>, hch@infradead.org,
 corbet@lwn.net, snitzer@kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, linux-block@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Sergei Shtepa <sergei.shtepa@veeam.com>
References: <20231124165933.27580-1-sergei.shtepa@linux.dev>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20231124165933.27580-1-sergei.shtepa@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/24/23 9:59 AM, Sergei Shtepa wrote:
> From: Sergei Shtepa <sergei.shtepa@veeam.com>
> 
> Hi all.
> 
> I am happy to offer an improved version of the Block Devices Snapshots
> Module. It allows creating non-persistent snapshots of any block devices.
> The main purpose of such snapshots is to provide backups of block devices.
> See more in Documentation/block/blksnap.rst.

Please stop posting the same version, this is the third one of the
morning. What's going on?

-- 
Jens Axboe



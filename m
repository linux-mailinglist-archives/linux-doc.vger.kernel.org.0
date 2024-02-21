Return-Path: <linux-doc+bounces-10180-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 665D785D21C
	for <lists+linux-doc@lfdr.de>; Wed, 21 Feb 2024 09:06:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 978CE1C20402
	for <lists+linux-doc@lfdr.de>; Wed, 21 Feb 2024 08:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83E03BB23;
	Wed, 21 Feb 2024 08:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="MwEI1dou"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43743B1B7
	for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 08:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708502809; cv=none; b=BiLqx+di/ZtEGJx/ObHNiOcIeQxbrsM/r/ldXklUrk71cGQ54tqVWcaYExCmUkBM/faj6rRxEqqpyD8LlPFI9NthUWwmIClsX7qYdqLaIo5xVSysE1q3ZRXWfqGfy22V0ZG0EKuTXG2E9Lu9Ycm3smuqybjzVLtWDvbfSXB8bRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708502809; c=relaxed/simple;
	bh=VAp5EJfwMAx3N+LtvfX8uYtr5+xL1bjdXnqMcz/4K3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omO946XEiNtXztQqAvTarHYJTMaQyzhm6thndsBRGMMeLlIGdLDXXiDdfFZsJUNsRCrDLv7sxEmR0Cq6MZfpwafBz2Qe+dAPAgA8oqiSyLM5AvAV1WqnZbrG9/J0o3yvF8TjahfQhySkJYPvmfh52yig11TQ2cQwT/odS2n6Hys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=MwEI1dou; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33d4efb419bso376893f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 00:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708502806; x=1709107606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VAp5EJfwMAx3N+LtvfX8uYtr5+xL1bjdXnqMcz/4K3g=;
        b=MwEI1dou+7YCBCm2uLi0F+KO0fE61XS3I9rGOcps2f6GphSJtsV0GpCLLC2y6Wr15w
         s2T7mX/Q3bpMS4sk3i2bQID/MuleUdW6MT8biow/HCSLX7zA8TK/Q7PJPq/Y2UUnxrv4
         rsNViZg3zwv1lqstpIagej2Mq7AXoFLeSik9hA0JfeMRKNSgVWph3Syyl0JnEj/QXdNA
         gAP+1b5Jq/gMJjVuWugUKfU3sORlCETVzuXCNmXiBOtsASO4SPA5NpjWHRYhYvO5lzw0
         +ZRhvAZIgcOQfONnGnEUIv0Lij1GgVn9bJoBY/bpwqE6uVpTcjQnb6xbi7PhKWfz6uWd
         Kr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708502806; x=1709107606;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VAp5EJfwMAx3N+LtvfX8uYtr5+xL1bjdXnqMcz/4K3g=;
        b=C5g85GXY6GP7+Vae6xVey71hFWpxD7FRPbQJf8nc2HS85WcRLV5kZqLPGbcQfX+UCM
         UingriFzWjBEb0X70YNIGIW7CSZGRvlIgouztUG4G90Sg1ZsSW8UfTMb8Azfl8+ZCpZ1
         MZKHHLYN2QM7I4+hSGOGRFyAuL8P8sA+wvfva5SPibJxMzZNDMsw5VVtouRHzRbWfV3V
         +hF9CCD0JETejeU8DwjhSvc+Ge+1bxqg+AMmD6Kp0nzaOI8/1b3gh9212I2xbTwuHfJX
         BuPSnjUkA33GVvy5+c81f/gR2azbFTGEI+8BlyKbjZZK1n6y80zwlDg0+wAYZJK+7uFZ
         eQjA==
X-Forwarded-Encrypted: i=1; AJvYcCUOtxwvrDgxC7+bRVvB2vVDZsFULAMXOtAlDmb9SVGrFkONrxZkm2JvepFl4JEan1Hycf/gRbIy25YFRfjQb/UO7yvBuWaSYKH1
X-Gm-Message-State: AOJu0YzKAtksm4xR+5+IQQilIqv9D2P9XywgkhQvg1NV1m/BVC7VS5Jj
	+kmfUrvlMXMKlMWVtmJdUkB4kYsxvFjQ+AFbUKlmUbapsBDPloKgqNZeYSqdm6M=
X-Google-Smtp-Source: AGHT+IFhhuo+eJPWSLWQq+dZbJmeLfckVhpVthonWGbWlj64bYNPwd9tHXCUdOlo32NdqDMLAdPZBQ==
X-Received: by 2002:a05:600c:1587:b0:412:5670:ef62 with SMTP id r7-20020a05600c158700b004125670ef62mr8238941wmf.1.1708502806057;
        Wed, 21 Feb 2024 00:06:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:999:a3a0:e1be:e214:b8ab:dbb2? ([2a01:e0a:999:a3a0:e1be:e214:b8ab:dbb2])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c19d000b00410bca333b7sm1629488wmq.27.2024.02.21.00.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 00:06:45 -0800 (PST)
Message-ID: <2b667310-6bb4-45fa-9c11-098c532e6a7c@rivosinc.com>
Date: Wed, 21 Feb 2024 09:06:44 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: hwprobe: export Zihintpause ISA extension
Content-Language: en-US
To: Atish Patra <atishp@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Robbin Ehn <rehn@rivosinc.com>
References: <20240219154905.528301-1-cleger@rivosinc.com>
 <3cd9c332-1187-4204-94c9-34a3c4f5958c@rivosinc.com>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <3cd9c332-1187-4204-94c9-34a3c4f5958c@rivosinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 21/02/2024 00:42, Atish Patra wrote:
>          during signoff")
>   +  * :c:macro:`RISCV_HWPROBE_EXT_ZIHINTPAUSE`: The Zihintpause
> extension is
> +       supported as defined in the RISC-V ISA manual starting from
> commit commit

Looks like I did a typo ("commit" twice). Let me send a V2.

Clément

> +       d8ab5c78c207 ("Zihintpause is ratified").
> +


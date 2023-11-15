Return-Path: <linux-doc+bounces-2198-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A767E93AD
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 01:45:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F05691C20748
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 00:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458313D78;
	Mon, 13 Nov 2023 00:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QhzCdqOF"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5518256A
	for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 00:45:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35C7919A3
	for <linux-doc@vger.kernel.org>; Sun, 12 Nov 2023 16:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699836317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AIBcuinF5ss2DgGVnkjihkWjegSjrF5pOFgfBoAd6NQ=;
	b=QhzCdqOF/peHHu1nOYDpgVSLfbgiev3pSlpxpwSazaaOS/OI8bnFYsbUWI1/uDTVg8c9y9
	LVc2Z3DKOC7uo10Dxds2VvPqfvx5xw6gyw0AGK8zxfxwO4lDMa/NA8OEMkOzImsMZC+7yl
	QoagdbuAEi8bAiozJl+qW0kpxoJXxYM=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-Cul2eZI4NPyqeCTBHf-mFA-1; Sun, 12 Nov 2023 19:45:15 -0500
X-MC-Unique: Cul2eZI4NPyqeCTBHf-mFA-1
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1f4ddfe6fe1so1318750fac.1
        for <linux-doc@vger.kernel.org>; Sun, 12 Nov 2023 16:45:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699836315; x=1700441115;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AIBcuinF5ss2DgGVnkjihkWjegSjrF5pOFgfBoAd6NQ=;
        b=nRZFb7q77+bxbB4LVli49J+hXaf8ZDtAUuoJmN3RaJzLopZgfo5i7l3XFv53t6tkFP
         LOOP9GVF6d7NpjV0rnr15wf24CMAx4ToTTiMtAW/5YWXOcnIMMMWyPKUjWtwuSHXLfkh
         4RsBOwoXkQo2IgiIYmptWu6flsTWq6G4lhaaSG727SsRpD0URYFN1ghn51vx5O0zIvuZ
         ZpxT7Gov2dAN5VFyTsvAirS6imD6QNPxTjNp+fqtsC5NF6aEqzWyAjxHVL2rQbonFOMw
         SwvDvowVA2GmmCb4AZesM/uqQgdxBP4BUNCQR61dOFl+e4IhVHywbJNqYXEYtQM1lIbW
         sRmQ==
X-Gm-Message-State: AOJu0Yy/g1mJGZoehVezTaa96a3Fy19aLQGKCW4rYviDNe/vvBfk/dIO
	raZSxTSJd/00xWGwUGvy1t6+eGXx8cMGhQ9gkquGJ4ZnLis3nQkV3Bz/faqw30jAbnUlF8GtbvH
	pSTY42p5StIy/5GxbD1hv
X-Received: by 2002:a05:6870:f14d:b0:1d5:b2ba:bc93 with SMTP id l13-20020a056870f14d00b001d5b2babc93mr7060122oac.13.1699836315182;
        Sun, 12 Nov 2023 16:45:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9rLDeDKmdt9jI4rfj9b9OvZLsFOMuiJgoFwWcjW46CaFvA839DNqkdgqlkT2G64l2xzZLdg==
X-Received: by 2002:a05:6870:f14d:b0:1d5:b2ba:bc93 with SMTP id l13-20020a056870f14d00b001d5b2babc93mr7060111oac.13.1699836314952;
        Sun, 12 Nov 2023 16:45:14 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id hq18-20020a056a00681200b006933822e7a6sm2957854pfb.66.2023.11.12.16.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 16:45:14 -0800 (PST)
Message-ID: <df5fb117-96e0-4231-85c6-70c960fbb6c4@redhat.com>
Date: Mon, 13 Nov 2023 10:45:05 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/22] drivers: base: Implement weak
 arch_unregister_cpu()
Content-Language: en-US
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 linux-pm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org,
 linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com,
 justin.he@arm.com, James Morse <james.morse@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JLL-00CTxD-Gc@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JLL-00CTxD-Gc@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/7/23 20:29, Russell King (Oracle) wrote:
> From: James Morse <james.morse@arm.com>
> 
> Add arch_unregister_cpu() to allow the ACPI machinery to call
> unregister_cpu(). This is enough for arm64, riscv and loongarch, but
> needs to be overridden by x86 and ia64 who need to do more work.
> 
> CC: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Changes since v1:
>   * Added CONFIG_HOTPLUG_CPU ifdeffery around unregister_cpu
> Changes since RFC v2:
>   * Move earlier in the series
> ---
>   drivers/base/cpu.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>



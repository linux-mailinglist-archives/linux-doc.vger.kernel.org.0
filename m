Return-Path: <linux-doc+bounces-2194-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC84A7E9383
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 01:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C41CB208D5
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 00:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E761FC9;
	Mon, 13 Nov 2023 00:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XCXMkA5Q"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E99B17D2
	for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 00:11:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CEC10E9
	for <linux-doc@vger.kernel.org>; Sun, 12 Nov 2023 16:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699834313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQiJJ/dxNEHd77f2PC0oaN2B9+v5Hs6KtuITs8AqQVc=;
	b=XCXMkA5QOB0SBJCrwFOA7lVQxltMIBDSjs7jIsXedmQuofdQWUtIZ9ikOs3jAVZ2aDmDSk
	2rBOsrF/wDFq/DXq8lfzWT9nAzjusb9F/vQfsgK8yZzK8HJsrPQcLjyx2UJUwliD5GIWNX
	qJFOwcRalWgqYeM61if0BTvFpaSaY3M=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-JTblnKqhNj6uwSLcKZbMAw-1; Sun, 12 Nov 2023 19:11:52 -0500
X-MC-Unique: JTblnKqhNj6uwSLcKZbMAw-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1cc2efd22ccso45262435ad.1
        for <linux-doc@vger.kernel.org>; Sun, 12 Nov 2023 16:11:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699834311; x=1700439111;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQiJJ/dxNEHd77f2PC0oaN2B9+v5Hs6KtuITs8AqQVc=;
        b=oUcmf8OfjE7KIn+9EULIXKrKcmsBV86JGbD4ypeyjvrIvy0X2qzM2uWcA5elLR9h18
         n1SxzCcHKZ7xsgkbPErJz1xmWxHk/99BOkbKzZkPrB0P9EaeY1fivYXlBMOO7A2kVFpb
         ANbzVHdi/+OrX1+p6J/UE2nPsEag8RMSjObrFZLFU4SEKYJ//nAYqVuFzCuPLfBSDStp
         nVPH8n79/LpNHNj6qOyQKsI+DIymP1v6mffzUY5A0fy7jpmSDC8pId8z9uGunXAAjQn/
         w6lgK6Eo7/7FC+qepkroRQ6hsFQgaKSDQBthwEii81AvwIDNmFuO3nCBA894kRApFFVd
         /nIg==
X-Gm-Message-State: AOJu0Ywq65oFc3ECQylvaSgqC0N+0yvMEikRuUih1PqkielUTnJT+7oC
	kN8NHaIpJksk170CSqqrtaBLzslYiUGLq42+ev3EdLAaO22x5hIbCMRGG+p+hBiWeqOqKlYnhiJ
	VVMsURx0oh1FraCtgyDJG
X-Received: by 2002:a17:902:eecd:b0:1c3:4b24:d89d with SMTP id h13-20020a170902eecd00b001c34b24d89dmr6067397plb.40.1699834311419;
        Sun, 12 Nov 2023 16:11:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdqJareZ27x0vWYdkv//f/HJqmqCsdd3lWu5y3OyZlPyNdejWbYRbuSoSv157Xo1Ur4thQ4Q==
X-Received: by 2002:a17:902:eecd:b0:1c3:4b24:d89d with SMTP id h13-20020a170902eecd00b001c34b24d89dmr6067370plb.40.1699834311176;
        Sun, 12 Nov 2023 16:11:51 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id m16-20020a170902db1000b001c9b8f76a89sm3022112plx.82.2023.11.12.16.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 16:11:50 -0800 (PST)
Message-ID: <fffd8a37-bb23-4c76-aec7-aec2f1361817@redhat.com>
Date: Mon, 13 Nov 2023 10:11:42 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 04/22] Loongarch: remove arch_*register_cpu() exports
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
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JL0-00CTwm-VX@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JL0-00CTwm-VX@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/23 20:29, Russell King (Oracle) wrote:
> arch_register_cpu() and arch_unregister_cpu() are not used by anything
> that can be a module - they are used by drivers/base/cpu.c and
> drivers/acpi/acpi_processor.c, neither of which can be a module.
> 
> Remove the exports.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   arch/loongarch/kernel/topology.c | 2 --
>   1 file changed, 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>



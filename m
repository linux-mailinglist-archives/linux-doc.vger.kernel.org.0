Return-Path: <linux-doc+bounces-2193-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 438237E937D
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 01:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92B8CB208A0
	for <lists+linux-doc@lfdr.de>; Mon, 13 Nov 2023 00:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2837FF;
	Mon, 13 Nov 2023 00:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qn4gWjNH"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F431369
	for <linux-doc@vger.kernel.org>; Mon, 13 Nov 2023 00:08:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 021B02582
	for <linux-doc@vger.kernel.org>; Sun, 12 Nov 2023 16:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699834133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZoVE59pXWGm0JQT+CMJNCgS+fu8REHYPUoz78JAFk8=;
	b=Qn4gWjNHcrEuRH4DStbrWmBp5aL5c4MNSCh8FasXLDJdhpieh/Z+RyyCy9cKi0emrSBGu9
	q1ppty/M+jGnw4rwHik2nssoQT3QdezOgAqYlMHxnkRApTIwqNo70v65Hwp1OcsvhDQXz6
	GvzmgLg27FNRjj0wES2jtiw0i3CJm2Y=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-170-8_xCW0ssNwyYsg_vVBznsg-1; Sun, 12 Nov 2023 19:08:51 -0500
X-MC-Unique: 8_xCW0ssNwyYsg_vVBznsg-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-6b6f4c118a9so3926872b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 12 Nov 2023 16:08:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699834130; x=1700438930;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZoVE59pXWGm0JQT+CMJNCgS+fu8REHYPUoz78JAFk8=;
        b=iYNe8q6RVQu5OckquDDJuYpxygCIVriE12hC8MXk604vER7qlsyamLHcTHf45ZsuVX
         St6iq9HVY8uxVyP8Ehth/Uk+zMifdvikORwrAfb5DzBHJNsezFEzRKKQt1rFt0owu/Qy
         U5l2tgDEKW8oXYyrHJstTZV+/nakPrK9x+uJvBpWrIKQLhURQH4PRP5mQFN+5NixOqsj
         eUpnA+P300BYTHKbWiNzmaduAp8qGhIt3g+ftEnXlGxUOYKLenyVW7e9wCVJutkKXu8k
         Mishd/0K/Sl0phJ2utlj1IQIwTWQEqHveMQGunSG0FvdLC+8xqk9v1Tzcbf3kvx9gDd8
         WOFQ==
X-Gm-Message-State: AOJu0Yz9MofczimckivBEZ5IVSabKlcUrYHP65tymVmXj7KG9kzAlZJs
	KnQz9W8yyC9mv9/GI0fvGkYoeOV2IX1lxHpQDXz2/n5m2sob2ZKjXbLdbuZnRgYsFH+rClFqYuy
	p55ZetVInSh1fwsVDzNLP
X-Received: by 2002:a05:6a20:748b:b0:186:603b:6b53 with SMTP id p11-20020a056a20748b00b00186603b6b53mr1091852pzd.0.1699834130294;
        Sun, 12 Nov 2023 16:08:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEuXsyqcDEY3uU8V/1tkBaOM8ZFpVTqspPi9KzQF+bgKRFukH+13LuLcTE/aP13+7JgHA4Nsg==
X-Received: by 2002:a05:6a20:748b:b0:186:603b:6b53 with SMTP id p11-20020a056a20748b00b00186603b6b53mr1091836pzd.0.1699834129822;
        Sun, 12 Nov 2023 16:08:49 -0800 (PST)
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709027c9200b001b53c8659fesm2998333pll.30.2023.11.12.16.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 16:08:49 -0800 (PST)
Message-ID: <baa98649-1840-48aa-89ac-0c27a08559d5@redhat.com>
Date: Mon, 13 Nov 2023 10:08:40 +1000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/22] x86/topology: remove arch_*register_cpu()
 exports
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
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <ZUoRY33AAHMc5ThW@shell.armlinux.org.uk>
 <E1r0JKv-00CTwf-R9@rmk-PC.armlinux.org.uk>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <E1r0JKv-00CTwf-R9@rmk-PC.armlinux.org.uk>
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
>   arch/x86/kernel/topology.c | 2 --
>   1 file changed, 2 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>



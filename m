Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2B98D4A0
	for <lists+linux-doc@lfdr.de>; Wed, 14 Aug 2019 15:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbfHNN0T (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 14 Aug 2019 09:26:19 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35545 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727898AbfHNN0T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Aug 2019 09:26:19 -0400
Received: by mail-wm1-f68.google.com with SMTP id l2so4464702wmg.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Aug 2019 06:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xAZiPJjmd3PI+GZoBuvq/KNF0BWtwepJ9HhFWDTukEY=;
        b=SChvpw6aA76tYEoCR2fhqJAIIlRK8X8P6iU6VLBiiBUMwDlY5dUSEUk1+dUA5BKKcK
         riMrYxpbmykgbfqr56PLMbZuSRMg2MiEd4haSoOocl2ELd6YlKDPBHVTXN5vF7nxLvG7
         HP4z5fkB2wyju8YphleQp8UzexZxAkuorf582tbxE/U/hN1sF24RXtXJJLqhmx9rwLx4
         mp6209PZuKEe5fDTKB1ywmyKy1v1dH1ifM18DqlDmlokRz+fGSY7Dj4CUd6o8+E7tAyI
         VXQwEpyQbdfF/q+DJKHFsrw61hh6y22dhJUMIgOcQ7EX0F4ZBDuFUrDB+NB1NC9k4cBr
         +8fA==
X-Gm-Message-State: APjAAAVojKugeYKVdAXCcLiXz0KUSzp5LYlg0NQ/WKALp3TMgByDvdYj
        8yVKVmMsMH1q4PSkbdq/kXSmbA==
X-Google-Smtp-Source: APXvYqw5R7ojamwpGp9GNDYM/3FlDkueNtnfQMNYbHyZwrsXb2PfA9JrdUUz9Jm+0mWhZEM/oEFv/w==
X-Received: by 2002:a1c:3587:: with SMTP id c129mr8953730wma.90.1565789177208;
        Wed, 14 Aug 2019 06:26:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:2cae:66cd:dd43:92d9? ([2001:b07:6468:f312:2cae:66cd:dd43:92d9])
        by smtp.gmail.com with ESMTPSA id z6sm25300600wre.76.2019.08.14.06.26.16
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 06:26:16 -0700 (PDT)
Subject: Re: [PATCH V2 1/3] x86/Hyper-V: Fix definition of struct
 hv_vp_assist_page
To:     lantianyu1986@gmail.com, rkrcmar@redhat.com, corbet@lwn.net,
        kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
        sashal@kernel.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, hpa@zytor.com, x86@kernel.org,
        michael.h.kelley@microsoft.com
Cc:     Tianyu Lan <Tianyu.Lan@microsoft.com>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hyperv@vger.kernel.org, vkuznets@redhat.com
References: <20190814073447.96141-1-Tianyu.Lan@microsoft.com>
 <20190814073447.96141-2-Tianyu.Lan@microsoft.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <a73173b2-da31-b5fc-394f-462c7e0bf1d4@redhat.com>
Date:   Wed, 14 Aug 2019 15:26:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814073447.96141-2-Tianyu.Lan@microsoft.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 14/08/19 09:34, lantianyu1986@gmail.com wrote:
> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
> 
> The struct hv_vp_assist_page was defined incorrectly.
> The "vtl_control" should be u64[3], "nested_enlightenments
> _control" should be a u64 and there is 7 reserved bytes
> following "enlighten_vmentry". This patch is to fix it.

How did the assignment to vp_ap->current_nested_vmcs work then?  Does
the guest simply not care?

Paolo

> Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
> --
> Change since v1:
>        Move definition of struct hv_nested_enlightenments_control
>        into this patch to fix offset issue.
> ---
>  arch/x86/include/asm/hyperv-tlfs.h | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/include/asm/hyperv-tlfs.h b/arch/x86/include/asm/hyperv-tlfs.h
> index af78cd72b8f3..cf0b2a04271d 100644
> --- a/arch/x86/include/asm/hyperv-tlfs.h
> +++ b/arch/x86/include/asm/hyperv-tlfs.h
> @@ -514,14 +514,24 @@ struct hv_timer_message_payload {
>  	__u64 delivery_time;	/* When the message was delivered */
>  } __packed;
>  
> +struct hv_nested_enlightenments_control {
> +	struct {
> +		__u32 directhypercall:1;
> +		__u32 reserved:31;
> +	} features;
> +	struct {
> +		__u32 reserved;
> +	} hypercallControls;
> +} __packed;
> +
>  /* Define virtual processor assist page structure. */
>  struct hv_vp_assist_page {
>  	__u32 apic_assist;
> -	__u32 reserved;
> -	__u64 vtl_control[2];
> -	__u64 nested_enlightenments_control[2];
> -	__u32 enlighten_vmentry;
> -	__u32 padding;
> +	__u32 reserved1;
> +	__u64 vtl_control[3];
> +	struct hv_nested_enlightenments_control nested_control;
> +	__u8 enlighten_vmentry;
> +	__u8 reserved2[7];
>  	__u64 current_nested_vmcs;
>  } __packed;
>  
> 


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AADD85F3E26
	for <lists+linux-doc@lfdr.de>; Tue,  4 Oct 2022 10:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiJDIVU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Oct 2022 04:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbiJDIVT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Oct 2022 04:21:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918981AF32
        for <linux-doc@vger.kernel.org>; Tue,  4 Oct 2022 01:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664871677;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ey2tkE+Uksmp2pmcaxq0Z3p4VeNfOuZjcREwwMwZJB8=;
        b=ZuK1e0DarU897XCEY3JjCgoRgvk539gq/1MEdvIRpDwO6ImlilQL+mL+svuEK6XD9gVeoX
        b5AxEHMoSEc2TWlPD0J9e5pFiajKp6JDXRVb7p/yR8mJYs5/fGXp8gYcA5vvGte1QijssK
        6RpRk6bQn1C376h9CD95Gym4WCzcJ1w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-42-hx5KFwm7OG6SlLLtDN99NA-1; Tue, 04 Oct 2022 04:21:14 -0400
X-MC-Unique: hx5KFwm7OG6SlLLtDN99NA-1
Received: by mail-wm1-f72.google.com with SMTP id y20-20020a05600c365400b003b4d4ae666fso3361920wmq.4
        for <linux-doc@vger.kernel.org>; Tue, 04 Oct 2022 01:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ey2tkE+Uksmp2pmcaxq0Z3p4VeNfOuZjcREwwMwZJB8=;
        b=s6s7kU3t+cznieZ/f/SSBiq18PAenPqN2r8jLIO0gdY0SZAoUOwtRMCo15eI5p7wPZ
         3Rg0vvk/69nFebPUip6tT3B5r3qyioBtZeGMGG7EzixtN7DMkKdmK3lfTc3EPR+Xsfcm
         EyaeNS/2KMM4GR0xz6wuvcFAtXgv91c25uTQztfc8AdVnlu9VcgDToIsBrYfutWZduWd
         zwGAxuxLVtnnCN5APOdlan6o1BryznCIEXp5TXtN4b9GIfqH6h7pilPBjMCmP4MvXba1
         53l0zUBXDOR3oRd4OKhciSzgCmv2UtcLXuXUU4C6Zz+syifpc2vprhDV/aMTbsFFYSrs
         AsXg==
X-Gm-Message-State: ACrzQf2ctdx/K2QTR++f46FTw5nXIakz3U8q2BU65KhoYl1wLFPz2Ak6
        yGw1O1LERecJidEGPNK3ZwpceIsbOUExDIrpJ7L5/426ObC4ANziJw8J42MQlhJc+TdyHXtkhmq
        g5Y+rX15LxR1a7NC3JKyw
X-Received: by 2002:a05:600c:474a:b0:3b4:cb93:7d57 with SMTP id w10-20020a05600c474a00b003b4cb937d57mr9507750wmo.41.1664871673639;
        Tue, 04 Oct 2022 01:21:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7t7/WnQ/rPAxDlAuMCud8gO/JdRg8ZGL5c/bT8KDb0P6rlWds0eGi2vsKOLBXUv0PFtCmybw==
X-Received: by 2002:a05:600c:474a:b0:3b4:cb93:7d57 with SMTP id w10-20020a05600c474a00b003b4cb937d57mr9507735wmo.41.1664871673457;
        Tue, 04 Oct 2022 01:21:13 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-246.web.vodafone.de. [109.43.178.246])
        by smtp.gmail.com with ESMTPSA id x24-20020a05600c189800b003b4727d199asm13080082wmp.15.2022.10.04.01.21.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 01:21:12 -0700 (PDT)
Message-ID: <3762a3e2-07f8-0048-6b3e-6b0417aff781@redhat.com>
Date:   Tue, 4 Oct 2022 10:21:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 8/9] KVM: s390: selftest: memop: Fix typo
Content-Language: en-US
To:     Janis Schoetterl-Glausch <scgl@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Shuah Khan <shuah@kernel.org>,
        Sven Schnelle <svens@linux.ibm.com>
References: <20220930210751.225873-1-scgl@linux.ibm.com>
 <20220930210751.225873-9-scgl@linux.ibm.com>
From:   Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220930210751.225873-9-scgl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30/09/2022 23.07, Janis Schoetterl-Glausch wrote:
> Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
> ---
>   tools/testing/selftests/kvm/s390x/memop.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/s390x/memop.c b/tools/testing/selftests/kvm/s390x/memop.c
> index 3a160ab0415b..1887685b41d2 100644
> --- a/tools/testing/selftests/kvm/s390x/memop.c
> +++ b/tools/testing/selftests/kvm/s390x/memop.c
> @@ -970,7 +970,7 @@ static void test_errors_key_fetch_prot_override_enabled(void)
>   
>   	/*
>   	 * vcpu, mismatching keys on fetch,
> -	 * fetch protection override does not apply because memory range acceeded
> +	 * fetch protection override does not apply because memory range exceeded
>   	 */
>   	CHECK_N_DO(ERR_PROT_MOP, t.vcpu, LOGICAL, READ, mem2, 2048 + 1, GADDR_V(0), KEY(2));
>   	CHECK_N_DO(ERR_PROT_MOP, t.vcpu, LOGICAL, READ, mem2, PAGE_SIZE + 2048 + 1,

Reviewed-by: Thomas Huth <thuth@redhat.com>


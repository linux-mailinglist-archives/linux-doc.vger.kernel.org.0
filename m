Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0E0667C483
	for <lists+linux-doc@lfdr.de>; Thu, 26 Jan 2023 07:39:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjAZGjm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 26 Jan 2023 01:39:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjAZGjl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Jan 2023 01:39:41 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 647504FC01
        for <linux-doc@vger.kernel.org>; Wed, 25 Jan 2023 22:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674715137;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IwnaW40wODo/RPJeJh2TlciTsJYMAL7AVIWQnJnbBqw=;
        b=SnU3S1hGb+tn0O3MZ1cVMNdRVsvcGpJVOr7ybG3UeB6mGplFspwjjiBOJb7QShMq0cZwcI
        EQhtQxXfHD9LZbwuUBjGYX9vB5CnV5cqcKCxcDMfnQt8y+wXLm/LoEjxT4z86rb64MVeLI
        nTjzQn92U4M871wABFRozT6xsyyBcp8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-442-R4AtziA1NuG3l57e1fQSdw-1; Thu, 26 Jan 2023 01:38:55 -0500
X-MC-Unique: R4AtziA1NuG3l57e1fQSdw-1
Received: by mail-qk1-f198.google.com with SMTP id az16-20020a05620a171000b00709129a745eso517535qkb.8
        for <linux-doc@vger.kernel.org>; Wed, 25 Jan 2023 22:38:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IwnaW40wODo/RPJeJh2TlciTsJYMAL7AVIWQnJnbBqw=;
        b=sEUqoDVUFnXxDoupzShjl/WOpJsMwUQ6OJ/ExHwJgRIQVqovbQMOEfNnMjxdkUSzvm
         P3oKNHKJ9pwe9A1xgrqCC+CNmabP4bxKp6CxbH1xX+p+wYJgqihiQkyNyYdNJ0A9rvD+
         NxCRQxfRCzfEuBAyUkt5lm5xr2iFfSyiHuu+xDa1Pi/K/b1ft/Wux2gB9VMQEN6wsLpE
         O45bTwI7UR1f2SS17XvucyOLV9ZIa0jpcDfl4qQq0mEFLi82PwgKQBBlCYnvDUhodStw
         zrk4GJlwKvzNl4BGTtQRzQ+PCPtusDdLut5wyJz1ZxwGxBtoBKN6iSX6LvRg80K10tLh
         45UA==
X-Gm-Message-State: AFqh2kpDgM+WjbocLkdJ6eLqUXQCbezqclnvbV9vpXDroH/URWMLxXhj
        lxD5r/PjtpMYPd7YYcN2HqyF8d3bZRnaL77mKRTBwtDEhz5MjtKm6CcFyked6SSYJSUUQqF20+h
        czKynOGNCpqjvIfTvtBo2
X-Received: by 2002:a05:622a:1aa5:b0:3b6:a1fd:19cd with SMTP id s37-20020a05622a1aa500b003b6a1fd19cdmr41574769qtc.46.1674715134722;
        Wed, 25 Jan 2023 22:38:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuf7UjZI2ffXZKoGViT9PivCgdjta/q3yUMmhqaU7OtGXYv4rT+XOka9LZmTzNCFQdUCAdNYA==
X-Received: by 2002:a05:622a:1aa5:b0:3b6:a1fd:19cd with SMTP id s37-20020a05622a1aa500b003b6a1fd19cdmr41574753qtc.46.1674715134495;
        Wed, 25 Jan 2023 22:38:54 -0800 (PST)
Received: from [192.168.8.105] (tmo-064-101.customers.d1-online.com. [80.187.64.101])
        by smtp.gmail.com with ESMTPSA id x8-20020ac84d48000000b003b63b8df24asm247352qtv.36.2023.01.25.22.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 22:38:53 -0800 (PST)
Message-ID: <957489fb-8080-8806-6ddf-8687da469a43@redhat.com>
Date:   Thu, 26 Jan 2023 07:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 07/14] KVM: s390: selftest: memop: Fix integer literal
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
References: <20230125212608.1860251-1-scgl@linux.ibm.com>
 <20230125212608.1860251-8-scgl@linux.ibm.com>
From:   Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230125212608.1860251-8-scgl@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 25/01/2023 22.26, Janis Schoetterl-Glausch wrote:
> The address is a 64 bit value, specifying a 32 bit value can crash the
> guest. In this case things worked out with -O2 but not -O0.
> 
> Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
> Fixes: 1bb873495a9e ("KVM: s390: selftests: Add more copy memop tests")
> ---
>   tools/testing/selftests/kvm/s390x/memop.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/s390x/memop.c b/tools/testing/selftests/kvm/s390x/memop.c
> index 3ec501881c7c..55b856c4d656 100644
> --- a/tools/testing/selftests/kvm/s390x/memop.c
> +++ b/tools/testing/selftests/kvm/s390x/memop.c
> @@ -514,7 +514,7 @@ static void guest_copy_key_fetch_prot_override(void)
>   	GUEST_SYNC(STAGE_INITED);
>   	set_storage_key_range(0, PAGE_SIZE, 0x18);
>   	set_storage_key_range((void *)last_page_addr, PAGE_SIZE, 0x0);
> -	asm volatile ("sske %[key],%[addr]\n" :: [addr] "r"(0), [key] "r"(0x18) : "cc");
> +	asm volatile ("sske %[key],%[addr]\n" :: [addr] "r"(0L), [key] "r"(0x18) : "cc");
>   	GUEST_SYNC(STAGE_SKEYS_SET);
>   
>   	for (;;) {

Reviewed-by: Thomas Huth <thuth@redhat.com>


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30BAC5F4FCF
	for <lists+linux-doc@lfdr.de>; Wed,  5 Oct 2022 08:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbiJEGcm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Oct 2022 02:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiJEGcl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Oct 2022 02:32:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2AAD74CC3
        for <linux-doc@vger.kernel.org>; Tue,  4 Oct 2022 23:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664951559;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i2fZF5NpPxB+zfptp/E3otmQs3yA+XxyrCxE6wqs+1E=;
        b=jM3cE9/99Ln8Rz/ue/98agBFrfglSC/5xoPobYfAty9cuFlacmgWm6NHCgI/S9t5DzVP2S
        /Mz1+vApszkZ7J7hfAM8WcJTb+wcZYsf1ez6R0ob2HnUCMzZvgX3GF5cXO54vFQ7vaVqZy
        69ojQ4AH+vg/hSa/uftxr+O3i5KPfdc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-480-CnGxYc2GNh-Lyu-WyqWMvQ-1; Wed, 05 Oct 2022 02:32:37 -0400
X-MC-Unique: CnGxYc2GNh-Lyu-WyqWMvQ-1
Received: by mail-wm1-f71.google.com with SMTP id e3-20020a05600c218300b003b4e4582006so121550wme.6
        for <linux-doc@vger.kernel.org>; Tue, 04 Oct 2022 23:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=i2fZF5NpPxB+zfptp/E3otmQs3yA+XxyrCxE6wqs+1E=;
        b=pbjAL0/EgPfl3CnSfZI+nIpLzlfTQT73uXnECBd+u/iMJsRrsm5y3E6knqQQsER6Ut
         J5Ho8rEBgQyozFO5yPsdiTxl2AXRoN2v3Q2C5CNALNLqTo5JtUtxsHw0eemEfZBAY1Th
         GsDyQR1RjuZTSG2eMd3FyI8Ytm4bwSeHAvFeYmKG2x8rvCTrcr3vfaFvbxd/GlwcpYpz
         cNAcRTZsK+0qwipKu5aKOzM/7okneG63wfuQ/oiqNsft3mKngYS2mx8x3NFYCk1Sv8n0
         UwY4f7f5IyYZo00vPsfvNGM0iES2DS4Ruhvv2BLPsTk58jDnE1aveDTEwa8RH1obqPwu
         0P0w==
X-Gm-Message-State: ACrzQf2+bsz/6tbDQnpiGZp3q5oSq6oOMD/qHc4M5+qd4iRxT9e5TnqU
        mycpY32dabZ3SOj+pHYEDStWWr7MNjHXxapuxTGTbo75DPeVmq442kOEnN882MpFQLdcDh6l45J
        RAZJcezb9UfpnVLWodIHL
X-Received: by 2002:a05:600c:1549:b0:3b4:8fd7:af4 with SMTP id f9-20020a05600c154900b003b48fd70af4mr2124928wmg.100.1664951556627;
        Tue, 04 Oct 2022 23:32:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6oN6PV4QL5PeEwB3AulW8hy8JRxoJitj3BA4H8xzN2l786Y0utSyQ0xn5AhPGpmYJfRD5rnQ==
X-Received: by 2002:a05:600c:1549:b0:3b4:8fd7:af4 with SMTP id f9-20020a05600c154900b003b48fd70af4mr2124913wmg.100.1664951556442;
        Tue, 04 Oct 2022 23:32:36 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-249.web.vodafone.de. [109.43.177.249])
        by smtp.gmail.com with ESMTPSA id s16-20020a1cf210000000b003a5f3f5883dsm997040wmc.17.2022.10.04.23.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 23:32:35 -0700 (PDT)
Message-ID: <37197cfe-d109-332f-089b-266d7e8e23f8@redhat.com>
Date:   Wed, 5 Oct 2022 08:32:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 2/9] KVM: s390: Extend MEM_OP ioctl by storage key
 checked cmpxchg
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
 <20220930210751.225873-3-scgl@linux.ibm.com>
From:   Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220930210751.225873-3-scgl@linux.ibm.com>
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
> User space can use the MEM_OP ioctl to make storage key checked reads
> and writes to the guest, however, it has no way of performing atomic,
> key checked, accesses to the guest.
> Extend the MEM_OP ioctl in order to allow for this, by adding a cmpxchg
> mode. For now, support this mode for absolute accesses only.
> 
> This mode can be use, for example, to set the device-state-change
> indicator and the adapter-local-summary indicator atomically.
> 
> Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
> ---
> 
> 
> The return value of MEM_OP is:
>    0 on success,
>    < 0 on generic error (e.g. -EFAULT or -ENOMEM),
>    > 0 if an exception occurred while walking the page tables
> A cmpxchg failing because the old value doesn't match is neither an
> error nor an exception, so the question is how best to signal that
> condition. This is not strictly necessary since user space can compare
> the value of old after the MEM_OP with the value it set. If they're
> different the cmpxchg failed. It might be a better user interface if
> there is an easier way to see if the cmpxchg failed.
> This patch sets the cmpxchg flag bit to 0 on a successful cmpxchg.
> This way you can compare against a constant instead of the old old
> value.
> This has the disadvantage of being a bit weird, other suggestions
> welcome.

This also breaks the old API of defining the ioctl as _IOW only ... with 
your change to the flags field, it effectively gets IOWR instead.

Maybe it would be better to put all the new logic into a new struct and only 
pass a pointer to that struct in kvm_s390_mem_op, so that the ioctl stays 
IOW ? ... or maybe even introduce a completely new ioctl for this 
functionality instead?

  Thomas


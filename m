Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05A785F3E12
	for <lists+linux-doc@lfdr.de>; Tue,  4 Oct 2022 10:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiJDIS1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Oct 2022 04:18:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230064AbiJDISI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Oct 2022 04:18:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A495811A0B
        for <linux-doc@vger.kernel.org>; Tue,  4 Oct 2022 01:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664871486;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NLtFZq4bDaN6BM38qfHtC/XiTFqjPED0T8bmDBUI3bM=;
        b=XRcRml3kdBAWjR7L5PLbkQAZO8DpuLMUwtyAbuOPU799wuQv2+BTvtpZ2OICSzJ2UPRuhi
        cF00jAjVD1rtNC2qQVyLvfz2PS7hiV/T6bn8elvR4XrSgmpeFFWRAN8ZXOqRgvN7rt7MMv
        cixpFKbWngmLJjaR8+kksA9yXMPOAfk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-282-RTFbUB1CPY-oMBwGsuQQdw-1; Tue, 04 Oct 2022 04:18:05 -0400
X-MC-Unique: RTFbUB1CPY-oMBwGsuQQdw-1
Received: by mail-wr1-f69.google.com with SMTP id k30-20020adfb35e000000b0022e04708c18so2525184wrd.22
        for <linux-doc@vger.kernel.org>; Tue, 04 Oct 2022 01:18:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=NLtFZq4bDaN6BM38qfHtC/XiTFqjPED0T8bmDBUI3bM=;
        b=bt2cOlk1b7SxOpLM38AFYbkK9ayj4vNNQUoiZk4tv2FlrHinNnGRqfrcQRQB0D3nFI
         XGkx0JhVRZwcvyHJH51sLw+o2N17MkpxHHZqq6R4St0rT0vvwwLrYSXY+ddyziGap1LY
         nsY3TW4G7b2hj73tfD2xaOxxFC92loK+CLj4llb5DbmGEk53YF+0Pn8onXdp1/NSS929
         VebpwrqQqQoTSqGcB/cxbjeuUn+L6Ww7gkNVLcWycBv7uTCxmRSaJzxdBNuxuFqR33cJ
         xx7Y0cdj7UK9lw1pPnqqBknc0VZGTc3XQcBwVOiHQ4xfQxWw+cT5uomqxIXvOIRwkKzF
         /C6g==
X-Gm-Message-State: ACrzQf1S/Qlrpxz1m0rf+72tPqSCEqU39yJ+hWRMB+oiu8gWJMpsxRRL
        mf3jjwUftpzzIwmXfexeTduUhMyrxmPhvz4ZtPIFr36O0uYueDZpESsLPchoz2U9PEdQEVPMznx
        k1akaynr/oMzS9Tge3lBE
X-Received: by 2002:adf:d1e3:0:b0:22a:b9e2:8841 with SMTP id g3-20020adfd1e3000000b0022ab9e28841mr14873499wrd.184.1664871484640;
        Tue, 04 Oct 2022 01:18:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6pGiVfRgi+gr5FmqmXrxztDFohEkGW+UwhA75mOZyu+1mXYa4G6dLTHbSwxPWZraEEuJmhXw==
X-Received: by 2002:adf:d1e3:0:b0:22a:b9e2:8841 with SMTP id g3-20020adfd1e3000000b0022ab9e28841mr14873486wrd.184.1664871484473;
        Tue, 04 Oct 2022 01:18:04 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-178-246.web.vodafone.de. [109.43.178.246])
        by smtp.gmail.com with ESMTPSA id y9-20020a5d4ac9000000b0021badf3cb26sm14655866wrs.63.2022.10.04.01.18.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 01:18:03 -0700 (PDT)
Message-ID: <65ec72fd-5893-659d-cc79-340eacb3a897@redhat.com>
Date:   Tue, 4 Oct 2022 10:18:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 4/9] KVM: s390: selftest: memop: Pass mop_desc via
 pointer
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
 <20220930210751.225873-5-scgl@linux.ibm.com>
From:   Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220930210751.225873-5-scgl@linux.ibm.com>
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
> The struct is quite large, so this seems nicer.
> 
> Signed-off-by: Janis Schoetterl-Glausch <scgl@linux.ibm.com>
> ---
>   tools/testing/selftests/kvm/s390x/memop.c | 44 +++++++++++------------
>   1 file changed, 22 insertions(+), 22 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


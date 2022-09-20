Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A96D5BDFDE
	for <lists+linux-doc@lfdr.de>; Tue, 20 Sep 2022 10:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbiITIVy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 20 Sep 2022 04:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231139AbiITIUp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Sep 2022 04:20:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08A6FC9
        for <linux-doc@vger.kernel.org>; Tue, 20 Sep 2022 01:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663661968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5gk3kLlspQCYjPujhZljAtxcOT9dALJ6AajDjY8rEpQ=;
        b=d3PXYXT+YXcQoPdJ7SmI+s9Guxv/wwEDvKFSGiUh+JMn24YBuP0Tv+HFVNub0GGFhdEaLw
        A2LYsDZAmjkuLlk8ppGDDk1rrhKixQxbgf4MCRUATRbpxPTDtAv816wnXDedFL6sNsapkZ
        5R2C8LY05fJfILxM6y2jMysVAjAowhs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-427-utsNTyuoMV-lssulhHLHQQ-1; Tue, 20 Sep 2022 04:19:26 -0400
X-MC-Unique: utsNTyuoMV-lssulhHLHQQ-1
Received: by mail-wr1-f69.google.com with SMTP id q25-20020adfb199000000b0022ae4ea0afcso834291wra.8
        for <linux-doc@vger.kernel.org>; Tue, 20 Sep 2022 01:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5gk3kLlspQCYjPujhZljAtxcOT9dALJ6AajDjY8rEpQ=;
        b=LmS7Ip4Eo1JeAJ8AFhSyVe/ARCCZlrj6UabizxGLtaVgmG9lRRAxVbIoegmi7J5sOZ
         JEXP5xzmCTlwduqzup+apNfrF3Q+afQkfHKYdU/IelW+4+cnPG7e03p56G1w/WAa1ooT
         nCi1wxxdKWfmAp7Umzqc14Vn8Yjtf7Lmb1MsGVkDQSQlYJM911vdzR8Cs9F0BL1Xzr3q
         mwLwjt5CQX1miulZtaAgLdF87yWgWcXqQr5TWXS78q0vke8DDjQhFJz6GDsVmz6fsQvL
         RMWCAKflx0A/NJDAGuzdOWKuj0KArTBjmba27ZUiaqL+QMeWeJumuZC5nRsnxo/JcMiS
         JfQQ==
X-Gm-Message-State: ACrzQf0INGJYLgmM7yWMZhGpA1lVWHAI0Cl50APfyrlZeQo56vRrSSrb
        vIqwXcIRa0Cx1NyNy7JhDDa+rfMEGdtlIzTXMtAN/ctKsf4ozpMViiMhyWOd8fKJfCyIgFyYZsE
        QIacuS6DHEhECeZVH9RnU
X-Received: by 2002:a05:600c:5d3:b0:3b4:c326:d096 with SMTP id p19-20020a05600c05d300b003b4c326d096mr1455789wmd.98.1663661965720;
        Tue, 20 Sep 2022 01:19:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM699k74ssA2kGuvCCoIhZaRcQrvxVrQkbuqjTWhJzQr+8vhrPtqFiDe49El6iFxQE3O3R+O2w==
X-Received: by 2002:a05:600c:5d3:b0:3b4:c326:d096 with SMTP id p19-20020a05600c05d300b003b4c326d096mr1455764wmd.98.1663661965297;
        Tue, 20 Sep 2022 01:19:25 -0700 (PDT)
Received: from ?IPV6:2003:cb:c712:2300:e82d:5a58:4fd8:c1e6? (p200300cbc7122300e82d5a584fd8c1e6.dip0.t-ipconnect.de. [2003:cb:c712:2300:e82d:5a58:4fd8:c1e6])
        by smtp.gmail.com with ESMTPSA id l9-20020a1ced09000000b003b49aa8083esm1325807wmh.42.2022.09.20.01.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 01:19:24 -0700 (PDT)
Message-ID: <a127720d-ed49-5d20-4d63-13da8914652d@redhat.com>
Date:   Tue, 20 Sep 2022 10:19:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 3/3] debugfs: fix error when writing negative value to
 atomic_t debugfs file
Content-Language: en-US
To:     Akinobu Mita <akinobu.mita@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        corbet@lwn.net, osalvador@suse.de, shuah@kernel.org,
        Zhao Gongyi <zhaogongyi@huawei.com>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        akpm@linux-foundation.org
References: <20220919172418.45257-1-akinobu.mita@gmail.com>
 <20220919172418.45257-4-akinobu.mita@gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220919172418.45257-4-akinobu.mita@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19.09.22 19:24, Akinobu Mita wrote:
> The simple attribute files do not accept a negative value since the
> commit 488dac0c9237 ("libfs: fix error cast of negative value in
> simple_attr_write()"), so we have to use a 64-bit value to write a
> negative value for a debugfs file created by debugfs_create_atomic_t().

Is that comment stale?

I would ahve thought you simply document that we restore the original 
behavior essentially by reverting 005747526d4f ("docs: fault-injection: 
fix non-working usage of negative values") and the using 
DEFINE_DEBUGFS_ATTRIBUTE_SIGNED accordingly.

> 
> This restores the previous behaviour by introducing
> DEFINE_DEBUGFS_ATTRIBUTE_SIGNED for a signed value.
> 
> Fixes: 488dac0c9237 ("libfs: fix error cast of negative value in simple_attr_write()")
> Reported-by: Zhao Gongyi <zhaogongyi@huawei.com>
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>


Apart from that

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


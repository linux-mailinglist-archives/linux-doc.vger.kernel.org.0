Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74B696BCCC8
	for <lists+linux-doc@lfdr.de>; Thu, 16 Mar 2023 11:30:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230023AbjCPKaJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Mar 2023 06:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbjCPKaF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Mar 2023 06:30:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7EB5FEB7
        for <linux-doc@vger.kernel.org>; Thu, 16 Mar 2023 03:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678962558;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eHniKnjuIv8qJtG69clFog5rWe2dmSl9LERE5gvQS/o=;
        b=fS8CAYzywBUTuTFiMlCfcuVHsxM5DBNHwFBqW0Qyr/7AiFjyzYCeaeLAL3R0T38z+suqQb
        uPYH4LWrxiuxPRFncB2W7F0Wh7bmFjd6CdSC252qYCaVcj414ScmB14LmFi1cgkJEBFJZL
        unUcFOcjDIC5WbAW5z2X1aov2AlrEQo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-147-owzJqc9QNtmuhMPOMEmoUw-1; Thu, 16 Mar 2023 06:29:17 -0400
X-MC-Unique: owzJqc9QNtmuhMPOMEmoUw-1
Received: by mail-ed1-f71.google.com with SMTP id r19-20020a50aad3000000b005002e950cd3so2412530edc.11
        for <linux-doc@vger.kernel.org>; Thu, 16 Mar 2023 03:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678962556;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHniKnjuIv8qJtG69clFog5rWe2dmSl9LERE5gvQS/o=;
        b=zpvPHrc6SolHaDqPtW6HqowkkIKEXJGGFkZL/g8Fa1k8IT4BlJTdtlsgQobX6ki6zt
         /weWNB35KsaHYavuduirXBYknz3nMZA+JrmlqU64nDor0868Psk0T3xOa8Va1hRvnwTe
         I7J9sv2Nm9HlWBygLyxfrRV7oliDfrGj6Nb8gfF6HfVMhFzTFObv6VLGQTHL13oNPojH
         LmaODgErOsZiwLFEH6OAXXflRcQTwL30ECWGRoFrdxwqfmFU+lxicDh6ikObOziMn7rx
         rc8s0AgNriv5Co0+i/NXIuyBD5BSCN/W3qTVui7PxbOu4oQSp8wH3ugggSXYlLmnGWkR
         55mA==
X-Gm-Message-State: AO0yUKXd/gP2Z5MB2eu1blndclBW2AgEn74/ZjP8+b9iRJDZ+3aobf3/
        tQj0VonOxuFnHzmN60tCaF7/rQlz3AuX4/nGwEgGomsSvw0opoBT5zAbvZ42I2x8U+faqHAQLMR
        byNpRjhZkdb99m1/Arzz8
X-Received: by 2002:a17:907:6746:b0:8a6:5720:9101 with SMTP id qm6-20020a170907674600b008a657209101mr9777673ejc.4.1678962556175;
        Thu, 16 Mar 2023 03:29:16 -0700 (PDT)
X-Google-Smtp-Source: AK7set+p6KWsDNnL9oBNL06Xru8BESWZajHVii0bIqIgJpn+AMSww8L7ff12HCderIUOI06gkYWMEg==
X-Received: by 2002:a17:907:6746:b0:8a6:5720:9101 with SMTP id qm6-20020a170907674600b008a657209101mr9777652ejc.4.1678962555841;
        Thu, 16 Mar 2023 03:29:15 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id lx20-20020a170906af1400b00930c6c01c9esm355771ejb.143.2023.03.16.03.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 03:29:15 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id 5D3FC9E2F84; Thu, 16 Mar 2023 11:29:14 +0100 (CET)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        Jakub Kicinski <kuba@kernel.org>, jesse.brandeburg@intel.com,
        anthony.l.nguyen@intel.com, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] docs: networking: document NAPI
In-Reply-To: <20230315223044.471002-1-kuba@kernel.org>
References: <20230315223044.471002-1-kuba@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Thu, 16 Mar 2023 11:29:14 +0100
Message-ID: <87o7ot9eh1.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jakub Kicinski <kuba@kernel.org> writes:

> Add basic documentation about NAPI. We can stop linking to the ancient
> doc on the LF wiki.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Looks good, just one nit:

[...]

> +Threaded NAPI
> +-------------
> +
> +Use dedicated kernel threads rather than software IRQ context for NAPI
> +processing. The configuration is per netdevice and will affect all
> +NAPI instances of that device. Each NAPI instance will spawn a separate
> +thread (called ``napi/${ifc-name}-${napi-id}``).

This section starts a bit abruptly. Maybe start it with "Threaded NAPI
is an operating mode that uses dedicated..." or something along those
lines?

Other than that:

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>


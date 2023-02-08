Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA8268F0F9
	for <lists+linux-doc@lfdr.de>; Wed,  8 Feb 2023 15:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbjBHOkP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 8 Feb 2023 09:40:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbjBHOkO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Feb 2023 09:40:14 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011A623DAD
        for <linux-doc@vger.kernel.org>; Wed,  8 Feb 2023 06:40:09 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id gr7so51708506ejb.5
        for <linux-doc@vger.kernel.org>; Wed, 08 Feb 2023 06:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IZeCaad2S5v0WlYmAkBmscLjPaa7FEu9p0Pwo9oVBD8=;
        b=H1amzHY2Vmv96dU/Mqz8wJN/1NBauyFwzoGDQNZ7HKDN52fKybMwwT6blU5i3s9huf
         gTO/NDrnsAzQcJRNQHq7kIR4YFasSEpTWo/I9RqnYUJv9SUMt3JiTnPLoUrRuRejWK6f
         7E1c/glSpcQzUj6ROOm+E0TvbOpdJZdcJB538Ve4q2Zx8V4c79TVpsurxr6oQpoqM+iV
         OfUShZoTpuz2iyEYdAHyhgbVsJLuH3V3Bef1gjFZUf3jJ3X8d8lyWlikMYbTjCodvaQM
         XkfaPEfgNeGhwOilvPUtHdthXvIlaeitlKj5SRhP2g2mxv3b2Mz1HJSvqo7PDXWsHIjp
         SeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZeCaad2S5v0WlYmAkBmscLjPaa7FEu9p0Pwo9oVBD8=;
        b=weY2hmqmvcU9/kjEuwE52gW8XDzwfAUrUFRl4DxmqVIBiSDLEsb9c2zBirNnAi19wO
         TbVUPRdvKS1NtEwHpaQnmDVef6Zmp0RTRn8HxkCToBcidLYT9q/HVxctl24hQ5zm8QpP
         ZTIxwLaQ1WWG7VXtmKmLVl/dGaiR+IUrkDi0bg5xZ8P4Dwv0x9+2RnLgkBSONScCBIYx
         Enf+NvENFM9JUUA7IPBDNBtaEkd1wVh5iVuRttIpFcZSvc8Uqppsj0ByCm4MBKHq/jfH
         7o+wRjvCjzAMV5VqDfh42EGaWfHSZ/OTj71YoPhFRaHggZuyG9XELzAz4Q+/HN9vaOdd
         2gng==
X-Gm-Message-State: AO0yUKWvWbn3A4JNJrzxkBFc6dk75CpYm48wMUJdLlF5MVdo7C1GgqYy
        pEK8ktHvJU8bFkU29FJCsCFi2g==
X-Google-Smtp-Source: AK7set/2TE/zjF7K7oGiloCD0nVojkQmteMchNTsYuP13dBVi34wLp1mGnNSsJXw834vICAFw+kPig==
X-Received: by 2002:a17:907:c297:b0:8aa:c35a:45e1 with SMTP id tk23-20020a170907c29700b008aac35a45e1mr3368820ejc.71.1675867207527;
        Wed, 08 Feb 2023 06:40:07 -0800 (PST)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id t21-20020a170906609500b008a58c3b8daesm3783210ejj.164.2023.02.08.06.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 06:40:07 -0800 (PST)
Date:   Wed, 8 Feb 2023 15:40:05 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     alejandro.lucero-palau@amd.com
Cc:     netdev@vger.kernel.org, linux-net-drivers@amd.com,
        davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
        edumazet@google.com, habetsm.xilinx@gmail.com,
        ecree.xilinx@gmail.com, linux-doc@vger.kernel.org, corbet@lwn.net,
        jiri@nvidia.com
Subject: Re: [PATCH v6 net-next 7/8] sfc: add support for devlink
 port_function_hw_addr_get in ef100
Message-ID: <Y+O0Rbkso/s8DGsq@nanopsycho>
References: <20230208142519.31192-1-alejandro.lucero-palau@amd.com>
 <20230208142519.31192-8-alejandro.lucero-palau@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208142519.31192-8-alejandro.lucero-palau@amd.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wed, Feb 08, 2023 at 03:25:18PM CET, alejandro.lucero-palau@amd.com wrote:
>From: Alejandro Lucero <alejandro.lucero-palau@amd.com>
>
>Using the builtin client handle id infrastructure, add support for
>obtaining the mac address linked to mports in ef100. This implies
>to execute an MCDI command for getting the data from the firmware
>for each devlink port.
>
>Signed-off-by: Alejandro Lucero <alejandro.lucero-palau@amd.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>

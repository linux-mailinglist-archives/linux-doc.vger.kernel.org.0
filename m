Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 336BA53D4CA
	for <lists+linux-doc@lfdr.de>; Sat,  4 Jun 2022 04:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350054AbiFDCHc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Jun 2022 22:07:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350007AbiFDCHb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 22:07:31 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D8B313B0
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 19:07:29 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id w3so7961909plp.13
        for <linux-doc@vger.kernel.org>; Fri, 03 Jun 2022 19:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ff/IhfCPH41H+OZSAXWB83B0oZdz+7dYMwu9KM64DQw=;
        b=ceZCdMwmQ+8G45eBMa/Yfy/rn6hFeHi7miTK9GBzQM0Na2P3sRiZNS33cnb4VAtjzP
         xIpg/TbOxpvQU/7irs6zU/aADpLUMdiGcQuFjUY0HLgYoj7I+paYvpkMvb7JSG3i2WpV
         RB8AiOpYfqRJRSM4j0uvO4NbwE9/vuMq0OlCVqFoOQHHwqw4R9zb8HRu2UuGSjQZsrn5
         0EEgLpQGwmi/WtYD9zaJaTOKpJs2zCUM8plapvqlq9jp9BW/VOdPPOytPkt47MuYdQMS
         UFeOSwXlBTOJgPu/GNZtGFNvWsU8Iqyc0140qnFy6XAmSJh4ocbn1O4jSoIEvdIQ8n1u
         5jig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ff/IhfCPH41H+OZSAXWB83B0oZdz+7dYMwu9KM64DQw=;
        b=wpLW2/lBKyFhgJ4WLfuls4rJQ8mK7osAR+Tqad1Via1n38CjElqVUybzD03xkyQlC0
         IBE3ejcjYQyGqth/b0MMTNtQxbQfTPh+oIl5aR5HSJCCbLHMVVblXkdl67ilH6OcH/7n
         nOBvbgkAhw4w22SuXxQLgA6Ks4Wa+J8/gALTpL69GdcG12MXauehdpABLTLb6wZE33xZ
         JwEO6dBM/K0WgD9Qi5rtceQ+gRYAwCaJSBXQFTgx0TdBbCJCujrHQRAB4dcxmYcYS5Qa
         vtndudQgzlFwJEA0Za1Fuaeb9eW8Gbj9pOfIJzKwQend7kll4pQ8dtxwtm0V7MzzOgD7
         aNuA==
X-Gm-Message-State: AOAM532ngWg7Kzevcg1zgqcmrG7k+RVrwIB2D5xrLQvrsStG7Lq0KuGO
        GSr23aQblolYxt66MVH/ba4xhA==
X-Google-Smtp-Source: ABdhPJyciJHiB4w7inpufhaHNS4EDndG3bC1pR3Eg/dKEgOX/M3M4LpojRWlNirzvjbZq8/I9eLCCA==
X-Received: by 2002:a17:90b:4c8c:b0:1e8:5607:7ec0 with SMTP id my12-20020a17090b4c8c00b001e856077ec0mr523504pjb.36.1654308449330;
        Fri, 03 Jun 2022 19:07:29 -0700 (PDT)
Received: from leoy-ThinkPad-X240s (ec2-54-67-95-58.us-west-1.compute.amazonaws.com. [54.67.95.58])
        by smtp.gmail.com with ESMTPSA id f17-20020a170902f39100b00163fd24ca8csm6079468ple.119.2022.06.03.19.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 19:07:28 -0700 (PDT)
Date:   Sat, 4 Jun 2022 10:07:21 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     James Clark <james.clark@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, broonie@kernel.org,
        acme@kernel.org, german.gomez@arm.com, mathieu.poirier@linaro.org,
        john.garry@huawei.com, Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] perf: arm64: Kernel support for Dwarf unwinding
 through SVE functions
Message-ID: <20220604020721.GB53464@leoy-ThinkPad-X240s>
References: <20220517100743.3020667-1-james.clark@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517100743.3020667-1-james.clark@arm.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 17, 2022 at 11:07:41AM +0100, James Clark wrote:
> Changes since v1:
> 
>   * Add Mark's review tag
>   * Clarify in docs that it's the SVE register length
>   * Split patchset into kernel side and Perf tool changes
> 
> When SVE registers are pushed onto the stack the VG register is required to
> unwind because the stack offsets would vary by the SVE register width at the
> time when the sample was taken.
> 
> These first two patches add support for sampling the VG register to the kernel
> and the docs. There is another patchset to add support to userspace perf.

Hi Catalin, Will,

Since James is on vacation, just want to ping if you could pick up
this two patches?  Mark.B has given review tags for this patch set.

I did this is because there has another patch set in perf tool to
enable SVE registsers [1], which is dependent on this patch set's
merging.

Thanks,
Leo

[1] https://lore.kernel.org/lkml/20220525154114.718321-1-james.clark@arm.com/

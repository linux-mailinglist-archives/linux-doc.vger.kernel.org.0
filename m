Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3AD755900
	for <lists+linux-doc@lfdr.de>; Mon, 17 Jul 2023 03:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbjGQBQE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 16 Jul 2023 21:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbjGQBQD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 Jul 2023 21:16:03 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7948FE4B
        for <linux-doc@vger.kernel.org>; Sun, 16 Jul 2023 18:16:01 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-676f16e0bc4so2541547b3a.0
        for <linux-doc@vger.kernel.org>; Sun, 16 Jul 2023 18:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689556561; x=1692148561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7oYHq1p/oXp0puIhFy9OrnpLdy2w5rBXDTDnolu96uM=;
        b=lpLLCmgz30TGZmwSdUJe4tDFJz5Fcd74dvul6RV1b10GYjbMvH7ymiHWYqHYwl1XDU
         AXvc9ttDTLXuhQDQ6AawB/CVruvT818GWrcl+rSI9CtyU4dUNshxytZ8qMbOnyt5hWo/
         NR2IUmY18rsbM26/5zCo5bACAbL5EdbpNCDmCSeu04IKz2/F38pSlK90Ee6/pp07p8iM
         2b312nFSgBZHusqLwvGAjAXkWhrRd+L6jTlWmn40iZ2VYBTHzaXHGEHE1QU2mvzpYcw2
         PcFrQ4ACun+46PghhI95QzcyTb0HxTlK8n0ChaNriwetm1HejWpDgt5yc+9WRH0WWLCv
         I4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689556561; x=1692148561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oYHq1p/oXp0puIhFy9OrnpLdy2w5rBXDTDnolu96uM=;
        b=CC3/etRGBt+no6n0JYsQFOC95ZgdIG00qJnEfn84ZabcbUPf8WGwHJSiWTurbqlL98
         5eG3KAsa+Yy+lozjv4d+zrhTRrE0samIHMo5xzj9JmMg42OPCw9vgVSxTvyxf1ybo4bT
         Wer5tFh4E2ra5zs70qlVIKfxNFuwbak83ny33eBNVI1LCb4wKqpz56VG5WcwkjT0hSYl
         Np5b+z3f3qnWiSOdk6m+kAQwQoW3k2OxK06rK6u3qeDoJOOX2PKu9LDkR+k8BgblOIb+
         UlcTm4pery3VtwdSmTDml/TJSeLclvFj8TiHymjO9sYxipNPbNZGXA+6Ufb3YDXkTP9z
         IYwg==
X-Gm-Message-State: ABy/qLa7kvAxGinJvQ1qQ2BTKooz6SczetJnXo/zPvAyru7GbpoK3DLi
        a1MAeJiTeSTKJxNkWlGpnOCxPA==
X-Google-Smtp-Source: APBJJlGT729jgOISi92Vcn9sb6yb8hOJik/a8kpi8tvYnR/R2ZGG42BlJaza9mC2BASDQp7lhQ53bw==
X-Received: by 2002:a05:6a20:2451:b0:126:43f7:e271 with SMTP id t17-20020a056a20245100b0012643f7e271mr12234973pzc.39.1689556560877;
        Sun, 16 Jul 2023 18:16:00 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1bdd:1b8b:7a6:78d0])
        by smtp.gmail.com with ESMTPSA id k10-20020a633d0a000000b0054fe6bae952sm11687701pga.4.2023.07.16.18.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 18:16:00 -0700 (PDT)
Date:   Sun, 16 Jul 2023 19:15:57 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     agross@kernel.org, konrad.dybcio@linaro.org, corbet@lwn.net,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        srinivas.kandagatla@linaro.org,
        Mukesh Ojha <quic_mojha@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: (subset) [PATCH v3 00/18] Add basic Minidump kernel driver
 support
Message-ID: <ZLSWTaMtr9UGmrDy@p14s>
References: <1683133352-10046-1-git-send-email-quic_mojha@quicinc.com>
 <168945921478.1805013.7211960599963339759.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <168945921478.1805013.7211960599963339759.b4-ty@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jul 15, 2023 at 03:13:34PM -0700, Bjorn Andersson wrote:
> 
> On Wed, 03 May 2023 22:32:14 +0530, Mukesh Ojha wrote:
> > Minidump is a best effort mechanism to collect useful and predefined data
> > for first level of debugging on end user devices running on Qualcomm SoCs.
> > It is built on the premise that System on Chip (SoC) or subsystem part of
> > SoC crashes, due to a range of hardware and software bugs. Hence, the
> > ability to collect accurate data is only a best-effort. The data collected
> > could be invalid or corrupted, data collection itself could fail, and so on.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [01/18] remoteproc: qcom: Expand MD_* as MINIDUMP_*
>         commit: 318da1371246fdc1806011a27138175cfb078687
>

Krzysztof asked for modifications on this patch.

> Best regards,
> -- 
> Bjorn Andersson <andersson@kernel.org>

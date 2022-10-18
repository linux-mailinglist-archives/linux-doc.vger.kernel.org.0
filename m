Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E121D6020F1
	for <lists+linux-doc@lfdr.de>; Tue, 18 Oct 2022 04:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbiJRCKy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 Oct 2022 22:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbiJRCKc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Oct 2022 22:10:32 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E09B228714
        for <linux-doc@vger.kernel.org>; Mon, 17 Oct 2022 19:09:57 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id l1-20020a17090a72c100b0020a6949a66aso12664440pjk.1
        for <linux-doc@vger.kernel.org>; Mon, 17 Oct 2022 19:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jiyLEWpU5Vr8UNvHaI2P6jWrDxYlYjUoltJSjloVH1I=;
        b=hX0obQ/EZm8Pl/NdNDUk3PWb0v9ZnyxW4jGAKyYBOMy/QF+aY3BkbN/bFyiU29BdyG
         0Sft8RgezxoohSYTfnh6tT+8bxHNJK5Z4rvWiLbIS0HLpDqQQ5p1INRGVmM1R+Hfk6xG
         JtsXhnWrV8oePjEH150pfzyQPEXPJOHPD7a58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiyLEWpU5Vr8UNvHaI2P6jWrDxYlYjUoltJSjloVH1I=;
        b=G9MndEyHXhSNwya6YxvMi8v6BhV5jQtwLEQKkmjnZIRrEzyW905le4T12maLHy62CB
         d62kMGyjwmvlJjxE5W+Qi7YDX2mfmrf/hdlxU2hhNUYmZ8iMQ7CTV1o/RF2fCTBjG3U8
         sRDfS5iLjUM9GRpCIdLQjGZs/FXAxDBkEneV0cdcUnfim7kjSsYW6jwq0Foz8d4I/SU2
         ecRIGk+SoBMmN9T9dRQGzYbgPPPNaQ8frVLrpF5Ge7itUkt8NTSNNVe7U1lLn55J8+U/
         UdUWZ+g54NbRiUeomGddNYwu+pMWByaPMHQZ7BfjRUz8GOR5Acoq/VIJoXUX6MMqH6Ah
         ignw==
X-Gm-Message-State: ACrzQf1mLQKQFGDOKSmBx5fl5/hrGl4pjjclsOQJ74t/I4nMOMNFhm2p
        MIAclsTGQet2BTarXKCrVmzhyw==
X-Google-Smtp-Source: AMsMyM76Iwrloo6pXjHpP+l4o1Nu/SlNFgkPEzmA2JfePmZI4bka2pMHfzkcmzlsg/0cbux1EOTczQ==
X-Received: by 2002:a17:902:8b83:b0:17f:5de5:c5ff with SMTP id ay3-20020a1709028b8300b0017f5de5c5ffmr675629plb.52.1666058986011;
        Mon, 17 Oct 2022 19:09:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p2-20020a17090a284200b0020dafceec65sm7453398pjf.13.2022.10.17.19.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 19:09:45 -0700 (PDT)
Date:   Mon, 17 Oct 2022 19:09:44 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-hardening@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        "Darrick J. Wong" <djwong@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] overflow: Fix kern-doc markup for functions
Message-ID: <202210171909.65FFFB5601@keescook>
References: <20221017035732.1968394-1-keescook@chromium.org>
 <6f8aa670-fb4f-3ff9-bcd9-8490e752b349@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f8aa670-fb4f-3ff9-bcd9-8490e752b349@gmail.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 18, 2022 at 10:11:43AM +0900, Akira Yokosawa wrote:
> Hi,
> 
> On Sun, 16 Oct 2022 20:57:32 -0700, Kees Cook wrote:
> > Fix the kern-doc markings for several of the overflow helpers and move
> > their location into the core kernel API documentation, where it belongs
> > (it's not driver-specific).
> > 
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: Akira Yokosawa <akiyks@gmail.com>
> LGTM,
> 
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Thanks!

> Kees, which tree do you expect this one to go through?

If the Documentation/* changes look okay, I'd rather carry it in my tree
since I'm going to be poking at more functions in there soon.

-- 
Kees Cook

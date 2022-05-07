Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53C9F51E57F
	for <lists+linux-doc@lfdr.de>; Sat,  7 May 2022 10:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390619AbiEGITI (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 7 May 2022 04:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383661AbiEGITH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 7 May 2022 04:19:07 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E527E181
        for <linux-doc@vger.kernel.org>; Sat,  7 May 2022 01:15:20 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id iq10so8991486pjb.0
        for <linux-doc@vger.kernel.org>; Sat, 07 May 2022 01:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xXMo3Iu7KrrtaTJNja1MGuo4fFLfSoIDMgbn2nLpUdo=;
        b=aB3QfVlpaiIgXfJVGa7V+xBdgjQvqYuHrEHa44Lugwxotnhmu7SYRcLLaANWk71r7Z
         pj3AAOtEcShLdlyWi5orxLvllFG0gItB9nAOqfTlgDjuD/iOCgN8swAhV0TJGNdEtGoj
         SWjIiHyeSoakBw0OKka4o4zUdMj/KvNxrvNB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xXMo3Iu7KrrtaTJNja1MGuo4fFLfSoIDMgbn2nLpUdo=;
        b=e1GOK5jxdx6b7nau4jBhVHrGZPbdYaflLFDRPotAxs8ZOUbl8Ki4fftSnZH8sU45P4
         AJslmVx8k38HuK8aIac9ciVycq406vawHO9FGNq2moBUEkGd30jWAneMELtmqO9/V2Mf
         H6bpTw1t6Ke5mViRBonx+HaZWFqLnG1wryvEdfyjxG2QCd6IlYKDg9K2Av1K9Z16xXNb
         w2VDxSstGARgFk14Crj+F5HZrHdGNju9/u/5SwfMVot9YS000LG/4A/t7C9uXT0vJynH
         GM1CT0+p8j/f2/pwdEylYROryYJAP1nGEdzQQiFKH293+Hb5zgPIFOfqQu1RzTNYW74a
         CPuw==
X-Gm-Message-State: AOAM533E51/k41FTU2wWKtZD3+AZ1VMiOUg5mrA9EtHIgMP87YdwL9az
        kfNCBAwoiAlujAJxRRTl8fkR0Q==
X-Google-Smtp-Source: ABdhPJydSfltgLSAmZDq14SURGTE/xbPPqsxlO5JsmHDH/lqhJQlNRUXyO6s6VCoKMx3frkX+VykWg==
X-Received: by 2002:a17:902:7597:b0:15e:b5d3:267d with SMTP id j23-20020a170902759700b0015eb5d3267dmr7774306pll.55.1651911320431;
        Sat, 07 May 2022 01:15:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q1-20020a056a00084100b005107da0f34csm2981701pfk.20.2022.05.07.01.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 May 2022 01:15:20 -0700 (PDT)
Date:   Sat, 7 May 2022 01:15:19 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>, Gary Guo <gary@garyguo.net>,
        Boris-Chengbiao Zhou <bobo1239@web.de>,
        Yuki Okushi <jtitor@2k36.org>, Wei Liu <wei.liu@kernel.org>,
        Daniel Xu <dxu@dxuuu.xyz>, Julian Merkle <me@jvmerkle.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v6 18/23] docs: add Rust documentation
Message-ID: <202205070114.88C59DF@keescook>
References: <20220507052451.12890-1-ojeda@kernel.org>
 <20220507052451.12890-19-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220507052451.12890-19-ojeda@kernel.org>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, May 07, 2022 at 07:24:16AM +0200, Miguel Ojeda wrote:
> Most of the documentation for Rust is written within the source code
> itself, as it is idiomatic for Rust projects. This applies to both
> the shared infrastructure at `rust/` as well as any other Rust module
> (e.g. drivers) written across the kernel.
> 
> However, these documents contain general information that does not
> fit particularly well in the source code, like the Quick Start guide.
> 
> It also contains an asset (SVG logo) used for the `rustdoc` target
> and a few other small changes elsewhere in the documentation folder.

I like the docs! :) It'll be interesting to see how we can grow
cross-linking between rustdoc and kerndoc.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

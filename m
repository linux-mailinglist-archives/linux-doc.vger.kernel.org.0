Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADE475A5482
	for <lists+linux-doc@lfdr.de>; Mon, 29 Aug 2022 21:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiH2T0H (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 29 Aug 2022 15:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiH2T0F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Aug 2022 15:26:05 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC6148A7CA
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 12:26:02 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id u9-20020a17090a1f0900b001fde6477464so2547437pja.4
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 12:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=VhWA9zltNIvjVh8Z8DuaAQPbsy5x2B8HO8rAH51nZcs=;
        b=eJWdBVSqu/L3b4Gx52Gb4jKAo92U2TKDhf7bztvP63HYkGxkmA2CVM9dFnWwHtbxyi
         /oqM5qROQsahReI/SrXkrJbmthPE66kBHogzexruiDDXvtE1a30nJPJFmAlle+/lnR0z
         /2BBq6o/dTJ7AVRL7iOu8FeE1wwhMaUGWML4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=VhWA9zltNIvjVh8Z8DuaAQPbsy5x2B8HO8rAH51nZcs=;
        b=h3b/qA0SxH4RDg4lKvc7FEIckOnwbCmuM850SNazXcATk6gzPkIZz7cOeGbjbOQ4CZ
         22eoQLITjHpknd5Bkj/EEJrKqu7/Eubo1q3nFQcSLks+guA+UN3DDDy0D7zisQLr3+9y
         vZkFfHfuP32MrSZFSiwK8iaVKnMxOhGLDRkh1GU7uTornpRo1bbcVpHx4WMT41QDi9Pv
         D9FysTA/L0QARDr7ED7Py44dJQVmp9iE+Tsx8dB/0NHPCIdVO7EGOsXwuXBGmnK6+Xre
         ZAhf9XefCjke21tLegFw1LrURLiBEDfVQsAO7/SP1IZ5aEx/1CCweQmAdiOBhd5hyq4o
         66xA==
X-Gm-Message-State: ACgBeo23uDQZ4YCAKiLsxCqHJfo0HnyQVv9ol9aaKvcMltC07EY2eQe9
        OgTTnv2IhNCzpdMjIz+EmaIWiA==
X-Google-Smtp-Source: AA6agR7u3y84UCyhfAk1IOVCe6FUtEm4rdvgw806xCycjSX/X3gzP52Q1hWrrhqe4GxNhc/peNJs5A==
X-Received: by 2002:a17:902:7003:b0:172:cbb0:9af8 with SMTP id y3-20020a170902700300b00172cbb09af8mr18161965plk.57.1661801161717;
        Mon, 29 Aug 2022 12:26:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t17-20020a170902e85100b00172e6c66f84sm7901946plg.148.2022.08.29.12.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 12:26:00 -0700 (PDT)
Date:   Mon, 29 Aug 2022 12:25:59 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Robert Elliott <elliott@hpe.com>
Cc:     mpe@ellerman.id.au, nanya@linux.vnet.ibm.com, asahiroy@kernel.org,
        michal.lkml@markovi.net, corbet@lwn.net, ndesaulniers@google.com,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/core-api: expand Fedora instructions for GCC plugins
Message-ID: <202208291225.A0D3FAFC@keescook>
References: <20220827193836.2582079-1-elliott@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220827193836.2582079-1-elliott@hpe.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Aug 27, 2022 at 02:38:36PM -0500, Robert Elliott wrote:
> In Fedora 36, cross-compiling an allmodconfig configuration
> for other architectures on x86 fails with this problem:
> 
> In file included from ../scripts/gcc-plugins/gcc-common.h:95,
>                  from ../scripts/gcc-plugins/latent_entropy_plugin.c:78:
> /usr/lib/gcc/aarch64-linux-gnu/12/plugin/include/builtins.h:23:10: fatal
> error: mpc.h: No such file or directory
>    23 | #include <mpc.h>
>       |          ^~~~~~~
> compilation terminated.
> 
> In that distro, that header file is available in the separate
> libmpc-devel package.
> 
> Although future versions of Fedora might correctly mark
> that dependency, mention this additional package.
> 
> To help detect such problems ahead of time, describe the
>     gcc -print-file-name=plugin
> command that is used by scripts/gcc-plugins/Kconfig to detect
> plugins [1].
> 
> [1] https://lore.kernel.org/lkml/CAHk-=wjjiYjCp61gdAMpDOsUBU-A2hFFKJoVx5VAC7yV4K6WYg@xxxxxxxxxxxxxx/
> 
> Fixes: 43e96ef8b70c50f ("docs/core-api: Add Fedora instructions for GCC plugins");
> Signed-off-by: Robert Elliott <elliott@hpe.com>

Thanks!

Reviewed-by: Kees Cook <keescook@chromium.org>

Jon, do you want to take this since it's entirely in the .rst file?

-- 
Kees Cook

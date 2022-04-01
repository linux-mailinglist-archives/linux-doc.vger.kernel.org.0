Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 199BD4EE830
	for <lists+linux-doc@lfdr.de>; Fri,  1 Apr 2022 08:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245393AbiDAG2U (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 1 Apr 2022 02:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233382AbiDAG2T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Apr 2022 02:28:19 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD76E25FD5E
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 23:26:29 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id r13so2678117wrr.9
        for <linux-doc@vger.kernel.org>; Thu, 31 Mar 2022 23:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=79X7EtfQCqwMr9U+t9hQNmDXR2b/b+GMQS5utWvmVGQ=;
        b=fmfXk+Tv4xoqeekZzf6ZPTtQTZzHuzsEiNhIbI99tXJEhnC/b+7H7/6zXj3xUr3Gk1
         d7AiW1f/qw/y5HSVcIGSlkjHg5+2XT2CtNk9FW5dCbsF6Gh/RnvSVzGWJuJ5+8ikninc
         Jh5BQrsxGB93d3lgswATCM7ggLH3Ho4K6b2roHHWA9wytrD5u8mGLDjESgELUx+9fUAn
         9zBXebPeViMHI+GTxJDVicHYBwg/a41E116freioQua2oX9WgeVY74IRTx7UNpiYJ9qW
         bW6WXv2TyTeHljiOY7cbryPfWDEOzNK8LFM+cZbFtNiQRGIig5RB+XRc8iRFUN+qmZii
         Sc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=79X7EtfQCqwMr9U+t9hQNmDXR2b/b+GMQS5utWvmVGQ=;
        b=3YzZ1+CIevbYYilSw8FOH7cc8l/d1ngq7PnLQJgXw6XyWqvVt+P2o5QODzMV+COqzR
         pV4OWLsC5Xfmt8nJtJ0WMj94nGcT1j0c/alstf7yBxMCt0o3dvt5028KxKJ1qOA4Qh2G
         b6kqREYbOUU7ehktoeKozxneKoRIikJ1bqXv1UZJpqB7CxmbfHuTzSkNhyDcHCe61eMa
         XB2TZIAEeMO48jAC2Tmns+p+3e63sa/w0l05SF403ThhZUq0/wF55QorG2MNc8APo7cT
         vfHhqXml4zPQKi+nRr7ionFpAZJCNZEcXwXBakt641koOGlaJfXx2L0z8DvXUYD/eeLh
         9U9A==
X-Gm-Message-State: AOAM531vwKnDdI3arEIPJSQUz+9vIgtY+U+kjwyhIzKcace1JxagzmZD
        OXS1IDrajUIEPOpokxmh4KWEdgDjVF/HphEFjrC3JA==
X-Google-Smtp-Source: ABdhPJxnCUH3DJN5Nhe1ho/cqLXP0iSBxtKYIuNCsF9SlZXn6TImxlu2h66ypv37iXWHmKcGWs6XmmUw8zB+duCMT7A=
X-Received: by 2002:a05:6000:2c7:b0:205:cb41:2a82 with SMTP id
 o7-20020a05600002c700b00205cb412a82mr6304240wry.395.1648794388277; Thu, 31
 Mar 2022 23:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220401024707.10550-1-rdunlap@infradead.org>
In-Reply-To: <20220401024707.10550-1-rdunlap@infradead.org>
From:   David Gow <davidgow@google.com>
Date:   Fri, 1 Apr 2022 14:26:16 +0800
Message-ID: <CABVgOSk-8O9jLZncbJvsZdTaA9VjBKbByktnwhPCNJHWME2Nug@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: eliminate code-block warnings
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Harinder Singh <sharinder@google.com>,
        Tim Bird <tim.bird@sony.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 1, 2022 at 10:47 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix Sphinx complaints about code-block directive missing an argument.
> For start.rst, add "none" since that is already heavily used in that
> file. For run_wrapper.rst, use the simpler "::" literal block instead.
>
> dev-tools/kunit/start.rst:83: WARNING: Error in "code-block" directive:
> 1 argument(s) required, 0 supplied.
>
> dev-tools/kunit/run_wrapper.rst:17: WARNING: Error in "code-block" directive:
> 1 argument(s) required, 0 supplied.
> dev-tools/kunit/run_wrapper.rst:23: WARNING: Error in "code-block" directive:
> 1 argument(s) required, 0 supplied.
> dev-tools/kunit/run_wrapper.rst:31: WARNING: Error in "code-block" directive:
> 1 argument(s) required, 0 supplied.
> dev-tools/kunit/run_wrapper.rst:51: WARNING: Error in "code-block" directive:
> 1 argument(s) required, 0 supplied.
> dev-tools/kunit/run_wrapper.rst:57: WARNING: Error in "code-block" directive:
> 1 argument(s) required, 0 supplied.
> dev-tools/kunit/run_wrapper.rst:78: WARNING: Error in "code-block" directive:
> 1 argument(s) required, 0 supplied.
> dev-tools/kunit/run_wrapper.rst:85: WARNING: Error in "code-block" directive:
> 1 argument(s) required, 0 supplied.
> dev-tools/kunit/run_wrapper.rst:109: WARNING: Error in "code-block" directive:
> 1 argument(s) required, 0 supplied.
> dev-tools/kunit/run_wrapper.rst:116: WARNING: Error in "code-block" directive:
> 1 argument(s) required, 0 supplied.
> dev-tools/kunit/run_wrapper.rst:124: WARNING: Error in "code-block" directive:
> 1 argument(s) required, 0 supplied.
> dev-tools/kunit/run_wrapper.rst:139: WARNING: Error in "code-block" directive:
> 1 argument(s) required, 0 supplied.
> dev-tools/kunit/run_wrapper.rst:162: WARNING: Error in "code-block" directive:
> 1 argument(s) required, 0 supplied.
>
> Fixes: c48b9ef1f794 ("Documentation: KUnit: Rewrite getting started")
> Fixes: 46201d47d6c4 ("Documentation: kunit: Reorganize documentation related to running tests")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Brendan Higgins <brendanhiggins@google.com>
> Cc: linux-kselftest@vger.kernel.org
> Cc: kunit-dev@googlegroups.com
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Harinder Singh <sharinder@google.com>
> Cc: Tim Bird <tim.bird@sony.com>
> ---

Thanks for fixing these.

Out of curiosity, is there a particular config option or version you
need to set in sphinx to get these warnings? My setup (with Sphinx
4.3.2) doesn't warn on this.

Nevertheless, I'll keep a closer eye on code-block directives in future.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

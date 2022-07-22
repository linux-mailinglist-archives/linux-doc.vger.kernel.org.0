Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5284857D7E2
	for <lists+linux-doc@lfdr.de>; Fri, 22 Jul 2022 02:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbiGVAyy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 21 Jul 2022 20:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiGVAyx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jul 2022 20:54:53 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B34392866
        for <linux-doc@vger.kernel.org>; Thu, 21 Jul 2022 17:54:52 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id bp15so6007705ejb.6
        for <linux-doc@vger.kernel.org>; Thu, 21 Jul 2022 17:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U8J/Z5o8rP43OFNK4dwBwF5FHxDhcbpnryZtpACIPwU=;
        b=aakNHfhMNCA0Ayjj5tI1Ms0awBaD3YllV8NPK58+gKhSeUP1jJPwOhaWZhyYmdCU+/
         6BulWvYbOgQK+FnZ0gds7HGdnRuC+2FVN1Vpre7P3BF8b7DbG9CieOE1SxfIBFF9whwq
         AYQn4tOGAWlb0quQAOQ2AMk8VeEmg75zQzeQIdvyImKWNGHUvH6GSJDAUlgL2EyXzW4x
         iCqBRjFtavWA5jJU7BSqJ7xa1dJhU/CDE+7SQB3B5qm6V+zQ12QME6KJkaaJOqawRDc2
         D2JjOosC7qxjEpplxHSnlP1CrtEWAGgCu1cxAf5By3vLp4reWfCmo8S4lJ3RPC41VDin
         WtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U8J/Z5o8rP43OFNK4dwBwF5FHxDhcbpnryZtpACIPwU=;
        b=nhD4D+qbKL14+YwxfqIeBYi+iepiy+WleDCQsBf+8McrZYMkjrRcOAS8J5v8Q/YGf6
         z02+3eS7xI4yzdxdbhhom0/70gmVUmQmMy4VLLXIFvINMMN/5CEiusCQIq/VOCrS7HEO
         k+RcAuHeQQ26U6JZ7XYXNeJAnT6kjQJVnglN/T+QF4/fSv1MtY+YzqZp+VAz+664qNCA
         XV5s6exDfCt/RojlfxC9k5vbDxdGVVAZ2jesTeCjlz7285XygszKP9WBsgGo40iCCTSq
         fVTp41CxvWBlPlU0CQI3iIMKxKYV26TNmvpEbbntMpxQ6L0JwlQ0L8GZe0VJ8X1WOKEF
         7xGQ==
X-Gm-Message-State: AJIora+fZx8L2MWg3A6tPlhP6fdG2hMiB+QUjR64SQekSCd7bO2VGjM8
        LJFhFOfcHdD6Wk8XIjDRPjXaCIq6j9/hdLE+HSiE+A==
X-Google-Smtp-Source: AGRyM1uDxgMvrFAGOH8NXgwd24p1U2/l21XSULTaM0eD9AEgA+DYH5MNUIJIQI2mbjPa9ZYg3esSksCRsYBkV4p1gVA=
X-Received: by 2002:a17:907:7d8b:b0:72f:2306:329a with SMTP id
 oz11-20020a1709077d8b00b0072f2306329amr954052ejc.369.1658451290242; Thu, 21
 Jul 2022 17:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220721081026.1247067-1-sadiyakazi@google.com>
In-Reply-To: <20220721081026.1247067-1-sadiyakazi@google.com>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Thu, 21 Jul 2022 17:54:38 -0700
Message-ID: <CAGS_qxoE7F0iWCghO2BmK+-4k-cicriGUaTuE_86oSFP_dBeBQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: kunit: Add CLI args for kunit_tool
To:     Sadiya Kazi <sadiyakazi@google.com>
Cc:     brendanhiggins@google.com, davidgow@google.com,
        skhan@linuxfoundation.org, corbet@lwn.net, mairacanal@riseup.net,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 21, 2022 at 1:26 AM 'Sadiya Kazi' via KUnit Development
<kunit-dev@googlegroups.com> wrote:
>
> Run_wrapper.rst was missing some command line arguments. Added
> additional args in the file.
>
> Signed-off-by: Sadiya Kazi <sadiyakazi@google.com>

Reviewed-by: Daniel Latypov <dlatypov@google.com>

Looks good!
A minor suggestion down below to go along with what everyone else has said.

> +- ``--qemu_config``: Specifies the path to a file containing a
> +  custom qemu architecture definition. This should be a python file
> +  containing a `QemuArchParams` object.
> +
> +- ``--qemu_args``: Specifies additional QEMU arguments, for example, "-smp 8".

Minor nit: I think ``-smp 8`` would be a bit better here.
It feels like it would fit what we did with other example arguments.

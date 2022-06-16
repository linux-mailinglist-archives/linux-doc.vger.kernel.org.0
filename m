Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0590154D8D8
	for <lists+linux-doc@lfdr.de>; Thu, 16 Jun 2022 05:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357429AbiFPDUO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 15 Jun 2022 23:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350033AbiFPDUN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jun 2022 23:20:13 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66265AA57
        for <linux-doc@vger.kernel.org>; Wed, 15 Jun 2022 20:20:11 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-313a8a8b95aso1857667b3.5
        for <linux-doc@vger.kernel.org>; Wed, 15 Jun 2022 20:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yZC94QyGrxl20UVmi6Bbzh0z18nlmSnWSZKrrHOOlIU=;
        b=nHLVhA6zL+rr1952EK4dDV99gYj7eeUWk5vsiO5wZJUyS45PabFeca4mj5gjXNGyLc
         1zJFAAjJvkbtkdYElrt6Zs8VWwCTee9GP375AJDVmzZHPV1WuASUTbZ2dcohWHoDlfdH
         BrdsWLzS/BhNKK4O9esn7kFkseBYhREmF5IqhNjOeT1sTyL9Gdpf5AarECMER4NXc3h/
         hbxuG7PBpvVWc19f3t5qU2lSnef2mJW2q3AB4dCEA1h3x9HBsnFobZyy0Hiqf7lx6zMc
         KTWzzys98kURmMHk2EAoi64fjETZKhn53ZJsIRZhvPM1/zU8M/HboMjrXDMAlHNq+yhU
         9i2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yZC94QyGrxl20UVmi6Bbzh0z18nlmSnWSZKrrHOOlIU=;
        b=KdVCc/whWNvOFCAAqNu7omkslIkQ1aUGsd93b5JNdEqbAs7CKln1MntQYD3p6yH9Bj
         YFNDk1pM/YOP4sUTF8aNUeWlxgSDHL3aFqmtGC5UFDe34nv5st8yaBT3ZwNBMGthXftE
         iKsHsbdjn/eRkKh1P9ezNwSCiBs9f6q0G9fd3k8tBdP4Ow7V7dkfQcVGNbB81sNI/z4F
         rswAhSaA1+nCiB30Xb9ODWCOUGDzoLTS1o0OjhT8HBI21+V7hwlXomBV8EUp+DVpqrEq
         hO9Y85pffAdcc1InVMMnxRwUhcBhM6PzrDWza/KktRqJBreUUWBUwL+Hfy0ijqbKs1pc
         vBGA==
X-Gm-Message-State: AJIora9RpA8nsQBQGfOdKS7VuhO3yT0fAnQutGp62mNl6oYf4Q0A+iO3
        Tf84IPKgEdQ4UIRZx7bFswH3GFyKIUDgG3RrQRLAzQ==
X-Google-Smtp-Source: AGRyM1tRDeWpcUh85R6nZJELiK50ZhN1KTNctwS1M4XiRR4sm0BrQ50F4dmy0+hMKWAlzdbrYVLXOGYB6+n3mVA+Xyw=
X-Received: by 2002:a81:7557:0:b0:317:6536:d404 with SMTP id
 q84-20020a817557000000b003176536d404mr2710980ywc.459.1655349610880; Wed, 15
 Jun 2022 20:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220604010101.719508-1-saravanak@google.com>
In-Reply-To: <20220604010101.719508-1-saravanak@google.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 15 Jun 2022 20:19:34 -0700
Message-ID: <CAGETcx_9AxUzmSFou=PqLpAJ6P_k4mq5tjFpt0WOC348RRBF0g@mail.gmail.com>
Subject: Re: [PATCH v2] module: Add support for default value for module async_probe
To:     Jonathan Corbet <corbet@lwn.net>,
        Luis Chamberlain <mcgrof@kernel.org>
Cc:     kernel-team@android.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 3, 2022 at 6:01 PM Saravana Kannan <saravanak@google.com> wrote:
>
> Add a module.async_probe kernel command line option that allows enabling
> async probing for all modules. When this command line option is used,
> there might still be some modules for which we want to explicitly force
> synchronous probing, so extend <modulename>.async_probe to take an
> optional bool input so that async probing can be disabled for a specific
> module.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
> v1->v2:
> - Updated the documentation to capture all the details/changes.

Luis,

Gentle reminder.

-Saravana

>
>  Documentation/admin-guide/kernel-parameters.txt | 17 +++++++++++++++--
>  kernel/module/main.c                            | 11 ++++++++++-
>  2 files changed, 25 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 710b52d87bdd..5174a08e20b0 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1147,8 +1147,12 @@
>         nopku           [X86] Disable Memory Protection Keys CPU feature found
>                         in some Intel CPUs.
>
> -       <module>.async_probe [KNL]
> -                       Enable asynchronous probe on this module.
> +       <module>.async_probe[=<bool>] [KNL]
> +                       If no <bool> value is specified or if the value
> +                       specified is not a valid <bool>, enable asynchronous
> +                       probe on this module.  Otherwise, enable/disable
> +                       asynchronous probe on this module as indicated by the
> +                       <bool> value. See also: module.async_probe
>
>         early_ioremap_debug [KNL]
>                         Enable debug messages in early_ioremap support. This
> @@ -3201,6 +3205,15 @@
>                         log everything. Information is printed at KERN_DEBUG
>                         so loglevel=8 may also need to be specified.
>
> +       module.async_probe=<bool>
> +                       [KNL] When set to true, modules will use async probing
> +                       by default. To enable/disable async probing for a
> +                       specific module, use the module specific control that
> +                       is documented under <module>.async_probe. When both
> +                       module.async_probe and <module>.async_probe are
> +                       specified, <module>.async_probe takes precedence for
> +                       the specific module.
> +
>         module.sig_enforce
>                         [KNL] When CONFIG_MODULE_SIG is set, this means that
>                         modules without (valid) signatures will fail to load.
> diff --git a/kernel/module/main.c b/kernel/module/main.c
> index fed58d30725d..47085795f037 100644
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -2410,6 +2410,12 @@ static void do_free_init(struct work_struct *w)
>         }
>  }
>
> +#undef MODULE_PARAM_PREFIX
> +#define MODULE_PARAM_PREFIX "module."
> +/* Default value for module->async_probe_requested */
> +static bool async_probe;
> +module_param(async_probe, bool, 0644);
> +
>  /*
>   * This is where the real work happens.
>   *
> @@ -2630,7 +2636,8 @@ static int unknown_module_param_cb(char *param, char *val, const char *modname,
>         int ret;
>
>         if (strcmp(param, "async_probe") == 0) {
> -               mod->async_probe_requested = true;
> +               if (strtobool(val, &mod->async_probe_requested))
> +                       mod->async_probe_requested = true;
>                 return 0;
>         }
>
> @@ -2797,6 +2804,8 @@ static int load_module(struct load_info *info, const char __user *uargs,
>         if (err)
>                 goto bug_cleanup;
>
> +       mod->async_probe_requested = async_probe;
> +
>         /* Module is ready to execute: parsing args may do that. */
>         after_dashes = parse_args(mod->name, mod->args, mod->kp, mod->num_kp,
>                                   -32768, 32767, mod,
> --
> 2.36.1.255.ge46751e96f-goog
>

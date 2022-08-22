Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 871D559C160
	for <lists+linux-doc@lfdr.de>; Mon, 22 Aug 2022 16:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbiHVOJE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 Aug 2022 10:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235335AbiHVOJE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Aug 2022 10:09:04 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9ED422B0A
        for <linux-doc@vger.kernel.org>; Mon, 22 Aug 2022 07:09:02 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-11d7a859b3aso1769334fac.4
        for <linux-doc@vger.kernel.org>; Mon, 22 Aug 2022 07:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=igSf/TxTkVuRcHrBbiiQMryoJhzhxyi4i/AdL/IKB1M=;
        b=8PMSwRgXTbp4Xgnxp3O8KZuqs7DWc2jx4iPEcWpKpIU5J5NFednVVBqMJ02EqmdlmJ
         HgFBJH3ReDcpA0Rlx4B4UzxuPuRSQK5CCjNywrQuzLDnmvDPJD/DFQvWJaI1dP5doF/u
         LBHcIH3iE/hx6Fbj1y7646s7mhW/kOwTAMPCK6761bbl810bv86ZWhk5unOfA1Ub6oMJ
         tFN6t5qXY6h1oUXPK6N43KVvdMrStNomBA0GVawVbXI+2iLXqEhfveFbgRmEaaWLk0+u
         RN9La20QfEdyRvWgHphW028C/uW8q0wvYzGZY7McoRuPC5cL+mvyZUc9pS7DRrdFBE7v
         C7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=igSf/TxTkVuRcHrBbiiQMryoJhzhxyi4i/AdL/IKB1M=;
        b=H3jjDo96sZVgO/4+8mUa+8nBv9JkZf5JJY25Xwz/mWKHdIqbHan8Z/m7iE0yeJCk1w
         WjHkDjaoC4bhWGMTIBWA1Uz+2aPaa4tJoBlRSJy0Obyex7ZODIDDXn8dfcSyiXRIiH1N
         lEKSDiN/UWAOgKnF8K+jYI1k7LLrAs99Dd1ReanNRxmPj8kifYZ7iHgcOfGFE9UL/dVH
         KdXXWz9VkS2w4S4LCRPkXKhBiC1OgLlCVF85UAVarx8EPUm/Ng6KC0ptHo3WDsKnkp06
         d2dt1mAvpQotxGmEgvWvdyXAO5vq+TvIPv/sr6rsyoJyUxgDs+82o/9hiAW8hbibrkHs
         eswg==
X-Gm-Message-State: ACgBeo2ekr3Pbb52Oo5gKqWHnklzZuIw8J9TujLf39X7j8XnCrjo+VyW
        XnRi7EhaoObTMBc0AF8craBPLsXZjFbtOWYahjdM
X-Google-Smtp-Source: AA6agR6cdETMfd/SjAWaIc+njLRHCYDbZQEGlFvahUPtrNZEvI2MntCyPPrurmD7nZrG3gL/k/zPMwRlqbCbiVLrVAw=
X-Received: by 2002:a05:6870:7092:b0:11d:83fe:9193 with SMTP id
 v18-20020a056870709200b0011d83fe9193mr820426oae.41.1661177342105; Mon, 22 Aug
 2022 07:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220729090513.1467-1-liutie4@huawei.com>
In-Reply-To: <20220729090513.1467-1-liutie4@huawei.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Mon, 22 Aug 2022 10:08:51 -0400
Message-ID: <CAHC9VhT-UHMc6XSiCwnA90w0C9xNYHZcZhuDidh7HmddHcgEig@mail.gmail.com>
Subject: Re: [PATCH] audit: Modifying indentation issue.
To:     l00581214 <liutie4@huawei.com>
Cc:     eparis@redhat.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, hewenliang4@huawei.com,
        linfeilong@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 29, 2022 at 5:05 AM l00581214 <liutie4@huawei.com> wrote:
>
> From: Tie Liu <liutie4@huawei.com>
>
> Modifying indentation issue in audit_rate_check().
>
> Signed-off-by: Tie Liu <liutie4@huawei.com>
> ---
>  kernel/audit.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

While I agree that the style in this patch is preferable to the
existing style in the code, I'm growing weary of these minor style
change from developers who have not contributing any other meaningful
change to the audit subsystem.  Once you have established a history of
useful contributions to the audit subsystem feel free to (re)submit
this patch.

> diff --git a/kernel/audit.c b/kernel/audit.c
> index 7690c29d4..deeede166 100644
> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -324,7 +324,8 @@ static inline int audit_rate_check(void)
>         unsigned long           elapsed;
>         int                     retval     = 0;
>
> -       if (!audit_rate_limit) return 1;
> +       if (!audit_rate_limit)
> +               return 1;
>
>         spin_lock_irqsave(&lock, flags);
>         if (++messages < audit_rate_limit) {

-- 
paul-moore.com

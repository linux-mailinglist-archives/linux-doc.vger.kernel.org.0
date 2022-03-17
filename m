Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7CF84DBC77
	for <lists+linux-doc@lfdr.de>; Thu, 17 Mar 2022 02:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358346AbiCQB3O (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 16 Mar 2022 21:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358352AbiCQB26 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Mar 2022 21:28:58 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A0FA1F632
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 18:27:29 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id r23so4880846edb.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Mar 2022 18:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LlTH+G09rcVN0vQqtM5Msv7WROSZnwcaeBZzTdA/4gI=;
        b=Gta4TIZXLILirF7gfnrO7YgWEjB3SLjF0xn5PYqWfkcU3f2rCNOTAwttJ5RaOUYcEN
         IL/KnKuzVML6tmQ5vNx6Ap7s9sIoztvAx0gKaohJj92FgLpdit9Te1NW94nXasoZy5Fb
         Qt84EU51en3oFiIXYSC+LJ7o492gVsRWdYkYBopUBjvX5GKfniK5s/L+OJvs3ryFORot
         iXYxbSOi+POCJUOGGgHqeR5CFkYkdDqODzhAKpdLp8MIIOb7aRdnaFMMtsVtHoWABfka
         4LyicoGjRjJle5hDeV8yCwzQtUfAGLoC+FEpsveRZo15DyCtpJqy1/TCHChSDv3/XpNE
         /R/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LlTH+G09rcVN0vQqtM5Msv7WROSZnwcaeBZzTdA/4gI=;
        b=aer+eqnh/kVUBYnBTsvbaOVRECkIpdFwg6yF4CI/yQdnxw1MFQ/Cmthn07TGBukOI/
         qOTYIrD5kW97WB8vBFnHcx+kxVvbub/nRQON5Yjw//k3yc+Wy46s91x8PLlXDBDY4LBv
         On3Mit1dko0xJkEDcWDu0+7DDOYKZeUg1J8Cukztnx6ODAhe1kl7tiSOhDk3ocGzQgz+
         VjIcTghMfLoNvWb3AZEArYfSqKNdg8YZvxcw/3lL90RPI69N785lyFUUFcgdBq96oR1Y
         HK805t6334yG/pROXJwzL+vZtSS/X1dbFbzh6qM1k0MBjhfJ244vQKKEOUl6IcTmxk8k
         CZOg==
X-Gm-Message-State: AOAM530nBPPLTDV3MgPs61kWYZQUFfFEEjvgRZbbZL68gEBBIkBxoU6S
        9cJGRd5NbAzHubaAKwMaarWVi70HT6z1uBQonqwA
X-Google-Smtp-Source: ABdhPJyQf6Sx+VLp9Inh3suxXELVVTMqKA2vmRoPnOq/6Us7RHLzOl0j0BC6mxnVRiSybuRb3t6MQT+Nyca7bV1qfBA=
X-Received: by 2002:a05:6402:27ca:b0:418:93fe:da71 with SMTP id
 c10-20020a05640227ca00b0041893feda71mr1941793ede.409.1647480447687; Wed, 16
 Mar 2022 18:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220221212522.320243-1-mic@digikod.net> <20220221212522.320243-12-mic@digikod.net>
In-Reply-To: <20220221212522.320243-12-mic@digikod.net>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 16 Mar 2022 21:27:16 -0400
Message-ID: <CAHC9VhQM99=OVFBcpO72QM-9NSk5dBXy3_jVrwmG304ugjzSdQ@mail.gmail.com>
Subject: Re: [PATCH v1 11/11] landlock: Add design choices documentation for
 filesystem access rights
To:     =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc:     James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
        Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 21, 2022 at 4:15 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> =
wrote:
>
> From: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
>
> Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
> Link: https://lore.kernel.org/r/20220221212522.320243-12-mic@digikod.net
> ---
>  Documentation/security/landlock.rst | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)

Reviewed-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com

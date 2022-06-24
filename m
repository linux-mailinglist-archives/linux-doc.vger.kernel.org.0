Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D546B55A4F1
	for <lists+linux-doc@lfdr.de>; Sat, 25 Jun 2022 01:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbiFXXkW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 24 Jun 2022 19:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbiFXXkU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Jun 2022 19:40:20 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4CB89D33
        for <linux-doc@vger.kernel.org>; Fri, 24 Jun 2022 16:40:19 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id t5so7707605eje.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Jun 2022 16:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ioGTNHXffZwnZ8I7y2BRheK/DbmuKIFCf1q9qCvNtRE=;
        b=gPUgC1E8eC2BqehwvtcAgsVR+1S+BTJA9WU5iGYKvy4xUBKGEbcb3f5NG2dSVmkMaL
         J0foMgTURbKIFnRnbsj58R+I8QxePawmLt5GxBwk1f3eIjfsRBUg4NwXldr7Z4hdTHmK
         DW8NHmYIkHd1kfQEj9hJKqxrPZ7b7MkzZHdCE3f2Sng0BMeZR/jY00wCr2S2nJZoU9+X
         tWk5Eg+ehQq4J9nyR34lLr7rj29iW/NtN/QvVXjd8UDCOZSv4IeImJK6NwKlIG3PA50Z
         X3lu/4llQ5L9ifwgfVyYqfGMRPmC1sj3klUTNf/JkPvbivh59rMwhGMlmOVQtXFRaGLO
         RytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ioGTNHXffZwnZ8I7y2BRheK/DbmuKIFCf1q9qCvNtRE=;
        b=gHXKPHZm4e6KVTSapsMpeODHr83buwKJ30YuQ++f1pz3gjOz9MMKnRGaRKR9iR6AIW
         eio0UX5oj9ltvudtms/Zd7LvlfD6I9FoDPDZwLfJwnq0QH5xuuVWYwaQwbiOsjcBWre+
         Aq4t9QREnA6SIi72ADlA70/KA2goskEHnw/NCuyv58lZKnppDJazL4wsyRcuFHluS7mN
         A5IPPJlXQZOPRBiQGTp0pnIB8eL23n7mwSc6qy6b0tRsWfazNBeFtIspNouEcTXRNSIA
         oju/gzxwolbaqYl2yGvQOD0m5Se+w9gWPwMJW2T4ovMCJdFB1s17gK33JDqu4HYWmrhT
         rFeg==
X-Gm-Message-State: AJIora/MrslOrYcPxKuVvTAz8y6jZlMnd+x507aZZZvfY723oaHHKBjP
        n69xGhJ3mJYVETEVaMSxFHN4o2ZJTy6Py9BzlPc63A==
X-Google-Smtp-Source: AGRyM1s4ws/aqxlJeM5cTpkwHOGmCVjfTOdh8yuqMaDTlT05PSaxFD6smAlqQyw8HO9CERa4VC023nFn6040NePICfw=
X-Received: by 2002:a17:906:308f:b0:709:af33:9fa7 with SMTP id
 15-20020a170906308f00b00709af339fa7mr1347941ejv.369.1656114017449; Fri, 24
 Jun 2022 16:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220603195626.121922-1-dlatypov@google.com> <87pmix3ktq.fsf@meer.lwn.net>
 <2c3399e9-4f4e-a71a-4030-e4e6d72b5d4e@linuxfoundation.org>
 <8735ft3co5.fsf@meer.lwn.net> <96154234-7842-3bc9-d89f-eb20be40e6de@linuxfoundation.org>
In-Reply-To: <96154234-7842-3bc9-d89f-eb20be40e6de@linuxfoundation.org>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Fri, 24 Jun 2022 16:40:06 -0700
Message-ID: <CAGS_qxpQvftq2qiiaNhr5sAkJWgQhtB1CK2_ZeYASLYynWVHRA@mail.gmail.com>
Subject: Re: [PATCH 1/3] Documentation: kunit: remove duplicate kunit-tool.rst
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, brendanhiggins@google.com,
        davidgow@google.com, linux-kernel@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-doc@vger.kernel.org
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

On Fri, Jun 24, 2022 at 3:51 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 6/24/22 4:43 PM, Jonathan Corbet wrote:
> > Shuah Khan <skhan@linuxfoundation.org> writes:
> >
> >>> So not that long ago these patches were going through Shuah...it seems
> >>> that's not happening anymore?  I can pick up kunit docs patches,
> >>> certainly.  I've taken the silence on these as assent and applied them.
> >>>
> >>
> >> I am still taking ksefltest and kunit doc patches through my tree. I wait
> >> for Brendan to ack at times. This one didn't show up in linux-kselftest
> >> list it appears.
> >>
> >> If you cc linux-kselftest and I get an ack from Brendan, I will take this
> >> through kselftest tree.
> >
> > As I said up above, I went ahead and applied them.  I can drop them
> > again if you want to carry them, just let me know.
> >
>
> Jon, yes please go ahead and drop this one. I will wait for Brendan
> to ack it. Reduces confusion in the future. Very often, there is code
> dependencies as well.
>
> Daniel, please don't skip kselftest list in the future.

Ack.
I was hoping to avoid confusion about who should apply them; looks
like it created more.

Just a note: this one has no code dependencies, so it can be applied
whenever or wherever.

Daniel

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8CEC27B5F4
	for <lists+linux-doc@lfdr.de>; Mon, 28 Sep 2020 22:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgI1UJi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Sep 2020 16:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbgI1UJi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Sep 2020 16:09:38 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D855C061755
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 13:09:38 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id k13so2168159pfg.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 13:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=S99N8rvF/t2so08QhL6pclkzbq8/CXYQ8U2vW/BH+ec=;
        b=At/lupLafCk7dwPh75O9pTw9C98MC2piMlqqdXjCzrWBQEXwERGK3FCRzSXAetk9zy
         wZhTjK+f3R0DZzkscP2AJNyOVoNpsfj0X+47zeF7OmSmo6FJKe1aSrrNF9LeOUO0Yt6M
         FhtmIbkzd0YQyxlBLICX1+SPytq0egZ0FJQn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S99N8rvF/t2so08QhL6pclkzbq8/CXYQ8U2vW/BH+ec=;
        b=APpJZGiSyh01Ua3Ty/nPVJAabjtV9NXbfObaW+EBD/yikBok85DuIHKGfxXfeWfdBm
         zB7m4LxXEq0g0emJG7sfCLMdT0qS1A0JodvqqlSilRZpNNtizu3nblJD6XLFTg/UV5qI
         8Ia4apG6U/gSKwZAeXeqHjWMoW2xcVgwCKVoWoCQkAFOJxpAjy45USmv/+D3yYYZaRsz
         RE43p9wb1LqnnvLitM6iITRA8KlW6jDMrH+stGgpJZ02DA/BkkPXhQBkDvvcS/RSNDWz
         bKrdcp1QIJ3+GqU3VzqzAB6ktsKw3N7nWinhSAslK37fVSdhR66ssMYoYNEPjrZbog8J
         /GAQ==
X-Gm-Message-State: AOAM533H9tH+aBgrH1iJrnmseWTo3wKjxw1II+cSfyQj9fJNFYCUwnDn
        hd3aSx3NmVGFMVHXuoeqxo6zSA==
X-Google-Smtp-Source: ABdhPJxweUo6JrIl7VJ75Z4XsJc91vU6Ojb4p0GxGm9M1MwgskGNvzWJmdsuLPOU9Iac8TJrkoyTMA==
X-Received: by 2002:a63:165c:: with SMTP id 28mr527069pgw.302.1601323777776;
        Mon, 28 Sep 2020 13:09:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l14sm2165383pfc.170.2020.09.28.13.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 13:09:36 -0700 (PDT)
Date:   Mon, 28 Sep 2020 13:09:36 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Hangbin Liu <liuhangbin@gmail.com>
Cc:     Shuah Khan <shuah@kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Tim.Bird@sony.com, lkft-triage@lists.linaro.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Justin Cook <justin.cook@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests/run_kselftest.sh: Make each test
 individually selectable
Message-ID: <202009281306.CF94D1786@keescook>
References: <20200925234527.1885234-1-keescook@chromium.org>
 <20200925234527.1885234-3-keescook@chromium.org>
 <20200927024840.GD2531@dhcp-12-153.nay.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927024840.GD2531@dhcp-12-153.nay.redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Sep 27, 2020 at 10:48:40AM +0800, Hangbin Liu wrote:
> On Fri, Sep 25, 2020 at 04:45:27PM -0700, Kees Cook wrote:
> > Currently with run_kselftest.sh there is no way to choose which test
> > we could run. All the tests listed in kselftest-list.txt are all run
> > every time. This patch enhanced the run_kselftest.sh to make the test
> > collections (or tests) individually selectable. e.g.:
> > 
> > $ ./run_kselftest.sh -c seccomp -t timers:posix_timers -t timers:nanosleep
> > 
> > Additionally adds a way to list all known tests with "-l", usage
> > with "-h", and perform a dry run without running tests with "-n".
> 
> This is better than my previous patch and we can modify run_kselftest.sh
> easily. The Documentation/dev-tools/kselftest.rst should also be update.

Thanks! I will send a v2.

-- 
Kees Cook

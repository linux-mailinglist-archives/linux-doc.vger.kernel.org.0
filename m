Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4FAB27B5EB
	for <lists+linux-doc@lfdr.de>; Mon, 28 Sep 2020 22:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgI1UGV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Sep 2020 16:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726781AbgI1UGS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Sep 2020 16:06:18 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE62C0613CF
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 13:06:17 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id jw11so1313922pjb.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 13:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GB2ojgWNqZXvqEdj/VV8371C+BmRndozba/z5/3tWGk=;
        b=OdImwqSK9MfonoLopWLPhPPwNfbz9gexbud4kQh5dYPi1aYXnLcNS7Fs0Q3VUr6DX9
         BdxPS2tdTenGb/kWVbJUd1ffR67EUMaxyDwRwHKdqhSf7ppcYTPrh1NLn7aBTb2UhTq+
         9zy0WTzkdLpMaQzEfSiw/9c0XIPc62gte6O6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GB2ojgWNqZXvqEdj/VV8371C+BmRndozba/z5/3tWGk=;
        b=UMstiYa664yB2Lg5YhlQ9XpE584tPg1sEDVntZGYf03JhIKbZTrlfAZg3uqZY5lpUy
         NedFMq5LHG1TDKFGfDMxMQnwX+rmmyCXzh50qEvffrD/K6nRTOPMlXunYUDMZh6EL8Lm
         Fep3vE4ud2CUdq8wf3ErLhHM/Mhvp+t4MjDJcxDKPdosTI54MQbbm7z4aUgPzj+25c9/
         s3gRIS9ZdXJekuCnYO3qC0MPpUN7PcQ3+1gzJyeo+93uS4BDRa3Fn1wJglknvaPJhMtd
         /Q8rHj7qc76ZsqMxtvQ4uObKFggdmR9BQdyNl1RivAwFKt+5h4Jc1MqL3KjvjlF0u+ZM
         egTQ==
X-Gm-Message-State: AOAM532Gkk4a3FhxbrxwrWaev63CbpijceRCZdDjdGRyfNKX+DzoDRzK
        l1qsheERQeA9r4rVTazE6bbybQ==
X-Google-Smtp-Source: ABdhPJxO+MI0WUHrgxRNZjH1ImCCvDkrrvTbzJHKtH0SHCAC/3OKSHmbyqvGL0KgC2NSJyvv4QR9pg==
X-Received: by 2002:a17:90a:b88c:: with SMTP id o12mr768525pjr.43.1601323576799;
        Mon, 28 Sep 2020 13:06:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a24sm2148981pju.25.2020.09.28.13.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 13:06:16 -0700 (PDT)
Date:   Mon, 28 Sep 2020 13:06:15 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Hangbin Liu <liuhangbin@gmail.com>
Cc:     Shuah Khan <shuah@kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-doc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, Tim.Bird@sony.com,
        lkft-triage@lists.linaro.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Justin Cook <justin.cook@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCHv5 kselftest next] selftests/run_kselftest.sh: make each
 test individually selectable
Message-ID: <202009281305.E6F9595@keescook>
References: <20200914021758.420874-1-liuhangbin@gmail.com/>
 <20200914022227.437143-1-liuhangbin@gmail.com>
 <CA+G9fYvT6Mw2BamoiVyw=wLUqD-3LB2oaDqcuabOyWfFxEN1qg@mail.gmail.com>
 <202009251414.15274C0@keescook>
 <20200927015334.GC2531@dhcp-12-153.nay.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927015334.GC2531@dhcp-12-153.nay.redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Sep 27, 2020 at 09:53:34AM +0800, Hangbin Liu wrote:
> On Fri, Sep 25, 2020 at 02:16:14PM -0700, Kees Cook wrote:
> > On Fri, Sep 25, 2020 at 01:51:53PM +0530, Naresh Kamboju wrote:
> > > On Mon, 14 Sep 2020 at 07:53, Hangbin Liu <liuhangbin@gmail.com> wrote:
> > > >
> > > > Currently, after generating run_kselftest.sh, there is no way to choose
> > > > which test we could run. All the tests are listed together and we have
> > > > to run all every time. This patch enhanced the run_kselftest.sh to make
> > > > the tests individually selectable. e.g.
> > > >
> > > >   $ ./run_kselftest.sh -t "bpf size timers"
> > > 
> > > My test run break on linux next
> > > 
> > > ./run_kselftest.sh: line 1331: syntax error near unexpected token `)'
> > > ./run_kselftest.sh: line 1331: `-e -s | --summary )
> > > logfile=$BASE_DIR/output.log; cat /dev/null > $logfile; shift ;;'
> > 
> > Yes, please revert this patch. The resulting script is completely
> > trashed:
> > 
> > BASE_DIR=$(realpath $(dirname $0))
> > . ./kselftest/runner.sh
> > TESTS="seccomp"
> > 
> > run_seccomp()
> > {
> > -e      [ -w /dev/kmsg ] && echo "kselftest: Running tests in seccomp" >> /dev/kmsg
> > -e      cd seccomp
> > -en     run_many
> >         \
> > -ne             "seccomp_bpf"
> >         \
> > -ne             "seccomp_benchmark"
> > 
> > -e      cd $ROOT
> > }
> 
> I'm really sorry to make this trouble. And I'm OK to revert the patch.
> I just a little wondering how do you generate this script.

This issue is with which shell is used. I suspect your /bin/sh is full
/bin/bash, where as Naresh's, the CI's, and mine are /bin/dash (which
lacks "-e" support for the built-in "echo").

-- 
Kees Cook

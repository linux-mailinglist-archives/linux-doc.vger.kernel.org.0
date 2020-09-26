Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9EB279AFC
	for <lists+linux-doc@lfdr.de>; Sat, 26 Sep 2020 18:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729342AbgIZQdU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 26 Sep 2020 12:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729363AbgIZQdU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 26 Sep 2020 12:33:20 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2088C0613D5
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2020 09:33:19 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id x5so840404plo.6
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2020 09:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mvGz7fsSzQyG47W1/0kt8/LOxSWmeEYp8+sMo1z9HUE=;
        b=j18SszrIGHglF5HogqSQsLrk58lP8fECmVsnU5yfOkqc1W0HCJU1XuoZWoSIGhCw8O
         5BStnOqQow7SWPPTqSlIcqGVqAw/vVxjHtQ/Q1W5D+EbZaryvm/j2R/qcMgcPnAAXJ+P
         plaUHOPH8H18NjpTtFiQzfPWrswFQIWoggbK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mvGz7fsSzQyG47W1/0kt8/LOxSWmeEYp8+sMo1z9HUE=;
        b=C99TD21UfW39QEWOxRu6BdAul38P6o8nZqHMkwjzBna4G7PySuYReAtsw39pcUIzFS
         N/6joX3qrrElqbL2tZu6qWJ4rY+VH0KB8dYhqftQCqmuUQ2ZaGmgGBIGU+om9QN5PKCv
         kh4r+6jjHnjFPHMyFATees6SuUkrM9Z6TfaB7DiBL7cpxxv/qvvPqU62OpcADIDRhvl9
         +HUYvoneF9uWYAZsmxGvMLzNrI778qrueorEHdRZemeteAxCK1s0NnBy52TkXuyFX9XD
         ZIyy/kzs3Ov5PbxNDZ0J9w4qnSs5777QUryxf0Vtp1VCqlia9+d7pHlObx5wyJy1k1NB
         lqzw==
X-Gm-Message-State: AOAM530W3p94Y2oTda1UgKGHw9DtJnqlB+KAO5eQKnMsmZwF1yAu8zyV
        9bbBcO/tl2Twm9Tm364rLFR5Bg==
X-Google-Smtp-Source: ABdhPJz07FYhFy6jlg7aMFgFGis4mK43u8VsIHtsiKwV5vvMHcarj8PIcUsFLtBpAAi0bNvkL0ZzQA==
X-Received: by 2002:a17:90a:4b42:: with SMTP id o2mr2367400pjl.205.1601137999302;
        Sat, 26 Sep 2020 09:33:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w14sm5767645pfu.87.2020.09.26.09.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 09:33:18 -0700 (PDT)
Date:   Sat, 26 Sep 2020 09:33:17 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     corbet@lwn.net, gregkh@linuxfoundation.org, shuah@kernel.org,
        rafael@kernel.org, johannes@sipsolutions.net, lenb@kernel.org,
        james.morse@arm.com, tony.luck@intel.com, bp@alien8.de,
        arve@android.com, tkjos@android.com, maco@android.com,
        joel@joelfernandes.org, christian@brauner.io, hridya@google.com,
        surenb@google.com, minyard@acm.org, arnd@arndb.de,
        mchehab@kernel.org, rric@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-acpi@vger.kernel.org, devel@driverdev.osuosl.org,
        openipmi-developer@lists.sourceforge.net,
        linux-edac@vger.kernel.org
Subject: Re: [PATCH 00/11] Introduce Simple atomic and non-atomic counters
Message-ID: <202009260930.9252966D@keescook>
References: <cover.1601073127.git.skhan@linuxfoundation.org>
 <202009251650.193E2AD@keescook>
 <7d8f86ab-4333-afa1-6523-e42ae5c7d9b2@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d8f86ab-4333-afa1-6523-e42ae5c7d9b2@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 25, 2020 at 06:13:37PM -0600, Shuah Khan wrote:
> On 9/25/20 5:52 PM, Kees Cook wrote:
> > On Fri, Sep 25, 2020 at 05:47:14PM -0600, Shuah Khan wrote:
> > > -- Addressed Kees's comments:
> > >     1. Non-atomic counters renamed to counter_simple32 and counter_simple64
> > >        to clearly indicate size.
> > >     2. Added warning for counter_simple* usage and it should be used only
> > >        when there is no need for atomicity.
> > >     3. Renamed counter_atomic to counter_atomic32 to clearly indicate size.
> > >     4. Renamed counter_atomic_long to counter_atomic64 and it now uses
> > >        atomic64_t ops and indicates size.
> > >     5. Test updated for the API renames.
> > >     6. Added helper functions for test results printing
> > >     7. Verified that the test module compiles in kunit env. and test
> > >        module can be loaded to run the test.
> > 
> > Thanks for all of this!
> > 
> > >     8. Updated Documentation to reflect the intent to make the API
> > >        restricted so it can never be used to guard object lifetimes
> > >        and state management. I left _return ops for now, inc_return
> > >        is necessary for now as per the discussion we had on this topic.
> > 
> > I still *really* do not want dec_return() to exist. That is asking for
> > trouble. I'd prefer inc_return() not exist either, but I can live with
> > it. ;)
> > 
> 
> Thanks. I am equally concerned about adding anything that can be used to
> guard object lifetimes. So I will make sure this set won't expand and
> plan to remove dec_return() if we don't find any usages.

I would like it much stronger than "if". dec_return() needs to be just
dec() and read(). It will not be less efficient (since they're both
inlines), but it _will_ create a case where the atomicity cannot be used
for ref counting. My point is that anything that _requires_ dec_return()
(or, frankly, inc_return()) is _not_ "just" a statistical counter. It
may not be a refcounter, but it relies on the inc/dec atomicity for some
reason beyond counting in once place and reporting it in another.

-- 
Kees Cook

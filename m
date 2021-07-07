Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63FA63BE961
	for <lists+linux-doc@lfdr.de>; Wed,  7 Jul 2021 16:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231919AbhGGOKi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 7 Jul 2021 10:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbhGGOKh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Jul 2021 10:10:37 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44870C061574
        for <linux-doc@vger.kernel.org>; Wed,  7 Jul 2021 07:07:56 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id p8so3238166wrr.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Jul 2021 07:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kWyuGMwX+ZNUDXD7vDpVa4A2OyqG/8p+xZdri8V20uc=;
        b=T2dqzRwPotD5ZOjn6JCz0tkAm6jUi7jcBoxaUMn0E8tLfrXB0oQe6az48pOSGJeQOW
         178QgAoV2QSn0YP58N1pUNvWbviBPoa+YmpgoiPa7onI0WpIAZ/dSIQv5hS1gUaaqREJ
         kO32XVR27MdLkzkZJa2JQSqI1EUnfYR+YjUuoTJ+uqmoTBXGwuX7DQmCaNhLiYoVAXow
         cPcp1zIGaVOyt8InKS58l8xUrIOs8k9obW3pQvApQNh1DwtllPUndcl/wrN9CHKK7mi5
         cfWBeLOO6jBVnT6Q9OuOnZap2IOh2UbzlIS20nbxa4Z+4d7oFG7B1ozeGTdk3YJ3FTjA
         QkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kWyuGMwX+ZNUDXD7vDpVa4A2OyqG/8p+xZdri8V20uc=;
        b=Wn0ApV7zqJXtLcJo84SeFQvy0wd4AT7lp17e/iVT/TMq2nCZ/y7QveoxAm3WXuAOeU
         SCZcyJUnOKEspN+JebQsFCk++gq+u8QtNjfo/+S0Kn0Xgs/ahCiRcCbqaP9wr+4lRzm7
         e1PS6wP39xD3wYS1QkyS5QLxoValcT4+yx5dG5gFPcLPhXHdg1E9gAoh8QvEzuXiODiz
         DbjRV7lXaRaRt/l1zY2ktOcjJHXPqTJCa6dhc43IiUMO0hqC74LCg89Y3DNymiY1TanC
         oT5lEMlRVcpXwmCalZnUfM88W+aRct2wJpcygKXiXI6W4pvX5TYNaaxk98nnPsGlJChv
         SDtw==
X-Gm-Message-State: AOAM532uMXk2Ma+6cek5EHUBrsXCPAJfN9hky65eCu6WD9JwWLuHFL4b
        x4wXKawlrmg0Tu1HMYqfyAmn
X-Google-Smtp-Source: ABdhPJy4pvViQLXcf5CZiXO9ylISZ7qhOwfU2XWINGPk2cDzGLvvCqrd+9hRWF0xZknrQrz1n7ZNEQ==
X-Received: by 2002:a05:6000:1867:: with SMTP id d7mr21264188wri.263.1625666874582;
        Wed, 07 Jul 2021 07:07:54 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:860d:625a:fd59:d699])
        by smtp.gmail.com with ESMTPSA id u9sm21396849wmq.41.2021.07.07.07.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 07:07:54 -0700 (PDT)
Date:   Wed, 7 Jul 2021 15:07:50 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/17] Rust support
Message-ID: <YOW1Nj8+a2Yth2++@google.com>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <YOVNJuA0ojmeLvKa@infradead.org>
 <CANiq72mKPFtB4CtHcc94a_y1V4bEOXXN2CwttQFvyzwXJv62kw@mail.gmail.com>
 <YOWjLmg/Z7kr2+tx@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOWjLmg/Z7kr2+tx@kroah.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 07, 2021 at 02:50:54PM +0200, Greg Kroah-Hartman wrote:
> On Wed, Jul 07, 2021 at 02:33:57PM +0200, Miguel Ojeda wrote:
> > Now, if you are OK with non-hardware modules, you can take a look at
> > Rust Binder (last patch in the series) which is a non-trivial module
> > and it is already working.
> 
> Cool, does it actually pass the binder self-tests that the Android
> systems have for the codebase?

We haven't run the Android tests yet because they depend on an Android-specific
service (servicemanager) running and other Android-specific libraries. What we
are doing instead is adding binder tests that don't depend on anything
Android-specific; in fact, we are putting them in tools/testing/selftests/binder
so that they can run on any vanilla system.

The commit is available here:
https://github.com/wedsonaf/linux/commit/f90ec49be9207fa765f07ad1071210ad871712ac

The tests are written in C and run successfully against both C and Rust drivers.
I still have another ~20 tests that I wrote in another harness that I will
convert to selftests soon, but the two together I believe have more coverage
than the ones in Android.

We also have a trivial latency benchmark (ping with no payload) where the Rust
version performs better than the C one.

The benchmark is available here: https://github.com/wedsonaf/linux/commits/ping

> Last I looked at this thing, it was not
> feature-complete compared to the in-kernel binder code, has that been
> resolved and the needed filesystem changes added?

It is not feature-complete in comparison to the C one just yet, it is missing a
few things but not for any fundamental reason -- we were mostly focusing on the
kernel crate and tests.

Miguel's point is that it does implement the vast majority of binder features
and is non-trivial, so it could be used as evidence that useful kernel drivers
can be built with Rust; not just "transpiled" from C, but written with the Rust
safety guarantees.

Cheers,
-Wedson

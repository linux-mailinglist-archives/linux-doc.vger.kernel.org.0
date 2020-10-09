Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C6D2899F1
	for <lists+linux-doc@lfdr.de>; Fri,  9 Oct 2020 22:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733003AbgJIUpq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 9 Oct 2020 16:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388586AbgJIUpq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Oct 2020 16:45:46 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA2AC0613D8
        for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2020 13:45:46 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g9so8160960pgh.8
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2020 13:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hVX5+FfHI4ZUM/n+lt7+FKmZQZljIf9JA1OHbdRm9dM=;
        b=VXDV+aZd/7WAFMj+s91i6dzU5o9niIOJr9LtvzDbExqBX92/o43XJ4mLdkWsssdUYW
         59/mf+Vx9HTFuB+s5Uq+SPPb/V+sG7AmiVA9XX0Je/8LgHrwTkCyhv3fT9fvBKLsQUI1
         kv3u9MueBXwLYe6awXe3LxmAvsJGNqzekmkq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hVX5+FfHI4ZUM/n+lt7+FKmZQZljIf9JA1OHbdRm9dM=;
        b=YrKnn+Qw6U5pDp0LwV5kMFbwyI3YH92WxstNH11h8KQ8fKK+zMVizNzTRjG52A2e7X
         oyl8GRhfa5SOg3P93k/W4owJa2dc1VbEsz4XK4aelX58FbPo5Cyzrl/mrvhn6oXJAfI9
         fhDwfvg9xgCVdmygovXHUUvrQyjyMh2LMrDtO5duHiGzlfq5cOgoYxiG3CiTj+aYBiAf
         eKcBTMzo+i4+HFs4Yl2coOBx3RIwuoK10ehmG7C8fRMVVz1IJnFxkbbBuqDdYbflWTYB
         78f0nlY3qXAoz3qiA8uPw2IGd0ZQiE/sUoWCye8RgM4ONswMwfa3VX9LQE8+9XWAY+s/
         GT+Q==
X-Gm-Message-State: AOAM530JWkUVOkVQ88nfIQamC+uEpfEdsu0kfSWPIu/bbRqnJy0sP0v9
        JgpR8H2seg7/bE81LYwoGbfRYg==
X-Google-Smtp-Source: ABdhPJzSAKjeywiz0Od20lW+Cape3t34gBitYgmyJAvlFQsFShOemku3ICOQ9rzytzKY66XYHOnlUw==
X-Received: by 2002:a17:90a:1548:: with SMTP id y8mr6533282pja.113.1602276345630;
        Fri, 09 Oct 2020 13:45:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j25sm11474436pfn.212.2020.10.09.13.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 13:45:44 -0700 (PDT)
Date:   Fri, 9 Oct 2020 13:45:43 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Shuah Khan <skhan@linuxfoundation.org>, corbet@lwn.net,
        gregkh@linuxfoundation.org, shuah@kernel.org, rafael@kernel.org,
        johannes@sipsolutions.net, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, bp@alien8.de, arve@android.com,
        tkjos@android.com, maco@android.com, joel@joelfernandes.org,
        christian@brauner.io, hridya@google.com, surenb@google.com,
        minyard@acm.org, arnd@arndb.de, mchehab@kernel.org,
        rric@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-acpi@vger.kernel.org, devel@driverdev.osuosl.org,
        openipmi-developer@lists.sourceforge.net,
        linux-edac@vger.kernel.org, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 00/11] Introduce Simple atomic counters
Message-ID: <202010091255.246395A6@keescook>
References: <cover.1602209970.git.skhan@linuxfoundation.org>
 <20201009193746.GA1073957@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009193746.GA1073957@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 09, 2020 at 09:37:46PM +0200, Peter Zijlstra wrote:
> On Fri, Oct 09, 2020 at 09:55:55AM -0600, Shuah Khan wrote:
> > Simple atomic counters api provides interfaces for simple atomic counters
> > that just count, and don't guard resource lifetimes. The interfaces are
> > built on top of atomic_t api, providing a smaller subset of atomic_t
> > interfaces necessary to support simple counters.
> 
> To what actual purpose?!? AFACIT its pointless wrappery, it gets us
> nothing.

It's not pointless. There is value is separating types for behavioral
constraint to avoid flaws. atomic_t provides a native operation. We gained
refcount_t for the "must not wrap" type, and this gets us the other side
of that behavioral type, which is "wrapping is expected". Separating the
atomic_t uses allows for a clearer path to being able to reason about
code flow, whether it be a human or a static analyzer.

The counter wrappers add nothing to the image size, and only serve to
confine the API to one that cannot be used for lifetime management.

Once conversions are done, we have a clean line between refcounting
and statistical atomics, which means we have a much lower chance of
introducing new flaws (and maybe we'll fix flaws during the conversion,
which we've certainly seen before when doing this stricter type/language
changes).

I don't see why this is an objectionable goal.

-- 
Kees Cook

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2AA25FFD3
	for <lists+linux-doc@lfdr.de>; Mon,  7 Sep 2020 18:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730702AbgIGQjy (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Sep 2020 12:39:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730959AbgIGQiU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Sep 2020 12:38:20 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB951C061574
        for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2020 09:38:16 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id c10so12665335otm.13
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2020 09:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=22rG+o0x5E8fn3lCo9EgmgeQWY6DcyVeCCT/ulJfvbo=;
        b=bitllW57EJOYHuZ5CUKD/Lb1sFDAtPUOem3ecI2UP5Q0jVAjzxdw9cvG8bOu1yi6S2
         bvOWP86o1ZNwx9Fkmfi7+tvAVV+vGPobCKiG9y/53o2pVIkHQDx0ZsFka6V4SD3czEE3
         x+Tl+fP+CGIy2viSi3K8rmPDboV3CnVBOn/Kfri5r96cPfRSz4zqlHRNBSAr3lAOaYqf
         i9ZVZlwxyHvG/GF2NDA+lzp1mfQI+qImZwMyK9aISDMX7zgmLcCO02j6vi8tyMXcMY++
         ObuajIiQvYTIYZHSkaTPgwyUzMEl92mdfXHfPW0TV337JP+dOU765tvAW6aj/lyM8YfE
         1OfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=22rG+o0x5E8fn3lCo9EgmgeQWY6DcyVeCCT/ulJfvbo=;
        b=eZmKwIIh+B2zR31idswihzfjBXxU3ukFpyetOaMgXdi1jPBdR0rJhqFTSx/FHVnLfI
         fBCNfQsgKDuZexgZU82l8BDCwqkr5SJSyVnVNFnJ6ABfO5ix+p/T4RILAOwZ9IIghG6+
         GNJcJtWZYhOSl2zjgkAYOnUHrcW6UDg/6I7L+7cq9JsmlpIAzEbAJ2hOt9YAadlqrP3h
         Q23c9j/ShlA1StJSfaeK+egmJOFvJ5nze7GLeSyUYpRlUa4hmE9dGRBi5PMSRy3TZXVr
         5DpMn85cp4aFmAf5e0PrN7o6XJNy7/+52Mi0ZezismNMQC5XjiTVt8R1nCR5JAo6ECIN
         LLUw==
X-Gm-Message-State: AOAM533lnEtuMz6aCYhlQ8h7mN79Y5I66BdNjJ7kWKv3CBVGAgfyX94v
        0bIHYuCnJb6YQIKckKwqmz9S/iyx1F3i8kjTN67EKg==
X-Google-Smtp-Source: ABdhPJzsrwPGCQDoeOK2piqQ7QiJFzBZJjpEU9sPz0Ed1c6gEk6sIyv2+pbiSAvi7iaELl3C5S0YJJO8OglifQ0pITQ=
X-Received: by 2002:a9d:3da1:: with SMTP id l30mr15600016otc.233.1599496695929;
 Mon, 07 Sep 2020 09:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200907134055.2878499-1-elver@google.com> <20200907134055.2878499-2-elver@google.com>
 <20200907164148.00007899@Huawei.com>
In-Reply-To: <20200907164148.00007899@Huawei.com>
From:   Marco Elver <elver@google.com>
Date:   Mon, 7 Sep 2020 18:38:04 +0200
Message-ID: <CANpmjNNL_hqmKfZAGF5mF-HwVx78tp+j0JNKhK=xPwJLvdWnZg@mail.gmail.com>
Subject: Re: [PATCH RFC 01/10] mm: add Kernel Electric-Fence infrastructure
To:     Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc:     Alexander Potapenko <glider@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Lameter <cl@linux.com>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Pekka Enberg <penberg@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrey Konovalov <andreyknvl@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Andy Lutomirski <luto@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>, Qian Cai <cai@lca.pw>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 7 Sep 2020 at 17:43, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
...
> Interesting bit of work. A few trivial things inline I spotted whilst having
> a first read through.
>
> Thanks,
>
> Jonathan

Thank you for having a look! We'll address these for v2.

Thanks,
-- Marco

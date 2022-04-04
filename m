Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 733FE4F1C6E
	for <lists+linux-doc@lfdr.de>; Mon,  4 Apr 2022 23:28:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344386AbiDDV1Y (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 4 Apr 2022 17:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379690AbiDDRvW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Apr 2022 13:51:22 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976D724BC6
        for <linux-doc@vger.kernel.org>; Mon,  4 Apr 2022 10:49:25 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id l26so5237069ejx.1
        for <linux-doc@vger.kernel.org>; Mon, 04 Apr 2022 10:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vABpGBhTQYtFSOzIwpkJiQp51DmO237fnb6hvRyBNdc=;
        b=kq6Yz32DSK9zOJ7bPFvcjQc80bzG6ufNST/PLxnAZDgUll2EsHl/7DOBySFQGPGQBO
         KMODRAMzGVkg4wqeYXpIEQMsuSa51JzFJkHYQV/My/8bthoa0wEAwWm7JnYdhKy4f0IT
         IYKHfXxzGnqGNhFnMBgVhoIPXAaka/SXRk3ohySgOUIybytsG3xyO6h2D7l0K9voeYoc
         FYu5KchV6tYEpdQHe9DyEGR2HYvvOlDHDoh49SMaDGfn3ZJuDuFq+z31146fxq/I3vjU
         3Dn3Z+2p5l8tnkxwc2V2sRlJAeC27tWtZrvSRD17I4uVRkSVjpL8J+bR+U9LjYMfhu8d
         puPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vABpGBhTQYtFSOzIwpkJiQp51DmO237fnb6hvRyBNdc=;
        b=kTKwDb+SkrCnYOXGaaa4UGdLD8PWFxxlCEtXB6sn/VamvjezZIuvV93LLVImmPkARY
         Lg9SzPZudVDKy0bqSzsUI6I3qEm9gmCk7se/uZFIhBW9gFPx6Fx8WbLh3uTJ+r+90lvV
         XaXWB0lseE45LkRGPHZRUwU55VSAsDaPhrAueamm/QLQofeQuCDNXkb8RXzxuNdXKbG7
         wF1Kmb5f+hFZRgAHfJJRYxmCa575FuJh2kHhcn+ADTfzFFtayW6pwe9ZxCc6QunWt/W2
         Gb7MfV8GMNER9j8pb/zGfVtIjE40VbxeZH9ywThPqUgggQINJUidTgy5JZYM/EonqTc6
         jrvA==
X-Gm-Message-State: AOAM530spspOjScumVYM7DrBF9zT65BaygynIfyp8G1cPgiEsEqfUf9J
        AuRs24J5XNDrXhMETIUs4YIG0+gnu3iL8pPBbmUFGQ==
X-Google-Smtp-Source: ABdhPJxeKG3vf8CXWCkQRoUM6NvTL32UYsKMz1d5IhptaAJYwGgG3KUfWseo+ekkT3O/3+91ErXB7keFFH7bAAKG860=
X-Received: by 2002:a17:906:7304:b0:6da:9243:865 with SMTP id
 di4-20020a170906730400b006da92430865mr1195561ejc.665.1649094563498; Mon, 04
 Apr 2022 10:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220328035951.1817417-1-tjmercier@google.com>
 <20220328035951.1817417-3-tjmercier@google.com> <YkM6/57mVxoNfSvm@slm.duckdns.org>
 <CABdmKX2Gxg35k7QiL2Vn4zWhmQ4UnM-Z8cnOXR0fwBWyJnZ+Ng@mail.gmail.com> <Ykst5K/cI+DUVc94@slm.duckdns.org>
In-Reply-To: <Ykst5K/cI+DUVc94@slm.duckdns.org>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Mon, 4 Apr 2022 10:49:12 -0700
Message-ID: <CABdmKX3LR1h_tac+UCCXf57hhDQ9CmmmYe2ymS8ZFiDA9Mcv4w@mail.gmail.com>
Subject: Re: [RFC v4 2/8] cgroup: gpu: Add a cgroup controller for allocator
 attribution of GPU memory
To:     Tejun Heo <tj@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <brauner@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Shuah Khan <shuah@kernel.org>,
        Kalesh Singh <kaleshsingh@google.com>, Kenny.Ho@amd.com,
        =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, cgroups@vger.kernel.org,
        linux-kselftest@vger.kernel.org
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

On Mon, Apr 4, 2022 at 10:42 AM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Wed, Mar 30, 2022 at 01:56:09PM -0700, T.J. Mercier wrote:
> > The use case we have for accounting the total (separate from the
> > individual devices) is to include the value as part of bugreports, for
> > understanding the system-wide amount of dmabuf allocations. I'm not
> > aware of an existing need to limit the total. Admittedly this is just
> > the sum over the devices, but we currently maintain out of tree code
> > to do this sort of thing today. [1]
>
> So, drop this part?

Ok, will do - I'll drop the "total" limitation text from the series.
>
> Thanks.
>
> --
> tejun

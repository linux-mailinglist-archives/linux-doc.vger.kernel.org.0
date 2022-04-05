Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 762534F4A24
	for <lists+linux-doc@lfdr.de>; Wed,  6 Apr 2022 02:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443460AbiDEWfM (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 5 Apr 2022 18:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573063AbiDERvK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Apr 2022 13:51:10 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB17BD9EB7
        for <linux-doc@vger.kernel.org>; Tue,  5 Apr 2022 10:49:11 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id r10so10096613eda.1
        for <linux-doc@vger.kernel.org>; Tue, 05 Apr 2022 10:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RXCW1evSnb4oJ88sHTAFEYTq0HTuOW2ocRpwnA3InQ4=;
        b=DFediYf4lKdcEGd6wHnf3P2A1rH9d97LcubT3QP6yRNY6vUA82uDkOevPceh0sN/Wl
         AzNDVgFuK6V76WaqpSYAiG2hRF9Re4Ov3xlC/Ms7hpW9uCTQ7y898MEv8Ijbqhc6SxXo
         QvfpY4jywVuV6j8Ii/P3vkQXreEU44Hlqin6E5RTxZAap0ziUpyUXuD83coag22gB7nJ
         kP94eXAsBC1cr7hK8pVNGZaStSW21SliZd84A/wTh+8QK9KZdm23HHaRa8zC2IVlp4fq
         sk905jrtMt/I2FOoTaeCu/ArrkOR8UVb6SsiWhRhquLKZ90pI6vt79FBY7MRBMWLMUZ2
         L8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RXCW1evSnb4oJ88sHTAFEYTq0HTuOW2ocRpwnA3InQ4=;
        b=GccxTWJCQ21pN0Lh/wcJ7o2/Y13fb9kX9GtNzV6KTd9rsvfUzv3o2Jq1I2bSMZeMMq
         EEiK9htKKaaQvikPjat2iTRovGvh6PcBiqOy+o+/p6Q/20jXz4yjjOZuyQ4CB+RjCdnb
         xV27LMNIn/nJYW9pjqKAwe6ePB0pku1LQIHNpIbPMGB7Q+Gsr+/X7IT5Jg8dENrE5Ndd
         wOkDjLg1DQCCdjxb+L7A7v9Uai1gPpxhlH2vwrMeFgpIZw9zi9R/6ui/H1YWroguWsdB
         mEwjd40CoBkoMET1EasMqMiNWDfPIwRYqxWdLULNjnbWNKW9mmCoSsnKaof8mCNOSjDv
         tIjA==
X-Gm-Message-State: AOAM531pbLAnB3Z03HTYwftVWry2lbTTSE3B2W9LliQRnf7n+IZ3QQrY
        0vuDkX25P/hOZ4E6m+AS6WoiUqcn7cQy+7ha8hmbTQ==
X-Google-Smtp-Source: ABdhPJy3kLISS/qYYRzMDmjCuhPu7OU3AJeQfL+t2mEx7NkNwMYgXC85KD1rOoe+vR5iNyCwy95ZqCXnaDcme/ng0CI=
X-Received: by 2002:aa7:d98f:0:b0:41c:bf0f:4c45 with SMTP id
 u15-20020aa7d98f000000b0041cbf0f4c45mr4818393eds.379.1649180950052; Tue, 05
 Apr 2022 10:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220328035951.1817417-1-tjmercier@google.com>
 <20220328035951.1817417-6-tjmercier@google.com> <20220329152142.GA15794@blackbody.suse.cz>
 <CABdmKX2874NdYCBzpKLnqWhZQDkC2wKz4ZL_aFNqrec6iAutpQ@mail.gmail.com> <20220405121245.GA30368@blackbody.suse.cz>
In-Reply-To: <20220405121245.GA30368@blackbody.suse.cz>
From:   "T.J. Mercier" <tjmercier@google.com>
Date:   Tue, 5 Apr 2022 10:48:58 -0700
Message-ID: <CABdmKX0aF5zXozbb7npcEq3PgaeDE=gaGLf+jYY4oRKW9N+46g@mail.gmail.com>
Subject: Re: [RFC v4 5/8] dmabuf: Add gpu cgroup charge transfer function
To:     =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
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
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Shuah Khan <shuah@kernel.org>,
        Kalesh Singh <kaleshsingh@google.com>, Kenny.Ho@amd.com,
        Shuah Khan <skhan@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, cgroups@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 5, 2022 at 5:12 AM Michal Koutn=C3=BD <mkoutny@suse.com> wrote:
>
> On Fri, Apr 01, 2022 at 11:41:36AM -0700, "T.J. Mercier" <tjmercier@googl=
e.com> wrote:
> > This link doesn't work for me, but I think you're referring to the
> > discussion about your "RAM_backed_buffers" comment from March 23rd.
>
> (Oops, it's a non-public message. But yes, you guessed it right ;-))
>
> > Anyway the test I did goes like this: enable memcg and gpu cgoups
> > tracking and run a process that allocates 100MiB of dmabufs. Observe
> > memcg and gpu accounting values before and after the allocation.
>
> Thanks for this measurement/dem/demoo.
>
> > Before
> > # cat memory.current gpu.memory.current
> > 14909440
> > system 0
> >
> > <Test program does the allocation of 100MiB of dmabufs>
> >
> > After
> > # cat memory.current gpu.memory.current
> > 48025600
> > system 104857600
> >
> > So the memcg value increases by about 30 MiB while the gpu values
> > increases by 100 MiB.
>
> > This is with kmem enabled, and the /proc/maps
> > file for this process indicates that the majority of that 30 MiB is
> > kernel memory.
>
> > I think this result shows that neither the kernel nor process memory
> > overlap with the gpu cgroup tracking of these allocations.
>
> It depends how the semantics of the 'system' entry is defined, no?
> As I grasped from other thread, the 'total' is going to be removed, so
> 'system' represents exclusively device memory?
>
That's right. The system charges (soon to be renamed "system-heap")
result only from an allocator (in this case the system heap) deciding
to call gpucg_try_charge for the buffer which is entirely device
memory.
>
> > So despite the fact that these buffers are in main memory, they are
> > allocated in a way that does not result in memcg attribution. (It
> > looks to me like __GFP_ACCOUNT is not set for these.)
>
> (I thought you knew what dmabufs your program used :-p)
>
I'm coming up to speed on a lot of new-to-me code here. :)
Just for completeness, these buffers were allocated with
libdmabufheap's AllocSystem.

> So, the goal is to do the tracking and migrations only via the gpu cg
> layer, regardless how memcg charges it (or not).
>
> (I have no opinion on that, I'm just summing it so that we're on the
> same page.)
>
Yes, this reflects my intention and current state of the code in this serie=
s.

> Michal

Thanks,
T.J.

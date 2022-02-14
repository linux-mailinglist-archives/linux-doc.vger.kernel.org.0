Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41FAB4B5B0F
	for <lists+linux-doc@lfdr.de>; Mon, 14 Feb 2022 21:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbiBNURz (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 14 Feb 2022 15:17:55 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:56522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbiBNURy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Feb 2022 15:17:54 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24BD91AF3C
        for <linux-doc@vger.kernel.org>; Mon, 14 Feb 2022 12:17:39 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id r18-20020a05683001d200b005ac516aa180so5280260ota.6
        for <linux-doc@vger.kernel.org>; Mon, 14 Feb 2022 12:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9iLzCF2TaMCSxVJ++G7B9k6oyEfu4Hb24dWcp9NavGo=;
        b=bvMGtJIya6i3kldlZ68PIkQqYQHrWh9etw576kRgvqubMe8pOdz7mPqNNyEWu0qYpu
         K2+jd6xSBx5ppv4DQhtAnJ/C1/ar+hoh3j4AET1ped77vG9F4QpStWrR5C/ynxDK3vKN
         F4ftSIe8zSlM/Ns0STbrln5QJiVtN8Mb1FflduG9ZT54+xcqp70wfp9WWIW2Zk6aDtuu
         Djv4CpRkBWIv6K7ZeB7+p1MAM8FavXkccQBC2frvBkJ2JfvUDXYUQVZoWaiMCLK08wlH
         BGwhSfln6q5TY9QJ0CXJOGeU35akaI0qKxsYbaroT2gei4kFJSaQtHAN9gq7j5k3cA9G
         1Q1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9iLzCF2TaMCSxVJ++G7B9k6oyEfu4Hb24dWcp9NavGo=;
        b=I4/6LcGkvqXQBsge2Cosu1yN3V+uwpfxsPh/2F8GWnxGrR5iC312KyiCvzrmJkjdsI
         jmRgwpPEzbakQ0fYDw4SdHiV47D0xGvkB5vzUIqSwkNEpcXITfLHHkbPK3cAgqUEItE1
         zZauFsK4kd71qriGj4VbTeXNwCFROxIHjZbTlCWGEdKFpU1BqKZeDC5zndofxt4D+FPG
         ZXtpTvyZbixfBFuP3yAXhKqitxNxiC5ouiFNtm1WZOVZKWAV+6cDVpyv5b0TraFJVXd2
         O6xh9mQKULWpMQkjEPqQp1DhMjmOyWVw4sbvODn6b29cULbIifzbZzDtHbFd+ocfT3a5
         8dgQ==
X-Gm-Message-State: AOAM532Q/FZZZ5Gq/nflb18D7RQPnXRaMFaFkKq+EFmotM2m8ICiF5Xp
        LMVGqXJXfqbirK9k/iszWbujudBy6occA/79nGilFjzmvH4cSMqK
X-Google-Smtp-Source: ABdhPJyWwIYYnlk3ZSzKkARKSenDfxGIdF7NYMwdRVcMXb2jVKuNZSwS8LN5JTVoMgWsqXP9by8zlQbqgPKPiLNFFWE=
X-Received: by 2002:a25:6a55:: with SMTP id f82mr574637ybc.1.1644866971626;
 Mon, 14 Feb 2022 11:29:31 -0800 (PST)
MIME-Version: 1.0
References: <20220211161831.3493782-1-tjmercier@google.com>
 <20220211161831.3493782-7-tjmercier@google.com> <Ygdfe3XSvN8iFuUc@kroah.com> <CAHRSSEwoJ67Sr_=gtSaP91cbpjJjZdOo57cfAhv3r-ye0da7PA@mail.gmail.com>
In-Reply-To: <CAHRSSEwoJ67Sr_=gtSaP91cbpjJjZdOo57cfAhv3r-ye0da7PA@mail.gmail.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Mon, 14 Feb 2022 11:29:20 -0800
Message-ID: <CAJuCfpHf=Ewm0e9kguY3MEGVHU_cyviVXByi0oQtq7kTtOOD=A@mail.gmail.com>
Subject: Re: [RFC v2 6/6] android: binder: Add a buffer flag to relinquish
 ownership of fds
To:     Todd Kjos <tkjos@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "T.J. Mercier" <tjmercier@google.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <brauner@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Kalesh Singh <kaleshsingh@google.com>, Kenny.Ho@amd.com,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        cgroups mailinglist <cgroups@vger.kernel.org>
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

On Mon, Feb 14, 2022 at 10:33 AM Todd Kjos <tkjos@google.com> wrote:
>
> On Fri, Feb 11, 2022 at 11:19 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Feb 11, 2022 at 04:18:29PM +0000, T.J. Mercier wrote:
>
> Title: "android: binder: Add a buffer flag to relinquish ownership of fds=
"
>
> Please drop the "android:" from the title.
>
> > > This patch introduces a buffer flag BINDER_BUFFER_FLAG_SENDER_NO_NEED
> > > that a process sending an fd array to another process over binder IPC
> > > can set to relinquish ownership of the fds being sent for memory
> > > accounting purposes. If the flag is found to be set during the fd arr=
ay
> > > translation and the fd is for a DMA-BUF, the buffer is uncharged from
> > > the sender's cgroup and charged to the receiving process's cgroup
> > > instead.
> > >
> > > It is up to the sending process to ensure that it closes the fds
> > > regardless of whether the transfer failed or succeeded.
> > >
> > > Most graphics shared memory allocations in Android are done by the
> > > graphics allocator HAL process. On requests from clients, the HAL pro=
cess
> > > allocates memory and sends the fds to the clients over binder IPC.
> > > The graphics allocator HAL will not retain any references to the
> > > buffers. When the HAL sets the BINDER_BUFFER_FLAG_SENDER_NO_NEED for =
fd
> > > arrays holding DMA-BUF fds, the gpu cgroup controller will be able to
> > > correctly charge the buffers to the client processes instead of the
> > > graphics allocator HAL.
> > >
> > > From: Hridya Valsaraju <hridya@google.com>
> > > Signed-off-by: Hridya Valsaraju <hridya@google.com>
> > > Co-developed-by: T.J. Mercier <tjmercier@google.com>
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > ---
> > > changes in v2
> > > - Move dma-buf cgroup charge transfer from a dma_buf_op defined by ev=
ery
> > > heap to a single dma-buf function for all heaps per Daniel Vetter and
> > > Christian K=C3=B6nig.
> > >
> > >  drivers/android/binder.c            | 26 ++++++++++++++++++++++++++
> > >  include/uapi/linux/android/binder.h |  1 +
> > >  2 files changed, 27 insertions(+)
> > >
> > > diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> > > index 8351c5638880..f50d88ded188 100644
> > > --- a/drivers/android/binder.c
> > > +++ b/drivers/android/binder.c
> > > @@ -42,6 +42,7 @@
> > >
> > >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > >
> > > +#include <linux/dma-buf.h>
> > >  #include <linux/fdtable.h>
> > >  #include <linux/file.h>
> > >  #include <linux/freezer.h>
> > > @@ -2482,8 +2483,10 @@ static int binder_translate_fd_array(struct li=
st_head *pf_head,
> > >  {
> > >       binder_size_t fdi, fd_buf_size;
> > >       binder_size_t fda_offset;
> > > +     bool transfer_gpu_charge =3D false;
> > >       const void __user *sender_ufda_base;
> > >       struct binder_proc *proc =3D thread->proc;
> > > +     struct binder_proc *target_proc =3D t->to_proc;
> > >       int ret;
> > >
> > >       fd_buf_size =3D sizeof(u32) * fda->num_fds;
> > > @@ -2521,8 +2524,15 @@ static int binder_translate_fd_array(struct li=
st_head *pf_head,
> > >       if (ret)
> > >               return ret;
> > >
> > > +     if (IS_ENABLED(CONFIG_CGROUP_GPU) &&
> > > +             parent->flags & BINDER_BUFFER_FLAG_SENDER_NO_NEED)
> > > +             transfer_gpu_charge =3D true;
> > > +
> > >       for (fdi =3D 0; fdi < fda->num_fds; fdi++) {
> > >               u32 fd;
> > > +             struct dma_buf *dmabuf;
> > > +             struct gpucg *gpucg;
> > > +
> > >               binder_size_t offset =3D fda_offset + fdi * sizeof(fd);
> > >               binder_size_t sender_uoffset =3D fdi * sizeof(fd);
> > >
> > > @@ -2532,6 +2542,22 @@ static int binder_translate_fd_array(struct li=
st_head *pf_head,
> > >                                                 in_reply_to);
> > >               if (ret)
> > >                       return ret > 0 ? -EINVAL : ret;
> > > +
> > > +             if (!transfer_gpu_charge)
> > > +                     continue;
> > > +
> > > +             dmabuf =3D dma_buf_get(fd);
> > > +             if (IS_ERR(dmabuf))
> > > +                     continue;
> > > +
> > > +             gpucg =3D gpucg_get(target_proc->tsk);
> > > +             ret =3D dma_buf_charge_transfer(dmabuf, gpucg);
> > > +             if (ret) {
> > > +                     pr_warn("%d:%d Unable to transfer DMA-BUF fd ch=
arge to %d",
> > > +                             proc->pid, thread->pid, target_proc->pi=
d);
> > > +                     gpucg_put(gpucg);
> > > +             }
> > > +             dma_buf_put(dmabuf);
>
> Since we are creating a new gpu cgroup abstraction, couldn't this
> "transfer" be done in userspace by the target instead of in the kernel
> driver? Then this patch would reduce to just a flag on the buffer
> object.

Are you suggesting to have a userspace accessible cgroup interface for
transferring buffer charges and the target process to use that
interface for requesting the buffer to be charged to its cgroup?
I'm worried about the case when the target process does not request
the transfer after receiving the buffer with this flag set. The charge
would stay with the wrong process and accounting will be invalid.

Technically, since the proposed cgroup supports charge transfer from
the very beginning, the userspace can check if the cgroup is mounted
and if so then it knows this feature is supported.

> This also solves the issue that Greg brought up about
> userspace needing to know whether the kernel implements this feature
> (older kernel running with newer userspace). I think we could just
> reserve some flags for userspace to use (and since those flags are
> "reserved" for older kernels, this would enable this feature even for
> old kernels)
>
> > >       }
> > >       return 0;
> > >  }
> > > diff --git a/include/uapi/linux/android/binder.h b/include/uapi/linux=
/android/binder.h
> > > index 3246f2c74696..169fd5069a1a 100644
> > > --- a/include/uapi/linux/android/binder.h
> > > +++ b/include/uapi/linux/android/binder.h
> > > @@ -137,6 +137,7 @@ struct binder_buffer_object {
> > >
> > >  enum {
> > >       BINDER_BUFFER_FLAG_HAS_PARENT =3D 0x01,
> > > +     BINDER_BUFFER_FLAG_SENDER_NO_NEED =3D 0x02,
> > >  };
> > >
> > >  /* struct binder_fd_array_object - object describing an array of fds=
 in a buffer
> > > --
> > > 2.35.1.265.g69c8d7142f-goog
> > >
> >
> > How does userspace know that binder supports this new flag?  And where
> > is the userspace test for this new feature?  Isn't there a binder test
> > framework somewhere?
> >
> > thanks,
> >
> > greg k-h

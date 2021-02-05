Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19EBA3114B7
	for <lists+linux-doc@lfdr.de>; Fri,  5 Feb 2021 23:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233100AbhBEWMw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 5 Feb 2021 17:12:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232458AbhBEOk7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Feb 2021 09:40:59 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D14DC0617A7
        for <linux-doc@vger.kernel.org>; Fri,  5 Feb 2021 08:19:04 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id q131so4628200pfq.10
        for <linux-doc@vger.kernel.org>; Fri, 05 Feb 2021 08:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=uaau4sgQ9hT4TilyNvussNtYWDpCQq4C5pX2PL2MkbA=;
        b=RQiutqdV9uKt5WpY7LmQnqOyik8QlV/xIC11t47Cxy6iPhsjdv7Kgt4t0vvK0ioHfm
         evdTtgL4mXNsmg2lYfDsBg0vDtJuclK/YKze5J5lernt3k/bnB7sosOWua7eWz5n3xFd
         Y9T09TOUDCpONnIP8oi8aST0SHKdlM7bsgcVwdzBVRwXa4+ypaC8v7qimmBPM/XVG0AH
         6eeSMwZmJAYY73o5aDxUKihBsBtIdgCDSRiH35nqLpdz9zwJ34Pztdz4ltqVTgpzQEMI
         Tqna40GWas6ybMNlVQ9D1coNYLz0CBr+9t8ic2Siyy66vvOie3xSqZPi5Kq7wjUtOV6h
         tcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uaau4sgQ9hT4TilyNvussNtYWDpCQq4C5pX2PL2MkbA=;
        b=WmEr0/0YP4Z6aOsXxgiJZ5N5sP+1uqUaX5teKBLiFQRvqO1ZI5nhxQkjdeZdXV3Ss3
         +PQJLSETFuQ7RWlcfApE+17q/0ng5XpeNWGysaZHDpLZyVzTONgTLHExbEMMmOKHm7BM
         mAvgQ6HM4zBJIYWZWyFCXsv0iZ2IcxXwUuLJwKFzCiBal2GSh36Ovyf8Hh96XyM0DUdm
         Ue9rM/ugPifU4fCpDTB0Tipu8Bc+UOoIdY7OtLyXkHgNwdfLBOfk5CSRN0/Af4Cl87mT
         W5qf7/AE9QhDuBCtvudPwZIPccGjPciIfH8zJxRJ2aEAljWFxIpVQvrm6mMvkY/aKjEu
         9VRQ==
X-Gm-Message-State: AOAM532qKZ3P0HdTnVdNM26ffNW1Ua85gqNNJ/OM+h2S7lK2pyupLWAR
        NuIzWvjDoWoALhxpdJ9pt38J0a6kmHhbGNwAHRmM8Eq7PmvbMQ==
X-Google-Smtp-Source: ABdhPJw/KUgUzSu9HyWsw7w094KKGV8UazdOBjJhfXTEooNN4RSJLHuY9UsurqCqtD67VvrC4YI+d1km2qWrSXarE8o=
X-Received: by 2002:a63:5309:: with SMTP id h9mr4691610pgb.19.1612538034909;
 Fri, 05 Feb 2021 07:13:54 -0800 (PST)
MIME-Version: 1.0
References: <20210205022328.481524-1-kaleshsingh@google.com>
 <20210205022328.481524-2-kaleshsingh@google.com> <df97ba85-2291-487a-8af0-84398f9e8188@amd.com>
In-Reply-To: <df97ba85-2291-487a-8af0-84398f9e8188@amd.com>
From:   Kalesh Singh <kaleshsingh@google.com>
Date:   Fri, 5 Feb 2021 10:13:43 -0500
Message-ID: <CAC_TJvfZ4G8oL1c6kgBVvmjeXYPpf3ziRp+BEWqiEKYK1mhbDg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dmabuf: Add dmabuf inode number to /proc/*/fdinfo
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Jann Horn <jannh@google.com>,
        Jeffrey Vander Stoep <jeffv@google.com>,
        Kees Cook <keescook@chromium.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Minchan Kim <minchan@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        Anand K Mistry <amistry@google.com>,
        NeilBrown <neilb@suse.de>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Michel Lespinasse <walken@google.com>,
        Bernd Edlinger <bernd.edlinger@hotmail.de>,
        Andrei Vagin <avagin@gmail.com>,
        Yafang Shao <laoar.shao@gmail.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 5, 2021 at 2:56 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 05.02.21 um 03:23 schrieb Kalesh Singh:
> > If a FD refers to a DMA buffer add the DMA buffer inode number to
> > /proc/<pid>/fdinfo/<FD> and /proc/<pid>/task/<tid>/fdindo/<FD>.
> >
> > The dmabuf inode number allows userspace to uniquely identify the buffe=
r
> > and avoids a dependency on /proc/<pid>/fd/* when accounting per-process
> > DMA buffer sizes.
>
> BTW: Why do we make this DMA-buf specific? Couldn't we always print the
> inode number for all fds?

Good point. We can make this a common field instead of DMA buf
specific. I will update in the next version.

Thanks,
Kalesh
>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
> > ---
> > Changes in v3:
> >    - Add documentation in proc.rst
> > Changes in v2:
> >    - Update patch description
> >
> >   Documentation/filesystems/proc.rst | 17 +++++++++++++++++
> >   drivers/dma-buf/dma-buf.c          |  1 +
> >   2 files changed, 18 insertions(+)
> >
> > diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesys=
tems/proc.rst
> > index 2fa69f710e2a..fdd38676f57f 100644
> > --- a/Documentation/filesystems/proc.rst
> > +++ b/Documentation/filesystems/proc.rst
> > @@ -2031,6 +2031,23 @@ details]. 'it_value' is remaining time until the=
 timer expiration.
> >   with TIMER_ABSTIME option which will be shown in 'settime flags', but=
 'it_value'
> >   still exhibits timer's remaining time.
> >
> > +DMA Buffer files
> > +~~~~~~~~~~~~~~~~
> > +
> > +::
> > +
> > +     pos:    0
> > +     flags:  04002
> > +     mnt_id: 9
> > +     dmabuf_inode_no: 63107
> > +     size:   32768
> > +     count:  2
> > +     exp_name:  system-heap
> > +
> > +where 'dmabuf_inode_no' is the unique inode number of the DMA buffer f=
ile.
> > +'size' is the size of the DMA buffer in bytes. 'count' is the file cou=
nt of
> > +the DMA buffer file. 'exp_name' is the name of the DMA buffer exporter=
.
> > +
> >   3.9 /proc/<pid>/map_files - Information about memory mapped files
> >   ---------------------------------------------------------------------
> >   This directory contains symbolic links which represent memory mapped =
files
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 9ad6397aaa97..d869099ede83 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -414,6 +414,7 @@ static void dma_buf_show_fdinfo(struct seq_file *m,=
 struct file *file)
> >   {
> >       struct dma_buf *dmabuf =3D file->private_data;
> >
> > +     seq_printf(m, "dmabuf_inode_no:\t%lu\n", file_inode(file)->i_ino)=
;
> >       seq_printf(m, "size:\t%zu\n", dmabuf->size);
> >       /* Don't count the temporary reference taken inside procfs seq_sh=
ow */
> >       seq_printf(m, "count:\t%ld\n", file_count(dmabuf->file) - 1);
>

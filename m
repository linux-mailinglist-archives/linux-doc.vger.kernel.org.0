Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5CFB7853B6
	for <lists+linux-doc@lfdr.de>; Wed, 23 Aug 2023 11:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235443AbjHWJUQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 23 Aug 2023 05:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235581AbjHWJSo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Aug 2023 05:18:44 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028172721
        for <linux-doc@vger.kernel.org>; Wed, 23 Aug 2023 02:07:57 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-986d8332f50so716692666b.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Aug 2023 02:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1692781676; x=1693386476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FVP76RlJvsBtkWhgLM8vBQOXDlj8GhxoiyPHARb5l/E=;
        b=LyVvis7zYm4I0vHCuioQM5J/LFAGr8OOXZdZExDQl1j63nfL3buqPv+l98yd2v5szd
         jHpvj83SgKtnEhzrOVuPxK5trCmzk3MTUj9bjTKTnTEsumPlkRp3eyCrkrT0cP2thv2s
         RuWwL1qDO4NABN0w6oGYhhPHwC9GvDmrDNS0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692781676; x=1693386476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVP76RlJvsBtkWhgLM8vBQOXDlj8GhxoiyPHARb5l/E=;
        b=IRbfHkxtObgQkghxbfgXuWN+N7bLeeC3jS/1TmXBwLHmllibh63hm1e30On+x8FG+z
         dWY6S2UzCu0elWOfHzKwvLh7T43D1TXmmNT3uiG3ewLfmnv8Vx9uuEmOohkd7R6mD/uu
         UG7+1hYcSIS9YRzXIdG29yQae5j/VV7yFj5owMXE/dlkXKmKnr/6ibaSZKkkB3c95zcj
         t5+xaXt3MfIBDgOmtpZr0dknduwYDBdWVIchTrDtIUlXmfOV67AaFothB/VI/u4CCrly
         dAy9s1Tc3ckujR5BgVg/te+xYqqHiH5i9qK1wI8BrQnhmQAPfwyyCUBejgN9tfsAMfT/
         pxXQ==
X-Gm-Message-State: AOJu0YxVpNTFJ4zVib56Ys7HolqV6bbsWPbBvskn1AF71LmNskHH51n3
        TCc2juFYnDa2rDdLq/WyenxMPl73CQAC5WJsnr+kNw==
X-Google-Smtp-Source: AGHT+IFz8/brK1bWJ5bvmYypjGCFsAX9p1Z8B5AoZJZ+Gg/CamQ6zFRzZR72NtZl0GOitVFch3eYVledp8ZGP9aC53Y=
X-Received: by 2002:a17:906:cc0b:b0:99b:499d:4635 with SMTP id
 ml11-20020a170906cc0b00b0099b499d4635mr9408127ejb.75.1692781676219; Wed, 23
 Aug 2023 02:07:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230711043405.66256-1-zhangjiachen.jaycee@bytedance.com> <20230711043405.66256-5-zhangjiachen.jaycee@bytedance.com>
In-Reply-To: <20230711043405.66256-5-zhangjiachen.jaycee@bytedance.com>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Wed, 23 Aug 2023 11:07:44 +0200
Message-ID: <CAJfpegtqJo78wqT0EY0=1xfoSROsJogg9BNC_xJv6id9J1Oa+g@mail.gmail.com>
Subject: Re: [PATCH 4/5] fuse: writeback_cache consistency enhancement (writeback_cache_v2)
To:     Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        me@jcix.top
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 11 Jul 2023 at 06:36, Jiachen Zhang
<zhangjiachen.jaycee@bytedance.com> wrote:
>
> Some users may want both the high performance of the writeback_cahe mode
> and a little bit more consistency among FUSE mounts. Current
> writeback_cache mode never updates attributes from server, so can never
> see the file attributes changed by other FUSE mounts, which means
> 'zero-consisteny'.
>
> This commit introduces writeback_cache_v2 mode, which allows the attributes
> to be updated from server to kernel when the inode is clean and no
> writeback is in-progressing. FUSE daemons can select this mode by the
> FUSE_WRITEBACK_CACHE_V2 init flag.
>
> In writeback_cache_v2 mode, the server generates official attributes.
> Therefore,
>
>     1. For the cmtime, the cmtime generated by kernel are just temporary
>     values that are never flushed to server by fuse_write_inode(), and they
>     could be eventually updated by the official server cmtime. The
>     mtime-based revalidation of the fc->auto_inval_data mode is also
>     skipped, as the kernel-generated temporary cmtime are likely not equal
>     to the offical server cmtime.
>
>     2. For the file size, we expect server updates its file size on
>     FUSE_WRITEs. So we increase fi->attr_version in fuse_writepage_end() to
>     check the staleness of the returning file size.
>
> Together with FOPEN_INVAL_ATTR, a FUSE daemon is able to implement
> close-to-open (CTO) consistency like NFS client implementations.

What I'd prefer is mode similar to NFS: getattr flushes pending writes
so that server ctime/mtime are always in sync with client.  FUSE
probably should have done that from the beginning, but at that time I
wasn't aware of the NFS solution.

Thanks,
Miklos

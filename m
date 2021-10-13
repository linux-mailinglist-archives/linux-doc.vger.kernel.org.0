Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859EF42BA94
	for <lists+linux-doc@lfdr.de>; Wed, 13 Oct 2021 10:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230461AbhJMIhV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 13 Oct 2021 04:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbhJMIhS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Oct 2021 04:37:18 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F58C061570
        for <linux-doc@vger.kernel.org>; Wed, 13 Oct 2021 01:35:15 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id z11so8452827lfj.4
        for <linux-doc@vger.kernel.org>; Wed, 13 Oct 2021 01:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SefPEr/moa6wKQbCWN6jZ4XKEiadGETzM9Rm53D/EzU=;
        b=vknABL3GD8R2SCx+yRHuxuXifwOW2ayrE5DQjDemq83z5+4G7v2Rwp4QdzWEmDtUl6
         RhQj49RaP8tSRCqWRlUiUayLRCxAGMR9IxJmXLlKsScV9r0+QXFUUfgAgD84t9oekgpc
         ztBwHaKrhwuXXOarPxkgoztR0ybOIwhXwX6XM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SefPEr/moa6wKQbCWN6jZ4XKEiadGETzM9Rm53D/EzU=;
        b=1YhMNDl/Rz15XRE67y1TVWNqWxgj4xz4fR7MNiXl3nwW7fC3YK0WMWZgoP08L1vNCR
         8gYI6orzsAZvdgCpXF3OFtDpK6JQ5XscXaZ583cUFMv2rffWFIXkVhoF42dyCfsv18Jv
         lpASdb8QeoATFL/KXEnisUEAQuI31i0s6kPYV+Q4tQiy3bivBXwZNpZGzHa+rfL6XFlx
         t8psErepF3t/Kv0D+OY4N9tEy9e9pT2CKjeenJxl4prcbEjJY1SKAGKGvsuoMjIGwTNi
         T9dlnv3NPOnEJOSoJ+pN56h85pQZqQ81zMv8cOGwZTFS+ZigSOOORDlBzcaB9BLxJLGr
         9P6g==
X-Gm-Message-State: AOAM532ZTioUQvp5g0WJEL55eqB+FQv+Y+ekmV9OZhkNvnmRnPvDB5WZ
        ML7dc7rCnscerk5QdYRsy/UnBbtQr+78e0X1++gxYA==
X-Google-Smtp-Source: ABdhPJxwVjBoXGbdxEOjKa3jafLF2MTLf7MWOKnf9TsyT7qGPhKyGXz2Y2SQhSx02NS3pjnpCMIzIPz7JhLyZOSw7zM=
X-Received: by 2002:a05:6512:314b:: with SMTP id s11mr13005772lfi.206.1634114114183;
 Wed, 13 Oct 2021 01:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211012135935.37054-1-lmb@cloudflare.com> <20211012135935.37054-5-lmb@cloudflare.com>
 <836d9371-7d51-b01f-eefd-cc3bf6f5f68e@6wind.com>
In-Reply-To: <836d9371-7d51-b01f-eefd-cc3bf6f5f68e@6wind.com>
From:   Lorenz Bauer <lmb@cloudflare.com>
Date:   Wed, 13 Oct 2021 09:35:03 +0100
Message-ID: <CACAyw99ZfALrTRYKOTifWXCRFS9sUOhONbyEyWjTBdzFE4fpQQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] bpf: export bpf_jit_current
To:     nicolas.dichtel@6wind.com
Cc:     Luke Nelson <luke.r.nels@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        kernel-team <kernel-team@cloudflare.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 12 Oct 2021 at 17:29, Nicolas Dichtel <nicolas.dichtel@6wind.com> w=
rote:
>
> Le 12/10/2021 =C3=A0 15:59, Lorenz Bauer a =C3=A9crit :
> > Expose bpf_jit_current as a read only value via sysctl.
> >
> > Signed-off-by: Lorenz Bauer <lmb@cloudflare.com>
> > ---
>
> [snip]
>
> > +     {
> > +             .procname       =3D "bpf_jit_current",
> > +             .data           =3D &bpf_jit_current,
> > +             .maxlen         =3D sizeof(long),
> > +             .mode           =3D 0400,
> Why not 0444 ?

This mirrors what the other BPF related sysctls do, which only allow
access from root with CAP_SYS_ADMIN. I'd prefer 0444 as well, but
Daniel explicitly locked down these sysctls in
2e4a30983b0f9b19b59e38bbf7427d7fdd480d98.

Lorenz

--
Lorenz Bauer  |  Systems Engineer
6th Floor, County Hall/The Riverside Building, SE1 7PB, UK

www.cloudflare.com

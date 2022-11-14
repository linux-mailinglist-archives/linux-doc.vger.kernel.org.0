Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44C2B6286EC
	for <lists+linux-doc@lfdr.de>; Mon, 14 Nov 2022 18:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237219AbiKNRWc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 14 Nov 2022 12:22:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237828AbiKNRW0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Nov 2022 12:22:26 -0500
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B49E022BC7
        for <linux-doc@vger.kernel.org>; Mon, 14 Nov 2022 09:22:24 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-368036d93abso111067807b3.18
        for <linux-doc@vger.kernel.org>; Mon, 14 Nov 2022 09:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QUsNi4J79V6t81+jF+yxLJ421uZ3CPaUqBkKGi/clUc=;
        b=Lvtq/8s3DPKdvP+jHmk5TcWQ+rEzc104kZmjgRVQis8Uji8oTagz1wVsewa66tOu6l
         nANL/D3e3AEgy50Mos7FGQ1F4pIwFjQf+8Lr5agj0oVYf5S8dNcijnSBYcboiSR5E4Wz
         0IfOltZMCvYQkcS1184xKnzAfAfnt9u+u5PW7m4vUg60SeAGDmZxcK5+sMW5/FkscHl1
         6HPkv4PZsMO/ZqFWCoH18SWNXp9lD3J6J2+ZPEdtEdOOnb4lEcDiWUV/Afr4A9VlyIOS
         /ybrN6E1HXHmVN+O8XZPaZOyP9sJgltDdcenLDMzP2rNgHOeTNz97u4XYvkYVrCs1/EF
         8S0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QUsNi4J79V6t81+jF+yxLJ421uZ3CPaUqBkKGi/clUc=;
        b=itL1Hl7ASgAgihqD9kqYoZWTid7QCOPII8aUtvAemYOnWawMm40SX1awxZmAcHTE12
         bfDIzt2WS/AqSo11Uz+MuCRtMCWYXc4S16eWTT8YAm/7UAISFyGRBWktusvpTT8t391o
         iRmnljnRuTinHwwsU/d4tM5DxgqibEP9OLxGm/LwW96vRJna2QKb9roIrdRieKOt709m
         yP36MvWBWzC5/oE6BdYqtzHqsRfuBzTcpim8LrWTiDiWM9xVm5Xu8DWHhJRgtaI0pHFt
         FiwzmJYCP+4+OiHriDelJ254r8/xXUmVBrRCLXC7Nw6He+o5PHKDLXTUmItOql/+3SvZ
         ut8w==
X-Gm-Message-State: ANoB5pmyh2H7wPBVZTb6jRwVZ2nDFZu/ui6+v7LwzhWjvHjGsog30Wxo
        yiezbOEJ2BAz6BIM2GQmEe16UEI=
X-Google-Smtp-Source: AA0mqf6sQEQa53xmJeaZErJhcNcfwX4bm0676GIh9alHZJIH0lwfOb1usV3DAq26/ZxOr/XoirOY4L0=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a81:5e45:0:b0:355:b0c2:91f2 with SMTP id
 s66-20020a815e45000000b00355b0c291f2mr14100857ywb.129.1668446543963; Mon, 14
 Nov 2022 09:22:23 -0800 (PST)
Date:   Mon, 14 Nov 2022 09:22:22 -0800
In-Reply-To: <20221113103327.3287482-1-mtahhan@redhat.com>
Mime-Version: 1.0
References: <20221113103327.3287482-1-mtahhan@redhat.com>
Message-ID: <Y3J5ThS9VGVVgsKf@google.com>
Subject: Re: [PATCH bpf-next v1 1/1] docs: fixup cpumap sphinx >= 3.1 warning
From:   sdf@google.com
To:     mtahhan@redhat.com
Cc:     bpf@vger.kernel.org, linux-doc@vger.kernel.org, jbrouer@redhat.com,
        thoiland@redhat.com, donhunte@redhat.com, akiyks@gmail.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/13, mtahhan@redhat.com wrote:
> From: Maryam Tahhan <mtahhan@redhat.com>

> Fixup bpf_map_update_elem() declaration to use a single line.

> Signed-off-by: Maryam Tahhan <mtahhan@redhat.com>
> Reported-by: Akira Yokosawa <akiyks@gmail.com>

Acked-by: Stanislav Fomichev <sdf@google.com>

> ---
>   Documentation/bpf/map_cpumap.rst | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

> diff --git a/Documentation/bpf/map_cpumap.rst  
> b/Documentation/bpf/map_cpumap.rst
> index eaf57b38cafd..61a797a86342 100644
> --- a/Documentation/bpf/map_cpumap.rst
> +++ b/Documentation/bpf/map_cpumap.rst
> @@ -48,8 +48,7 @@ Userspace
>       program will result in the program failing to load and a verifier  
> warning.

>   .. c:function::
> -    int bpf_map_update_elem(int fd, const void *key, const void *value,
> -                   __u64 flags);
> +    int bpf_map_update_elem(int fd, const void *key, const void *value,  
> __u64 flags);

>    CPU entries can be added or updated using the ``bpf_map_update_elem()``
>    helper. This helper replaces existing elements atomically. The  
> ``value`` parameter
> --
> 2.35.3


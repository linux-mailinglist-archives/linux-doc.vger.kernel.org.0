Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0D863B2FA
	for <lists+linux-doc@lfdr.de>; Mon, 28 Nov 2022 21:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233585AbiK1UXi (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Nov 2022 15:23:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234011AbiK1UX1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Nov 2022 15:23:27 -0500
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CD319C33
        for <linux-doc@vger.kernel.org>; Mon, 28 Nov 2022 12:23:26 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id l127so12898181oia.8
        for <linux-doc@vger.kernel.org>; Mon, 28 Nov 2022 12:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCa69YdEtMn4spqO3MAiWVwYikmJqS2nm+0NXq6y6Ck=;
        b=Yc4MyIuW2yggdapxAdcen0pJDpU/eLlafTPt80WvP733RUnpDMNqpoY5ETncKVt0EB
         N9qM7f119WFnJRV4ANVDHKZyi/F8TcWSz+jbOHn49QmLz0NgT7BIOsIri3BAfBMyAKw1
         5QC6Ov3Hh7HAowwolK8nIN+ZDe59lDcE5VTGd45Q0KYmHZbNlPPl832j2vlOAJOD8Rb9
         DvoeqKwWM8Ni+2xMFFAAhnNI8KWDPMnCdiUAv+mfkD/76psDAXrM4ecg+SNRk4Nbcb1v
         7YOtUSJggoEeiegNwhjbxFB0Uq/63+mmNZ8DH7cSn02DoMH4GHbXFjeCN2N+94Oi0DIZ
         ZCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCa69YdEtMn4spqO3MAiWVwYikmJqS2nm+0NXq6y6Ck=;
        b=h/pmOXFTLKnGEhklU53TGDEEdqudHx+1hj1DQZjeUhLPuyAGGoFfPRjAn/05Mi1AGu
         /ExsduXjNu4F92noQwNS/mHvw1rZsVgRsia1YTUvMY1558oXjgOvUgjHiKebwfTDreBk
         VqOKePAm7JX7QeNp4wI8+VUeOSCXMNxWrlLP8i3WmlSIuSTpr/wXn+nk1xQ6EnIT6WOM
         n474ScNASTTpXSMpUqUXui4gZgSLJ87at7RY0VkzfvjxjL3fobYtkdm86GoUEKDXOtPk
         bmLSRRzYsUzMOwm1bA5syk1FMXbgO+616cSSrb8KNkTylbRvlkBbDCBsmYKsHFMF7XsU
         Dw0g==
X-Gm-Message-State: ANoB5plR8MRTF09ySBZHrdgiKkVWjrlXWXxm/Eh2TgRcrirhLLHGKtAQ
        twuPT0xbbUC6yPYu5jSeORl6JtU+Xc/LbKJOSBo=
X-Google-Smtp-Source: AA0mqf6KOpkpp4yLsP+YGWSjXQZkjzqtYGUWdHBw22rjkoo5Mx5ec1jUOGue9xiXqjF0rVRwCM/EibS6SFlNovCm9r0=
X-Received: by 2002:a05:6808:9b8:b0:34f:97ea:14d with SMTP id
 e24-20020a05680809b800b0034f97ea014dmr15773971oig.96.1669667005543; Mon, 28
 Nov 2022 12:23:25 -0800 (PST)
MIME-Version: 1.0
References: <20221125210055.16333-1-rdunlap@infradead.org>
In-Reply-To: <20221125210055.16333-1-rdunlap@infradead.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 28 Nov 2022 15:23:14 -0500
Message-ID: <CADnq5_NaHGrEM++_vRH0n3XKB-ON8ked4YMaFuPBYGv=PQ0xhA@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu: update docum. filename following rename
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Applied.  Thanks!

Alex

On Fri, Nov 25, 2022 at 4:01 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix documentation build errors for amdgpu: correct the filename.
>
> Error: Cannot open file ../drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> Error: Cannot open file ../drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> Error: Cannot open file ../drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
>
> WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -sphinx-ve=
rsion 5.3.0 -function MMU Notifier ../drivers/gpu/drm/amd/amdgpu/amdgpu_mn.=
c' failed with return code 1
> WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -sphinx-ve=
rsion 5.3.0 -internal ../drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c' failed wit=
h return code 2
>
> Fixes: d9483ecd327b ("drm/amdgpu: rename the files for HMM handling")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> ---
>  Documentation/gpu/amdgpu/driver-core.rst |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff -- a/Documentation/gpu/amdgpu/driver-core.rst b/Documentation/gpu/am=
dgpu/driver-core.rst
> --- a/Documentation/gpu/amdgpu/driver-core.rst
> +++ b/Documentation/gpu/amdgpu/driver-core.rst
> @@ -148,10 +148,10 @@ PRIME Buffer Sharing
>  MMU Notifier
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c
>     :doc: MMU Notifier
>
> -.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c
>     :internal:
>
>  AMDGPU Virtual Memory

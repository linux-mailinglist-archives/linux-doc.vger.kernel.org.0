Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00461F8CE2
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2020 06:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbgFOEN1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 15 Jun 2020 00:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgFOENZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Jun 2020 00:13:25 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B080C05BD43
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2020 21:13:23 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id j202so8300631ybg.6
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2020 21:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a/+Hcg0/3J9I3AxA1tGH/O1FSezeXt+zyW36H9kmc+0=;
        b=rTiW/phGaeTJk5Cu8UPYwcysQscXKX/ltfldOkyNePn1iaouMwIxkVSKkBthYiSQ2q
         v/PDs41DDaiCHOlCrAqCnfNVVh4VEhjXhaRBHGt63widXmFI3riRndmM1Q1ehdUCflWu
         I8HliMQSF4bv1pTtCpN3H7GkE5WDzbJUoHxsOdhWw1j5bAuiG4L8LxRLVRmw0ghquQIs
         7M4Ki2UZ6sMoKIjZKDkXsQe+IMcELV+uiXP5OR7a9KXQywYEsvpVEVRFoj9PHd0WhS71
         H5/XqdhOGKD1rFvKy7hRBqK3mwouD/1PnwkUU5nnIogbfTwRluu1rG9KoUc+qISCevYh
         EL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a/+Hcg0/3J9I3AxA1tGH/O1FSezeXt+zyW36H9kmc+0=;
        b=DNOlAqSnzHo45p7iz2FXCMTm6tpxLUdvD2vE8rFkdPiPK4jfg9HK37WOEVldng6+1H
         oKfoglfln/UaYwHvbnKVcUSeIJ1anbebLT5iRdI7t/AR8ANFLBssj6NcpQVE4CrsfChm
         RbB0NX9YkH32um0mkT+UZb01AavuhTy9eNQbuiUishXz2EaXKpFABGuIt66K5u7eMUYH
         16UZS/SdJz3bh8NDpKIxWpBrUPPvcbhcAGishOosPWdjgdkI2gwtKfVJDZx2zJz1Mqpy
         st4RIb8ExNU0eYtq9dFZCz00duyqW5W+oXMHDBrsl6gP5Gx+KGNkhYF3fCKuqBtfSSY/
         Aweg==
X-Gm-Message-State: AOAM532hYQM3t5Xinr+gOd1FiuGVIZEP2ARXEnEWQt/yyb52IIaV5/qr
        4sXTPtX+MU8hmzoLauyLUPDHR3u4qg5QvN004xVMrA==
X-Google-Smtp-Source: ABdhPJyiPMHvaILosjLc/KHQg0liU6EZkZNf+Bt2vYIicOF0yfOZqmDiG+sd4hvCsUWKhOOdrxnWKBmwFAVclYKWiVM=
X-Received: by 2002:a5b:cc9:: with SMTP id e9mr28140746ybr.287.1592194401312;
 Sun, 14 Jun 2020 21:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <12c2afd1-2dcf-2ea0-02aa-bc2759729c77@infradead.org>
In-Reply-To: <12c2afd1-2dcf-2ea0-02aa-bc2759729c77@infradead.org>
From:   Michel Lespinasse <walken@google.com>
Date:   Sun, 14 Jun 2020 21:13:07 -0700
Message-ID: <CANN689E5sSwTKLeswEuDVrcOFAuGm2UvanzUMK4GDuBX_ey44Q@mail.gmail.com>
Subject: Re: [PATCH] Documentation: fix filesystems/locking.rst malformed
 table warnings
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jun 14, 2020 at 8:22 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix Sphinx malformed table warnings in filesystems/locking.rst:
>
> lnx-58-rc1/Documentation/filesystems/locking.rst:443: WARNING: Malformed table.
> Text in column margin in table line 8.
>
> lnx-58-rc1/Documentation/filesystems/locking.rst:620: WARNING: Malformed table.
> Text in column margin in table line 2.
>
> Fixes: ec23eb54fbc7 ("docs: fs: convert docs without extension to ReST")
> Fixes: c1e8d7c6a7a6 ("mmap locking API: convert mmap_sem comments")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: Michel Lespinasse <walken@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>

Acked-by: Michel Lespinasse <walken@google.com>
Thanks for the fixes !

-- 
Michel "Walken" Lespinasse
A program is never fully debugged until the last user dies.

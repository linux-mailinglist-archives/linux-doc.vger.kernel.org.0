Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7D2B497F33
	for <lists+linux-doc@lfdr.de>; Mon, 24 Jan 2022 13:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbiAXMV2 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 24 Jan 2022 07:21:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238591AbiAXMV1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Jan 2022 07:21:27 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41268C06173D
        for <linux-doc@vger.kernel.org>; Mon, 24 Jan 2022 04:21:27 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id l64-20020a9d1b46000000b005983a0a8aaaso21997104otl.3
        for <linux-doc@vger.kernel.org>; Mon, 24 Jan 2022 04:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5HHwOHpu3DODX4uWQ1+JZsd1/iIv5h6cdRibus7mBoQ=;
        b=lf093PoaWmusMgbiWy/WDpNTxiGQ8V5bvGmNAVRCS7jWCTTUL3SvfmEUxY+2pcHc7x
         zhpDlcNUDYTQub/RIKGlX2iDEwmyowOkMcFSp1fD/sSe0PxMuEP6Iqx9L1voRUFeqlt2
         85EUPdAFScwMwM1thEV/3TbCbQ6SndwlDnZylNYQxLTJRMXIG5dOt7mCubuFU5zvZPeQ
         PCYslMpSLeZzcQbq+6ho807GRSEOEibqCUZ1e3hoD6Y0M7ifNYMJF2vyaBhBmdVXtsxY
         Oub8NhYRxSmPX+89FDlveehVTV9p+4MIjScv2djqoYjLokXFVW4wISpaV7KfHCGxmQ2/
         gAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5HHwOHpu3DODX4uWQ1+JZsd1/iIv5h6cdRibus7mBoQ=;
        b=PAtFgy3MQLqwMPipK4iRtMtk3s3FW1cDQSVemqEDrIFG8/XhxX5U289TL1Mw86z97A
         ttN53N8CTrblz+3FNS4Yv6VtxI38zILsZY2NiUzZqzvX9KmU9+4q+z27wqTOAdhce0zP
         7VFhxP96CoXPtQVo1i1rJHOmDnykc2pv0w4FQAVTSjlRnClIYVKIJk06WgNg/DOq5+hx
         P299g26GxouUrd+JlnzRK8Lq5BWljvbjzsJAmIY9iybfxrc1xGV/a2j/5M28cmiybGwJ
         IuBVQx2d8i+dbDQm/z/m768z7sIZ2nidDvVM9Qgpk4+rIgXEF6dHqYwaSLkUVcpdlQVw
         1tSw==
X-Gm-Message-State: AOAM5302EII8WA/oiBTOH1ODfIZD+8CNDR5gbeglXQgQp7D9TCNVyZSs
        9yRiToQ38RBdoWv7l+V23dPgYSsZULWa0pTyLAGHCQ==
X-Google-Smtp-Source: ABdhPJwPCK6JVvtPZA/qEwNUZFdTfKV6fNMlNE0y/mgV0d/FLXRv3yIuKlsLt0y/g/mEMvyfH8KcoRBGc9UjO+K2CWU=
X-Received: by 2002:a9d:58c7:: with SMTP id s7mr11139396oth.246.1643026886411;
 Mon, 24 Jan 2022 04:21:26 -0800 (PST)
MIME-Version: 1.0
References: <20220124025205.329752-1-liupeng256@huawei.com>
 <20220124025205.329752-4-liupeng256@huawei.com> <CANpmjNNYG=izN12sqaB3dYbGmM=2yQ8gK=8_BMHkuoaKWMmYPw@mail.gmail.com>
 <261a5287-af0d-424e-d209-db887d952a74@huawei.com>
In-Reply-To: <261a5287-af0d-424e-d209-db887d952a74@huawei.com>
From:   Marco Elver <elver@google.com>
Date:   Mon, 24 Jan 2022 13:21:15 +0100
Message-ID: <CANpmjNNc6F7tRVn=UqLaW0WAgTr67XFm=CUu5X2D0Xbt3nKXwA@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] kfence: Make test case compatible with run time
 set sample interval
To:     "liupeng (DM)" <liupeng256@huawei.com>
Cc:     glider@google.com, dvyukov@google.com, corbet@lwn.net,
        sumit.semwal@linaro.org, christian.koenig@amd.com,
        akpm@linux-foundation.org, kasan-dev@googlegroups.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 24 Jan 2022 at 13:19, liupeng (DM) <liupeng256@huawei.com> wrote:
[...]
> When KFENCE pool size can be adjusted by boot parameters(assumption),
> automatically test and train KFENCE may be useful. So far, exporting
> kfence.sample_interval is not necessary.

I'm not opposed to the patch (I've also run into this issue, but not
too frequently) - feel free to just send it with EXPORT_SYMBOL_GPL.

Thanks,
-- Marco

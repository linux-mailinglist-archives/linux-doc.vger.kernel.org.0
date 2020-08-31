Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2173257DE9
	for <lists+linux-doc@lfdr.de>; Mon, 31 Aug 2020 17:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728126AbgHaPt0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 31 Aug 2020 11:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgHaPtW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 Aug 2020 11:49:22 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95741C061573
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2020 08:49:21 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id z1so2979663wrt.3
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2020 08:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V1d2XOGj4/mQm0XIjmCNV1oewYnJg6EZTFcc9J+2cbQ=;
        b=REVuEsg2CiN/qtSP5ghWobHHXBx5sr9ZVE7C/NuSXKhV/Xd7Pgzyr4SVn563uQXjGI
         Eq5XEDoSWa0svg/5eG6tnrbMJgXXZoPwGMXyG5sbV2Km3PHMCETnnzx8qcNwyPs1khSq
         cRcnMTckV8XPo0ktVdWLdXr2ct9RSKYAiE0xufkCrESiMa4TJBNJmTLn6Fdy8dFiglUs
         O37bIvopoXLB7N36Owu79jonpk31lWDBrDWtmm+NOnUo89VmO/RngjUCO4Wc35VV9fMu
         OPBpxB5pQxZE9lYtu6VREchdX5ne11FFpN15mkX3yDP8vGmORrv8G57zWMROdPY4i9W4
         Zqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V1d2XOGj4/mQm0XIjmCNV1oewYnJg6EZTFcc9J+2cbQ=;
        b=CMgeWYAOvMonS8AdrIVXpzQcdDr7Ih1yZ13CAuYB46oDMH/yFlqfXq8coACMZMjEIH
         mQdhxyylVyUNFdXUP5d1rPygdTAelqh/qZd1DSG49NuctnlulhvsDbk/stSRHU7zDpqn
         NoubPJgG4SX7PPUqvO69Uql3peu6mwsS4ZqqwEV6DGIY0D7VDa3KSXmAFzT7xZmtNGN+
         hQOvdGuxXA5zoYsNGU7csPW3gWx9q+giBYee1gmtQA1/4WXlLrjcJ7dL1cWq8lDQRPPs
         /3RbpRvYVTJg4nqbSA8xC1hvERiAuGWtyXrvBKiuSJcJ7cit+xsC1rpyrWV9WwYCoDTR
         12ow==
X-Gm-Message-State: AOAM531T9dG5GOizbUyN2+6viBGmF0k6eJd/gjtSG79OL6ApB6ebxRpv
        TfFcMnD4JW/I2fh+WTx/xmQogbA0LxPMl5A0pCIVng==
X-Google-Smtp-Source: ABdhPJxLWPETNyPnCiyjTDBC8XYVpbEbjCWK79OLmZWLx/OGDa49T6VAmNNs0loEizDKgyAsCush7FlOkIpOBlpST30=
X-Received: by 2002:adf:f101:: with SMTP id r1mr2234529wro.314.1598888960087;
 Mon, 31 Aug 2020 08:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200828141344.2277088-1-alinde@google.com> <CAC5umyiNw7FA__Y3HZ1UEG8Y6uQDgAWHTJpOVf7okERzpCjnRg@mail.gmail.com>
In-Reply-To: <CAC5umyiNw7FA__Y3HZ1UEG8Y6uQDgAWHTJpOVf7okERzpCjnRg@mail.gmail.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Mon, 31 Aug 2020 17:49:08 +0200
Message-ID: <CAG_fn=XDTWYbxb1Hy1p0hdOtOejZPWvDXfitysK7wUOsPAE_XQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] add fault injection to user memory access
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     Albert Linde <albert.linde@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrey Konovalov <andreyknvl@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Marco Elver <elver@google.com>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Albert van der Linde <alinde@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> This series looks good to me.

Great!

Which tree do fault injection patches normally go to?

> Reviewed-by: Akinobu Mita <akinobu.mita@gmail.com>

Reviewed-by: Alexander Potapenko <glider@google.com>

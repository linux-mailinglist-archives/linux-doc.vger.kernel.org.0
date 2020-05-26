Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806411C8023
	for <lists+linux-doc@lfdr.de>; Thu,  7 May 2020 04:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgEGCuW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 May 2020 22:50:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727841AbgEGCuW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 May 2020 22:50:22 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07F5C061A0F
        for <linux-doc@vger.kernel.org>; Wed,  6 May 2020 19:50:21 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id l18so3658273qtp.0
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2020 19:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=v5p4G137YuitFnxAdjJGDeWrlR5PjlajIuvgc0Izz2k=;
        b=p750SKit8Chs8O2JezORAPJP4t47zmSpkpleyDhzPywZlEJsAjOgD1QOW2EMlvn+BU
         uUhq4taDMrPJ9oMxWXeeGRQmFme0e56qiaJtXl1HeHxNKv5VSarf8JeQy8150L7SOMcQ
         N6ggNiN+Ch3wUcnHtpQhOBQc6Dao+VF13YpZDf5joeWA7yujT6zP4AUdBvGwTkL5O2W/
         WNuDFPqSWKDMBboXLDy5YrC08br3dkGkUDFV8/wuR5nQ/jVvlGBukgFucJT7oiWO9twE
         f8BaYKqyQI547ysjYYYd0UldV8tUpnUIi0NDYTZWPxM/bAYwmkPA8f+jUiufYRfJkjXk
         HKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=v5p4G137YuitFnxAdjJGDeWrlR5PjlajIuvgc0Izz2k=;
        b=I3j2FKo/dy2F7lDIMwF4B0WN0Up3enVekZwj98YGsJb3gxu3vX8UDrQPzit49R1T2E
         97dajqPwFwUcRigbZ25XS3gi0zXzt+KuekkF0EpkoNyiGZPW2OEeSD71yuU3mkczW6Rb
         xXgMfs1gvhNhgvrZQONGusA05PPrZKtwl/FfQWA/brJv7ISFmTGtTs9tiwqxr9jZp+xD
         JUb0d6bEr6KzZ5t+0liw3//dHHgyOiwjdhyoagcKHyh+aN+woDT1p6vIv9inieMFVcqt
         fXlwnpTeSSvZtbcp1ROzjg9w4H9m8F1p/Rr6vLFdiG0zD59kxfHO+aVKLRa9rDpmTOLk
         SvYw==
X-Gm-Message-State: AGi0Puav8Ltj7+Pck7gUZoXBtycu7Ylu9KbO+0uOPdGEaza/sryYeHts
        vv/lMwlaZN1+ZxSIeXCrXknXPg==
X-Google-Smtp-Source: APiQypKxWi4AkhGDT+GZggTnrZrPgUKz0gOo0rLAfbuL7zwLe73GZWVPmGUFdEpd/zUZxCk8YGaGHw==
X-Received: by 2002:aed:3ffd:: with SMTP id w58mr11966424qth.21.1588819821027;
        Wed, 06 May 2020 19:50:21 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id y18sm3363851qty.41.2020.05.06.19.50.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 19:50:20 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] kernel: add panic_on_taint
From:   Qian Cai <cai@lca.pw>
In-Reply-To: <20200506222815.274570-1-aquini@redhat.com>
Date:   Wed, 6 May 2020 22:50:19 -0400
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        dyoung@redhat.com, Baoquan He <bhe@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Rafael Aquini <aquini@redhat.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C5E11731-5503-45CC-9F72-41E8863ACD27@lca.pw>
References: <20200506222815.274570-1-aquini@redhat.com>
To:     Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> On May 6, 2020, at 6:28 PM, Rafael Aquini <aquini@redhat.com> wrote:
>=20
> Analogously to the introduction of panic_on_warn, this patch
> introduces a kernel option named panic_on_taint in order to
> provide a simple and generic way to stop execution and catch
> a coredump when the kernel gets tainted by any given taint flag.
>=20
> This is useful for debugging sessions as it avoids rebuilding
> the kernel to explicitly add calls to panic() or BUG() into
> code sites that introduce the taint flags of interest.
> Another, perhaps less frequent, use for this option would be
> as a mean for assuring a security policy (in paranoid mode)
> case where no single taint is allowed for the running system.

Andrew, you can drop the patch below from -mm now because that one is =
now obsolete,

mm-slub-add-panic_on_error-to-the-debug-facilities.patch=

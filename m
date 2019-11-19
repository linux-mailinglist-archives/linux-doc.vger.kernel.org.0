Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30F24103041
	for <lists+linux-doc@lfdr.de>; Wed, 20 Nov 2019 00:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfKSXbG (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 19 Nov 2019 18:31:06 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53919 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbfKSXbF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Nov 2019 18:31:05 -0500
Received: by mail-wm1-f68.google.com with SMTP id u18so5115903wmc.3
        for <linux-doc@vger.kernel.org>; Tue, 19 Nov 2019 15:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mP+0iqiXj77eONbT81jP0IEP9HdwZqjxx63AWCIxHNA=;
        b=eWt1VHPn8CeyEJkHh8wfdDoWw5EBwvsVv+ooqf2AO/Zbwx52j4WyMuZ5MnEbfn+4Gi
         KfL/jdy4ujXa0lrrB4mryex1DzfBRrRNcJJzcXW+RNbKutYVCpwkXIY0pylxxMgWm3Ht
         M8VIf2ub0+jN+0s3ZGOz+lYWhR8yH/TtZfTuSaO9asxRMqzuDXYlks/kEkTgE/S/P53S
         m5fYO4xeerkaV2wpfwkPh1m2WbLZs3cvqOti+OCNs09c0s4sHlZt4JrvGQ4JXuXf5oAH
         EiOeSSVac8ZaFvRrrRNj9ba26sS3QxpitGEk2F+ZU+USScUYVseseeZx10PO67zMRmXt
         SLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mP+0iqiXj77eONbT81jP0IEP9HdwZqjxx63AWCIxHNA=;
        b=bFGBOpdD8xvnTvK9C6TJryL2N9dVpIFQAipYNFq1BlVHdO7uVoh6jDkKlDPWhDGLw3
         lu5BRPn3y2rzCMz5cjJWdorzw1iwCaTOUe2Zjh8YyjYrGSltg9/0AU/Fw9tmmMnRQldf
         mQx0KFQpA3dbvPOwYO5WCh8zegkUQNZH7V4zXapV1l5L/wJpZWqdqqdM85ge3x5yiOED
         9H8xISXphfrkOM+MMFiTy9hnv/dn7VuAfOTNf70H3vuiiL/p2qT2Bpn3XEwoVBPe9zJD
         o1xCKbImthwRMyfXDaAb+8cq/brHDGZez4ZQ4LBcvfNel7m9cAph30NzP4dQ5QHY1Nxn
         FTvA==
X-Gm-Message-State: APjAAAXTScIW5h/MYYAId9lnVTaP0WpZ3gJG8sQTy/ivMEZ/LU4BWKx2
        0lZtmH1QQj5Www1pCV3TbTogyjzsD8aMZZ4Z9pUhVw==
X-Google-Smtp-Source: APXvYqwRIvQ8PKVNdixUgQnuXSHFcZZKFRs7eXQkjHRIkNkDAd3sCFPQ/jj3utQ2CUNuE+/QqniO8zwM2uAD7sAvFhM=
X-Received: by 2002:a05:600c:295:: with SMTP id 21mr369402wmk.43.1574206263262;
 Tue, 19 Nov 2019 15:31:03 -0800 (PST)
MIME-Version: 1.0
References: <20191119213834.175992-1-brendanhiggins@google.com>
In-Reply-To: <20191119213834.175992-1-brendanhiggins@google.com>
From:   David Gow <davidgow@google.com>
Date:   Tue, 19 Nov 2019 15:30:51 -0800
Message-ID: <CABVgOSn6bc=Rq50Y_Av+0gXTjyHuV+UaULNHicz16hp_uRmDsg@mail.gmail.com>
Subject: Re: [PATCH linux-kselftest/test v1] Documentation: kunit: fix typos
 and gramatical errors
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     Shuah Khan <shuah@kernel.org>, kunit-dev@googlegroups.com,
        linux-kernel@vger.kernel.org,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, linux-doc@vger.kernel.org,
        corbet@lwn.net, heidifahim@google.com,
        Patricia Alfonso <trishalfonso@google.com>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 19, 2019 at 1:39 PM 'Brendan Higgins' via KUnit
Development <kunit-dev@googlegroups.com> wrote:
>
> Fix typos and gramatical errors in the Getting Started and Usage guide
> for KUnit.
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://patchwork.kernel.org/patch/11156481/
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  Documentation/dev-tools/kunit/start.rst |  6 +++---
>  Documentation/dev-tools/kunit/usage.rst | 22 +++++++++++-----------
>  2 files changed, 14 insertions(+), 14 deletions(-)
>

Reviewed-by: David Gow <davidgow@google.com>

These changes look good to me.


> diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
> index f4d9a4fa914f8..db146c7d77490 100644
> --- a/Documentation/dev-tools/kunit/start.rst
> +++ b/Documentation/dev-tools/kunit/start.rst

Could you also fix the kunit.py invocation on line 162, which should
have "run" passed as an argument?
See:
https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/tree/Documentation/dev-tools/kunit/start.rst?h=test#n162

It should read "/tools/testing/kunit/kunit.py run".

Thanks,
-- David

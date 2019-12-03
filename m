Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08DDB112006
	for <lists+linux-doc@lfdr.de>; Wed,  4 Dec 2019 00:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727705AbfLCXLC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 3 Dec 2019 18:11:02 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:38471 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728252AbfLCWli (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Dec 2019 17:41:38 -0500
Received: by mail-pj1-f65.google.com with SMTP id l4so2102117pjt.5
        for <linux-doc@vger.kernel.org>; Tue, 03 Dec 2019 14:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wvcQSeD9fUy4K6hmpGadBFCY8hD8Kt15D7Xjws7LrzY=;
        b=WxTExWP/19lbIo0fY+5OW62d08F7PomNap1+0TY5sUtrtzPOGpdsJbNrv4BmOK+wo3
         3KpKKvycvKGQnbwQUD2Al8L7apeOOVmQ5/fDbHdSyIJ0SrUYLivf7IxloVayeomLb9D6
         i1CeS+8S8UPrr6e7YawLim1GC2BsdJnla/UxSDKmk6dcYWW0X4LnN+qSgOem6/q0JH3m
         zeqQ1V0aE3sE3jdkBQHuLBrEXZBzEx8xNJm/0PfIzcR13BAG4CeFZ9QSgIkcL+VUsKYO
         BitSJLid6c3cE7TDqygbrOv2IZvQU1R+Rvt8Vme7VGWaPlZfQFX56g8xRsw51zgMS6jT
         noaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wvcQSeD9fUy4K6hmpGadBFCY8hD8Kt15D7Xjws7LrzY=;
        b=aCrKaKyhxIf5mmAi1Qxc5a8Vekz6G3BWMMpPvp5r3TdOplu+wozBVnz4B+k2yn4C2I
         IgUmIVOAxbqeVoF4gqhswvTFLa6yfEfM+B8y8Vl80G45KbltXKUJzFyvSkucZDshUutg
         g08HItaeC+OTVMAf/qZOc/CZEpedwB9Xwo0ovcLHxFV1yDutvELvACRMjsOuWkh3zz3z
         nZsFjoFPxKDeaZr+Yjp61i5D797yJxGW3FFz16K9xQ+oFfIe57eQzL6t6Trw0K7cJG8K
         inW4br4wagaEhyazObBr6hk5vQAuGaqLWgUXo9gzDsU8z/QkUrAhNI7dJef9t2dkxzao
         Az2Q==
X-Gm-Message-State: APjAAAVOPTPxGkNw2jAkY9Hiuvi4Ljx/GZUGIqzKxc8QbsJIbY7MBWQ0
        xIaHkfZ1rNhq+I/FIGKeZ0bT3ILpT3akDU05bIwrB2k3FMcYMA==
X-Google-Smtp-Source: APXvYqwNBKITRg7JLfQdIfZ7Hq2in6sPhBtMwgNhkjM1eOSXrNFrRKWgmizNbNOpj7SVMke2uCVL05noCM3vd+KB1eQ=
X-Received: by 2002:a17:90a:d155:: with SMTP id t21mr7870642pjw.84.1575412897403;
 Tue, 03 Dec 2019 14:41:37 -0800 (PST)
MIME-Version: 1.0
References: <1575396508-21480-1-git-send-email-sj38.park@gmail.com>
In-Reply-To: <1575396508-21480-1-git-send-email-sj38.park@gmail.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 3 Dec 2019 14:41:26 -0800
Message-ID: <CAFd5g46X9WK-xKJFF5AVYXXmM4a2dYD3fy=oi1CGJM1gc9RzuA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Fix nits in the kunit
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, shuah <shuah@kernel.org>,
        SeongJae Park <sjpark@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 3, 2019 at 10:08 AM SeongJae Park <sj38.park@gmail.com> wrote:
>
> This patchset contains trivial fixes for the kunit documentations and the
> wrapper python scripts.
>
> Changes from v2 (https://lore.kernel.org/linux-kselftest/1575361141-6806-1-git-send-email-sj38.park@gmail.com/T/#t):
>  - Make 'build_dir' if not exists (missed from v3 by mistake)
>
> SeongJae Park (5):
>   docs/kunit/start: Use in-tree 'kunit_defconfig'
>   kunit: Remove duplicated defconfig creation
>   kunit: Create default config in '--build_dir'
>   kunit: Place 'test.log' under the 'build_dir'
>   kunit: Rename 'kunitconfig' to '.kunitconfig'
>
>  Documentation/dev-tools/kunit/start.rst | 13 +++++--------
>  tools/testing/kunit/kunit.py            | 16 ++++++++++------
>  tools/testing/kunit/kunit_kernel.py     |  8 ++++----
>  3 files changed, 19 insertions(+), 18 deletions(-)

Tested-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!

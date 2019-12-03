Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 660DB111F03
	for <lists+linux-doc@lfdr.de>; Wed,  4 Dec 2019 00:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728004AbfLCXGc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 3 Dec 2019 18:06:32 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39045 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729325AbfLCXGa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Dec 2019 18:06:30 -0500
Received: by mail-pl1-f194.google.com with SMTP id o9so2292807plk.6
        for <linux-doc@vger.kernel.org>; Tue, 03 Dec 2019 15:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y2iAUprUf3pSOMTinMI9+8tya2E8oBWIGOekFGX5HtE=;
        b=RQtd+Q+Jq3oz26YIhHqXhGktsZlvdyT9W6nrwbKCBKWRL7ZTHS787L7uBYipiIuaj0
         t2LGZD3jBENoo8sWRPYby5PA1LhyYsxqw21isJh37AehCw93QsAqUDZuq0cA7E8xfb3Y
         ZRrQzh32e0Rodb7O//iAPRQf0KFSv7TJrLfAwCF1lTUki4OZomF7ih5Pja27/hkMFFvd
         BUevFk6R/3E1YWJkpNBkUS9TuI0QccztX4CJSI3/xTIVegPjSgybEJgJnsoBJDL+NAyX
         RzB0Daj07rp+bSWj/JG12eLEmrWyliRC+gVc50JRjCBX2OgKmyn3A/1+8VkMy6MwYd9b
         5hOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y2iAUprUf3pSOMTinMI9+8tya2E8oBWIGOekFGX5HtE=;
        b=Cw5v2mOz4GRuEFQqYwig0mMFUCrVN17Eo0Y+E9DIfvvm9mBkFnSEPc3Jkuv3O4XLV7
         7sJ+3gfuDr95B5IR5iH+TqKsYl0DBjZd66zN1XLUcjRap6RmCvDJ8UVPFUUZOG3Pc9/y
         j8HDT5THZYtEejAc3QL7VI7wH+CUVzo43SlBHwQ7JaESPquMwTIxxEENmyE/menbVr9n
         lJWYtuC6/MYlj1tjvttket0+tvCZhJEKU/gQ3hIO6WHw7eyMmouffsLz1fmMDxzDn05/
         FYkkSjRXs/G7U5tKWaSQJ2myGG44OpVGbRfzF8MYs7Ul22cXrn+8U65cYxrx7e7D/3pv
         fNIg==
X-Gm-Message-State: APjAAAVE21Nq2tRqmI3/gyCyPAIMWtLIbufQFlL2aD6g3k6sDo9VOtDN
        tRKPJho1lu8XcPzQ1fZZcd8oRo8+1uMcty+rjssfmw==
X-Google-Smtp-Source: APXvYqwoExgGqnGZkIzdVLbdVbyPMv/m/oFfgdibsdNl5+1hS5tfHV2K1vCgTDj2i/m7J0guJkjxOOZDsOKAKgfVUv0=
X-Received: by 2002:a17:90a:c390:: with SMTP id h16mr8400706pjt.131.1575414389181;
 Tue, 03 Dec 2019 15:06:29 -0800 (PST)
MIME-Version: 1.0
References: <1575374868-32601-1-git-send-email-alan.maguire@oracle.com>
In-Reply-To: <1575374868-32601-1-git-send-email-alan.maguire@oracle.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 3 Dec 2019 15:06:17 -0800
Message-ID: <CAFd5g45VsXEXX--z-tjZWOTLgodnUwnOgyGqJVgy4xbz_YZFTQ@mail.gmail.com>
Subject: Re: [PATCH v5 linux-kselftest-test 0/6] kunit: support building
 core/tests as modules
To:     Alan Maguire <alan.maguire@oracle.com>
Cc:     "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        catalin.marinas@arm.com, joe.lawrence@redhat.com,
        penguin-kernel@i-love.sakura.ne.jp, urezki@gmail.com,
        andriy.shevchenko@linux.intel.com,
        Jonathan Corbet <corbet@lwn.net>,
        David Gow <davidgow@google.com>, adilger.kernel@dilger.ca,
        "Theodore Ts'o" <tytso@mit.edu>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 3, 2019 at 4:08 AM Alan Maguire <alan.maguire@oracle.com> wrote:
>
> The current kunit execution model is to provide base kunit functionality
> and tests built-in to the kernel.  The aim of this series is to allow
> building kunit itself and tests as modules.  This in turn allows a
> simple form of selective execution; load the module you wish to test.
> In doing so, kunit itself (if also built as a module) will be loaded as
> an implicit dependency.
>
> Because this requires a core API modification - if a module delivers
> multiple suites, they must be declared with the kunit_test_suites()
> macro - we're proposing this patch set as a candidate to be applied to the
> test tree before too many kunit consumers appear.  We attempt to deal
> with existing consumers in patch 3.

Tested-by: Brendan Higgins <brendanhiggins@google.com>

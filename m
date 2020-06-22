Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61C802042C9
	for <lists+linux-doc@lfdr.de>; Mon, 22 Jun 2020 23:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730556AbgFVVlw (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 22 Jun 2020 17:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbgFVVlv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Jun 2020 17:41:51 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE16C061573
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2020 14:41:51 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id d8so8150207plo.12
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2020 14:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=pqnf0FnBUuYpKz/n/r4JQUEKAUHxuHRfE8+5BTSy4/U=;
        b=SFUOEHMSstrKcXOTbikZuSz9rTgaLt4WjiMo3Fl6RAFjO/gL1vRgNMsyWto4eWjBWx
         5wL6IQmuzlGDxEBbZfDBPIRtP18cnLF/FcQYrnkJ8BaG3o+x5+2JGLdRvzxSoz95Rl4V
         1391fqlid3bsX5LJWkblgHyBQi1Mh0XoYZ3eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=pqnf0FnBUuYpKz/n/r4JQUEKAUHxuHRfE8+5BTSy4/U=;
        b=Q7BSQ0YJKWVhgzRSwHpr37zpyouMmH++5omSSDxNSQxoaxOyxxAT2XfDXxUwKO5f+O
         3C4NEOcm2VlGOMGCgr116fY7LRWsfAWVlvjHcdDWgiYbJLak4dpauBSln+oiDsP56g3s
         tNXeqFRJO4wzMTNwOYdAbk0TkUDAyv02nFAuz5g8vydit7DwkjTAJjmlgnonwcwnx57J
         IBgQDLd6YcIJT35FbyZj91LwHMNKgPJVSg5udutk+dH/9HBmKLLgMK/PI0hBtCuWcVWe
         uEh8osbHVbbDk6zSeozQ+Q7W9hjO3+tFYdh4uMKzo1LZ5DBZJ4nY0roOt2p7tq1PIu8q
         MdwQ==
X-Gm-Message-State: AOAM530v1ZINSyUjy/LiAJIJvurSxfXQzqIAz8S5jiD9flIyHK0nDdui
        iaQntTdbORucvNdZVgJ/KYrH8A==
X-Google-Smtp-Source: ABdhPJwHuLCwCcrxujnyqY3Xfao1IwZplHPj6XzKXZ0PHjejheVS7KN+SNrR5RJjdrlVNHnJGFLrLw==
X-Received: by 2002:a17:902:9882:: with SMTP id s2mr21189218plp.112.1592862110614;
        Mon, 22 Jun 2020 14:41:50 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 10sm14746397pfn.6.2020.06.22.14.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 14:41:49 -0700 (PDT)
Date:   Mon, 22 Jun 2020 14:41:48 -0700
From:   Kees Cook <keescook@chromium.org>
To:     David Gow <davidgow@google.com>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Maguire <alan.maguire@oracle.com>,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: kunit: Add naming guidelines
Message-ID: <202006221439.B40C58A9@keescook>
References: <20200620054944.167330-1-davidgow@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200620054944.167330-1-davidgow@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 19, 2020 at 10:49:44PM -0700, David Gow wrote:
> As discussed in [1], KUnit tests have hitherto not had a particularly
> consistent naming scheme. This adds documentation outlining how tests
> and test suites should be named, including how those names should be
> used in Kconfig entries and filenames.

Thanks for preparing this!

> [...]
> +Test Kconfig Entries
> +====================
> +
> +Every test suite should be tied to a Kconfig entry.
> +
> +This Kconfig entry must:
> +
> +* be named ``CONFIG_<name>_KUNIT_TEST``: where <name> is the name of the test
> +  suite.
> +* be listed either alongside the config entries for the driver/subsystem being
> +  tested, or be under [Kernel Hacking]→[Kernel Testing and Coverage]
> +* depend on ``CONFIG_KUNIT``
> +* be visible only if ``CONFIG_KUNIT_ALL_TESTS`` is not enabled.
> +* have a default value of ``CONFIG_KUNIT_ALL_TESTS``.
> +* have a brief description of KUnit in the help text
> +* include "If unsure, say N" in the help text

Is this last one needed? It seems redundant -- I'm not sure any of the
normal Kconfig help needs this. *shrug*

Everything else looks good!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

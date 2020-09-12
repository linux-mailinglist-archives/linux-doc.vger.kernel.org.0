Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE9852678AE
	for <lists+linux-doc@lfdr.de>; Sat, 12 Sep 2020 09:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbgILHzL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 12 Sep 2020 03:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgILHzH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Sep 2020 03:55:07 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB65C061757
        for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2020 00:55:06 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id bd2so1995289plb.7
        for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2020 00:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SwmgBKMctXV6TtEg0fYkPqOSmPyVvQUoCAnAPe5+4Yw=;
        b=bhWveefsCp+YI5xlakkMnFNndET2vW3kVhSGwfV/mCfiv4CDzaMV/OCiIzY0SHzzv6
         b1dtKF6usuNxBxxNupsYEbODeK5eyIybIL46HK2kKImUz0TfGPmz6XFk/CQ+rl1AYdGg
         2oYPI7IzyUunJ7NBRgfFqO9TKqfzQ+XD+O5ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SwmgBKMctXV6TtEg0fYkPqOSmPyVvQUoCAnAPe5+4Yw=;
        b=pVCzQOwANiiwkut9JBGao/HaNq30eDoMorcDmjQuvhIEtfF3KnzaZOltutp2ddf/jd
         b6NwtbQCdVVmwgBC7/+QXT0wa5/32wgK5TDg8tfK/ofwRuWgao/EUQJOFzXroEbnEHdl
         EtUo4O5axn5ClXDoRMnPyQFtJnQEyotHmYtRVVxQMu7oQ+Ox0VJeolgdhhXev2ciCJBm
         kza40fpzMT+CLUilofIDhlo9sTV0OsfBwIczHg9vlr0wBocQsaOqxmfpWIdJv+yivipX
         Q45BtKBclimaOXwOFBqDaEH1i2U0jzfmyN2aAGlkEhI9Rx0/fupkyylIDc8pJrqvYqu9
         Zbew==
X-Gm-Message-State: AOAM533hIbRcjoBu9Ieg+GL2FF1RkRGUAqadNYsyvDZlB4yGVxrSOjfE
        AJXNJsH65AeGllknL0AiD837VQ==
X-Google-Smtp-Source: ABdhPJxqrfVafrPK3gxgwUxw9HHTOjH0Ec5Yun4GlH4SiLxpVSA605MrMv2cG84RTf0D+4l68327UA==
X-Received: by 2002:a17:90b:3cb:: with SMTP id go11mr5054511pjb.152.1599897305693;
        Sat, 12 Sep 2020 00:55:05 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a16sm3464188pgh.48.2020.09.12.00.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 00:55:04 -0700 (PDT)
Date:   Sat, 12 Sep 2020 00:55:03 -0700
From:   Kees Cook <keescook@chromium.org>
To:     John Wood <john.wood@gmx.com>
Cc:     Jann Horn <jannh@google.com>, Matthew Wilcox <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Iurii Zaikin <yzaikin@google.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-security-module@vger.kernel.org
Subject: Re: [RESEND][RFC PATCH 0/6] Fork brute force attack mitigation
 (fbfam)
Message-ID: <202009120053.9FB7F2A7@keescook>
References: <20200910202107.3799376-1-keescook@chromium.org>
 <202009101656.FB68C6A@keescook>
 <20200911144806.GA4128@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911144806.GA4128@ubuntu>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 11, 2020 at 04:48:06PM +0200, John Wood wrote:
> In other words, a late reply to this serie comments is not a lack of
> interest. Moreover, I think it would be better that I try to understand and
> to implement your ideas before anything else.

Understood! :)

> My original patch serie is composed of 9 patches, so the 3 lasts are lost.
> Kees: Have you removed them for some reason? Can you send them for review?
> 
> security/fbfam: Add two new prctls to enable and disable the fbfam feature
> https://github.com/johwood/linux/commit/8a36399847213e7eb7b45b853568a53666bd0083
> 
> Documentation/security: Add documentation for the fbfam feature
> https://github.com/johwood/linux/commit/fb46804541f5c0915f3f48acefbe6dc998815609
> 
> MAINTAINERS: Add a new entry for the fbfam feature
> https://github.com/johwood/linux/commit/4303bc8935334136c6ef47b5e50b87cd2c472c1f

Oh, hm, I'm not sure where they went. I think they were missing from my
inbox when I saved your series from email. An oversight on my part;
apologies!

> Is there a problem if I ask for some guidance (replying to this thread)
> during the process to do my second patch series?

Please feel free! I'm happy to help. :)

> My goal is to learn as much as possible doing something useful for the
> linux kernel.

Sounds good; thanks!

-- 
Kees Cook

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2696419FD4C
	for <lists+linux-doc@lfdr.de>; Mon,  6 Apr 2020 20:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgDFShP (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 6 Apr 2020 14:37:15 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:35156 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgDFShM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Apr 2020 14:37:12 -0400
Received: by mail-pj1-f68.google.com with SMTP id g9so241219pjp.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2020 11:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RPf4iEWl31iyICcKKYAUoZ6x8ZFphZAANeccq/+cSuQ=;
        b=ZhH7J/98IP9aFb1GIbiBZDjP8zYVMEESv42tnRyH7AYdTf+r78V5lVruWjn7mB3vr1
         Qd0HfY4jT6/b7j8XtBs57O8ruHLNxbSFjdUZj5qZ6U01MsfE4MUUL/JKi+VHxDKHd/1P
         fRym4RH6wHkv8Qv3chNSOPmmmhl1vpCYtaIOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RPf4iEWl31iyICcKKYAUoZ6x8ZFphZAANeccq/+cSuQ=;
        b=jf9FNA2rCIIS2uBp81818+GvxXcp/kfzm0GwkOvHO+rSj4ydeOKBn3UDqktE2RkWbO
         3N808WC/kJvp5SgIsDgf6RhF20twi5CJEBdWibpTlmsboSsdKLi6iCe+xq/KmsmMwlkn
         E5SMaLVDp30q7k8V7xPnLlH3iFtUhWp4FzO2coG/Jx2dclU6r8IZj0/x3iTPTBXmKV3g
         gQqC4NUWX2iBXNHawJlyV0HfsQ7EYkonnvf6Aej2yvy2SBA1tusBzc/XrwEftVvvs55c
         JrmVKs+dnAQdFLIpVURYFd5VvahMWVJzxk7HmvxyCHlU4A9wN88uQIjqnWos49VApEFx
         G4KA==
X-Gm-Message-State: AGi0PuZVBuOm/ypPnA/6m0KaijFTu4Zylh8WTA9d4DOQlQpWAGegGmUu
        Da+z06rbqQmkGpGy7tsqsNKE1Q==
X-Google-Smtp-Source: APiQypJkJzqyAVk93YophF2DdDXFQtQFxEQ1p7UwWuwI6Z3WRoKl15rLkyLHchyR+rCTa2HWS+biEg==
X-Received: by 2002:a17:902:bd85:: with SMTP id q5mr22257863pls.326.1586198230653;
        Mon, 06 Apr 2020 11:37:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h4sm11426186pgg.67.2020.04.06.11.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 11:37:09 -0700 (PDT)
Date:   Mon, 6 Apr 2020 11:37:08 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Guilherme Piccoli <gpiccoli@canonical.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org,
        Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
        mcgrof@kernel.org, Iurii Zaikin <yzaikin@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Vlastimil Babka <vbabka@suse.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        "Guilherme G. Piccoli" <kernel@gpiccoli.net>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH V3] kernel/hung_task.c: Introduce sysctl to print all
 traces when a hung task is detected
Message-ID: <202004061136.8029EF3@keescook>
References: <20200327223646.20779-1-gpiccoli@canonical.com>
 <d4888de4-5748-a1d0-4a45-d1ecebe6f2a9@canonical.com>
 <202004060854.22F15BDBF1@keescook>
 <CAHD1Q_xwR4OqsF8n3VJXknZ5QgpLWPQ3YTuztTgn0GTMR0vgKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHD1Q_xwR4OqsF8n3VJXknZ5QgpLWPQ3YTuztTgn0GTMR0vgKA@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 06, 2020 at 03:32:42PM -0300, Guilherme Piccoli wrote:
> Thanks Kees! I was expecting this could be merged in the current
> window, but there's really no problem in waiting for the next!

That's not usually how these things work, unfortunately. Stuff going
into the merge window are those things that have been living in
linux-next for a while (usually since before the -rc5). Once Andrew is
done with the merge window for the -mm tree, he'll start scanning for
new things to pull in. I expect this to be one of them. :)

-- 
Kees Cook

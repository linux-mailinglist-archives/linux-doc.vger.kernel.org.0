Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 743F21918E5
	for <lists+linux-doc@lfdr.de>; Tue, 24 Mar 2020 19:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728047AbgCXSVA (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 24 Mar 2020 14:21:00 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44388 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728078AbgCXSU7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Mar 2020 14:20:59 -0400
Received: by mail-pl1-f196.google.com with SMTP id h11so7732627plr.11
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2020 11:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pT25UnZw8GM7Hd21OQrxHvPDWru16NnMVVxodL4fKVA=;
        b=iyhktkumgD/jnOyy/wrt8dXzir+rVbxsCaX0F1NIU968y/5PKrYcKlaC+EUgsXxoD1
         qRnZuBoGJVEq/iPtymBbiQq/d0t+3o76Vg7pmHHpXjJtM7UuE+MA3iFeocbUrYXAjiQM
         Z6sejDHA46aOnvzsmPK6WvTcsSKcktL/hzcag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pT25UnZw8GM7Hd21OQrxHvPDWru16NnMVVxodL4fKVA=;
        b=oWhzuJqYex37uqmH8w0OzBVqq9jeDVO5apw8ykhT/uQqT8piApHg5zzwzee7FR2huN
         7kYZgToRypPCKiS1MZolQNRsNKbhAAkGWdewuilvykbqRFbRf8Z70bHpUUIHL3E3WSgL
         caaGobuMeC1W7lHXwHoum9ACj+IslobQUcXm8DhGdrDRz6jbxwlpfp4uYmZy5KwYkGGn
         ny2+A8gadzlV5jD0iy6Pd1PVaP+Xbo3iMnUIw29wAQAJbGMUDKbnCbzxbAj9CX2WDykW
         YyxxeerRUVfdq5cwdHOG6lzz0aEKLXNqLRjgmBfvNhixD4QnLhuWcof96Br8E2fqAhsz
         gleA==
X-Gm-Message-State: ANhLgQ0IYGkmsU0I0iB0N7KwkoDganKAODc3/h/0Xfzl5m4pvhUioDyc
        nB6zNCweUpG8XRB1QUaII3jR+A==
X-Google-Smtp-Source: ADFU+vsbUZvpEd+JNrfXu3SDrVaKk1GB6LCcXwZqBJNz0+KcmuSLdw3UClszpGNl3JJHmzGTOgzQXQ==
X-Received: by 2002:a17:90a:3349:: with SMTP id m67mr6643283pjb.175.1585074057290;
        Tue, 24 Mar 2020 11:20:57 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w31sm15114250pgl.84.2020.03.24.11.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 11:20:56 -0700 (PDT)
Date:   Tue, 24 Mar 2020 11:20:55 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Cc:     Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        mcgrof@kernel.org, yzaikin@google.com, tglx@linutronix.de,
        penguin-kernel@I-love.SAKURA.ne.jp, akpm@linux-foundation.org,
        cocci@systeme.lip6.fr, linux-api@vger.kernel.org,
        kernel@gpiccoli.net, randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH V2] kernel/hung_task.c: Introduce sysctl to print all
 traces when a hung task is detected
Message-ID: <202003241119.A666E1C694@keescook>
References: <20200323214618.28429-1-gpiccoli@canonical.com>
 <b73a6519-0529-e36f-fac5-e4b638ceb3cf@suse.cz>
 <eee335a2-e673-39bf-ae64-e49c66f74255@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eee335a2-e673-39bf-ae64-e49c66f74255@canonical.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 24, 2020 at 09:45:40AM -0300, Guilherme G. Piccoli wrote:
> Thanks Randy and Vlastimil for the comments. I really liked your
> approach Vlastimil, I agree that we have no reason to not have a generic
> sysctl setting via cmdline mechanism - I'll rework this patch removing
> the kernel parameter (same for other patch I just submitted).

I've been thinking we'll likely want to have a big patch series that
removes all the old "duplicate" boot params and adds some kind of
"alias" mechanism.

Vlastimil, have you happened to keep a list of other "redundant" boot
params you've noticed in the kernel? I bet there are a lot. :)

-- 
Kees Cook

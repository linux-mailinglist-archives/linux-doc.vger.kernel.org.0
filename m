Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 515A7153AE6
	for <lists+linux-doc@lfdr.de>; Wed,  5 Feb 2020 23:23:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbgBEWXK (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 5 Feb 2020 17:23:10 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43932 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbgBEWXK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Feb 2020 17:23:10 -0500
Received: by mail-ot1-f67.google.com with SMTP id p8so3549867oth.10
        for <linux-doc@vger.kernel.org>; Wed, 05 Feb 2020 14:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7BPBFZwYMLdjTS7FC4wsJG0SBY3jzmuiQq5ab/pR8tE=;
        b=bsCVEZXyO1m1nDWrhyLfqfamqKXOfvuJP41PTr4vHEntSvyBELd7iYKhNse6c2Tn9g
         iIYLNxjo6KV5OEOU8j19451ahN0XbitPB0O/3aRADfb1w9uvKbYi0JIUSthzfFbgWSZV
         dMOREBTUlTsa8xBI1nry+fdIWSqxaER3PK0/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7BPBFZwYMLdjTS7FC4wsJG0SBY3jzmuiQq5ab/pR8tE=;
        b=epss2LF/ZI5yPQqiP0IXGRDyWCbJLEae63f+VRVhKHToGro07OV6BwZxm3zLPMZ5MJ
         rS6/0FCSDCr6gxuwdSGKpDEfy6y98BEKj2zPoSK7X8nIqe099B+f2DPnM1XLZReJJeY6
         USE9xtl3yhrRUgH5sHNApmSeMf6y/krw4hprAnxFqtnE5VIJC7dYjl3hndy2MjiT7CHZ
         RgXQpk25Rqm3P65OAOl2kUhrLrg7FGhad6JIuIrpcUNpmA2JuihsGX5Wi1XknimQ61/n
         NfEvLB6IPHcWudg85r8oPUXhJrDvMdJuWqZczFy5jsCpDjTSHoLLs0PW6DKeeLeVp7Jk
         JHrQ==
X-Gm-Message-State: APjAAAWYfCgS9xWv3juvR/2k5K3HDPcDvB0BtfWoNy24sBIvMKIFA9b2
        RFsnuIB4/hx6sZ9LbEgEktcx0Q==
X-Google-Smtp-Source: APXvYqwiWxsqH9jzwGGCPTTA/BuMOcFastWQH/FIEhWKfTbMO7E5g/kRONngb8jpggIUpd8KuKUR/A==
X-Received: by 2002:a9d:1ca3:: with SMTP id l35mr27648946ota.271.1580941389697;
        Wed, 05 Feb 2020 14:23:09 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n22sm369796otj.36.2020.02.05.14.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 14:23:08 -0800 (PST)
Date:   Wed, 5 Feb 2020 14:23:07 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Qian Cai <cai@lca.pw>
Cc:     Christian Borntraeger <borntraeger@de.ibm.com>,
        Grzegorz Halat <ghalat@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, ssaner@redhat.com, atomlin@redhat.com,
        oleksandr@redhat.com, vbendel@redhat.com, kirill@shutemov.name,
        khlebnikov@yandex-team.ru,
        Andrew Morton <akpm@linux-foundation.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH 1/1] mm: sysctl: add panic_on_inconsistent_mm sysctl
Message-ID: <202002051421.9419721B@keescook>
References: <20200129180851.551109-1-ghalat@redhat.com>
 <84C253EB-B348-4B62-B863-F192FBA8C202@lca.pw>
 <34467005-1742-47a0-cd2b-05567584b91e@de.ibm.com>
 <1580742371.7365.1.camel@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1580742371.7365.1.camel@lca.pw>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Feb 03, 2020 at 10:06:11AM -0500, Qian Cai wrote:
> On Mon, 2020-02-03 at 15:08 +0100, Christian Borntraeger wrote:
> > 
> > On 29.01.20 19:39, Qian Cai wrote:
> > > 
> > > 
> > > > On Jan 29, 2020, at 1:08 PM, Grzegorz Halat <ghalat@redhat.com> wrote:
> > > > 
> > > > Memory management subsystem performs various checks at runtime,
> > > > if an inconsistency is detected then such event is being logged and kernel
> > > > continues to run. While debugging such problems it is helpful to collect
> > > > memory dump as early as possible. Currently, there is no easy way to panic
> > > > kernel when such error is detected.
> > > > 
> > > > It was proposed[1] to panic the kernel if panic_on_oops is set but this
> > > > approach was not accepted. One of alternative proposals was introduction of
> > > > a new sysctl.
> > > > 
> > > > Add a new sysctl - panic_on_inconsistent_mm. If the sysctl is set then the
> > > > kernel will be crashed when an inconsistency is detected by memory
> > > > management. This currently means panic when bad page or bad PTE
> > > > is detected(this may be extended to other places in MM).
> > > > 
> > > > Another use case of this sysctl may be in security-wise environments,
> > > > it may be more desired to crash machine than continue to run with
> > > > potentially damaged data structures.
> > > 
> > > It is annoying that I have to repeat my feedback, but I don’t know why
> > > admins want to enable this by allowing normal users to crash the systems
> > > more easily through recoverable MM bugs where I am sure we have plenty.
> > > How does that improve the security?
> > 
> > There are cases where data corruption is a no-go, while "one node going down" 
> > is acceptable.
> > And then there is also the case for payed service providers that often need
> > a dump at the time of the problem to understand rare issues.
> > 
> > So I DO see value in such a thing. We should just piggy-back on panic_on_warn
> > I guess.
> > 
> 
> Indeed, so change pr_alert() to pr_warn() there then?

pr_* are just printk levels. If you want a full trace and to hook to
panic_on_warn, you want WARN_ON(condition) (or WARN_ON_ONCE(), etc).

-- 
Kees Cook

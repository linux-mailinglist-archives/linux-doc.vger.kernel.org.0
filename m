Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB3CF31836C
	for <lists+linux-doc@lfdr.de>; Thu, 11 Feb 2021 03:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbhBKCHQ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 10 Feb 2021 21:07:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbhBKCGb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Feb 2021 21:06:31 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB84C061756
        for <linux-doc@vger.kernel.org>; Wed, 10 Feb 2021 18:05:50 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id t26so2654483pgv.3
        for <linux-doc@vger.kernel.org>; Wed, 10 Feb 2021 18:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GWehHpPBiIbtAUGV973qzMbhfGOacu1gexxk5hpereM=;
        b=VkI1vNchcTfqZMT8TdeTKNunPyydlTDpaduc777AZXErfTUw+IoNoowB3buQXwB7D2
         HM2cW4ajkZGMEI9fbbyaG+QS01IhsQO2IvFJRs0rrcX6Aw2nR/Sd0VcHmSULgTNW1OGQ
         OrJ32pm7uzcNVvPSKZDo8yzfQ3HtJKHFRkXZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GWehHpPBiIbtAUGV973qzMbhfGOacu1gexxk5hpereM=;
        b=OMkX0kPNVEvPSIirTdOyGU/yW5flYgilZeNRTHF6OrGuYdAbCn+hFoNJgIdMKf5YaJ
         fQn2RK/oSnASjtXQh+5TFdsVVSOwZNpg08MGzROh5tZCpTDKRvNQz6FYTbq/hzfGP/y7
         PrFHvXnFxtFr8GEtMpHLr80Lq7WcVpF75SGknSS+CPn7hTJZsn5RkNt2uJ9uOvz7CfzX
         lJoG0Pw/njyvMHdvAc4Ttv9dzTeCiobqq+AfRHmuLa76Y2EO6udffFTVo+XAcp50cnfz
         1tpTIRcb2wf1Jw4sDCkIRj9B87F5IVviFvex6NJuipH/TWyPOK+Z7HqFQDQqrcTsFUxe
         O1PQ==
X-Gm-Message-State: AOAM533fTv/WQiWSKWadlDV3T06Ssx4gSefRa3tZTQrqYM7m6ZYppEQt
        ZFtC4eLMK2VDlK53Tkfmak+Rfg==
X-Google-Smtp-Source: ABdhPJzsWXbn1Ou/vFtG4NQUWw149O4AAHSFlrE0lP7i2j/RD0O7x0LK3DLeL8X3j84QUwiX06AIsg==
X-Received: by 2002:a63:6381:: with SMTP id x123mr1570843pgb.177.1613009150490;
        Wed, 10 Feb 2021 18:05:50 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h8sm3286360pfv.154.2021.02.10.18.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 18:05:49 -0800 (PST)
Date:   Wed, 10 Feb 2021 18:05:48 -0800
From:   Kees Cook <keescook@chromium.org>
To:     "Yu, Yu-cheng" <yu-cheng.yu@intel.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>, haitao.huang@intel.com
Subject: Re: [PATCH v20 21/25] x86/cet/shstk: Handle signals for shadow stack
Message-ID: <202102101805.0B98ACA743@keescook>
References: <20210210175703.12492-1-yu-cheng.yu@intel.com>
 <20210210175703.12492-22-yu-cheng.yu@intel.com>
 <202102101154.CEF2606E@keescook>
 <57dcc827-052a-94cd-31d4-286675f9d506@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57dcc827-052a-94cd-31d4-286675f9d506@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 10, 2021 at 01:38:10PM -0800, Yu, Yu-cheng wrote:
> On 2/10/2021 11:58 AM, Kees Cook wrote:
> > On Wed, Feb 10, 2021 at 09:56:59AM -0800, Yu-cheng Yu wrote:
> > > To deliver a signal, create a shadow stack restore token and put the token
> > > and the signal restorer address on the shadow stack.  For sigreturn, verify
> > > the token and restore from it the shadow stack pointer.
> > > 
> > > A shadow stack restore token marks a restore point of the shadow stack.
> > > The token is distinctively different from any shadow stack address.
> > 
> > How is it different? It seems like it just has the last 2 bits
> > masked/set?
> > 
> 
> For example, for 64-bit apps,
> 
> A shadow stack pointer value (*ssp) has to be in some code area, but for a
> token, (*ptr_of_token) = (ptr_of_token + 8), which has to be within the same
> shadow stack area.  In cet_verify_rstor_token(), this is checked.
> 
> > > In sigreturn, restoring from a token ensures the target address is the
> > > location pointed by the token.
> > 
> > As in, a token (real stack address with 2-bit mask) is checked against
> > the real stack address? I don't see a comparison -- it only checks that
> > it is < TASK_SIZE.
> > 
> > How does cet_restore_signal() figure into this? (As in, the MSR writes?)
> > 
> 
> The kernel takes the restore address from the token.  It will not mistakenly
> take a wrong address from the shadow stack.  I will put this in my commit
> logs.

Ah-ha, okay, got it now. Thank you!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

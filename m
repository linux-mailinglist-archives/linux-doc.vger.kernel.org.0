Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA4B516F12B
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2020 22:31:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728585AbgBYVbc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 25 Feb 2020 16:31:32 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38805 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgBYVbc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Feb 2020 16:31:32 -0500
Received: by mail-pf1-f195.google.com with SMTP id x185so252502pfc.5
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2020 13:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rrlr+907qtKDudjoqI94u3BDniTLuSDFOK3CBpzOF4E=;
        b=bsIBaiOx2q6Nz0szIaHfQPNo4hYm/9YM3ER93MPP+idoUIhz//erff21F8ACX8lvyy
         /Vtb7KtuLiUG7PmyVOr8JCBZ8gC2CPzmF/IOKIOP6YqVmnN9EltjeteoiuFViaN6gzGA
         ftBujYT7QwO14ICuSzTpjMUOlrqwxXrSa2li4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rrlr+907qtKDudjoqI94u3BDniTLuSDFOK3CBpzOF4E=;
        b=sB8squdtxsAOkULqoUN4+hi+Tcp/gXIRMLQo9SijFQhREuAoAywNGjsJdE/S2atJC8
         TvAJGJ9+RF24o+xRkm1aeQx6bJlLSCwAGrW38yDXyWrdmuEthFDwNBaPRP8bBIdzWlQK
         LAq3yWYS0Ktp+lm8AEJRxuzgiZ9/ixqD4gPM/2JiX14JGLpPtOtwEL8MBXDdg9KxN1Mk
         gGw0pp/yUnCudNVQso8LKjgGRxWtb1qD+6+rlTemITH1SZUkTrC3WgtU+kV7K0CThiRF
         fgyGxRDMIbiuh1w9ewcleXzknADjE+ercOKOOEk7W0sjSZ+sNwwr+JCVX6gcNP+kOpKj
         89Dg==
X-Gm-Message-State: APjAAAWg4elkgNjcvw4YNnkbvpOQ+6Paix3LM2riJwJqvQtce77trHDt
        CV6roJZgnaR6JGPd+FRUid/VPg==
X-Google-Smtp-Source: APXvYqzVvUZuW1LsUViX6xfqJvhxOzF3Vucg+hrYDZWfmpFNwnE34eriSoo3DlbkNO1ERPnR/8OPug==
X-Received: by 2002:aa7:84c6:: with SMTP id x6mr669697pfn.181.1582666289361;
        Tue, 25 Feb 2020 13:31:29 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h26sm33487pfr.9.2020.02.25.13.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 13:31:28 -0800 (PST)
Date:   Tue, 25 Feb 2020 13:31:27 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
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
        Dave Martin <Dave.Martin@arm.com>, x86-patch-review@intel.com
Subject: Re: [RFC PATCH v9 00/27] Control-flow Enforcement: Shadow Stack
Message-ID: <202002251330.7CD5EEFA2@keescook>
References: <20200205181935.3712-1-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205181935.3712-1-yu-cheng.yu@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 05, 2020 at 10:19:08AM -0800, Yu-cheng Yu wrote:
> Control-flow Enforcement (CET) is a new Intel processor feature that blocks
> return/jump-oriented programming attacks.  Details can be found in "Intel
> 64 and IA-32 Architectures Software Developer's Manual" [1].

At v9, this probably isn't RFC any more. :)

As mentioned in another patch, I'd really like to see some self tests
for this feature. It's relatively complex...

-- 
Kees Cook

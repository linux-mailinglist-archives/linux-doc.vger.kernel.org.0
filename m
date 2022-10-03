Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB4395F3A38
	for <lists+linux-doc@lfdr.de>; Tue,  4 Oct 2022 01:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbiJCX7v (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 3 Oct 2022 19:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbiJCX7u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Oct 2022 19:59:50 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E29FA643E
        for <linux-doc@vger.kernel.org>; Mon,  3 Oct 2022 16:59:45 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id 10so7479665pli.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Oct 2022 16:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=RIJLKN8u3zDyFaSBgpFe42GEBZf7a4VcF4ED49hMdZc=;
        b=U+gKP1h4Pv9jFJIM8fjrqS3Zno7OwmnOpMAEvlBoaqn2bYimBV48LjwocIwL22pTj/
         XGCusQxLHKaS1oM8qYA/31YZIM1g4yyqMOyA0EeUSQHwPMu/2406h3E8d5UGens+Sg6R
         JFsWqk+j7+9V4+Cv11zUIopHfUbO1vKfQtibE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=RIJLKN8u3zDyFaSBgpFe42GEBZf7a4VcF4ED49hMdZc=;
        b=mcz8AoTmeJ+Lxr8nv+dpauxsCfl4S1iVGQu30MqP7c2CPf+4zTwItK5oM1WfelSyRE
         dnZaCIeadUoX0Ul0lzf5Bz7nvehnkWUocj4qO+uW+ruL7BKzEGz9yiJ1YeSk8Cw/a7rD
         GcBz5js+hWzUggCNe/3SBG7wnfS1tlz8CdzgA0DGEo7truvYh3AuepvOpHwfJZPIZ8ql
         tMpIY6IwrVNz6XfCAoVncwLleDP9/oKj3bKwiGmORP2dSzh5Oj6q8Xsk7uxhEJeiwYQy
         kUguyfa+VRhtlDafllfEONZf+TvY9PVeKb+TV+QNrNge+oDyqZYPeFSgXPA2+TAG1NsZ
         4G0g==
X-Gm-Message-State: ACrzQf3LxSH5ZBHtnZSRnZf/aVFdrc46hypFHhUQzW48oa+4Nzf6Oz4J
        In0kbV1eR1NneA6WNMHQ9E2L0g==
X-Google-Smtp-Source: AMsMyM5ug1R6yL4efHcI6RcSe9hN88kwzJ/nJywTthiwC0PYrD9jVlLYOuUXb9T8VVj14hEZ5CWOZA==
X-Received: by 2002:a17:90a:7c4a:b0:20a:b201:461a with SMTP id e10-20020a17090a7c4a00b0020ab201461amr5640401pjl.181.1664841585370;
        Mon, 03 Oct 2022 16:59:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id mp8-20020a17090b190800b0020ad26fa65dsm284824pjb.56.2022.10.03.16.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 16:59:44 -0700 (PDT)
Date:   Mon, 3 Oct 2022 16:59:43 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc:     x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
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
        "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V . Shankar" <ravi.v.shankar@intel.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        joao.moreira@intel.com, John Allen <john.allen@amd.com>,
        kcc@google.com, eranian@google.com, rppt@kernel.org,
        jamorris@linux.microsoft.com, dethoma@microsoft.com,
        Yu-cheng Yu <yu-cheng.yu@intel.com>
Subject: Re: [OPTIONAL/RFC v2 37/39] x86/cet: Add PTRACE interface for CET
Message-ID: <202210031658.EEC88324FD@keescook>
References: <20220929222936.14584-1-rick.p.edgecombe@intel.com>
 <20220929222936.14584-38-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929222936.14584-38-rick.p.edgecombe@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 29, 2022 at 03:29:34PM -0700, Rick Edgecombe wrote:
> From: Yu-cheng Yu <yu-cheng.yu@intel.com>
> 
> Some applications (like GDB and CRIU) would like to tweak CET state via

Eee. Does GDB really need this? Can we make this whole thing
CONFIG-depend on CRIU?

-- 
Kees Cook

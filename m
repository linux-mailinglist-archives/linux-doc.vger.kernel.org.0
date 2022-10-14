Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 158075FF39D
	for <lists+linux-doc@lfdr.de>; Fri, 14 Oct 2022 20:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbiJNSfO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 14 Oct 2022 14:35:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbiJNSfM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Oct 2022 14:35:12 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585C44E1A5
        for <linux-doc@vger.kernel.org>; Fri, 14 Oct 2022 11:35:09 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id q9so12421799ejd.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Oct 2022 11:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dlOttIcbfyJ9Meuwl/3DVPLPY7LTZL8V6KpgIWHa/o8=;
        b=bo+sSeamjV3ogFeVE4woZcjggXzUoZaHSUx6jp0WPOZzpXDNmcc/cEcYdKtM48zH7e
         Q8hrssyWU3nff+vqi1+2UwgCpwkQ9mNZwhoxtCYtoyOImHoU6sr2EgS5FSVJHeHv72Gx
         ivMoH1EYL5oEpkIYp3Altv+OuFDnh25XvMft3oq6CAX7Lg1bHdcRUDF5uanM4EvvYYLH
         ScOMwLnABxganJ5jJ69lPKPQm06FeCCSHiH114ov0w+bi1KMynXHAw6J/ybjpBOkwQ60
         Njc0xgYtm7geqQcvVxY6MqZQHxUA67w1M6uCS77zWiYeNi3Td5G/+xAI/uKs52rqfCAx
         VPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlOttIcbfyJ9Meuwl/3DVPLPY7LTZL8V6KpgIWHa/o8=;
        b=Q2R6S/ilx0+6nOVJshzCDa7u31gupCD4eYvdRI2+S+7debb8vNy59MCtHqJPUd9KKa
         x9rAhsr8UY1T9eJn2nVPIR7eqkUB43gZD5Rzq0TBlhAs4zn72oTXI45eFF/74MM5ORDu
         3DWPm5zS74xEdQZLCf4iP9gwqMhGlq+k5uDN/Q7/u13NDudAntey9ddRaj82RquImwSd
         hhEB4aFqsql0XX+lTaxRJ8KSYfqjDkeRs1WkwdUS9XFE49tGmGacUideiMqki1qaxEvu
         Yx3A45yIvZ432XRHn2bWK/TRhNo/OqoqSdC34PGTUcT3iVmr+UrSki3x4hSlQLOIYilI
         uKzg==
X-Gm-Message-State: ACrzQf2Rsajj1IOcGqUTPCSwtjr5tnuq6ru0CcHyB+kXwYpi8ItsIL3H
        Lu6+X1seq417iZbnSWyooZKvjgtD/ijgLx9D8debOQ==
X-Google-Smtp-Source: AMsMyM5PxvI7q1eLhIz1kRuPl4pgKS5NxzGTkhgVaLLpKkixQpMznDKsv3NsRyMn7CuF+C/HYyOrjzaNom7zJdwX7EI=
X-Received: by 2002:a17:907:e93:b0:78d:46ae:cf61 with SMTP id
 ho19-20020a1709070e9300b0078d46aecf61mr4483765ejc.579.1665772507710; Fri, 14
 Oct 2022 11:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220927131518.30000-1-ojeda@kernel.org> <20220927131518.30000-26-ojeda@kernel.org>
 <Y0BfN1BdVCWssvEu@hirez.programming.kicks-ass.net> <CABCJKuenkHXtbWOLZ0_isGewxd19qkM7OcLeE2NzM6dSkXS4mQ@mail.gmail.com>
 <CANiq72k6s4=0E_AHv7FPsCQhkyxf7c-b+wUtzfjf+Spehe9Fmg@mail.gmail.com>
In-Reply-To: <CANiq72k6s4=0E_AHv7FPsCQhkyxf7c-b+wUtzfjf+Spehe9Fmg@mail.gmail.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Fri, 14 Oct 2022 11:34:30 -0700
Message-ID: <CABCJKuca0fOAs=E6LeHJiT2LOXEoPvLVKztA=u+ARcw=tbT=tw@mail.gmail.com>
Subject: Re: [PATCH v10 25/27] x86: enable initial Rust support
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, patches@lists.linux.dev,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        David Gow <davidgow@google.com>,
        Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 14, 2022 at 11:05 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 11, 2022 at 1:16 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > Rust supports IBT with -Z cf-protection=branch, but I don't see this
> > option being enabled in the kernel yet. Cross-language CFI is going to
> > require a lot more work though because the type systems are not quite
> > compatible:
> >
> > https://github.com/rust-lang/rfcs/pull/3296
>
> I have pinged Ramon de C Valle as he is the author of the RFC above
> and implementation work too; since a month or so ago he also leads the
> Exploit Mitigations Project Group in Rust.

Thanks, Miguel. I also talked to Ramon about KCFI earlier this week
and he expressed interest in helping with rustc support for it. In the
meanwhile, I think we can just add a depends on !CFI_CLANG to avoid
issues here.

Sami

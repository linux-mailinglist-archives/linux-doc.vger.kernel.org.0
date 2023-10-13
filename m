Return-Path: <linux-doc+bounces-205-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4437C8579
	for <lists+linux-doc@lfdr.de>; Fri, 13 Oct 2023 14:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA725282D14
	for <lists+linux-doc@lfdr.de>; Fri, 13 Oct 2023 12:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B33614A84;
	Fri, 13 Oct 2023 12:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fN+CMP8c"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8F414295
	for <linux-doc@vger.kernel.org>; Fri, 13 Oct 2023 12:18:06 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E40BE
	for <linux-doc@vger.kernel.org>; Fri, 13 Oct 2023 05:18:04 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so325312466b.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Oct 2023 05:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697199483; x=1697804283; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfMcaSPK1nNALi0ZL2/STHAwFBjikJyI73GljAs8CFY=;
        b=fN+CMP8czqx+zKvehOpSezbKnn4yGuWRS59DGkEVqSyFoz54Ky9XBIOIEPcp4BIzCm
         1f3e2MenjsQ/U9J3UwBGHV7ykr055TonK5NvMg81vNxUvgzs1EjkllLqMcT0pt6Gfp05
         UN3FwUZLPzVCZM8a/ANAUDnIS4BQTjPPyx0/OYWMTvNXrhIkDo7REemt2mCRXCT2pRqp
         BXiFsBUEMlRCUoTBj0J7U4ZbLKQ95PrcP97yq8Ayf9H9/KWCbNG1POiFDoivyLgKlT93
         j0mcTHDZ8yzHnH10kPWpuApqq+OuxtmXpCNvIe9V/ghixUb4yS+f+VrG5OSFboE5ACa8
         +60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697199483; x=1697804283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfMcaSPK1nNALi0ZL2/STHAwFBjikJyI73GljAs8CFY=;
        b=cUvh8o5Ii8X86wmmBgqFFtENZ85feC2qZlOhVwl4j/ZROdB56t50J0rje+51fBACPY
         KOOuPii8iNTXVF6BaaipXU4Llu7lhayTQRDzl7TCtRJIRPH6zWP36eV9/r8zbUm5hfyD
         BCdTpDdgLeT8csLENSug43phEAyPf5CLAbOZyt0VtCt9uso6h7O62nl5/UgSbVpTUp7J
         T6gWzfda0aRLUWa65fa2b0uAqgEmCv6S/twqSrnnKadb5DTBySPD77i15GtMdEy1Z+Jm
         AwLcew5GsCVSOhLaRkzan/UvxLPUMoxcTwmGeiUgqFlowD8QB/vOBybl/aZrvTU/JBPW
         Omeg==
X-Gm-Message-State: AOJu0YwUOa7AbDExN/CcXvP6Drfpohu3Ndngx+VXrelhPHUFX2qP1i5s
	tNb2MlbyO4LbZ+OhTEsn273wwQ1z3WpirOdLziIVow==
X-Google-Smtp-Source: AGHT+IGQJ9SEIC8vE0aqfRJOcMNPn+seOjJOdw/SPreQJQAaFkIsSMzyhkSV+UwdtrZcN9HIBGcHUUvxmzb9X/Yth+w=
X-Received: by 2002:a17:906:fe07:b0:9bd:e036:387d with SMTP id
 wy7-20020a170906fe0700b009bde036387dmr587057ejb.21.1697199483200; Fri, 13 Oct
 2023 05:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20220927131518.30000-1-ojeda@kernel.org> <20220927131518.30000-26-ojeda@kernel.org>
 <Y0BfN1BdVCWssvEu@hirez.programming.kicks-ass.net> <CABCJKuenkHXtbWOLZ0_isGewxd19qkM7OcLeE2NzM6dSkXS4mQ@mail.gmail.com>
 <CANiq72k6s4=0E_AHv7FPsCQhkyxf7c-b+wUtzfjf+Spehe9Fmg@mail.gmail.com>
 <CABCJKuca0fOAs=E6LeHJiT2LOXEoPvLVKztA=u+ARcw=tbT=tw@mail.gmail.com>
 <20231012104741.GN6307@noisy.programming.kicks-ass.net> <CABCJKufEagwJ=TQnmVSK07RDjsPUt=3JGtwnK9ASmFqb7Vx8JQ@mail.gmail.com>
 <202310121130.256F581823@keescook> <CAOcBZOTed1a1yOimdUN9yuuysZ1h6VXa57+5fLAE99SZxCwBMQ@mail.gmail.com>
 <20231013075005.GB12118@noisy.programming.kicks-ass.net>
In-Reply-To: <20231013075005.GB12118@noisy.programming.kicks-ass.net>
From: Ramon de C Valle <rcvalle@google.com>
Date: Fri, 13 Oct 2023 05:17:50 -0700
Message-ID: <CAOcBZOTP_vQuFaqREqy-hkG69aBvJ+xrhEQi_EFKvtsNjne1dw@mail.gmail.com>
Subject: Re: [PATCH v10 25/27] x86: enable initial Rust support
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <keescook@chromium.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	patches@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@google.com>, 
	David Gow <davidgow@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Oct 13, 2023 at 12:50=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Thu, Oct 12, 2023 at 03:15:12PM -0700, Ramon de C Valle wrote:
>
> > [1]:
> > https://doc.rust-lang.org/nightly/unstable-book/language-features/cfi-e=
ncoding.html
>
> I'm sorry, but that looks like a comment from where I'm sitting :-(
> Worst part is it being on a line of it's own and thus unrelated to
> anything.
>
> This rust syntax is horrific..

I understand where you're coming from. I'm still getting used to Rust synta=
x.

>
>
> > [2]:
> > https://doc.rust-lang.org/book/ch19-04-advanced-types.html#using-the-ne=
wtype-pattern-for-type-safety-and-abstraction
>
> I don't speak enough rust to even begin following this :/
>
> > [3]: Wrapping a type in a struct should achieve something similar even
> > without using the cfi_encoding attribute since the encoding for structs=
 in
> > both are <length><name>, where <name> is <unscoped-name>.
>
> You're not talking about C, right?

Both C and repr(C) Rust structs have this encoding, but I understand
the problems with doing this in C since it doesn't have
repr(transparent) structs so there would be a lot of casting back and
forth. Maybe there is an alternative or this could be done for less
used function pairs?


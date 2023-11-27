Return-Path: <linux-doc+bounces-3176-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0256D7FA024
	for <lists+linux-doc@lfdr.de>; Mon, 27 Nov 2023 13:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99145B20DB0
	for <lists+linux-doc@lfdr.de>; Mon, 27 Nov 2023 12:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F8412E5C;
	Mon, 27 Nov 2023 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vrull.eu header.i=@vrull.eu header.b="ncFrNiSd"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ABEA9B
	for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 04:58:49 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-28598035301so2249606a91.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Nov 2023 04:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1701089928; x=1701694728; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zb7LG4+VC86lAK3ACNOsqD4c+4Q3Zl+YX9v/JCc2Lsw=;
        b=ncFrNiSd6zzwoLe7jqogXnWo19X38R/PoeSJBL4uxYyCX4tLHFAlHjrCgIZYmXhLFg
         ADwLmLm1HE3L8lxph3EaNKpmZPSlnhiCaZBPuizUlOMCrz7QxyQ/NKJAKmQU29DgATqR
         JFvSz5TGW18Si6gghRhlM6rJD/4D0wbNfMV5Ohn2aQAiALhmo6pF9Ywjr3KW6dZ0DlQG
         waEkoMRO4IEREO0oyCu2tLfSVoy2V0oF8x29R0CIChkjvUriFe431DxITS/gTqkWZo+j
         m+szBx+k6dnbeLcd8mwbkj3fwlf6bdsCHFeOJDmHzXh1ZkhO016oGyVgf1E30cBAkoFc
         UuEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701089928; x=1701694728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zb7LG4+VC86lAK3ACNOsqD4c+4Q3Zl+YX9v/JCc2Lsw=;
        b=aQZ6G436lpw1mIxINcTRGxCyiiAt2Gf7wVS55vg/q5Bv7nvmQjAWFYssT80IdwehNu
         D3VAqR6MJXT4o8XYg6SUZUHdvNhSnEFojikBGvlAvjR71J4u//QdeVNv/HB1pplOAZVi
         3YIiteeh2Ezrn8KjHn8D05SGuXeNwhPmEGmRU76OCXNwabA7NUtQub8AkNzBqfxRH0Sm
         rzQPJt112XogE9m8Hmg6vYYMJ+Nq04yK1CR5L1ppNn0WYrUPneW/OMZrms4+Tg7QLOZa
         a6SOAiXVN4y6PzaZf8cOPj5fF2H0fJ96Hujl7yN1jimKujJ+FUMRHVA2krK5yjXLsKqh
         j4Yw==
X-Gm-Message-State: AOJu0YwfZwTBCQJnkv1PlgD2Z3QpH+6liY8D7PCBK3OIegpYVmC3QNYX
	qlTu003pl2pdGVQ2/5BYZgLiI+oaUJJL8vREgLrIzQ==
X-Google-Smtp-Source: AGHT+IED72gn7lrICwt9dspFALErw3zzL/Mo+GIDENL1lqLFyfYwPcVMIv337Xlw9EVnLjHJzGLwS8GX9uQZvPG71ps=
X-Received: by 2002:a17:90b:1a8d:b0:280:c9a1:861e with SMTP id
 ng13-20020a17090b1a8d00b00280c9a1861emr13211345pjb.13.1701089928629; Mon, 27
 Nov 2023 04:58:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231124072142.2786653-1-christoph.muellner@vrull.eu> <20231127-process-dinginess-cea6dd652b99@wendy>
In-Reply-To: <20231127-process-dinginess-cea6dd652b99@wendy>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>
Date: Mon, 27 Nov 2023 13:58:36 +0100
Message-ID: <CAEg0e7jjLCEL28exKqWBUAMSRj_M9bSBxmOM-1Bu-Fpfmd8hjQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] RISC-V: Add dynamic TSO support
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <apatel@ventanamicro.com>, 
	Philipp Tomsich <philipp.tomsich@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>, 
	Guo Ren <guoren@kernel.org>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Will Deacon <will@kernel.org>, Daniel Lustig <dlustig@nvidia.com>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 11:37=E2=80=AFAM Conor Dooley
<conor.dooley@microchip.com> wrote:
>
> Hi,
>
> On Fri, Nov 24, 2023 at 08:21:37AM +0100, Christoph Muellner wrote:
> > From: Christoph M=C3=BCllner <christoph.muellner@vrull.eu>
> >
> > The upcoming RISC-V Ssdtso specification introduces a bit in the senvcf=
g
> > CSR to switch the memory consistency model at run-time from RVWMO to TS=
O
> > (and back). The active consistency model can therefore be switched on a
> > per-hart base and managed by the kernel on a per-process/thread base.
> >
> > This patch implements basic Ssdtso support and adds a prctl API on top
> > so that user-space processes can switch to a stronger memory consistenc=
y
> > model (than the kernel was written for) at run-time.
> >
> > I am not sure if other architectures support switching the memory
> > consistency model at run-time, but designing the prctl API in an
> > arch-independent way allows reusing it in the future.
> >
> > The patchset also comes with a short documentation of the prctl API.
> >
> > This series is based on the second draft of the Ssdtso specification
> > which was published recently on an RVI list:
> >   https://lists.riscv.org/g/tech-arch-review/message/183
> > Note, that the Ssdtso specification is in development state
> > (i.e., not frozen or even ratified) which is also the reason
> > why I marked the series as RFC.
> >
> > One aspect that is not covered in this patchset is virtualization.
> > It is planned to add virtualization support in a later version.
> > Hints/suggestions on how to implement this part are very much
> > appreciated.
> >
> > Christoph M=C3=BCllner (5):
>
> I know this is an RFC, but it could probably do with a bit more compile
> testing, as:
>
> >   RISC-V: Add basic Ssdtso support
>
> This patch doesn't build for rv64 allmodconfig
>
> >   RISC-V: Expose Ssdtso via hwprobe API
>
> This one seems to build fine
>
> >   uapi: prctl: Add new prctl call to set/get the memory consistency
> >     model
> >   RISC-V: Implement prctl call to set/get the memory consistency model
> >   RISC-V: selftests: Add DTSO tests
>
> These don't build for:
> rv32 defconfig
> rv64 allmodconfig
> rv64 nommu

Thanks for reporting this. You are absolutely right.
In my defense, this patchset was compile-tested and got some limited
run-time testing in QEMU.
But after that, I wrote the documentation, which triggered a renaming
of several function/macro names,
and these changes did not see adequate testing. I am sorry for that.

I've already fixed the patches (addressing the issues you have
reported, plus other small issues).
To not distract the ongoing discussion, I will not send an updated
patchset right now.
In case you are interested, you can find the latest changes (rebased
on upstream/master) here:
  https://github.com/cmuellner/linux/tree/ssdtso
I've also extended my local compile-test script to include all
mentioned configs.

In case you want to play a bit with these changes, you can also have a
look at the QEMU
patchset, which also got support for the prctl (which is not part of
the published mailpatch):
  https://github.com/cmuellner/qemu/tree/ssdtso
With these changes, you can run the kernel self-test binary in
user-mode emulation.

BR
Christoph


Return-Path: <linux-doc+bounces-35192-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46257A1066E
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jan 2025 13:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52774188173E
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jan 2025 12:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E29236ED6;
	Tue, 14 Jan 2025 12:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WhMTozHl"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F330236EDB
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 12:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736857036; cv=none; b=N/b49oQf5YFZt7MvQaZHJbCEb3tk3CPt3r1TzEAbJO0PDKDGUyVuOkCUA3ylmaZ/I+knLELppK4ogJXVrX/EF97KLtdzNVCF6wo+6/hPCf+9+5iHyUAXsjuKXmNrqlUskFzOEb7xom0ZgpPR9ag3RsspMWg8zk9IXI7AzYfvGYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736857036; c=relaxed/simple;
	bh=UxkJV4aVvyiR9jpdgEwyPY4Vq5a9CDmiXa9H1wyI1gk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsEfkXP0AyOZuEU78n9/g/wPxBPhEH7lPZNy0iNY/JPwxfmkg3xYgIaMGja5fBchxW+YylJZdMd8XdaMri4IguZTF7fqWxHtolGaDpGWBHya9qphQ2G2V3Ctfjw72QyQJ+6pVb90fYUU05FUoASXWbJhd9UlTyUCTEEFRfAMv8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WhMTozHl; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2a383315d96so2740186fac.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 04:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736857033; x=1737461833; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4INfH/TpDecneo+NlcBviw89emu+iz2WYGUG/aV6WRg=;
        b=WhMTozHlgejvNvzEmaNCCx0nElEzP80i8+lnE+AF3HcyobzIG8w+CNYcnLRSkxB8oq
         +oTrGtDxRA1RiAPbHspzF3jHpSHZ8vIGkQQVRYrN8vezAcYDu1673odj/lsg9o64O60d
         tO0W03EVsVtlsjiBtjy/PXP8DiIANOHd3MNX1Ag1Ixe+Z44OHe6M1bW7RUwPsJWR27Ym
         YkX7kyZ+h8qKYUrJfjip+f6c5C5KrzgH9tHM+zLo3HufLLNuVdBymUSvFM1cC8+OyTop
         1IsDBZCJXYJIjx1gcSvCcmMcZKhtIP6KlvdImJazAg69eHhYmTrioN9V2N2N7b7gmw9X
         vmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736857033; x=1737461833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4INfH/TpDecneo+NlcBviw89emu+iz2WYGUG/aV6WRg=;
        b=jgLg5ytdPo8XgFQqKZGUbcNBarWlwOlbhkKAvT4tuRPNYorrqrYjgMiNuOp/nZvYDi
         OqOYGfzRFJUqAMDcXP6KDyu0CIhKCmfTpBjqMCehQ4Pt/dIWXRCpJYDQclOpRujMCzEw
         d61rEBVSVLq+OasIgh+iyQ4hVyFgr/ZdXGpJU36KtRB7Gi3rXuP8Qrv/QF56pkXJzMdk
         1iJ9WxJBb2zYTwnDmEOj6CO+cEoPAs9N5QkVi6hPaGJIAWi93Zm4vtlkkJqUvFlhY0Oy
         o+vtwDBwsQvk0ZPrWqZxz9PMWGNmNMI1DED+9+90cviFVAR32GxbltyKMAJCx26Y/mVf
         eang==
X-Forwarded-Encrypted: i=1; AJvYcCWP2r16tzfg5E7Sq8oCnZFzc5QXbxHmFi6bsyjHwXQOkeFxa0iUi47az9YBJ76o9pBfU9onDkTsG6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhC38SOdqGsFNEvPhRjNd3U1/x7p7APajajILeFrGxkEOP6Vih
	XYCPuSLfuxcM/AZvGh3LQpa/cYo7osrcrZuBQwax8P/ugUzEZCh7Byv4WjLFiqIsx+A0KHnhW2X
	80QG/h8Vd9Zx7CjfLKx8zzFLgNbxS2QBmCn4jow==
X-Gm-Gg: ASbGncsh7uGtgLxaGbQaTdPTC/P5zM8kiHum9HzkfJjX9C8dYKjmHoI56wrn+Ar6GXi
	xnRkM/AYBYPzn39meB9m2HEg1/GrYbHLjMYfig8BN
X-Google-Smtp-Source: AGHT+IEHZGO4c+aev0xCDPbWA8bFqbqbN4JnHG7sydhDT0QCnIP1LpjWakccU3G6ykFeEWt7fgi7ZuQ99Z3j1cufJsc=
X-Received: by 2002:a05:6870:c8c:b0:29e:55c1:229a with SMTP id
 586e51a60fabf-2aa06678512mr15178648fac.14.1736857033256; Tue, 14 Jan 2025
 04:17:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114021936.17234-1-cuiyunhui@bytedance.com>
 <20250114021936.17234-3-cuiyunhui@bytedance.com> <7c181d03-b0d0-4b81-bbd0-06943a58a287@sifive.com>
In-Reply-To: <7c181d03-b0d0-4b81-bbd0-06943a58a287@sifive.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 14 Jan 2025 20:17:02 +0800
X-Gm-Features: AbW1kvZgoWRu28_ou5khJ-oDrc4uTs3sOn70Kk7VVMM2aZm0JHVssnRohhN4zrs
Message-ID: <CAEEQ3wm7-O5U3jjbQ1+XgVvk+G7csMPAxzGoV=K5WczCOsbQ5g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 2/3] RISC-V: hwprobe: Expose Zicbom
 extension and its block size
To: Samuel Holland <samuel.holland@sifive.com>
Cc: ajones@ventanamicro.com, alexghiti@rivosinc.com, andybnac@gmail.com, 
	aou@eecs.berkeley.edu, charlie@rivosinc.com, cleger@rivosinc.com, 
	conor.dooley@microchip.com, conor@kernel.org, corbet@lwn.net, 
	evan@rivosinc.com, jesse@rivosinc.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Samuel=EF=BC=8C

On Tue, Jan 14, 2025 at 1:28=E2=80=AFPM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Hi Yunhui,
>
> On 2025-01-13 8:19 PM, Yunhui Cui wrote:
> > Expose Zicbom through hwprobe and also provide a key to extract its
> > respective block size.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >  Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
> >  arch/riscv/include/asm/hwprobe.h      | 2 +-
> >  arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
> >  arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
> >  4 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/=
riscv/hwprobe.rst
> > index 955fbcd19ce9..0ea7754b2049 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -242,6 +242,9 @@ The following keys are defined:
> >    * :c:macro:`RISCV_HWPROBE_EXT_SUPM`: The Supm extension is supported=
 as
> >         defined in version 1.0 of the RISC-V Pointer Masking extensions=
.
> >
> > +  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is suppo=
rted, as
> > +       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv=
-CMOs.
> > +
> >  * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar=
 values to
> >       :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key =
was
> >       mistakenly classified as a bitmask rather than a value.
> > @@ -281,6 +284,9 @@ The following keys are defined:
> >  * :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF`: An enum value d=
escribing the
> >       performance of misaligned vector accesses on the selected set of =
processors.
> >
> > +* :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int whic=
h
> > +  represents the size of the Zicbom block in bytes.
> > +
> >    * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN`: The performanc=
e of misaligned
> >      vector accesses is unknown.
>
> The new key needs to go further down, below this list of possible values =
for the
> previous key.
I guess you mean to put it after
RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED, right?

>
> Regards,
> Samuel
>
> >
> > diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/=
hwprobe.h
> > index 1ce1df6d0ff3..89379f9a2e6e 100644
> > --- a/arch/riscv/include/asm/hwprobe.h
> > +++ b/arch/riscv/include/asm/hwprobe.h
> > @@ -8,7 +8,7 @@
> >
> >  #include <uapi/asm/hwprobe.h>
> >
> > -#define RISCV_HWPROBE_MAX_KEY 10
> > +#define RISCV_HWPROBE_MAX_KEY 11
> >
> >  static inline bool riscv_hwprobe_key_is_valid(__s64 key)
> >  {
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include=
/uapi/asm/hwprobe.h
> > index 3af142b99f77..b15c0bd83ef2 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -73,6 +73,7 @@ struct riscv_hwprobe {
> >  #define              RISCV_HWPROBE_EXT_ZCMOP         (1ULL << 47)
> >  #define              RISCV_HWPROBE_EXT_ZAWRS         (1ULL << 48)
> >  #define              RISCV_HWPROBE_EXT_SUPM          (1ULL << 49)
> > +#define              RISCV_HWPROBE_EXT_ZICBOM        (1ULL << 50)
> >  #define RISCV_HWPROBE_KEY_CPUPERF_0  5
> >  #define              RISCV_HWPROBE_MISALIGNED_UNKNOWN        (0 << 0)
> >  #define              RISCV_HWPROBE_MISALIGNED_EMULATED       (1 << 0)
> > @@ -94,6 +95,7 @@ struct riscv_hwprobe {
> >  #define              RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW            2
> >  #define              RISCV_HWPROBE_MISALIGNED_VECTOR_FAST            3
> >  #define              RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED     4
> > +#define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE  11
> >  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> >
> >  /* Flags */
> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hw=
probe.c
> > index cb93adfffc48..04150e62f998 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -106,6 +106,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *=
pair,
> >               EXT_KEY(ZCA);
> >               EXT_KEY(ZCB);
> >               EXT_KEY(ZCMOP);
> > +             EXT_KEY(ZICBOM);
> >               EXT_KEY(ZICBOZ);
> >               EXT_KEY(ZICOND);
> >               EXT_KEY(ZIHINTNTL);
> > @@ -278,6 +279,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe =
*pair,
> >               if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
> >                       pair->value =3D riscv_cboz_block_size;
> >               break;
> > +     case RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE:
> > +             pair->value =3D 0;
> > +             if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOM))
> > +                     pair->value =3D riscv_cbom_block_size;
> > +             break;
> >       case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
> >               pair->value =3D user_max_virt_addr();
> >               break;
>

Thanks,
Yunhui


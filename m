Return-Path: <linux-doc+bounces-19197-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 011239131AC
	for <lists+linux-doc@lfdr.de>; Sat, 22 Jun 2024 04:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B055FB2168E
	for <lists+linux-doc@lfdr.de>; Sat, 22 Jun 2024 02:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C2D8F5B;
	Sat, 22 Jun 2024 02:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WVToFhRH"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE3D2C80
	for <linux-doc@vger.kernel.org>; Sat, 22 Jun 2024 02:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719024161; cv=none; b=SAIwhtoyvcHbcvmwG4l7HuwWJfPWnN5In5IqTaMYPGAF7ls8oHMTfcYTloKLsET/V2A0TpLs7rZuEK2n6kkclJeAEDdHtNBTZSqZVlGAad5dyMFdrgvFC5ld3owvb+dX25B3YX8MuX6+M54DF8RLfm/monPaTW7VX3Uh4pfa5OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719024161; c=relaxed/simple;
	bh=8X+5edeImXVtpUO9KaH5XBi8TyP1pDZB4OE8O8Kx25c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZNn51TQKo8sOY8JnKYki3PIsGsMYBZVz8NyXKUjeiikg35JmKYyMnCpdvsHKcoOFuB883tNqWsQ9XbUBxzaBQ9WSIZsYdHsWZbp8BAc/xr0xrEychf4QPhKFWvVWm6vfO5uNEgGID6tr7PY6M5PaFkPgaxnTG34zeToeC0aaAAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WVToFhRH; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-70089223245so1567752a34.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Jun 2024 19:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719024157; x=1719628957; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTwieLueSKpyVDRXh253M5R7l7vUHpUoE8U7jFyR2qY=;
        b=WVToFhRH6EEwOufTku1Oe3iPuMA1tw1ISKn/Z3FtOCDLAZY1U7FsmWqGIcgUIS4brm
         yMZ4h7hHJwY0uQVSrYLpBX1mgqj4nB8QKBUsmOGyQeZ2N14W0pBrq3bE+0HPqu5l7unF
         m1oCNoYc9riwszOpyIoivqIGh6ynOlXpWDiVJIeGJluassfi8MRDSZj18rF69TF3XASq
         ltVVV9v6CBz+H2q1NA2f8iNJma3281fTc/aBXgxQ1vd4ioDs2EWpVMcGb9IDKIiC8SWl
         pt2mRDZ7S2wivzNqX0qunutRH13xK4NTSnas6FD1+9H0LbMGvoPI583xO0i/INv/sKGv
         PlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719024157; x=1719628957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTwieLueSKpyVDRXh253M5R7l7vUHpUoE8U7jFyR2qY=;
        b=KoSVC2h/cLQZjCFN1uuOtbe3bAim7t7ISfhsYWutSPeTz/jEh0cra9bWW8VeawvQtI
         qC8swMa2FPIrdS4wqe415tJGwm9gGIGUFWYPTEHPjjO/EUJCxi+c+pTgIvFL8QseM1fu
         g6G+ia3WvIGwJP9i3vW5GlLjxsG8QLO8bh2gLk7rSFZY57/lmIAl60QNSonwDkRoIe68
         07lVXHB/pfs7Coc9U2M9WBCAX4M87pHl+xHGbNZTIx7HzMMiwY3T0/blaDfBGVJ4ToUY
         7rPrw1YBeJ2NmrerOMrgKv9FINUojRqHgPcr3a0lTEIalpId+6kNzWMyuik/3mQSUxE4
         KJ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX87cHeLJd7dRpeypETs8zmtGvvnQD3d8UtJOdKlGng5OHmsQS5A+GTVZy9UXFtxMXhGxSR4SBn5tsv5tmVAbQNEs+VMb3mSWVQ
X-Gm-Message-State: AOJu0Yynce1UVRuCD695s9mHum3jzNjiPGuTCnVJlqHE3Y/pP7sSoCcI
	rjmZfrzuppZ5T6tqg/L+IQamNx5SIGrqAwEnuzyaFOTcb7w++IP6KjiYaKfa21TiGiICD1atxsj
	jj2W8hMlxAoQwCmkf3y42UICXAxDnvXJ+UZxrRA==
X-Google-Smtp-Source: AGHT+IFHivR0NYkwKhZaqhM/IuRaVop8lkRBRo+/Zee5iD0izgB12QHg5jo+MOuyyOxhBQ6DOobL7PQhZa4C8dkv1Ik=
X-Received: by 2002:a05:6871:b08:b0:254:ac99:1152 with SMTP id
 586e51a60fabf-25c94d72a5dmr10814668fac.58.1719024157068; Fri, 21 Jun 2024
 19:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621113143.35827-1-cuiyunhui@bytedance.com> <705FA6B0-53E6-4CF0-B840-D51EC871B596@jrtc27.com>
In-Reply-To: <705FA6B0-53E6-4CF0-B840-D51EC871B596@jrtc27.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sat, 22 Jun 2024 10:42:25 +0800
Message-ID: <CAEEQ3wktjBkZ9x1V+YHxCom9o9e8OFk3rwVyX8DTet7TUAKxdg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] RISC-V: Provide the frequency of time
 CSR via hwprobe
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Evan Green <evan@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, costa.shul@redhat.com, 
	Andy Chiu <andy.chiu@sifive.com>, samitolvanen@google.com, linux-doc@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jessica,

On Sat, Jun 22, 2024 at 2:04=E2=80=AFAM Jessica Clarke <jrtc27@jrtc27.com> =
wrote:
>
> On 21 Jun 2024, at 12:31, Yunhui Cui <cuiyunhui@bytedance.com> wrote:
> >
> > From: Palmer Dabbelt <palmer@rivosinc.com>
> >
> > A handful of user-visible behavior is based on the frequency of the
> > time CSR.
> >
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> > Documentation/arch/riscv/hwprobe.rst  | 2 ++
> > arch/riscv/include/asm/hwprobe.h      | 2 +-
> > arch/riscv/include/uapi/asm/hwprobe.h | 1 +
> > arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
> > 4 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/=
riscv/hwprobe.rst
> > index fc015b452ebf..c07f159d8906 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -229,3 +229,5 @@ The following keys are defined:
> >
> > * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
> >   represents the size of the Zicboz block in bytes.
> > +
> > +* :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `mt=
ime`.
>
> This still says mtime.
Okay, I will update it on v3, thanks.

>
> Jess
>
> > diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/=
hwprobe.h
> > index 630507dff5ea..150a9877b0af 100644
> > --- a/arch/riscv/include/asm/hwprobe.h
> > +++ b/arch/riscv/include/asm/hwprobe.h
> > @@ -8,7 +8,7 @@
> >
> > #include <uapi/asm/hwprobe.h>
> >
> > -#define RISCV_HWPROBE_MAX_KEY 6
> > +#define RISCV_HWPROBE_MAX_KEY 7
> >
> > static inline bool riscv_hwprobe_key_is_valid(__s64 key)
> > {
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include=
/uapi/asm/hwprobe.h
> > index 7b95fadbea2a..18754341ff14 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -73,6 +73,7 @@ struct riscv_hwprobe {
> > #define RISCV_HWPROBE_MISALIGNED_UNSUPPORTED (4 << 0)
> > #define RISCV_HWPROBE_MISALIGNED_MASK (7 << 0)
> > #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE 6
> > +#define RISCV_HWPROBE_KEY_TIME_CSR_FREQ 7
> > /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> >
> > /* Flags */
> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hw=
probe.c
> > index 83fcc939df67..fc3b40fb9def 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -8,6 +8,7 @@
> > #include <asm/cacheflush.h>
> > #include <asm/cpufeature.h>
> > #include <asm/hwprobe.h>
> > +#include <asm/delay.h>
> > #include <asm/sbi.h>
> > #include <asm/switch_to.h>
> > #include <asm/uaccess.h>
> > @@ -226,6 +227,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe =
*pair,
> > pair->value =3D riscv_cboz_block_size;
> > break;
> >
> > + case RISCV_HWPROBE_KEY_TIME_CSR_FREQ:
> > + pair->value =3D riscv_timebase;
> > + break;
> > +
> > /*
> > * For forward compatibility, unknown keys don't fail the whole
> > * call, but get their element key set to -1 and value set to 0
> > --
> > 2.20.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>

Thanks,
Yunhui


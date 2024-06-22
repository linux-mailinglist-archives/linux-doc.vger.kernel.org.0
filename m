Return-Path: <linux-doc+bounces-19198-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C87919131AE
	for <lists+linux-doc@lfdr.de>; Sat, 22 Jun 2024 04:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAC6D1C22492
	for <lists+linux-doc@lfdr.de>; Sat, 22 Jun 2024 02:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B142C80;
	Sat, 22 Jun 2024 02:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Z29Z6ogz"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F830BA2D
	for <linux-doc@vger.kernel.org>; Sat, 22 Jun 2024 02:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719024249; cv=none; b=CXHR5WPpBp1IiWgy3QJnPiLg4g+Obik7xKF044WWkL1IGNLqE48rwVjvwTPjpQZEETJz2yUNuN/IOo3b8HK1eDKSUfmt1qO0iobOi5IJCeyWcD5SpKfboFN6h8nqEpZFj6lIYA+FLnUxJ/l2VX/XcAJDq3c4swByVv8JybsTaVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719024249; c=relaxed/simple;
	bh=iRXr1RsZ3+BvbMRrsmQuycl9+iwKHAXtZ8vMhGOYFqQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BVoiNXFMMJX3MWhEgritMy9vuVYQZtLUUQEijNTfIvrgKH8WWc4jztcrtRjIyqmCxN05GwBTo1aLdOylSehZ1W6QoYt+1dnCtygSbJOkfgRO8YBJBKwnng2YaKFZjdD7nu7HQgbI27lh7jWwkzpqsX6eyaFtSk1tmcJCJUc+/Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Z29Z6ogz; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-24542b8607fso1326753fac.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Jun 2024 19:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719024247; x=1719629047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ui4xFT5stec6JvODOrN2KjF93fbyz0ONTz3dpTKa1FY=;
        b=Z29Z6ogz2wgwqn0Uf+KUgGL38VHk5FKe6xRqytI+2ynXX2wBq+86LvN2MnAj35lqBK
         urQl6SSIsHnLXrBHOkehmmlPYMDEIDR8EIFDfzOjvUuFEm52//NXx+10uLDmQTLhD/n4
         Wg5qPSWhpTHtIkFln82f/HyG1jaBEA19RWiHv5vUn9ng2BFwLgDLdB2fpUgVvQfPHKd/
         wHct+ZwjYaF9/hySw5aIbMk5k9zE9bls0GDYGSLgcP4an53bTZ4bHpE1om+qjXrJKUNw
         KXlawzkbvyaHd9jmHw7mAD+Txm/cIVY0WTmJaCH4f87m07jTC4pxs6QS3rsVIAQTFY6B
         7aRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719024247; x=1719629047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ui4xFT5stec6JvODOrN2KjF93fbyz0ONTz3dpTKa1FY=;
        b=uaEGAl0fgBwIS97yvdNstHdjh4yVR9bRvE4ENAZh/SJ8JYFHu/FP4FCa+mmafbWscN
         AH/yhHPfgrhJG5JvzLs9isVSAPvcwTVkejVRIhSKjsQ5b96L3Kz0vcqOUQ42MFbalogx
         wOL247/JoacACmHAboR7jc0G2cbQYFNHzjdO1SWkX3V35u7jsqknDpkjUW9AuImcsyH2
         3vvLizBf5+KoqbDVSkxtN+q0gY5261v1xcazOV+niw1WUlTjv/8RpyXNUNiEYKgTWKsW
         Yo3hQZuziDM6rZVQOGskjugr6wd1A6/Emaexg1Q34y1xDH1bToc8/fUh/T8yFoEoAAPt
         4fGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM0buvm6D9FVntnrRNq3o6joT7aAdyFZLZAySEs6NLsApN/+msQBQTc5DBXwUJwPAd6bF02zHOd6vAO33GtZg/U7rb2jo8YNvQ
X-Gm-Message-State: AOJu0Yxsx8vt63CowqpvbxyUdyfNijmYkkw4GuXzNP8p9MomTCZiPoiQ
	XCKb2OghWejDW1XyuUHi32bBt1pPOeVFXxZMDbL2UNbHdu9b1WhQytK4PlNKJJy+S5CACGVxomp
	Kwrb9zLNUOQ78Sgx4SKZrS9zeEJpQTpgtANE4ww==
X-Google-Smtp-Source: AGHT+IE7bJWYgfKqVWNpGz8Qa1UsuPm+jomiTuPUFmc3fa0G/eoy5t03b7JjTOZso8c35GopoR8gHJNl0Z51H0bvZYU=
X-Received: by 2002:a05:6870:808d:b0:250:8913:7400 with SMTP id
 586e51a60fabf-25c94d5c0b3mr10095865fac.40.1719024247214; Fri, 21 Jun 2024
 19:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621113143.35827-1-cuiyunhui@bytedance.com> <94e8a430-7a2c-49a7-b1d3-74e7e924c2a3@rivosinc.com>
In-Reply-To: <94e8a430-7a2c-49a7-b1d3-74e7e924c2a3@rivosinc.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sat, 22 Jun 2024 10:43:56 +0800
Message-ID: <CAEEQ3w=apjwEbH6i_s_mhPre0rBoGu7BBgkfaT_5pbCE1dt+vw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] RISC-V: Provide the frequency of time
 CSR via hwprobe
To: Jesse Taube <jesse@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, corbet@lwn.net, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, cleger@rivosinc.com, 
	evan@rivosinc.com, conor.dooley@microchip.com, costa.shul@redhat.com, 
	andy.chiu@sifive.com, samitolvanen@google.com, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jesse,


On Sat, Jun 22, 2024 at 5:25=E2=80=AFAM Jesse Taube <jesse@rivosinc.com> wr=
ote:
>
>
>
> On 6/21/24 07:31, Yunhui Cui wrote:
> > From: Palmer Dabbelt <palmer@rivosinc.com>
> >
> > A handful of user-visible behavior is based on the frequency of the
> > time CSR.
> >
> > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >   Documentation/arch/riscv/hwprobe.rst  | 2 ++
> >   arch/riscv/include/asm/hwprobe.h      | 2 +-
> >   arch/riscv/include/uapi/asm/hwprobe.h | 1 +
> >   arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
> >   4 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/=
riscv/hwprobe.rst
> > index fc015b452ebf..c07f159d8906 100644
> > --- a/Documentation/arch/riscv/hwprobe.rst
> > +++ b/Documentation/arch/riscv/hwprobe.rst
> > @@ -229,3 +229,5 @@ The following keys are defined:
> >
> >   * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int whi=
ch
> >     represents the size of the Zicboz block in bytes.
> > +
> > +* :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `mt=
ime`.
> > diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/=
hwprobe.h
> > index 630507dff5ea..150a9877b0af 100644
> > --- a/arch/riscv/include/asm/hwprobe.h
> > +++ b/arch/riscv/include/asm/hwprobe.h
> > @@ -8,7 +8,7 @@
> >
> >   #include <uapi/asm/hwprobe.h>
> >
> > -#define RISCV_HWPROBE_MAX_KEY 6
> > +#define RISCV_HWPROBE_MAX_KEY 7
>
> Please rebase onto palmers branch as MAX_KEY is already 7.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/log/?h=
=3Dfor-next
Okay, I will update it on v3, thanks.

>
> Thanks,
> Jesse Taube
>
> >
> >   static inline bool riscv_hwprobe_key_is_valid(__s64 key)
> >   {
> > diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include=
/uapi/asm/hwprobe.h
> > index 7b95fadbea2a..18754341ff14 100644
> > --- a/arch/riscv/include/uapi/asm/hwprobe.h
> > +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> > @@ -73,6 +73,7 @@ struct riscv_hwprobe {
> >   #define             RISCV_HWPROBE_MISALIGNED_UNSUPPORTED    (4 << 0)
> >   #define             RISCV_HWPROBE_MISALIGNED_MASK           (7 << 0)
> >   #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE 6
> > +#define RISCV_HWPROBE_KEY_TIME_CSR_FREQ      7
> >   /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
> >
> >   /* Flags */
> > diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hw=
probe.c
> > index 83fcc939df67..fc3b40fb9def 100644
> > --- a/arch/riscv/kernel/sys_hwprobe.c
> > +++ b/arch/riscv/kernel/sys_hwprobe.c
> > @@ -8,6 +8,7 @@
> >   #include <asm/cacheflush.h>
> >   #include <asm/cpufeature.h>
> >   #include <asm/hwprobe.h>
> > +#include <asm/delay.h>
> >   #include <asm/sbi.h>
> >   #include <asm/switch_to.h>
> >   #include <asm/uaccess.h>
> > @@ -226,6 +227,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe =
*pair,
> >                       pair->value =3D riscv_cboz_block_size;
> >               break;
> >
> > +     case RISCV_HWPROBE_KEY_TIME_CSR_FREQ:
> > +             pair->value =3D riscv_timebase;
> > +             break;
> > +
> >       /*
> >        * For forward compatibility, unknown keys don't fail the whole
> >        * call, but get their element key set to -1 and value set to 0

Thanks,
Yunhui


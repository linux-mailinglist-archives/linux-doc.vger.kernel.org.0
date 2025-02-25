Return-Path: <linux-doc+bounces-39408-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 11827A44892
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2025 18:41:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9049C1635D0
	for <lists+linux-doc@lfdr.de>; Tue, 25 Feb 2025 17:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1B51211460;
	Tue, 25 Feb 2025 17:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="MjFXpwVj"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DD0197A67
	for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 17:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740504672; cv=none; b=kj20ATkpYZE0vtK0w4gv0n3Cm1VO7T/LJofBCbGCiZDv4AAc2R6PrOW2QsRRDauQd4Op3Jdp+A/UrvdgqFpRkvAXUKMjns1NpIAlS+0ZZxsj28Ywo53RHE14b9yjv01foJy1jwga0Add8UekMCR0UvcFA+GgyoY7ELCxWsM5M7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740504672; c=relaxed/simple;
	bh=MmVKquil6mmQ3xpk1eRUf/E0TrskgYszVWtL0BZFMDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ASiI1zPCyz5V0n3mdlaAjd5/eWkdtVekWbkWnKuprGjcxpASHOQRsBppTEFXdIEPJBBi4+5C6OAHoPiFtem1QrgSKlBE1M/3/1w/COXcjR734KstA+8/r14V1gjl8qU4ishsXJbQ/KcLd5cWiemVyTmIf1DO9O2pUzcZ39rWodI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=MjFXpwVj; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5452efeb87aso5901795e87.3
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2025 09:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1740504667; x=1741109467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sr0lGKah3/e1a4myY+vuvPqjngZ6J7nGdFvX+CNC6oA=;
        b=MjFXpwVj8s41TDtH4gisFRuZnTOZRd0XxJrh33e81HJtWyfbghfaz0Bsqg0OXw5Iv1
         1WI6Pjk6X/HR+p6JdMrI35C0Irz5uycG/fSj5vgaJR6sW5xdyTDiGQyYKZVufLprBAHj
         eqy4vwrWKcnBoCgTzuLL7ZpnLYLkNurNg1JZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740504667; x=1741109467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sr0lGKah3/e1a4myY+vuvPqjngZ6J7nGdFvX+CNC6oA=;
        b=beyZuwFfNk8W8XLDE+bhJN3kERZWxvXleX4oVIoyy3Vfq77Zh/gHMHOqUWhuJCAc0N
         GB4rSK+0GKHYOu8v01hf3P73N3PguseQlXWhGsN9SgMgTKDZfX13Galh/gWEuD30bUTH
         da8VX0l9pHbSv/Xz3fYTci17mXyt09iunTJ+kzBCvk0nw7D/vmitn3MJ0HrhKJo7zo6w
         cTYCWplMeiiQcuXsZowvpf99Kbp8utX94NWKz3qXTKZAQNQ6AHcVCFMB3KhadsCgU0e0
         7p+xxnfsKW36oU/hFSIjScjCsZKJiYMOTfwKfJUtKOdFZbpsOeyPKgHwxgfUJPanUXQl
         y3pA==
X-Forwarded-Encrypted: i=1; AJvYcCXNPI5H1+0o3nRXng6AOZ4DxsX85Vr6sFRf/kMGmvNVncMei5eA8HItZEy00/xvociuMirg4x1W/l0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ7tly7pQUxaYCHzaXCtJf3QDgIZ0UxB06Klz8/kP7a27A8Ixu
	RRPphC67cnEAo4ic0jrI1DHN7Y/Ek3jGgibH1kw+6XeWtCAOklwB9AbEn4uPgbaVZ1+CE+JG6bs
	i2QH8E90sM/2EEtoFZJ+CHgLl3guD9ZYl+0HCGA==
X-Gm-Gg: ASbGncsYJfAV7dSctrLlgJaydO7eaRPi4BqJBodmATmyIX+EnQGQayVQnDFWY/mCd06
	SbanlF2SH6IzfAvDUv4tps63IXFhJcaEC2YNmI529P+sXnBADjIDwutuBB0noyK3VOoz0i21ijd
	uFOgrrOKR0
X-Google-Smtp-Source: AGHT+IHKA343AalMF74L8JxUwbWM37GE3WpO7wyx52fYQdPhMdvql53UVqLAYK+QW17iKHLscQ29ybGBGuJOAlqGu2s=
X-Received: by 2002:a05:6512:230c:b0:545:721:b7d1 with SMTP id
 2adb3069b0e04-5493c57a8bemr166377e87.15.1740504666804; Tue, 25 Feb 2025
 09:31:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221170249.890014-1-mkoutny@suse.com> <20250221170249.890014-3-mkoutny@suse.com>
In-Reply-To: <20250221170249.890014-3-mkoutny@suse.com>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Tue, 25 Feb 2025 18:30:55 +0100
X-Gm-Features: AQ5f1Jox-7JY9Yq2cjjD4WYD_GzEdOQ4l8mmUecA8Ynp2bchP3f7oX2UthEQhrQ
Message-ID: <CAJqdLrpjx6nRRMO+349T8W4xFyoYav7N+ys+AvLGWFsOLfsHeg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pid: Optional first-fit pid allocation
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Christian Brauner <brauner@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Eric W . Biederman" <ebiederm@xmission.com>, Oleg Nesterov <oleg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Fr., 21. Feb. 2025 um 18:02 Uhr schrieb Michal Koutn=C3=BD <mkoutny@suse=
.com>:
>
> Noone would need to use this allocation strategy (it's slower, pid
> numbers collide sooner). Its primary purpose are pid namespaces in
> conjunction with pids.max cgroup limit which keeps (virtual) pid numbers
> below the given limit. This is for 32-bit userspace programs that may
> not work well with pid numbers above 65536.
>
> Link: https://lore.kernel.org/r/20241122132459.135120-1-aleksandr.mikhali=
tsyn@canonical.com/
> Signed-off-by: Michal Koutn=C3=BD <mkoutny@suse.com>

Dear Michal,

sorry for such a long delay with reply on your patches.

> ---
>  Documentation/admin-guide/sysctl/kernel.rst |  2 ++
>  include/linux/pid_namespace.h               |  3 +++
>  kernel/pid.c                                | 12 +++++++--
>  kernel/pid_namespace.c                      | 28 +++++++++++++++------
>  4 files changed, 36 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/=
admin-guide/sysctl/kernel.rst
> index a43b78b4b6464..f5e68d1c8849f 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -1043,6 +1043,8 @@ The last pid allocated in the current (the one task=
 using this sysctl
>  lives in) pid namespace. When selecting a pid for a next task on fork
>  kernel tries to allocate a number starting from this one.
>
> +When set to -1, first-fit pid numbering is used instead of the next-fit.
> +
>
>  powersave-nap (PPC only)
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/include/linux/pid_namespace.h b/include/linux/pid_namespace.=
h
> index f9f9931e02d6a..10bf66ca78590 100644
> --- a/include/linux/pid_namespace.h
> +++ b/include/linux/pid_namespace.h
> @@ -41,6 +41,9 @@ struct pid_namespace {
>  #if defined(CONFIG_SYSCTL) && defined(CONFIG_MEMFD_CREATE)
>         int memfd_noexec_scope;
>  #endif
> +#ifdef CONFIG_IA32_EMULATION

Unfortunately, this does not work for our use case as it's x86-specific.

In the original cover letter [1] it was written:

>In any case, there are workloads that have expections about how large
>pid numbers they accept. Either for historical reasons or architectural
>reasons. One concreate example is the 32-bit version of Android's bionic
>libc which requires pid numbers less than 65536. There are workloads
>where it is run in a 32-bit container on a 64-bit kernel. If the host

And I have just confirmed with folks from Canonical, who work on Anbox
(Android in container project),
that they use Arm machines (both armhf/arm64). And one of the reasons
to add this feature is to
make legacy 32-bit Android Bionic libc to work [2].

[1] https://lore.kernel.org/all/20241122132459.135120-1-aleksandr.mikhalits=
yn@canonical.com/
[2] https://android.googlesource.com/platform/bionic.git/+/HEAD/docs/32-bit=
-abi.md#is-too-small-for-large-pids

Kind regards,
Alex

> +       bool pid_noncyclic;
> +#endif
>  } __randomize_layout;
>
>  extern struct pid_namespace init_pid_ns;
> diff --git a/kernel/pid.c b/kernel/pid.c
> index aa2a7d4da4555..e9da1662b8821 100644
> --- a/kernel/pid.c
> +++ b/kernel/pid.c
> @@ -191,6 +191,10 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_=
t *set_tid,
>
>         for (i =3D ns->level; i >=3D 0; i--) {
>                 int tid =3D 0;
> +               bool pid_noncyclic =3D 0;
> +#ifdef CONFIG_IA32_EMULATION
> +               pid_noncyclic =3D READ_ONCE(tmp->pid_noncyclic);
> +#endif
>
>                 if (set_tid_size) {
>                         tid =3D set_tid[ns->level - i];
> @@ -235,8 +239,12 @@ struct pid *alloc_pid(struct pid_namespace *ns, pid_=
t *set_tid,
>                          * Store a null pointer so find_pid_ns does not f=
ind
>                          * a partially initialized PID (see below).
>                          */
> -                       nr =3D idr_alloc_cyclic(&tmp->idr, NULL, pid_min,
> -                                             pid_max, GFP_ATOMIC);
> +                       if (likely(!pid_noncyclic))
> +                               nr =3D idr_alloc_cyclic(&tmp->idr, NULL, =
pid_min,
> +                                                     pid_max, GFP_ATOMIC=
);
> +                       else
> +                               nr =3D idr_alloc(&tmp->idr, NULL, pid_min=
,
> +                                                     pid_max, GFP_ATOMIC=
);
>                 }
>                 spin_unlock_irq(&pidmap_lock);
>                 idr_preload_end();
> diff --git a/kernel/pid_namespace.c b/kernel/pid_namespace.c
> index 0f23285be4f92..ceda94a064294 100644
> --- a/kernel/pid_namespace.c
> +++ b/kernel/pid_namespace.c
> @@ -113,6 +113,9 @@ static struct pid_namespace *create_pid_namespace(str=
uct user_namespace *user_ns
>         ns->pid_allocated =3D PIDNS_ADDING;
>  #if defined(CONFIG_SYSCTL) && defined(CONFIG_MEMFD_CREATE)
>         ns->memfd_noexec_scope =3D pidns_memfd_noexec_scope(parent_pid_ns=
);
> +#endif
> +#ifdef CONFIG_IA32_EMULATION
> +       ns->pid_noncyclic =3D READ_ONCE(parent_pid_ns->pid_noncyclic);
>  #endif
>         return ns;
>
> @@ -260,7 +263,7 @@ void zap_pid_ns_processes(struct pid_namespace *pid_n=
s)
>         return;
>  }
>
> -#ifdef CONFIG_CHECKPOINT_RESTORE
> +#if defined(CONFIG_CHECKPOINT_RESTORE) || defined(CONFIG_IA32_EMULATION)
>  static int pid_ns_ctl_handler(const struct ctl_table *table, int write,
>                 void *buffer, size_t *lenp, loff_t *ppos)
>  {
> @@ -271,12 +274,23 @@ static int pid_ns_ctl_handler(const struct ctl_tabl=
e *table, int write,
>         if (write && !checkpoint_restore_ns_capable(pid_ns->user_ns))
>                 return -EPERM;
>
> -       next =3D idr_get_cursor(&pid_ns->idr) - 1;
> +       next =3D -1;
> +#ifdef CONFIG_IA32_EMULATION
> +       if (!pid_ns->pid_noncyclic)
> +#endif
> +               next +=3D idr_get_cursor(&pid_ns->idr);
>
>         tmp.data =3D &next;
>         ret =3D proc_dointvec_minmax(&tmp, write, buffer, lenp, ppos);
> -       if (!ret && write)
> -               idr_set_cursor(&pid_ns->idr, next + 1);
> +       if (!ret && write) {
> +               if (next > -1)
> +                       idr_set_cursor(&pid_ns->idr, next + 1);
> +               else if (!IS_ENABLED(CONFIG_IA32_EMULATION))
> +                       ret =3D -EINVAL;
> +#ifdef CONFIG_IA32_EMULATION
> +               WRITE_ONCE(pid_ns->pid_noncyclic, next =3D=3D -1);
> +#endif
> +       }
>
>         return ret;
>  }
> @@ -288,11 +302,11 @@ static const struct ctl_table pid_ns_ctl_table[] =
=3D {
>                 .maxlen =3D sizeof(int),
>                 .mode =3D 0666, /* permissions are checked in the handler=
 */
>                 .proc_handler =3D pid_ns_ctl_handler,
> -               .extra1 =3D SYSCTL_ZERO,
> +               .extra1 =3D SYSCTL_NEG_ONE,
>                 .extra2 =3D &pid_max,
>         },
>  };
> -#endif /* CONFIG_CHECKPOINT_RESTORE */
> +#endif /* CONFIG_CHECKPOINT_RESTORE || CONFIG_IA32_EMULATION */
>
>  int reboot_pid_ns(struct pid_namespace *pid_ns, int cmd)
>  {
> @@ -449,7 +463,7 @@ static __init int pid_namespaces_init(void)
>  {
>         pid_ns_cachep =3D KMEM_CACHE(pid_namespace, SLAB_PANIC | SLAB_ACC=
OUNT);
>
> -#ifdef CONFIG_CHECKPOINT_RESTORE
> +#if defined(CONFIG_CHECKPOINT_RESTORE) || defined(CONFIG_IA32_EMULATION)
>         register_sysctl_init("kernel", pid_ns_ctl_table);
>  #endif
>
> --
> 2.48.1
>


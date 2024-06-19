Return-Path: <linux-doc+bounces-18864-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B2890DF2E
	for <lists+linux-doc@lfdr.de>; Wed, 19 Jun 2024 00:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29F931C2274E
	for <lists+linux-doc@lfdr.de>; Tue, 18 Jun 2024 22:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C3817F36E;
	Tue, 18 Jun 2024 22:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="M/OSJfwc"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BB11741C9
	for <linux-doc@vger.kernel.org>; Tue, 18 Jun 2024 22:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718750398; cv=none; b=F5EMpXlT5ZMEJcYng2SHe0NmCzdPA5kA2fCZzKDXw22YtbkM/CPT1FxBILgDFDiM9sSytITVvzYYJ7sAohkqi3AH+727dwpWJ36G52Gy7K4BueOEaDEMBH5wZYadvUSTbI8hwuOWmCgj2JKL0qEceub7tqcmZfmqWs+DgWO9snk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718750398; c=relaxed/simple;
	bh=M7mzEbGbaQjbrcrgflbQy+a72iKuC7EQIbJAodQwhWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2D7ES2SwuNar0R4LKa/KDMTYD+RYBl7grxkg+M9omeOuV2YSsVZkDFcLukH5VP6QmV6yJo9cuy9EXQY6Dfydtd7mU+VoGS9onbCE2nbgyv496YswaZ4C46u8MhHAWfu3brJYmsPrCozJbFHLpwjjzikKJjJtgC8NSOiFV967HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=M/OSJfwc; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-25957dfd971so1414517fac.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Jun 2024 15:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718750396; x=1719355196; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDuIqiO2clIGfsQayJd1PsKODcIpbW8KgtS5TlfWIbc=;
        b=M/OSJfwcH4Zn/CDNpuzlfsXRQGTdXlZt/fe2onN7PnYVNBWmLQ0oHBgJOrc4Ok6Xo2
         oIGvBU8EFuFYpkTz9z27gmJe8osddhCC3ab6+M2lD3RBfjf7jg6VQmqPDa6yaDwiyOCx
         20U30Il2fAmosZoNCJUwJgCFLy/6ikca8fX1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718750396; x=1719355196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDuIqiO2clIGfsQayJd1PsKODcIpbW8KgtS5TlfWIbc=;
        b=q0VRxdrKGWgI8gaRLg+ErMgvxdt8h4h4Q82kJXmzy66VRSCEfI5QDQolU/iqIW5PKY
         e9rZWi+4tHbd2wn3rrU3gmjiCXLzdp3Flq7PkjnykBOQLAMDKhy8jqAZjTqEa4cnkQxf
         ODIvxGg9FclX6AbamfnlcGU088HxZERz1/ndAk7wrMnjf/w9E7KYSO/vIBoQ6Kctrcf6
         A5z1zuTwHbN2ZHGV1D/6R7BJK9laNhM9H6qefcEsDuyma8Clx881cLsISD87EWQiByuE
         ATJQICBZFp4SdVEu4lL5QdYoIsfg+SJI78k7f6epANt0KGo1kechhqZQjqzfLAdSfDpT
         mTKA==
X-Forwarded-Encrypted: i=1; AJvYcCUZoSRlRxHSF4oLO6XC63eZJdK88s8uw+ralYr4iKIi1XGg1hluYZI6kbz7BLzym71rCOJBtfj3xeKBdELhElZWjdFTCe+F93x6
X-Gm-Message-State: AOJu0YzVMRSzKuZQT8tFUqu6AB9RohHxpPjLJC3ISB9czyBbLHWm8ZgU
	zGILUDGYFEiISC7Oo5tCN9V9AnVTjEnwGZi6BcSZrIZfWzZLiBxFmW1zHobssD/9OWHxG2J24QC
	Q/UgFtdeeL8z27xoA6h5VfA55OaDZ7Ky/cKmX
X-Google-Smtp-Source: AGHT+IGVKWa3GDRDjvSCD4uk1Oy7nmeKUd5oiv8J/DJjDfpPfF8EqAvDsryZDGFNvYGm2Dh/2EdeImNb0LSeD/IJeuk=
X-Received: by 2002:a05:6870:c111:b0:254:e924:be62 with SMTP id
 586e51a60fabf-25c94a57362mr1438525fac.13.1718750396111; Tue, 18 Jun 2024
 15:39:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613133937.2352724-1-adrian.ratiu@collabora.com> <20240613133937.2352724-2-adrian.ratiu@collabora.com>
In-Reply-To: <20240613133937.2352724-2-adrian.ratiu@collabora.com>
From: Jeff Xu <jeffxu@chromium.org>
Date: Tue, 18 Jun 2024 15:39:44 -0700
Message-ID: <CABi2SkXY20M24fcUgejAMuJpNZqsLxd0g1PZ-8RcvzxO6NO6cA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] proc: restrict /proc/pid/mem
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Cc: linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel@collabora.com, gbiv@google.com, 
	ryanbeltran@google.com, inglorion@google.com, ajordanr@google.com, 
	jorgelo@chromium.org, Guenter Roeck <groeck@chromium.org>, 
	Doug Anderson <dianders@chromium.org>, Kees Cook <keescook@chromium.org>, 
	Jann Horn <jannh@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Christian Brauner <brauner@kernel.org>, Jeff Xu <jeffxu@google.com>, 
	Mike Frysinger <vapier@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Thanks for the patch !

On Thu, Jun 13, 2024 at 6:40=E2=80=AFAM Adrian Ratiu <adrian.ratiu@collabor=
a.com> wrote:
>
> Prior to v2.6.39 write access to /proc/<pid>/mem was restricted,
> after which it got allowed in commit 198214a7ee50 ("proc: enable
> writing to /proc/pid/mem"). Famous last words from that patch:
> "no longer a security hazard". :)
>
> Afterwards exploits started causing drama like [1]. The exploits
> using /proc/*/mem can be rather sophisticated like [2] which
> installed an arbitrary payload from noexec storage into a running
> process then exec'd it, which itself could include an ELF loader
> to run arbitrary code off noexec storage.
>
> One of the well-known problems with /proc/*/mem writes is they
> ignore page permissions via FOLL_FORCE, as opposed to writes via
> process_vm_writev which respect page permissions. These writes can
> also be used to bypass mode bits.
>
> To harden against these types of attacks, distrbutions might want
> to restrict /proc/pid/mem accesses, either entirely or partially,
> for eg. to restrict FOLL_FORCE usage.
>
> Known valid use-cases which still need these accesses are:
>
> * Debuggers which also have ptrace permissions, so they can access
> memory anyway via PTRACE_POKEDATA & co. Some debuggers like GDB
> are designed to write /proc/pid/mem for basic functionality.
>
> * Container supervisors using the seccomp notifier to intercept
> syscalls and rewrite memory of calling processes by passing
> around /proc/pid/mem file descriptors.
>
> There might be more, that's why these params default to disabled.
>
> Regarding other mechanisms which can block these accesses:
>
> * seccomp filters can be used to block mmap/mprotect calls with W|X
> perms, but they often can't block open calls as daemons want to
> read/write their runtime state and seccomp filters cannot check
> file paths, so plain write calls can't be easily blocked.
>
> * Since the mem file is part of the dynamic /proc/<pid>/ space, we
> can't run chmod once at boot to restrict it (and trying to react
> to every process and run chmod doesn't scale, and the kernel no
> longer allows chmod on any of these paths).
>
> * SELinux could be used with a rule to cover all /proc/*/mem files,
> but even then having multiple ways to deny an attack is useful in
> case one layer fails.
>
> Thus we introduce four kernel parameters to restrict /proc/*/mem
> access: open-read, open-write, write and foll_force. All these can
> be independently set to the following values:
>
> all     =3D> restrict all access unconditionally.
> ptracer =3D> restrict all access except for ptracer processes.
>
> If left unset, the existing behaviour is preserved, i.e. access
> is governed by basic file permissions.
>
> Examples which can be passed by bootloaders:
>
> proc_mem.restrict_foll_force=3Dall
> proc_mem.restrict_open_write=3Dptracer
> proc_mem.restrict_open_read=3Dptracer
> proc_mem.restrict_write=3Dall
>
> These knobs can also be enabled via Kconfig like for eg:
>
> CONFIG_PROC_MEM_RESTRICT_WRITE_PTRACE_DEFAULT=3Dy
> CONFIG_PROC_MEM_RESTRICT_FOLL_FORCE_PTRACE_DEFAULT=3Dy
>
> Each distribution needs to decide what restrictions to apply,
> depending on its use-cases. Embedded systems might want to do
> more, while general-purpouse distros might want a more relaxed
> policy, because for e.g. foll_force=3Dall and write=3Dall both break
> break GDB, so it might be a bit excessive.
>
> Based on an initial patch by Mike Frysinger <vapier@chromium.org>.
>
It is noteworthy that ChromeOS has benefited from blocking
/proc/pid/mem write since 2017 [1], owing to the patch implemented by
Mike Frysinger.

It is great that upstream can consider this patch, ChromeOS will use
the solution once it is accepted.

> Link: https://lwn.net/Articles/476947/ [1]
> Link: https://issues.chromium.org/issues/40089045 [2]
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Jann Horn <jannh@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Jeff Xu <jeffxu@google.com>
> Co-developed-by: Mike Frysinger <vapier@chromium.org>
> Signed-off-by: Mike Frysinger <vapier@chromium.org>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>

Reviewed-by: Jeff Xu <jeffxu@chromium.org>
Tested-by: Jeff Xu <jeffxu@chromium.org>
[1] https://chromium-review.googlesource.com/c/chromiumos/third_party/kerne=
l/+/764773

-Jeff Xu


-Jeff


Return-Path: <linux-doc+bounces-13615-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F415789BBB3
	for <lists+linux-doc@lfdr.de>; Mon,  8 Apr 2024 11:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5648B282AD5
	for <lists+linux-doc@lfdr.de>; Mon,  8 Apr 2024 09:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32BD47F48;
	Mon,  8 Apr 2024 09:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tYdxR0tp"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FE54C634
	for <linux-doc@vger.kernel.org>; Mon,  8 Apr 2024 09:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712568652; cv=none; b=SYLGCYotLeHIK74hUfmKwMmwZQNRYj5idMChHZN/ZpwAMbX8AYiBKEChMVXrriHtb969IvSmHwPjuxFtQZRqncLCp/c5Gw0orMENQ0lr5r3mHe+YkW0zsr3pzi+otcmeoGPxvJXS1TdoA4vmmJvFxLv9lmG3pyoKW98q5uohUaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712568652; c=relaxed/simple;
	bh=mXGVh5sNg5jlDv7GLXUH38FmV/TKaLl65KjI3d2PhLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIo81EeGB6yUOtL4NGjAgrHvw1nB/b/gpHherD/61laAvdfqhMaz4/mt7O1xfXRi6zw248ZhqLY02zB0Y/joN31fd5p2whBC6+APFROouZdljXEoUtkN4RAX680tuTxkLg40AC8Z/Wu3outv2Gu1dxoPKCWupZZuzkD9nH0/458=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tYdxR0tp; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-7db44846727so1090227241.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Apr 2024 02:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712568650; x=1713173450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dt4+ZQSYRlcSKRtpx5FfFY83qCQMJSz/0ZWKLb2RT/U=;
        b=tYdxR0tpqgRQdqvSM4RNMxGHia5crMBau46tsOiIcKjdtVbCT4K13ru+f5WE8XC1bh
         B7YwXtL91oF2iNLn9UaeCZfrzY+sAEq+GdMqtwplT+9VQTiJ725Aq6jAIqE6enS7bgae
         k9vanfSq2ki08grr8e46v53qMNbtproXy/GX53S6Y2pqI2nJHMkNF8rHG1bNnsGGVnUj
         /ciWJ04t1JSnrDacUmnEn1JO5oVpwYyYw14yK5gJlK5O2FgrrRbAUrOOj1QUukgmhBrm
         Om3orNRrLcMBYIlviJidFLuB8H/Mykav0I2uXlb1f2QOBGRnAexJTAsXlHuu3mtMlHEn
         QpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712568650; x=1713173450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dt4+ZQSYRlcSKRtpx5FfFY83qCQMJSz/0ZWKLb2RT/U=;
        b=b9CTZvtVIcZgWU34Nezf/zVB2e+0nuZxWcEy1rZIbux8lXnDag1wRcMHfVKsKIILb4
         Nhwe63dKCw5+ZdgoNudY0x10uZ1JfrKVHzQ9rPaGVbHVzqzdsr25xDxENSmH7gXVbhE9
         Bu7MGT88BfQbeRmEkBfM1zCriNuREBfg4hM4t+lEQ7D75IxXZdUkEPPR1FKV5sQiZs2u
         lkeCf18MyaFNcs1ht65PFVqHJzBs6rKUVk0VWoMJ18S3z0UXaZygsZUjtPqp3fPuiIrD
         diJDxamkzXmVETzaTQcyPJmfrLuyTbSjDnWxTFO9z7JS2OUaM4C4Ok3bzOrLTKgAEDT4
         1QnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXomguKE8SltFKeU2XwQCZ0Is9rvRShzkGHZ9qSZZfFGGhAfcmcggsqjh3JKu9xDR2/h2Ja4PVOdxnZRhHBapxyOdE170lETo3+
X-Gm-Message-State: AOJu0Yy9ibiP62mN9M7/q10klYQ2E+sH2dNkf6eH2jKLS2oZsjgRsmmR
	14F2/Ks60JFJvTTD0K8syPQ2qFPUxxEcAdj2keirBHWHBEtjXUsN1Qc/mH9Wz5xMLMPk+NOaSfp
	xbj3/9f8V8f9vqC+HUFDkVIt+HTvr/JrjqTOa
X-Google-Smtp-Source: AGHT+IHSc19HHK4rnD0e2MMJb+xfvoOodNgWrEhdPc+rpnJPoknruG/+MFwgowFZx5LQFPKVgH6cfOCOFZ1VGo3iO1E=
X-Received: by 2002:a05:6102:509f:b0:47a:66a:189f with SMTP id
 bl31-20020a056102509f00b0047a066a189fmr883424vsb.19.1712568649739; Mon, 08
 Apr 2024 02:30:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404190146.1898103-1-elver@google.com> <CAADnVQKc+Z39k9wbU2MHf-fPFma+9QsyOugmmmGq3ynQCTVfCw@mail.gmail.com>
 <CANpmjNN+rR1PWKbx6RBWhOjnmAP+jUDzc3TLcwTnmfd=ft03dg@mail.gmail.com> <CAEf4BzZCj=3hevf+Je=oed9Nisctotp_CX00NrLaO6_7+-0LSQ@mail.gmail.com>
In-Reply-To: <CAEf4BzZCj=3hevf+Je=oed9Nisctotp_CX00NrLaO6_7+-0LSQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 8 Apr 2024 11:30:11 +0200
Message-ID: <CANpmjNMCJwCaGiUpMCukgruNJ9k120sJ8pVkrdpyo-Tonve2Sw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Introduce bpf_probe_write_user_registered()
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, bpf <bpf@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Apr 2024 at 22:28, Andrii Nakryiko <andrii.nakryiko@gmail.com> wr=
ote:
>
> On Fri, Apr 5, 2024 at 1:28=E2=80=AFAM Marco Elver <elver@google.com> wro=
te:
> >
> > On Fri, 5 Apr 2024 at 01:23, Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
[...]
> > > and the tasks can use mmaped array shared across all or unique to eac=
h
> > > process.
> > > And both bpf and user space can read/write them with a single instruc=
tion.
> >
> > That's BPF_F_MMAPABLE, right?
> >
> > That does not work because the mmapped region is global. Our requiremen=
ts are:
> >
> > 1. Single tracing BPF program.
> >
> > 2. Per-process (per VM) memory region (here it's per-thread, but each
> > thread just registers the same process-wide region).  No sharing
> > between processes.
> >
> > 3. From #2 it follows: exec unregisters the registered memory region;
> > fork gets a cloned region.
> >
> > 4. Unprivileged processes can do prctl(REGISTER). Some of them might
> > not be able to use the bpf syscall.
> >
> > The reason for #2 is that each user space process also writes to the
> > memory region (read by the BPF program to make updates depending on
> > what state it finds), and having shared state between processes
> > doesn't work here.
> >
> > Is there any reasonable BPF facility that can do this today? (If
> > BPF_F_MMAPABLE could do it while satisfying requirements 2-4, I'd be a
> > happy camper.)
>
> You could simulate something like this with multi-element ARRAY +
> BPF_F_MMAPABLE, though you'd need to pre-allocate up to max number of
> processes, so it's not an exact fit.

Right, for production use this is infeasible.

> But what seems to be much closer is using BPF task-local storage, if
> we support mmap()'ing its memory into user-space. We've had previous
> discussions on how to achieve this (the simplest being that
> mmap(task_local_map_fd, ...) maps current thread's part of BPF task
> local storage). You won't get automatic cloning (you'd have to do that
> from the BPF program on fork/exec tracepoint, for example), and within
> the process you'd probably want to have just one thread (main?) to
> mmap() initially and just share the pointer across all relevant
> threads.

In the way you imagine it, would that allow all threads sharing the
same memory, despite it being task-local? Presumably each task's local
storage would be mapped to just point to the same memory?

> But this is a more generic building block, IMO. This relying
> on BPF map also means pinning is possible and all the other BPF map
> abstraction benefits.

Deployment-wise it will make things harder because unprivileged
processes still have to somehow get the map's shared fd somehow to
mmap() it. Not unsolvable, and in general what you describe looks
interesting, but I currently can't see how it will be simpler.

In absence of all that, is a safer "bpf_probe_write_user()" like I
proposed in this patch ("bpf_probe_write_user_registered()") at all
appealing?

Thanks,
-- Marco


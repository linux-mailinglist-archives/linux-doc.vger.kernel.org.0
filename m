Return-Path: <linux-doc+bounces-9001-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EB28519F0
	for <lists+linux-doc@lfdr.de>; Mon, 12 Feb 2024 17:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D80A01F21B61
	for <lists+linux-doc@lfdr.de>; Mon, 12 Feb 2024 16:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 378A83D54D;
	Mon, 12 Feb 2024 16:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HzzbIsKt"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABDB3A8E3
	for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 16:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707756443; cv=none; b=XtdzU+FA5EOS0RW3MUJqUq15ewVIzXWGKlIYjqItCS33ozs78n/K/tEC4CK6alWk3Oe1KlOfGvpXAQXbTXQsmWHd2l9By3oJfxV9NM2tCSq9X6USOD09CXyEnROWrpPBUwoJ2htPR4oSiKYXP7udhpnJTAw1XOsTHG+nVJgYMTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707756443; c=relaxed/simple;
	bh=MY228vr+39uuu/xQY9iIz40rY8941W7snNOmZuW3dRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GgSeoh1HT/HaP4l83IYOK53VdAqTnUNU2cJLQKUaxJfMeuuB5/cHMBLcKTL7eHkwrdA+cXM09N6Lcv2Ez8XIaxu3Lrfh6iuyM6BhZOu2nyDGqi6qfxJqAPXEEbJYdEFKQjKRVF9UOuPiVbd54xTLQuQfEMBdg89Lwe7lbXFcClA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HzzbIsKt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707756439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MY228vr+39uuu/xQY9iIz40rY8941W7snNOmZuW3dRk=;
	b=HzzbIsKtjBRMnjSJm9pthCPJFbYdNvFlS6kB5Li7BBPIlbrZu1c9Q++eZKxv1WGHyEqd8k
	ywZLPHerKjs6EJLbWrrIRTYja0734Q8uL/w2/gmwhY5k+5YDbhXPs2qaWVq2amqn5GVjlX
	cLy2Tk4KuIekOkwqXvQmCRvOLGnbtoU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-qZm1kfRnNxaXhB-utO67wA-1; Mon, 12 Feb 2024 11:47:16 -0500
X-MC-Unique: qZm1kfRnNxaXhB-utO67wA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a30f9374db7so440460066b.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 08:47:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707756435; x=1708361235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MY228vr+39uuu/xQY9iIz40rY8941W7snNOmZuW3dRk=;
        b=Gxa49SOWlN0S6+5UWCAeMNIMLL9JOY9jhcNNDBreTv8ZnLsFamdUSsLFYhwtpRq4/H
         LcUkYJxZ1blIAtUSBDxPKM9SiZGt5FGbbsSQPhjdbHL4S1fV5jJ6ocdyVVFLIk+1WZdv
         wtkeusNff60AvvVTqHGfwXWcmFVBsHq0+eXuIbouFFVofpgHlM2kO28Q57I7BJBIjSOI
         dq3tg+2QmmMx1puLeLH+dutftzW9os8sF0q40F1WrbbvuihomKWtIBTo8BnHtxbN+Q2V
         zhjaHhD+WobB/zt6ku2MO3fS09KsZuie8cKuKBKS1ovYDPCI3Svutx17eQ1u2l3zsT+X
         iXsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0ohJb+yujj0VihAIIBSfvyrS8V63Kp8jFFmAMS3mR1PGwpu6sNi6n6Ad5zHyMc468G5g8JOaNjV2ZeOYmAolbeybY5P+xAlNQ
X-Gm-Message-State: AOJu0YxoQsUfyi4yDdpcEdV880ouV4Nt/Aw/7l9XA7Jr8EtG3d8zMu5F
	sGcpJyZt6UwUEghvU3qhSAgtqFg9D5rvRQeoXmSWW4by0pzTNedhfuUXUHyI+9ZDlhqWxLcWToB
	qg7R8DLiGKjDRZCP9s1asHVebl/Yh9m/M+Y6tTyEiR62QtO4nErqbrC0OBsRsrekhz4kQO0wxGu
	nk1lSDiA7wA+JiwcDFW17kIkmdlJxus7A/
X-Received: by 2002:a17:906:a45:b0:a35:3eb8:2f6e with SMTP id x5-20020a1709060a4500b00a353eb82f6emr27075ejf.33.1707756435651;
        Mon, 12 Feb 2024 08:47:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAZerKch+MuCFwX1ZjjMTjm+95QqbUxaqQ0n/1DezRMjWdQ5qMyJNxcCuhpAYnDXw1l/GiYvxqNwRwneyLjyU=
X-Received: by 2002:a17:906:a45:b0:a35:3eb8:2f6e with SMTP id
 x5-20020a1709060a4500b00a353eb82f6emr27061ejf.33.1707756435301; Mon, 12 Feb
 2024 08:47:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209-hid-bpf-sleepable-v1-0-4cc895b5adbd@kernel.org>
 <87bk8pve2z.fsf@toke.dk> <CAO-hwJ+UeaBydN9deA8KBbgBiC_UCt6oXX-wGnNuSr8fhUrkXw@mail.gmail.com>
 <875xyxva9u.fsf@toke.dk>
In-Reply-To: <875xyxva9u.fsf@toke.dk>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Mon, 12 Feb 2024 17:47:03 +0100
Message-ID: <CAO-hwJLvEGNRXc8G2PR+AQ6kJg+k5YqSt3F7LCSc0zWnmFfe5g@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 0/9] allow HID-BPF to do device IOs
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 6:05=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen <to=
ke@redhat.com> wrote:
>
> Benjamin Tissoires <benjamin.tissoires@redhat.com> writes:
>
> > On Fri, Feb 9, 2024 at 4:42=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen=
 <toke@redhat.com> wrote:
> >>
> >> Benjamin Tissoires <bentiss@kernel.org> writes:
> >>
> >> > [Putting this as a RFC because I'm pretty sure I'm not doing the thi=
ngs
> >> > correctly at the BPF level.]
> >> > [Also using bpf-next as the base tree as there will be conflicting
> >> > changes otherwise]
> >> >
> >> > Ideally I'd like to have something similar to bpf_timers, but not
> >> > in soft IRQ context. So I'm emulating this with a sleepable
> >> > bpf_tail_call() (see "HID: bpf: allow to defer work in a delayed
> >> > workqueue").
> >>
> >> Why implement a new mechanism? Sounds like what you need is essentiall=
y
> >> the bpf_timer functionality, just running in a different context, righ=
t?
> >
> > Heh, that's exactly why I put in a RFC :)
> >
> > So yes, the bpf_timer approach is cleaner, but I need it in a
> > workqueue, as a hrtimer in a softIRQ would prevent me to kzalloc and
> > wait for the device.
>
> Right, makes sense.
>
> >> So why not just add a flag to the timer setup that controls the callba=
ck
> >> context? I've been toying with something similar for restarting XDP TX
> >> for my queueing patch series (though I'm not sure if this will actuall=
y
> >> end up being needed in the end):
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git/commit/=
?h=3Dxdp-queueing-08&id=3D54bc201a358d1ac6ebfe900099315bbd0a76e862
> >>
> >
> > Oh, nice. Good idea. But would it be OK to have a "timer-like" where
> > it actually defers the job in a workqueue instead of using an hrtimer?
>
> That's conceptually still a timer, though, isn't it? I.e., it's a
> mechanism whereby you specify a callback and a delay, and bpf_timer
> ensures that your callback is called after that delay. IMO it's totally
> congruent with that API to be able to specify a different execution
> context as part of the timer setup.

Yep :)

There is still a problem I wasn't able to fix over the week end and
today. How can I tell the verifier that the callback is sleepable,
when the tracing function that called the timer_start() function is
not?
(more on that below).

>
> As for how to implement it, I suspect the easiest may be something
> similar to what the patch I linked above does: keep the hrtimer, and
> just have a different (kernel) callback function when the timer fires
> which does an immediate schedule_work() (without the _delayed) and then
> runs the BPF callback in that workqueue. I.e., keep the delay handling
> the way the existing bpf_timer implementation does it, and just add an
> indirection to start the workqueue in the kernel dispatch code.

Sounds good, especially given that's roughly how the delayed_timers
are implemented.

>
> > I thought I would have to rewrite the entire bpf_timer approach
> > without the softIRQ, but if I can just add a new flag, that will make
> > things way simpler for me.
>
> IMO that would be fine. You may want to wait for the maintainers to
> chime in before going down this route, though :)
>
> > This however raises another issue if I were to use the bpf_timers: now
> > the HID-BPF kfuncs will not be available as they are only available to
> > tracing prog types. And when I tried to call them from a bpf_timer (in
> > softIRQ) they were not available.
>
> IIUC, the bpf_timer callback is just a function (subprog) from the
> verifier PoV, so it is verified as whatever program type is creating the
> timer. So in other words, as long as you setup the timer from inside a
> tracing prog type, you should have access to all the same kfuncs, I
> think?

Yep, you are correct. But as mentioned above, I am now in trouble with
the sleepable state:
- I need to call timer_start() from a non sleepable tracing function
(I'm in hard IRQ when dealing with a physical device)
- but then, ideally, the callback function needs to be tagged as a
sleepable one, so I can export my kfuncs which are doing kzalloc and
device IO as such.

However, I can not really teach the BPF verifier to do so:
- it seems to check for the callback first when it is loaded, and
there is no SEC() equivalent for static functions
- libbpf doesn't have access to the callback as a prog as it has to be
a static function, and thus isn't exported as a full-blown prog.
- the verifier only checks for the callback when dealing with
BPF_FUNC_timer_set_callback, which doesn't have a "flag" argument
(though the validation of the callback has already been done while
checking it first, so we are already too late to change the sleppable
state of the callback)

Right now, the only OK-ish version I have is declaring the kfunc as
non-sleepable, but checking that we are in a different context than
the IRQ of the initial event. This way, I am not crashing if this
function is called from the initial IRQ, but will still crash if used
outside of the hid context.

This is not satisfactory, but I feel like it's going to be hard to
teach the verifier that the callback function is sleepable in that
case (maybe we could suffix the callback name, like we do for
arguments, but this is not very clean either).

Cheers,
Benjamin



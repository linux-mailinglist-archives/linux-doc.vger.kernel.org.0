Return-Path: <linux-doc+bounces-43494-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 868F7A92230
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 18:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF7095A21DA
	for <lists+linux-doc@lfdr.de>; Thu, 17 Apr 2025 16:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAAA525484A;
	Thu, 17 Apr 2025 16:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="05T8qUJ8"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A9B2528F2
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 16:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744905906; cv=none; b=KrfsR1UFayikUP8eAKAc48f9KNUC26s8YiYyP1q3bnH1AOcLolvUWLmCMBardGqLWR75NvtXjJmwO+wsUO4tqoCfyZU2oSbH5WLxwunEA/b6svxhohMZ9MHs8pkdimhxqqWaY7xPCYWEXhzwuNZTIut3RMTbe2qbRWZ6dYyi95g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744905906; c=relaxed/simple;
	bh=W8qDOiyv1h4pWlH3g88O7C4xDqIzRDAqgGgkiAByMFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ebS28A/gZD6StuemC4RHZiL9L9NJeUH9smIaj1ulBkkfAlh/X7FOVDY3BERfxRHXwezNymAWnip+KeI9GDHvkHD+P/gDFh4pXHvh9lp3LQyj0wd0g67fnXYzyV4p/fA0JbkiGMY0S6qvyHeiOwgvLAtUGvGqw3Qcn7EjNQw4JaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=05T8qUJ8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ef83a6bfaso64915e9.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 09:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744905903; x=1745510703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8qDOiyv1h4pWlH3g88O7C4xDqIzRDAqgGgkiAByMFA=;
        b=05T8qUJ8RoX5tk45LI7g4c39PTyk5OSEfS5W7exQ5fG9bISBxuDnOWbP8RqIYV/KF6
         Ol6CSpSsyUGmbn3e6GPGa+gftSEpY91LDcfFZ43bpOcdbltJIadnEhoCbUXGqcXLhoSj
         UZgPtAvH9uYXzMZXR95hazlrI8KI+JNcrhSCR+zoI7MyIbJjj/dulsuNpTLbL7Iy/0cy
         yepyFRLzt/XMP79Cp6wYU8wC2eCu6KWYQRac6/gQmkPr6faMqUiRlfJ44bCqNhdx+0AR
         oxI9kkVBz/KUZ+ns1F/vu0IJojmOqe9sNa9JuPf1pt3BWdUlCDNcYSxBIIJaRL9KmUGt
         gPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744905903; x=1745510703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W8qDOiyv1h4pWlH3g88O7C4xDqIzRDAqgGgkiAByMFA=;
        b=N20VPN+ehQNbdnbC97MyhEqZA5yjM3j4A9h+rc62jb/CwThZK8S7YwIT0fJizom8qy
         IcWrhI+I6D2F2B0yMCi4Hx04o3fBHQw/HbXLUlwxx4vfdjskVM7P/jcJOrKodjPwmawa
         ulRpgTwXWwo7wzNgjzNqnxJFgX9SDFSs1Mg1vi90oApWNZcExvfk+lDnqObZm1yGZnBz
         nycmYresre0kDkTJHptga5NIPEVrx4oM9QdwJTIdnDQ3I3xVAHrc36k4H5cMhjHJMj9p
         9b2G4qSwGeQKuj7JnnW/KizEdK2qBJpTS+sPP7n48wc6XQLTPBLkANMq366dqITN75p9
         TV9A==
X-Forwarded-Encrypted: i=1; AJvYcCX5MRE5CGTzP1DD5YelE69LB7fHqXrLxEyzmcYA8TzkVgNWsXnkSCSEH0HOAcWku+wdmD0UdxX7aH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFfqMFmjOtudqyxytKKlUnSsqd7cpzwtuw9SLJ1czatbzKykbU
	TMlrneM8mrLY47S7mW5Vs9P/CpkXkEPomJTsTdLhmanYbeS3/OGrekhVLFb6Uov4cbleNs3xc59
	QulhOxF2NiAVucw9icS8Z/cKJC+C0kpAgeQJt
X-Gm-Gg: ASbGnctgw+VcvswGhVvUy2NrK46QwcDwkKhIHwG2ht1LpP/UWN71Eaw1FqQTKpiS2gs
	0CWtI/+wQs+X9GYagjSCRiF9VjU8x5dLNjaZ00te+8DX3BREhDHEBUM/NyVA2A6htigBVVc8ew7
	qF9Fs2ffmQkkWp5+uwcGku4U1kPLJeJ4SCW5AEf20ZbDvAQZfQCH4=
X-Google-Smtp-Source: AGHT+IHPxO/HoUoGfRA0x5PPvATzdMA6UAFEJv1oRfObulb1rUcdqwGzvQUiketg6T4NXeqjA4RD4Ot7mU9EPOGp8HE=
X-Received: by 2002:a05:600c:1c1e:b0:439:7fc2:c7ad with SMTP id
 5b1f17b1804b1-44063d6fe78mr983735e9.7.1744905902735; Thu, 17 Apr 2025
 09:05:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com> <CAPhsuW6sgGvjeAcciskmGO7r6+eeDo_KVS3y7C8fCDPptzCebw@mail.gmail.com>
 <CABdmKX0bgxZFYuvQvQPK0AnAHEE3FebY_eA1+Vo=ScH1MbfzMg@mail.gmail.com>
 <CAPhsuW72Q2--E9tQQY8xADghTV6bYy9vHpFQoCWNh0V_QBWafA@mail.gmail.com>
 <CABdmKX1tDv3fSFURDN7=txFSbQ1xTjp8ZhLP8tFAvLcO9_-4_A@mail.gmail.com>
 <CAPhsuW7xvSYjWvy8K9Ev_tMwDRy2dpEiBcHYai3n-wAa0xvLow@mail.gmail.com>
 <CABdmKX1p0KgbipTSW1Ywi4bTBabQmsg21gA14Bp5atYHg8FeXQ@mail.gmail.com> <CAPhsuW4f2=M_K553+BVnGJq=ddZ7sXj4CfCAHeYQ=4cpihBCzA@mail.gmail.com>
In-Reply-To: <CAPhsuW4f2=M_K553+BVnGJq=ddZ7sXj4CfCAHeYQ=4cpihBCzA@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 17 Apr 2025 09:04:48 -0700
X-Gm-Features: ATxdqUG71xXjeNh_Y--IqcHwHgbok8UYG45JYmWjM55y53LlzggibWtxWiJMWb4
Message-ID: <CABdmKX0P1tpa-jxzN1_TCyk6Cw6drYM+KRZQ5YQcjNOBFtOFJw@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: Add dmabuf iterator
To: Song Liu <song@kernel.org>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
	simona@ffwll.ch, corbet@lwn.net, eddyz87@gmail.com, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	jolsa@kernel.org, mykolal@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 9:56=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Wed, Apr 16, 2025 at 7:09=E2=80=AFPM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > On Wed, Apr 16, 2025 at 6:26=E2=80=AFPM Song Liu <song@kernel.org> wrot=
e:
> [...]
> > >
> > > Here is another rookie question, it appears to me there is a file des=
criptor
> > > associated with each DMA buffer, can we achieve the same goal with
> > > a task-file iterator?
> >
> > That would find almost all of them, but not the kernel-only
> > allocations. (kernel_rss in the dmabuf_dump output I attached earlier.
> > If there's a leak, it's likely to show up in kernel_rss because some
> > driver forgot to release its reference(s).) Also wouldn't that be a
> > ton more iterations since we'd have to visit every FD to find the
> > small portion that are dmabufs? I'm not actually sure if buffers that
> > have been mapped, and then have had their file descriptors closed
> > would show up in task_struct->files; if not I think that would mean
> > scanning both files and vmas for each task.
>
> I don't think scanning all FDs to find a small portion of specific FDs
> is a real issue. We have a tool that scans all FDs in the system and
> only dump data for perf_event FDs. I think it should be easy to
> prototype a tool by scanning all files and all vmas. If that turns out
> to be very slow, which I highly doubt will be, we can try other
> approaches.

But this will not find *all* the buffers, and that defeats the purpose
of having the iterator.

> OTOH, I am wondering whether we can build a more generic iterator
> for a list of objects. Adding a iterator for each important kernel lists
> seems not scalable in the long term.

I think the wide variety of differences in locking for different
objects would make this difficult to do in a generic way.


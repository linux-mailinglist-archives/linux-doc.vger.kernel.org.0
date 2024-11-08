Return-Path: <linux-doc+bounces-30275-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E929C13BD
	for <lists+linux-doc@lfdr.de>; Fri,  8 Nov 2024 02:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BB022820A9
	for <lists+linux-doc@lfdr.de>; Fri,  8 Nov 2024 01:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B7E1401B;
	Fri,  8 Nov 2024 01:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="23cqamfg"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2D1DDC3
	for <linux-doc@vger.kernel.org>; Fri,  8 Nov 2024 01:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731030026; cv=none; b=QBXoc7QirUXh9VdOilYTeXazdZ4MzhGVy0QvZ2QEOFyC8kTge5d9QlXCRKIx2EmM7QfW7FnEGtIvKpPQC7/9V44Ut2LmI9RePXZU7HdyE0sFE/JsTF/L0Hg5l6ovrGXJLC9KP2GiB6UiTxiaikf1F8SnZ8ysuJb53BVzBoddvQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731030026; c=relaxed/simple;
	bh=MzkymF9uy3YM4gdOXq5UOtYl3r3kQj8vdqgmku5EyP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CPBtSTqjvJDZKrezBhICGW/X/SSll5R+N/s49bSDsi1KtFVQS1aZZbUc4TT3yurCag/K9m3qhgg428U1Nwmfv1GEKENSWlSvNe7VfkZ7SqE8J1qoe8VvU9Xye/unMOVmA1MPIorLjeVmYW3tGTj8ncN/pLHWcyt4Bwk6E+lEzC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=23cqamfg; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-460a8d1a9b7so69971cf.1
        for <linux-doc@vger.kernel.org>; Thu, 07 Nov 2024 17:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731030024; x=1731634824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukymtuU99EA2ZHEawF4ZEDVUahugSnJbAfUv5oZityQ=;
        b=23cqamfg6ap991dAANMAcLt2+df+oQS2rCre8xevjKgU5R9Uo0MF+DW+vMPBw7PGcs
         UvZVjcfWC1o9k1+7QBhrjThIafXlQ/gyaiZ7bV+QbJWRBPYH1um8AeKgabwFNUFlSQyg
         dBjZZO2hJzLiQTH8B59UlZ1MEVbo41wPCT6tSOCyeli6l13frV6fUnzF9PUf6PwYbASC
         tZIW1ikd95Sy+ruKdsbIWKzE6bgPWUrSvstJ6403/cUDtVJ5wMHmfjEKkDEn3IdwYpVT
         CFts67o1mI5hOAJtGbrG9f0xSgkI3IY07b1gG87tCKhz0+xxYRaxdkEsbRpgvkadPuxN
         kebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731030024; x=1731634824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ukymtuU99EA2ZHEawF4ZEDVUahugSnJbAfUv5oZityQ=;
        b=kR7Ey/0QSorVybXsBirgPFgm9xq0bFXJbeo8SK3mq6h0IgkkPFfsaBvQOCqmOtTa/P
         hDMFT1Uo35Pgn0AQhxBbGAd8LrnsvC6gphANel350DVznhRo+ogIlqGs5xW2BYTvjx1b
         lt/r3H0pAVhaN/6kh+283E0pV6kzVDXAufEG/T+D6jfCRQegBQfLGWDlPNRwT2CAId0R
         KBAQlpxq51EEQchqQT9eyhsydkxrVa5ssDmABSTzTzs6gi7t+yKTcXheaF8PuHudpD8e
         5d8Rb4lh626LlJx3lRAcvgfpIQL0y7ZUkwzbFxNH7HJQWHVrNl8Fgw0Pjm2V/UhQxcq+
         BAyg==
X-Forwarded-Encrypted: i=1; AJvYcCWPbln/D1fR7ezHywWco71RReN2EnJoejCzqDmY4hrYRixu8OSviEq05InFUlKVtF572ZKr0fyRaw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkqYMVNdP8jP0tBzbI81+7US9/VX5ltmcPHeNN9QWJgKz04mAK
	ec1D5zdB03aI8IOTbLpNojqMpJ4MxKwbur1g4RpCiy1UyqXwFpM88nOAlFIH3d3c4lv1apMkQAL
	i36XTqwZtHGLvpVrk3Pgjbrjxws46bgWX36pY
X-Gm-Gg: ASbGncsUFjh+eXNBRnvYbc9ru8tLehDLQXMNSd3GSar/7LLb6yP5KLAUvN8Gxx5jh+2
	WZ9PVefiK0E/FT6YoTXfoygc8YASs6mw=
X-Google-Smtp-Source: AGHT+IGicJxLT38a1Pwdnr2fwM9wKrNXdQUwB1Ovyl7XPTZCRjnJPDh/mYMXzzY5yXepQD/gUW3HdeL2v3WemoBDuoc=
X-Received: by 2002:a05:622a:5b96:b0:460:b4e3:49e with SMTP id
 d75a77b69052e-462fa582ef8mr6840651cf.9.1731030023625; Thu, 07 Nov 2024
 17:40:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107210331.3044434-1-almasrymina@google.com>
 <20241107210331.3044434-2-almasrymina@google.com> <Zy1priZk_LjbJwVV@mini-arch>
In-Reply-To: <Zy1priZk_LjbJwVV@mini-arch>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 7 Nov 2024 17:40:10 -0800
Message-ID: <CAHS8izOJSd2-hkOBkL0Cy40xt-=1k8YdvkKS98rp2yeys_eGzg@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] net: clarify SO_DEVMEM_DONTNEED behavior in documentation
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Willem de Bruijn <willemb@google.com>, 
	"David S. Miller" <davem@davemloft.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Yi Lai <yi1.lai@linux.intel.com>, 
	Stanislav Fomichev <sdf@fomichev.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 5:30=E2=80=AFPM Stanislav Fomichev <stfomichev@gmail=
.com> wrote:
>
> On 11/07, Mina Almasry wrote:
> > Document new behavior when the number of frags passed is too big.
> >
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> > ---
> >  Documentation/networking/devmem.rst | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/Documentation/networking/devmem.rst b/Documentation/networ=
king/devmem.rst
> > index a55bf21f671c..d95363645331 100644
> > --- a/Documentation/networking/devmem.rst
> > +++ b/Documentation/networking/devmem.rst
> > @@ -225,6 +225,15 @@ The user must ensure the tokens are returned to th=
e kernel in a timely manner.
> >  Failure to do so will exhaust the limited dmabuf that is bound to the =
RX queue
> >  and will lead to packet drops.
> >
> > +The user must pass no more than 128 tokens, with no more than 1024 tot=
al frags
> > +among the token->token_count across all the tokens. If the user provid=
es more
> > +than 1024 frags, the kernel will free up to 1024 frags and return earl=
y.
> > +
> > +The kernel returns the number of actual frags freed. The number of fra=
gs freed
> > +can be less than the tokens provided by the user in case of:
> > +
>
> [..]
>
> > +(a) an internal kernel leak bug.
>
> If you're gonna respin, might be worth mentioning that the dmesg
> will contain a warning in case of a leak?

We will not actually warn in the likely cases of leak.

We warn when we find an entry in the xarray that is not a net_iov, or
if napi_pp_put_page fails on that net_iov. Both are very unlikely to
happen honestly.

The likely 'leaks' are when we don't find the frag_id in the xarray.
We do not warn on that because the user can intentionally trigger the
warning with invalid input. If the user is actually giving valid input
and the warn still happens, likely a kernel bug like I mentioned in
another thread, but we still don't warn.

--=20
Thanks,
Mina


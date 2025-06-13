Return-Path: <linux-doc+bounces-48985-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF70AAD8F87
	for <lists+linux-doc@lfdr.de>; Fri, 13 Jun 2025 16:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 118243A35B1
	for <lists+linux-doc@lfdr.de>; Fri, 13 Jun 2025 14:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD5B17B4EC;
	Fri, 13 Jun 2025 14:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PcAPZLKt"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FD9170A26
	for <linux-doc@vger.kernel.org>; Fri, 13 Jun 2025 14:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824809; cv=none; b=KS2ZcaN1o/btD1cc1DiDYoObPACwdEozC/5MGlTCdVcRPLbsBOR1cLEJ21fkGWuUbt05CIjtCm+1e97u+HBv1A1I7jd3Qu0aYcA67zzhf/PygFg3amzuIDmnrEPBDsMQRIa/I6IGsicgSpfYalP0qT5OL2xRULFBrKT5s6VvnHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824809; c=relaxed/simple;
	bh=ACP/hrp9Qfye/edApO/TeDy89ncgx6tq3kl7aHALZpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WaWHEMy6GXaQjV2Mzf7LFsBN+NAMhMgp9nqkG5fpsI9Nnl95mpGfXUXYma6iEMGVkk7NVpkf1i5gwh1YLVfaOvF4hoyPMqnL6DDvlXMnAL0Gx1ddYkfDSsHJyO+nShKzZoa7DgN51oFb9XEQDRGNd5W9uK1o6SkqmNfVmBiGpTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PcAPZLKt; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-47e9fea29easo369001cf.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Jun 2025 07:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749824806; x=1750429606; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8Jxe80PMT+botQHpeWFQMqNDpkBacoLOJzzs4cmSiE=;
        b=PcAPZLKt9+nXrU53hJ90Tmhfeg2D4hDXX+ICqhmMYDTfAkWsExNYXre5UGzG+SC9iP
         dsjdD+YV0Ax1fiUCyTZex1mxkJa1m8nrMQUqSyYBdf1vPLACemXKn8NGT6Tnb8gTh8hZ
         FpLr+BA2NiYtD4ltLlSr6WCv1ds6HGLDHLo35BVTmzVs9eqsWc5j5pqB7TKIjIzuEgu1
         DO/ClrAkWeOVhuBvgk+FuaslkTNYuz7/G8VKsl7VgnQGGP4lDd1hRbe5w4dbZq2A4pIf
         bOfVx82ydMam3maChKgINNH/ffeP5bxUKsB1t2rPOsQF+G6dSFKt2CWvM3iAVnwS7m0Y
         yj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749824806; x=1750429606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8Jxe80PMT+botQHpeWFQMqNDpkBacoLOJzzs4cmSiE=;
        b=Er1dqot3LS9p0HoXLY29Q2j8/xacSVDAZ4As1hU/uEgoRgtSfSpbFr2bYYYHijou7a
         PQSj8KFsVZER3NgqiZlIQkCs1kWS9YajLzlPnPPssavdRgnwXtI2Nv1T1o1pCO0nn+Qk
         rvW7IFkNV8L0PUkVTRcORBysxVfDCCd1OgIwrSRbiE5S1stU+nMXFjXduOJngBKbFmrY
         7PsGxIk5lGId4tdIutQUryc3BoO/b+a80Hchp3bSRVElvlgA/mZq/E0pMDCTrGICrqEH
         GFSOqVMeASAF2xY6VAAf8IEgOe89diDpUTz3vERnm08j0c082Wa62rLwBB9nYAQeYE0f
         +0Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVcpr+Jt0EyX2qu9z/GxLqbqZf6FHoU5zFILUSnkTjconJk4Bau05EsQJs5AUM7pVdjc11xvvL4f3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBrKNDHS+7+ixqA55jyVkrA4PQwYnbtV3KYXRozkr8cH1b2LBq
	B9LAWWNCoLs6bj0zqOX1zwaqmJRqeE6FQJVdshqHX5b+ZNt3TRlhrGNA0DuD8mxEIMoYb+TDHr1
	bTGlcBxvTZ/jqR13ni8u+i/qU97sw587BJOD4Rnh8
X-Gm-Gg: ASbGnct+m1OAQ6MsDij9afI/0jPN+9U3EA/NAo5nWrWVWoPLmlpGzgoY3lb7YDQpuPR
	Sl1BOv+f7u2gy+/EN92QHVa8HFSYd8Ezort0uPOdJM1f1VvpMYWToYLyU9VzZX/Cy5i7ZhxrxZE
	+YZNTQmaY6ctKIP82X0Gq/9mPQWNv42rMjgl3PK3OHw1tC
X-Google-Smtp-Source: AGHT+IHbli7Lnsvwsi7yQrld3VyFR4wD7vNt+L+iVVFtsCnMyMdexDNlww/fNjqKMLlNLxY74C9MxoEAw1mQ94XjIUg=
X-Received: by 2002:ac8:5fc4:0:b0:47b:840:7f5b with SMTP id
 d75a77b69052e-4a730d79d74mr4093481cf.29.1749824805557; Fri, 13 Jun 2025
 07:26:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610215516.1513296-1-visitorckw@gmail.com>
 <20250611184817.bf9fee25d6947a9bcf60b6f9@linux-foundation.org> <aEvCHUcNOe1YPv37@visitorckw-System-Product-Name>
In-Reply-To: <aEvCHUcNOe1YPv37@visitorckw-System-Product-Name>
From: Robert Pang <robertpang@google.com>
Date: Fri, 13 Jun 2025 23:26:33 +0900
X-Gm-Features: AX0GCFvkWwS1rcTtPYvnDVkpn-tKhNLpwiqEQsoAt3bvG3Gm0tJIQwjdfh_F5WE
Message-ID: <CAJhEC05+0S69z+3+FB2Cd0hD+pCRyWTKLEOsc8BOmH73p1m+KQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] Fix bcache regression with equality-aware heap APIs
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net, colyli@kernel.org, 
	kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-bcache@vger.kernel.org, 
	jserv@ccns.ncku.edu.tw, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew

Bcache is designed to boost the I/O performance of slower storage
(HDDs, network-attached storage) by leveraging fast SSDs as a block
cache. This functionality is critical in significantly reducing I/O
latency. Therefore, any notable increase in bcache's latency severely
diminishes its value. For instance, our tests show a P100 (max)
latency spike from 600 ms to 2.4 seconds every 5 minutes due to this
regression. In real-world environments, this  increase will cause
frequent timeouts and stalls in end-user applications that rely on
bcache's latency improvements, highlighting the urgent need to address
this issue.

Best regards
Robert Pang

On Fri, Jun 13, 2025 at 3:16=E2=80=AFPM Kuan-Wei Chiu <visitorckw@gmail.com=
> wrote:
>
> Hi Andrew,
>
> On Wed, Jun 11, 2025 at 06:48:17PM -0700, Andrew Morton wrote:
> > On Wed, 11 Jun 2025 05:55:08 +0800 Kuan-Wei Chiu <visitorckw@gmail.com>=
 wrote:
> >
> > > This patch series introduces equality-aware variants of the min heap
> > > API that use a top-down heapify strategy to improve performance when
> > > many elements are equal under the comparison function. It also update=
s
> > > the documentation accordingly and modifies bcache to use the new APIs
> > > to fix a performance regression caused by the switch to the generic m=
in
> > > heap library.
> > >
> > > In particular, invalidate_buckets_lru() in bcache suffered from
> > > increased comparison overhead due to the bottom-up strategy introduce=
d
> > > in commit 866898efbb25 ("bcache: remove heap-related macros and switc=
h
> > > to generic min_heap"). The regression is addressed by switching to th=
e
> > > equality-aware variants and using the inline versions to avoid functi=
on
> > > call overhead in this hot path.
> > >
> > > Cc: stable@vger.kernel.org
> >
> > To justify a -stable backport this performance regression would need to
> > have a pretty significant impact upon real-world userspace.  Especially
> > as the patchset is large.
> >
> > Unfortunately the changelog provides no indication of the magnitude of
> > the userspace impact.   Please tell us this, in detail.
> >
> I'll work with Robert to provide a more detailed explanation of the
> real-world impact on userspace.
>
> > Also, if we are to address this regression in -stable kernels then
> > reverting 866898efbb25 is an obvious way - it is far far safer.  So
> > please also tell us why the proposed patchset is a better way for us to
> > go.
> >
> I agree that reverting 866898efbb25 is a much safer and smaller change
> for backporting. In fact, I previously raised the discussion of whether
> we should revert the commit or instead introduce an equality-aware API
> and use it. The bcache maintainer preferred the latter, and I also
> believe that it is a more forward-looking approach. Given that bcache
> has run into this issue, it's likely that other users with similar use
> cases may encounter it as well. We wouldn't want those users to
> continue relying on the current default heapify behavior. So, although
> reverting may be more suitable for stable in isolation, adding an
> equality-aware API could better serve a broader set of use cases going
> forward.
>
> > (Also, each patch should have a fixes:866898efbb25 to help direct the
> > backporting efforts)
> >
> Ack. Will do.
>
> >
> > I'll add the patches to mm.git to get you some testing but from what
> > I'm presently seeing the -stable backporting would be unwise.
>
> Thanks!
>
> Regards,
> Kuan-Wei


Return-Path: <linux-doc+bounces-43809-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7803EA96002
	for <lists+linux-doc@lfdr.de>; Tue, 22 Apr 2025 09:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84A49177ECF
	for <lists+linux-doc@lfdr.de>; Tue, 22 Apr 2025 07:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E7C214226;
	Tue, 22 Apr 2025 07:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YrW6QqHY"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E9C1EE7B6
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 07:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745308356; cv=none; b=eyy+uc3El80QVqd2Z/xo/w85AwQsgrSrvuediTAm35VNIhXoGUeb1Em0j4s+i6JyLRvoi0twaAE3idyRxcRvgSFBvZ+VDiFa+1ckxPub9lX0snDs7HSKqEvE3Iw4GLCFjFmpErpP0vtqw3WRPjVF55icc084FAvf3TF5vih7Ptg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745308356; c=relaxed/simple;
	bh=mdja1zPwi11rl3j2lP+FosY/etFHJecqSbnzsbEbdzg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrUK2DLHem4pj7Z2Ai5V7LpxKULjdd/HEop8FTnuDWdmNL7zYpZPXNnuYwlovQe/6T6et3JIYWspEkB8pKpXfPRjo4vb2evssULHhLf1dXu3h/ZZt3j3QQIDIMywcI+RtejzCbT2+Jz9cuBadwGr6ky98yd3JCUnxy/ezDJBw20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YrW6QqHY; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5499614d3d2so5459341e87.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 00:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745308352; x=1745913152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wr8zkHOcjJp8JH/D5R9zZ1N0PkwxRBvn2f61DwoqQx4=;
        b=YrW6QqHYMSXMXFG4BFWLnIMOusSnNpuwDIwYfVs7Q1qTT/7KAmFWl9i4XO2EOJjXoQ
         yBHSxtTxYr1wTtZB5oJBGG7eh38na1b+0fegCbUX/MLNxhTBwZFcHZFzRh+gAShkeyHX
         cKWwOkktdQh4qMuafKJhk0l2wXP+rv0AY+26A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745308352; x=1745913152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wr8zkHOcjJp8JH/D5R9zZ1N0PkwxRBvn2f61DwoqQx4=;
        b=WCloDeI1v/Hn83E8p74Bu3cjUYZ5JxUNNi522v3b9ZIPccY3A/QDiBgAmp3nmuQQhd
         zfAfImoaUFLTvDiwxhHLVzSlSVDC5JuIATAIfKwMqSQtbeyxWwrUzkfveJMrfg+bFWx+
         eNXpNxCHagfiC/FrzvT3UJYvuRBjJjPMuKxKNhNISu1pz1lURBnZzpzq5DiQNZiwQiGZ
         wkEZiMxb58ENW+xRbS7zPL5oZZYqamUZAN/wlXOGC0dZ0MtRK4L6Qo0y4qy4lkoyiQy0
         UADqbCyU+6avqNiyOg1LKNuJjtHGK86zfAEbhVJaxLvEAQr8zFlaERY/boHWyo2aVySf
         7sSA==
X-Forwarded-Encrypted: i=1; AJvYcCUmtePW7Jl3Wma8seGGRl8+U+qIR0e9BgRYfPVLTgYXWRIaKjZrYIfr5uEw/ccst3b60Ncs6gQFae4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhJ8OVExAnz2qQOnkgqf04EPq9WYPGauAlfN4PB+2cz+vzWG4k
	KmH8SZL61QgQYe7HE5Tf3DCrcIDXtYvvjDqPARwiuNJ7aE6DHfwYxKv6GDPzR7/Fhw3PN0DjrQO
	g+Vhr5DaomupbUZSEGMAvelpBRMWKbV9ur7Ik
X-Gm-Gg: ASbGncsgXwBXxe3RwtiJxR/Y9Kjf4tpDzExsRDo57+MHISxGPKujblTv0xA8n4xuK7F
	260Prw9CIvJJ2YoX/7a3pGxMJ7zaPH2Alhwm2hN6arSC0ZyLYVoJvIlva/1Kzqrae30YOoDUcpX
	TXNyz2HymDYVWSL2jR/bpehQ==
X-Google-Smtp-Source: AGHT+IFJ6lcJHhs4les/hHMElmGqx/Gs/phTM805DYAJAK3V4MGWnxBI1/ZYxVFXtSykbjyfqSGPHxrZlSGhtLEvNSA=
X-Received: by 2002:a05:6512:398a:b0:54d:6989:919d with SMTP id
 2adb3069b0e04-54d6e66c955mr3838846e87.54.1745308351721; Tue, 22 Apr 2025
 00:52:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417002005.2306284-1-dualli@chromium.org> <20250417002005.2306284-2-dualli@chromium.org>
 <20250421151807.GQ2789685@horms.kernel.org>
In-Reply-To: <20250421151807.GQ2789685@horms.kernel.org>
From: Li Li <dualli@chromium.org>
Date: Tue, 22 Apr 2025 00:52:20 -0700
X-Gm-Features: ATxdqUGEbodkKiKzPD66g6rMQ0PQiXs-yAUyfR5qae67BGBgscO6cW8-1gvL2Ck
Message-ID: <CANBPYPi9+JvWOAPgOZLxq9dM9PX3-7Tz+_GnUR_xOKbtjdu8yQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v17 1/3] lsm, selinux: Add setup_report permission
 to binder
To: Simon Horman <horms@kernel.org>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	donald.hunter@gmail.com, gregkh@linuxfoundation.org, arve@android.com, 
	tkjos@android.com, maco@android.com, joel@joelfernandes.org, 
	brauner@kernel.org, cmllamas@google.com, surenb@google.com, 
	omosnace@redhat.com, shuah@kernel.org, arnd@arndb.de, masahiroy@kernel.org, 
	bagasdotme@gmail.com, tweek@google.com, paul@paul-moore.com, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	netdev@vger.kernel.org, selinux@vger.kernel.org, 
	linux-security-module@vger.kernel.org, hridya@google.com, 
	smoreland@google.com, ynaffit@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 8:18=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> On Wed, Apr 16, 2025 at 05:20:02PM -0700, Li Li wrote:
> > From: Thi=C3=A9baud Weksteen <tweek@google.com>
> >
> > Introduce a new permission "setup_report" to the "binder" class.
> > This persmission controls the ability to set up the binder generic
>
> nit: permission
>
>     Flagged by checkpatch.pl --codespell
>

Would fix this typo along with other changes in the next version.
Thank you for catching this!

> > netlink driver to report certain binder transactions.
> >
> > Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>
> > Signed-off-by: Li Li <dualli@google.com>
>
> ...


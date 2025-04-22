Return-Path: <linux-doc+bounces-43918-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D494DA977F3
	for <lists+linux-doc@lfdr.de>; Tue, 22 Apr 2025 22:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E37581890D89
	for <lists+linux-doc@lfdr.de>; Tue, 22 Apr 2025 20:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839AF2C3741;
	Tue, 22 Apr 2025 20:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="maDEm0/9"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11BC2D9979
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 20:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745354800; cv=none; b=j7Rd7VwP3yLJlvopHtgrAuUlxzVTp/vFuBrWVebuaL0oxAkBECBzUhZMINK555w0rpio4eOOCPZfD1KvjjJ4W3C1RD64V3eWaXbnqlqWOf6kJ5+KkDHb2wRq+wx2M+L6SKW6zs7ck6nugAWJeymw0VpqlOcl0ORm3kf2DomSNE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745354800; c=relaxed/simple;
	bh=AepzvkTaXC3tf015Trnt4kidHqKonWdB6m9AqTJB5Is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u4H4M+oBcNIhts4v7vdSZDliwPhGMdsxL4ZiXFvDHyNyfrh1nOprB41ggdnKm+8IG6uoon/EpujwegmCvGRsL5V7fGE1SQoAgSAwP9teALqgXPSZHgesAzz0ZE+qm2NpfRhjYlayDo864L1kgJ3STpP5piUdpmh4HY+VojU8ADA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=maDEm0/9; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2264c9d0295so66655ad.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 13:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745354798; x=1745959598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hbnVvENaVU3NRLrUDXLjqPtRsqZnanRvkC7zMsTFmw=;
        b=maDEm0/9uQs9/f9YyauaANBQvRiwE/gBMcs2NalSOx2kq7A9HxYvAFgU6uBag79YDM
         zhP8YHIrVOHPphcC182uhhXJnm1Bh4R1RaL1BmUhtTwn20leEt5B2+Yy6WZCF2jQNWYG
         a53e6R4X7AIHFD2r2iuUkFWwwqRcWh1hcVKnIz7Yz8hwp+0KlUNbVPKoYSwyo6/C17tm
         Xpxswaob9wTMBlgp30y03vJo+sd4/odiRz2MZVdNat1YJALG2hEN4VUnT9tF1qvhZgjr
         FR2N2NbZHEbYtIT/PYY4CZBl4kW/A2noNHH+lBCys5kiYlM6UZqwMnhC8ou48Aw8sWgF
         Jtlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745354798; x=1745959598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0hbnVvENaVU3NRLrUDXLjqPtRsqZnanRvkC7zMsTFmw=;
        b=kcbFlXPl97V7rRkJ5izwwFvzcgNpt8pNUmn2UEdz5aLNarS/PWS+Qv+D2knlv5mOPf
         38qt5ymjugIKY49pMwMV+MH84FSsRp+Arnc38gw2sWIoLgXbH6xMRZxpdI+RFxV+EHW4
         RQ3E7m9mJRsOqbjz78799xQmJcencE/SibaRSTyDj0Ep6kTwHUmNncADV2ROEr97EwBp
         YTAu1kVxwZVdeoKtRGvUf1MwvrtoimOvVCbUVD1J89KI4e30LKopSu7njoAV36+O8n7K
         mx2xsw95/yNZTepK6wEBfJQ0uOCRDp15k4rmtYNdebz1N7qbbFacCsHVLHHiBR8d3FDV
         VFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWit+WPkGIafKn7tIWTNi7UHsaFQLMdCiY8FM4TWRRgnhILuJsRMn5x1bXLMvJpp2UfYSGPD/0v43M=@vger.kernel.org
X-Gm-Message-State: AOJu0YykQ2Hu3ZHNe+NS204zcgtPhqB1P/JoZ3hCZ4TlxzaY11HchrUV
	BXz3Pa7IgCyX3zkngraX6V9X8+5K54yYw0jrozm+44XA9x7kf4mTMnLpKOCEI7nPGB8k+4mLdcr
	TXiAQlw0NO4t9xSpfIJf5PSqVYjl5Peo/eFqp
X-Gm-Gg: ASbGncumrNg78hBl96iZ+qYilba857k0VjazgCsbd980h9D0QZuPq3AnPGQiRjGZ8fQ
	s9Xi7yCPn24RXFBGxfOirRcqhXxTc1483OhTToQaB0s5WPZaTTu0nbtE9RiJLOGoTXfVcnSI7KF
	ykEBGP2IEkLK4YNFgnwEPo4OPlIN8E5nBHvCp8OoXd2/UxqAlJ5AFH
X-Google-Smtp-Source: AGHT+IEri+jHg7nzBWYce/s95T8w1odDrVsc9bNQomfJRGLKE9zLufWZUYri8enjRiH0NTmCrON34chxcEP4+8+fy1g=
X-Received: by 2002:a17:902:f78d:b0:224:1fb:7b65 with SMTP id
 d9443c01a7336-22da2c3fe23mr741975ad.22.1745354797940; Tue, 22 Apr 2025
 13:46:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417231540.2780723-1-almasrymina@google.com>
 <20250417231540.2780723-2-almasrymina@google.com> <f7a96367-1bb0-4ed2-8fbf-af7558fccc20@gmail.com>
 <CAHS8izMFxDG5E07ZdqnDH_2D_g1fW8X0M7u3gGyV8efzxDNZbg@mail.gmail.com> <5d2f86ce-e2bb-406a-8d53-58a464958d2d@gmail.com>
In-Reply-To: <5d2f86ce-e2bb-406a-8d53-58a464958d2d@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 22 Apr 2025 13:46:24 -0700
X-Gm-Features: ATxdqUFHY8ewiDnZPwv9bGxstV-8bLqJUqf0obD0wDTOy1se33mAidQpqaIoPl0
Message-ID: <CAHS8izMZbt=NAK0GF6VqJNBRKy+iZQGMFG+jFJEesbz=5RiLXg@mail.gmail.com>
Subject: Re: [PATCH net-next v9 1/9] netmem: add niov->type attribute to
 distinguish different net_iov types
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, io-uring@vger.kernel.org, 
	virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jeroen de Borst <jeroendb@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, Willem de Bruijn <willemb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	David Ahern <dsahern@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	sdf@fomichev.me, dw@davidwei.uk, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Victor Nogueira <victor@mojatatu.com>, Pedro Tammela <pctammela@mojatatu.com>, 
	Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 12:52=E2=80=AFPM Pavel Begunkov <asml.silence@gmail=
.com> wrote:
>
> On 4/22/25 15:03, Mina Almasry wrote:
> > On Tue, Apr 22, 2025 at 1:16=E2=80=AFAM Pavel Begunkov <asml.silence@gm=
ail.com> wrote:
> >>
> >> On 4/18/25 00:15, Mina Almasry wrote:
> >>> Later patches in the series adds TX net_iovs where there is no pp
> >>> associated, so we can't rely on niov->pp->mp_ops to tell what is the
> >>> type of the net_iov.
> >>
> >> That's fine, but that needs a NULL pp check in io_uring as well,
> >> specifically in io_zcrx_recv_frag().
> >>
> >
> > I think you mean this update in the code:
> >
> > if (!niov->pp || niov->pp->mp_ops !=3D &io_uring_pp_zc_ops ||
> >      io_pp_to_ifq(niov->pp) !=3D ifq)
> > return -EFAULT;
> >
> > Yes, thanks, will do.
>
> That will work. I'm assuming that those pp-less niovs can
> end up in the rx path. I think it was deemed not impossible,
> right?
>

I'm not sure these pp-less niovs can ever end up in the RX path, but
I'm not sure, and I guess better safe than sorry. We usually get
yelled at for defensive checks but I don't think this one is too
defensive. There could be a path where a TX skb somehow ends up here.

--
Thanks,
Mina


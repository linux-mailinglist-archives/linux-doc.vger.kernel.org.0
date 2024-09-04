Return-Path: <linux-doc+bounces-24330-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6904968C8D
	for <lists+linux-doc@lfdr.de>; Mon,  2 Sep 2024 19:01:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CAD21C21D25
	for <lists+linux-doc@lfdr.de>; Mon,  2 Sep 2024 17:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8094719F11E;
	Mon,  2 Sep 2024 17:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GXVQRA7u"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6D41A265D
	for <linux-doc@vger.kernel.org>; Mon,  2 Sep 2024 17:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725296463; cv=none; b=i1APA86bdeAqQLD5jvNvfBpzYOa2nBovuN3AU+jkGXqveoAYggilBx/VH5Z3cXufmSGDTTxaRon9PpwFZCLvum3uiCTAVUX1xxW1dqsuYkQnnJeWCMIdVp/WCFRqsf20u1Hs44QVjdwSFwiROj0dWbgZ16TXBRi9JDNG9PGBLsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725296463; c=relaxed/simple;
	bh=t3cgJNHVbDKb1zJmQ4enB9xC15b6g33WhNUPCbbKsbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=GdhOfrKf0wjtnhJIoeitfIiX/plcvRQg3hf6KSXZ4HQzd1CBf/OisjbvX+Oo0vSdjb0ZT+JAkDrQk9uHpoX2zrnO3lMIkjdxn8sBNK4KWLUh4b9hTOsGvazVkH3ciARl4Milq8bejaaVm+T4DqCvCqO75AQxeKL/YPc7ECK22Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GXVQRA7u; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a86acbaddb4so521415066b.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Sep 2024 10:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725296460; x=1725901260; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3cgJNHVbDKb1zJmQ4enB9xC15b6g33WhNUPCbbKsbk=;
        b=GXVQRA7u0xNYKuX+EzxJBY5f3tlGiDzyTwabYKSxSlo+ReoBcBnqoB5+XW7QLLdatJ
         R7/kbcW5xesg28PGrg1LItarq79pD+tHnfaZcHvnK/JiwsR7OMouDj04D7QrScx+85tT
         XjSch2RhZr69S61UWVhFqi+RQIX/M1qm4oud7ahIhVn+xhi4H6gVALLSwxQ0r5rv6/1c
         6XXxWzobnUB4hIs7G7YIRhjCMWPvdgiYRcts0MEiU13av5m8uw4kZdsQz4Rz1K0/8unr
         6H/s2PAb4u+UR1vvOlj9FRY5sMbQdfUmI+67tbW9TxKYcel7nOnhZrSzlxm8sKUqk7nd
         V1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725296460; x=1725901260;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3cgJNHVbDKb1zJmQ4enB9xC15b6g33WhNUPCbbKsbk=;
        b=Zp/0GCSEo6CRVMGCGaI6hjhVxy7bPwPbn9wuJciPWsiQ0GdNscZAwe6dQuDoTfZIiQ
         eSN3aQrxwXQMfxXmNMgzmJpYEy1etjBmc7kRMRAdkhLl/QJwi+TspE+J/vJiYYNij3Mi
         A0Afiir8oH1wzjnz9UCRylMQIq8y+bpzALUrXTH1E5nxZXkiHC3OtSdFNwVpnLSqhYv+
         lTgzL/RfMKDNskM6oNkhgFNtNMzx2CvDzqhDOQqYhS+4NW6UCsgwn+dxYDwNBokx7rYp
         A3Z+n34dypDN5SsLFbNvy28fU6MKMkf0FgjlNgl/soBL3OM3v5eVGEPHPkHieeAC74hP
         s0Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUO4SpA0b44Vm1iAWEvwNgAGddSHpyQOQeDsHf48w82/BOuuwJ8qS8EnhF72/IQTN8hga+IEHPCIyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoMUKlaEgAq31ri6NUKgYkuezeYNcb6xhklFbKfho3ENgVOU97
	H/BgYt5VnaJPRV2z+mxlC2aAxh79RT2BiZJOPxNwgYtPLkrVaTWTmtoO+xJSq4mEF+v+j3ydoby
	j7JJwgBXuoJB68UPoNNsuED+5E8IlnMHZ/inn
X-Google-Smtp-Source: AGHT+IGC+++a4+oBo4uwdmAqNrgHdgz1zzNCQ/FhWxeCG8dymcSFrVa5Tb3eZwpSUCaL6bx7YiE5zol2P2J3WA+ezaA=
X-Received: by 2002:a17:907:94cb:b0:a86:c372:14c3 with SMTP id
 a640c23a62f3a-a897fa74468mr1186393266b.48.1725296459153; Mon, 02 Sep 2024
 10:00:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240831113223.9627-1-jdamato@fastly.com> <CANn89iK+09DW95LTFwN1tA=_hV7xvA0mY4O4d-LwVbmNkO0y3w@mail.gmail.com>
 <ZtXn9gK6Dr-JGo81@LQ3V64L9R2.station>
In-Reply-To: <ZtXn9gK6Dr-JGo81@LQ3V64L9R2.station>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 2 Sep 2024 19:00:48 +0200
Message-ID: <CANn89iLhrKyFKf9DpJSSM9CZ9sgoRo7jovg2GhjsJABoqzzVsQ@mail.gmail.com>
Subject: Re: [PATCH net] net: napi: Make napi_defer_irqs u32
To: Joe Damato <jdamato@fastly.com>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, 
	mkarsten@uwaterloo.ca, stable@kernel.org, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Breno Leitao <leitao@debian.org>, 
	Johannes Berg <johannes.berg@intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 6:29=E2=80=AFPM Joe Damato <jdamato@fastly.com> wrot=
e:
>
> On Mon, Sep 02, 2024 at 03:01:28PM +0200, Eric Dumazet wrote:
> > On Sat, Aug 31, 2024 at 1:32=E2=80=AFPM Joe Damato <jdamato@fastly.com>=
 wrote:
> > >
> > > In commit 6f8b12d661d0 ("net: napi: add hard irqs deferral feature")
> > > napi_defer_irqs was added to net_device and napi_defer_irqs_count was
> > > added to napi_struct, both as type int.
> > >
> > > This value never goes below zero. Change the type for both from int t=
o
> > > u32, and add an overflow check to sysfs to limit the value to S32_MAX=
.
> > >
> > > Before this patch:
> > >
> > > $ sudo bash -c 'echo 2147483649 > /sys/class/net/eth4/napi_defer_hard=
_irqs'
> > > $ cat /sys/class/net/eth4/napi_defer_hard_irqs
> > > -2147483647
> > >
> > > After this patch:
> > >
> > > $ sudo bash -c 'echo 2147483649 > /sys/class/net/eth4/napi_defer_hard=
_irqs'
> > > bash: line 0: echo: write error: Numerical result out of range
> > >
> > > Fixes: 6f8b12d661d0 ("net: napi: add hard irqs deferral feature")
> > > Cc: stable@kernel.org
> > > Cc: Eric Dumazet <edumazet@google.com>
> > > Suggested-by: Jakub Kicinski <kuba@kernel.org>
> > > Signed-off-by: Joe Damato <jdamato@fastly.com>
> > > ---
> >
> > I do not think this deserves a change to stable trees.
>
> OK, I can send any other revisions to -next, instead.
>
> > Signed or unsigned, what is the issue ?
> >
> > Do you really need one extra bit ?
>
> I made the maximum S32_MAX because the practical limit has always
> been S32_MAX. Any larger values overflow. Keeping it at S32_MAX does
> not change anything about existing behavior, which was my goal.
>
> Would you prefer if it was U32_MAX instead?
>
> Or are you asking me to leave it the way it is?

I think this would target net-next at most, please lets avoid hassles
for stable teams.

